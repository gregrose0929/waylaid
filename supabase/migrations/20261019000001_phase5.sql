-- Phase 5: crash reports, stationery & wax seals, chain letters.

-- ---------------------------------------------------------------------------
-- Crash reports: the app records JavaScript errors here (readable in the
-- Supabase Table Editor). Anyone may write; nobody can read through the API.
-- ---------------------------------------------------------------------------

create table public.crash_reports (
  id          bigserial primary key,
  at          timestamptz not null default now(),
  user_id     uuid,
  message     text not null,
  stack       text,
  context     jsonb
);
alter table public.crash_reports enable row level security;

create function public.report_crash(p_message text, p_stack text default null, p_context jsonb default null)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
begin
  -- keep it small and stop a crash loop from flooding the table
  if (select count(*) from public.crash_reports where at > now() - interval '1 minute') > 30 then
    return;
  end if;
  insert into public.crash_reports (user_id, message, stack, context)
  values (auth.uid(), left(coalesce(p_message, '?'), 1000), left(p_stack, 8000), p_context);
end;
$$;

-- ---------------------------------------------------------------------------
-- Stationery and wax seals: cosmetic, unlocked by achievements that didn't
-- unlock anything before.
-- ---------------------------------------------------------------------------

create table public.cosmetics (
  id           text primary key,
  kind         text not null check (kind in ('paper', 'seal')),
  name         text not null,
  unlocked_by  text references public.achievements (id),
  sort         int not null
);
alter table public.cosmetics enable row level security;
create policy "cosmetics are public" on public.cosmetics for select using (true);

insert into public.cosmetics (id, kind, name, unlocked_by, sort) values
  ('classic',   'paper', 'Classic cream',   null,               1),
  ('airmail',   'paper', 'Airmail',         'long_distance',    2),
  ('parchment', 'paper', 'Old parchment',   'snail_delivered',  3),
  ('botanical', 'paper', 'Pressed flowers', 'good_samaritan',   4),
  ('love',      'paper', 'Love letter',     'fan_mail',         5),
  ('storm',     'paper', 'Storm cloud',     'storm_chaser',     6),
  ('midnight',  'paper', 'Midnight',        'ghosted',          7),
  ('red',       'seal',  'Wax-seal red',    null,               1),
  ('navy',      'seal',  'Navy',            'left_on_read',     2),
  ('green',     'seal',  'Forest green',    'marathon',         3),
  ('purple',    'seal',  'Moth purple',     'moth_delivered',   4),
  ('pink',      'seal',  'Rose pink',       'special_delivery', 5),
  ('black',     'seal',  'Snoop black',     'nosy',             6),
  ('silver',    'seal',  'Hero silver',     'neither_snow',     7),
  ('gold',      'seal',  'Mach-3 gold',     'sr71',             8);

alter table public.messages add column paper text not null default 'classic' references public.cosmetics (id);
alter table public.messages add column seal text not null default 'red' references public.cosmetics (id);

create function public._cosmetic_unlocked(u uuid, p_id text)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select c.unlocked_by is null
      or exists (select 1 from public.user_achievements ua where ua.user_id = u and ua.achievement_id = c.unlocked_by)
  from public.cosmetics c where c.id = p_id;
$$;

-- ---------------------------------------------------------------------------
-- Chain letters: each person adds a line and passes it to one of their friends.
-- Everyone further down the chain can read every line before theirs; once the
-- chain ends, everyone who took part can read all of it.
-- ---------------------------------------------------------------------------

create table public.chains (
  id           uuid primary key default gen_random_uuid(),
  started_by   uuid references public.profiles (id) on delete set null,
  max_links    int not null default 8 check (max_links between 2 and 20),
  created_at   timestamptz not null default now(),
  finished_at  timestamptz
);
alter table public.chains enable row level security;

alter table public.messages add column chain_id uuid references public.chains (id) on delete set null;
alter table public.messages add column chain_link int;
create index messages_chain_idx on public.messages (chain_id, chain_link);

-- A chain is open until someone ends it or it reaches its last link.
create function public._chain_open(p_chain uuid)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select c.finished_at is null
     and (select coalesce(max(chain_link), 0) from public.messages where chain_id = c.id) < c.max_links
  from public.chains c where c.id = p_chain;
$$;

-- ---------------------------------------------------------------------------
-- Sending, now with paper, seal, and chains. (Signature changes: drop first.)
-- ---------------------------------------------------------------------------

drop function public.send_message(uuid, text, text, text, text);
create function public.send_message(
  p_recipient uuid, p_body text, p_transport text,
  p_weather text default null, p_photo text default null,
  p_paper text default null, p_seal text default null,
  p_start_chain boolean default false, p_chain_from uuid default null
) returns uuid
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  v_from extensions.geography;
  v_to extensions.geography;
  v_message uuid;
  v_chain uuid;
  v_link int;
  prev public.messages;
begin
  if p_recipient = me then raise exception 'You can''t mail yourself (nice try)'; end if;
  if not public._are_friends(me, p_recipient) then raise exception 'You can only write to friends'; end if;
  perform public._refresh_achievements(me);
  if not public._carrier_unlocked(me, p_transport) then
    raise exception 'You haven''t unlocked that carrier yet';
  end if;
  if p_weather is not null and p_weather not in ('clear', 'cloudy', 'fog', 'rain', 'snow', 'storm', 'wind') then
    raise exception 'Unknown weather';
  end if;
  if p_photo is not null and split_part(p_photo, '/', 1) <> me::text then
    raise exception 'That photo isn''t yours';
  end if;
  if p_paper is not null and not coalesce(public._cosmetic_unlocked(me, p_paper), false)
     or p_paper is not null and not exists (select 1 from public.cosmetics where id = p_paper and kind = 'paper') then
    raise exception 'You haven''t unlocked that paper yet';
  end if;
  if p_seal is not null and not coalesce(public._cosmetic_unlocked(me, p_seal), false)
     or p_seal is not null and not exists (select 1 from public.cosmetics where id = p_seal and kind = 'seal') then
    raise exception 'You haven''t unlocked that seal yet';
  end if;

  -- Passing a chain on: you must hold its newest link, and the next person must be new to it.
  if p_chain_from is not null then
    select * into prev from public.messages where id = p_chain_from;
    if prev.chain_id is null or prev.recipient_id <> me
       or public._message_status(prev.id) <> 'delivered'
       or prev.chain_link <> (select max(chain_link) from public.messages where chain_id = prev.chain_id) then
      raise exception 'That chain isn''t yours to pass on';
    end if;
    if not public._chain_open(prev.chain_id) then
      raise exception 'That chain has ended';
    end if;
    if exists (select 1 from public.messages where chain_id = prev.chain_id
               and (sender_id = p_recipient or recipient_id = p_recipient)) then
      raise exception 'They''re already part of this chain. Pick someone new!';
    end if;
    v_chain := prev.chain_id;
    v_link := prev.chain_link + 1;
  elsif p_start_chain then
    insert into public.chains (started_by) values (me) returning id into v_chain;
    v_link := 1;
  end if;

  select home into v_from from public.profiles where id = me;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;

  insert into public.messages (sender_id, recipient_id, body, photo_path, paper, seal, chain_id, chain_link)
  values (me, p_recipient, trim(coalesce(p_body, '')), p_photo,
          coalesce(p_paper, 'classic'), coalesce(p_seal, 'red'), v_chain, v_link)
  returning id into v_message;

  perform public._create_leg(v_message, me, p_transport, v_from, v_to, p_weather);
  return v_message;
end;
$$;

-- End a chain you're holding.
create function public.end_chain(p_message uuid)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  m public.messages;
begin
  select * into m from public.messages where id = p_message;
  if m.chain_id is null or m.recipient_id <> me or public._message_status(m.id) <> 'delivered'
     or m.chain_link <> (select max(chain_link) from public.messages where chain_id = m.chain_id) then
    raise exception 'That chain isn''t yours to end';
  end if;
  update public.chains set finished_at = coalesce(finished_at, now()) where id = m.chain_id;
end;
$$;

-- The whole chain as you're allowed to see it: every link up to the furthest one you
-- took part in, or all of it once the chain is over.
create function public.get_chain(p_chain uuid)
returns jsonb
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  c public.chains;
  v_reach int;
  v_open boolean;
begin
  select * into c from public.chains where id = p_chain;
  if not found then raise exception 'No such chain'; end if;
  select max(chain_link) into v_reach from public.messages
   where chain_id = p_chain
     and (sender_id = me or (recipient_id = me and public._message_status(id) = 'delivered'));
  if v_reach is null then raise exception 'You''re not part of this chain'; end if;
  v_open := public._chain_open(p_chain);
  return jsonb_build_object(
    'id', c.id,
    'max_links', c.max_links,
    'finished', not v_open,
    'started_by', public._person(c.started_by, me),
    'links', (
      select coalesce(jsonb_agg(jsonb_build_object(
        'link', m.chain_link,
        'message_id', m.id,
        'from', public._person(m.sender_id, me),
        'to', public._person(m.recipient_id, me),
        'body', m.body,
        'delivered', public._message_status(m.id) = 'delivered',
        'transport_id', (select transport_id from public.legs where message_id = m.id and leg_no = 1)
      ) order by m.chain_link), '[]'::jsonb)
      from public.messages m
      where m.chain_id = p_chain
        and (m.chain_link <= v_reach or (not v_open and public._message_status(m.id) = 'delivered'))
    )
  );
end;
$$;

-- get_me reports unlocked stationery and seals too.
create or replace function public._unlocked_cosmetics(u uuid)
returns jsonb
language sql stable
set search_path = public, extensions
as $$
  select coalesce(jsonb_agg(id order by kind, sort), '[]'::jsonb)
  from public.cosmetics where public._cosmetic_unlocked(u, id);
$$;

create or replace function public.get_mail()
returns jsonb
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  result jsonb;
begin
  with base as (
    select m.*, public._message_status(m.id) = 'delivered' as delivered,
           case when m.sender_id = me then 'sent' else 'received' end as role,
           fl.archived_at is not null as archived,
           coalesce(fl.marked_unread, false) as marked_unread
    from public.messages m
    left join public.mailbox_flags fl on fl.user_id = me and fl.message_id = m.id
    where (m.sender_id = me or m.recipient_id = me)
      and fl.deleted_at is null
  ),
  mine as (
    select b.*,
           (select l from public.legs l where l.message_id = b.id and l.leg_no = 1) as first_leg,
           (select l from public.legs l where l.message_id = b.id order by l.leg_no desc limit 1) as last_leg
    from base b
    where b.role = 'sent' or b.delivered
  )
  select coalesce(jsonb_agg(jsonb_build_object(
    'id', mine.id,
    'role', mine.role,
    'status', case when mine.delivered then 'delivered'
                   when now() < (mine.first_leg).arrives_at then 'in_transit'
                   else 'overdue' end,
    'archived', mine.archived,
    'marked_unread', mine.marked_unread,
    'created_at', mine.created_at,
    'read_at', mine.read_at,
    'delivered_at', case when mine.delivered
                         then coalesce(mine.found_by_recipient_at, (mine.last_leg).arrives_at) end,
    'body', mine.body,
    'photo_path', mine.photo_path,
    'paper', mine.paper,
    'seal', mine.seal,
    'chain_id', mine.chain_id,
    'chain_link', mine.chain_link,
    -- you hold the chain if this is its newest link, it reached you, and it isn't finished
    'chain_can_pass', mine.chain_id is not null and mine.role = 'received' and mine.delivered
                      and public._chain_open(mine.chain_id)
                      and mine.chain_link = (select max(chain_link) from public.messages c where c.chain_id = mine.chain_id),
    'other', public._person(case when mine.role = 'sent' then mine.recipient_id else mine.sender_id end, me),
    'legs', case
      when mine.delivered then (
        select jsonb_agg(jsonb_build_object(
          'leg_no', l.leg_no,
          'transport_id', l.transport_id,
          'carrier', case when l.carrier_id = me then 'you'
                          when l.carrier_id = mine.sender_id then 'sender'
                          else 'stranger' end,
          'departed_at', l.departed_at,
          'arrives_at', l.arrives_at,
          'distance_km', round(l.distance_km::numeric, 1),
          'weather', l.weather,
          'origin', public._shared_coords(l.origin, l.carrier_id, me),
          'destination', public._shared_coords(l.destination, mine.recipient_id, me),
          'outcome', case
            when not f.fails then 'arrived'
            when f.found_by = mine.recipient_id then 'found_by_recipient'
            when f.forwarded then 'forwarded'
            else 'lost' end,
          'fail_reason', case when f.fails then f.fail_reason end,
          'last_seen', case when f.fails then public._coords(f.fail_point, 1) end,
          'last_seen_town', case when f.fails then f.fail_town end,
          'opened_by_finder', f.opened_at is not null and f.found_by <> mine.recipient_id
        ) order by l.leg_no)
        from public.legs l
        join public.leg_fates f on f.leg_id = l.id
        where l.message_id = mine.id)
      -- Not delivered (sender only): just the trip as planned. Its fate stays a mystery.
      else jsonb_build_array(jsonb_build_object(
        'leg_no', 1,
        'transport_id', (mine.first_leg).transport_id,
        'carrier', 'you',
        'departed_at', (mine.first_leg).departed_at,
        'arrives_at', (mine.first_leg).arrives_at,
        'distance_km', round(((mine.first_leg).distance_km)::numeric, 1),
        'weather', (mine.first_leg).weather,
        'origin', public._coords((mine.first_leg).origin, 5),
        'destination', public._shared_coords((mine.first_leg).destination, mine.recipient_id, me),
        'outcome', case when now() < (mine.first_leg).arrives_at then 'in_transit' else 'overdue' end,
        'fail_reason', null,
        'last_seen', null,
        'last_seen_town', null,
        'opened_by_finder', false))
      end
  ) order by coalesce(case when mine.delivered then coalesce(mine.found_by_recipient_at, (mine.last_leg).arrives_at) end,
                      mine.created_at) desc), '[]'::jsonb)
  into result
  from mine;

  return result;
end;
$$;

create or replace function public.get_found()
returns jsonb
language sql stable security definer
set search_path = public, extensions
as $$
  select coalesce(jsonb_agg(jsonb_build_object(
    'leg_id', l.id,
    'message_id', m.id,
    'transport_id', l.transport_id,
    'fail_reason', f.fail_reason,
    'town', f.fail_town,
    'found_at', f.found_at,
    'opened_at', f.opened_at,
    'forwarded', f.forwarded,
    'status', public._message_status(m.id),
    'from', public._person(m.sender_id, f.found_by),
    'to', public._person(m.recipient_id, f.found_by),
    'body', case when f.opened_at is not null then m.body end,
    'has_photo', m.photo_path is not null,
    'photo_path', case when f.opened_at is not null then m.photo_path end,
    'seal', m.seal,
    'paper', case when f.opened_at is not null then m.paper end,
    'chain_id', m.chain_id
  ) order by f.found_at desc), '[]'::jsonb)
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  join public.messages m on m.id = l.message_id
  where f.found_by = public._require_user()
    and m.recipient_id <> f.found_by;
$$;

-- get_me: add unlocked cosmetics (re-declared from phase 3/4 with one more field).
create or replace function public.get_me()
returns jsonb
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  p public.profiles;
begin
  select * into p from public.profiles where id = me;
  if not found then
    return null;
  end if;
  perform public._refresh_achievements(me);
  return jsonb_build_object(
    'id', p.id,
    'username', p.username,
    'display_name', p.display_name,
    'home', public._coords(p.home, 6),
    'home_label', p.home_label,
    'share_precise_home', p.share_precise_home,
    'unlocked_cosmetics', public._unlocked_cosmetics(me),
    'unlocked_carriers', (select coalesce(jsonb_agg(t.id order by t.sort), '[]'::jsonb)
                          from public.transports t where public._carrier_unlocked(me, t.id)),
    'new_achievements', (select coalesce(jsonb_agg(jsonb_build_object(
                                  'id', a.id, 'title', a.title, 'emoji', a.emoji, 'unlocks', a.unlocks)
                                  order by ua.unlocked_at), '[]'::jsonb)
                         from public.user_achievements ua join public.achievements a on a.id = ua.achievement_id
                         where ua.user_id = me and not ua.seen),
    'stats', jsonb_build_object(
      'sent',      (select count(*) from public.messages where sender_id = me),
      'delivered', (select count(*) from public.messages m where m.sender_id = me and public._message_status(m.id) = 'delivered'),
      'received',  (select count(*) from public.messages m where m.recipient_id = me and public._message_status(m.id) = 'delivered'),
      'found',     (select count(*) from public.leg_fates where found_by = me),
      'achievements', (select count(*) from public.user_achievements where user_id = me)
    )
  );
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions
-- ---------------------------------------------------------------------------

revoke all on function
  public.report_crash(text, text, jsonb),
  public._cosmetic_unlocked(uuid, text),
  public._chain_open(uuid),
  public._unlocked_cosmetics(uuid),
  public.send_message(uuid, text, text, text, text, text, text, boolean, uuid),
  public.end_chain(uuid),
  public.get_chain(uuid)
from public, anon, authenticated;

grant execute on function public.report_crash(text, text, jsonb) to anon, authenticated;
grant execute on function
  public.send_message(uuid, text, text, text, text, text, text, boolean, uuid),
  public.end_chain(uuid),
  public.get_chain(uuid)
to authenticated;
