-- Phase 1: moth, precise mailboxes, contacts, archive/delete, delete account.

-- ---------------------------------------------------------------------------
-- The moth. "I sent word by a moth" — it rarely gets there.
-- ---------------------------------------------------------------------------

update public.transports set sort = sort + 1 where sort >= 2;

insert into public.transports (id, name, emoji, tagline, speed_kmh, route_factor, failure_rate, failure_reasons, sort) values
  ('moth', 'Moth', '🦋', 'Whisper your message. Hope for eagles.', 1.5, 1.6, 0.83,
    array['Flew into a porch light', 'Eaten by a bat', 'Went looking for the Eagles. Never came back.',
          'Distracted by the moon', 'Ate a wool sweater instead', 'Captured by Saruman'], 2);

-- ---------------------------------------------------------------------------
-- Precise mailboxes. Homes are stored exactly; each person chooses whether
-- others see the exact spot (default) or a ~10 km area.
-- ---------------------------------------------------------------------------

alter table public.profiles add column share_precise_home boolean not null default true;

-- [lat, lng] of a point that belongs to `owner`, as `viewer` is allowed to see it.
create function public._shared_coords(g extensions.geography, owner uuid, viewer uuid)
returns jsonb
language sql stable
set search_path = public, extensions
as $$
  select public._coords(g,
    case when owner = viewer
           or coalesce((select share_precise_home from public.profiles where id = owner), false)
         then 5 else 1 end);
$$;

create or replace function public.set_home(p_lat double precision, p_lng double precision, p_label text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  update public.profiles
     set home = public._point(p_lat, p_lng, 6), home_label = nullif(trim(p_label), '')
   where id = me;
  if not found then
    raise exception 'Create a profile first';
  end if;
end;
$$;

create function public.set_share_precise_home(p_share boolean)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  update public.profiles set share_precise_home = p_share where id = public._require_user();
$$;

create or replace function public.quote_distance(p_recipient uuid, p_lat double precision default null, p_lng double precision default null)
returns double precision
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  v_from extensions.geography;
  v_to extensions.geography;
begin
  if p_lat is not null and p_lng is not null then
    v_from := public._point(p_lat, p_lng, 6);
  else
    select home into v_from from public.profiles where id = me;
  end if;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;
  return ST_Distance(v_from, v_to) / 1000.0;
end;
$$;

-- ---------------------------------------------------------------------------
-- Contacts: your private nickname for someone ("Carrie Rose" for @purplegiraffe).
-- ---------------------------------------------------------------------------

create table public.contacts (
  owner_id    uuid not null references public.profiles (id) on delete cascade,
  contact_id  uuid not null references public.profiles (id) on delete cascade,
  nickname    text check (char_length(nickname) between 1 and 40),
  created_at  timestamptz not null default now(),
  primary key (owner_id, contact_id),
  check (owner_id <> contact_id)
);
alter table public.contacts enable row level security;

-- How `viewer` sees person `p_id`: public profile plus the viewer's nickname for them.
create function public._person(p_id uuid, viewer uuid)
returns jsonb
language sql stable
set search_path = public, extensions
as $$
  select jsonb_build_object(
    'id', p.id,
    'username', p.username,
    'display_name', p.display_name,
    'nickname', c.nickname,
    'is_contact', c.owner_id is not null,
    'has_home', p.home is not null)
  from public.profiles p
  left join public.contacts c on c.owner_id = viewer and c.contact_id = p.id
  where p.id = p_id;
$$;

create function public.save_contact(p_contact uuid, p_nickname text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_contact = me then raise exception 'That''s you!'; end if;
  insert into public.contacts (owner_id, contact_id, nickname)
  values (me, p_contact, nullif(trim(p_nickname), ''))
  on conflict (owner_id, contact_id) do update set nickname = excluded.nickname;
end;
$$;

create function public.remove_contact(p_contact uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  delete from public.contacts where owner_id = public._require_user() and contact_id = p_contact;
$$;

create function public.get_contacts()
returns jsonb
language sql stable security definer
set search_path = public, extensions
as $$
  select coalesce(jsonb_agg(public._person(c.contact_id, c.owner_id)
                            order by lower(coalesce(c.nickname, p.display_name, p.username))), '[]'::jsonb)
  from public.contacts c
  join public.profiles p on p.id = c.contact_id
  where c.owner_id = public._require_user();
$$;

-- Search usernames, plus nicknames of your own contacts.
create or replace function public.find_users(p_query text)
returns jsonb
language sql stable security definer
set search_path = public, extensions
as $$
  with q as (select lower(trim(p_query)) as q, public._require_user() as me)
  select coalesce(jsonb_agg(public._person(s.id, q.me) order by s.is_contact desc, s.username), '[]'::jsonb)
  from q, lateral (
    select p.id, p.username, c.owner_id is not null as is_contact
    from public.profiles p
    left join public.contacts c on c.owner_id = q.me and c.contact_id = p.id
    where p.id <> q.me
      and char_length(q.q) >= 1
      and (p.username like q.q || '%' or lower(c.nickname) like '%' || q.q || '%')
    order by c.owner_id is not null desc, p.username
    limit 10
  ) s;
$$;

-- ---------------------------------------------------------------------------
-- Archive / delete. Both only affect your own mailbox.
-- ---------------------------------------------------------------------------

create table public.mailbox_flags (
  user_id      uuid not null references public.profiles (id) on delete cascade,
  message_id   uuid not null references public.messages (id) on delete cascade,
  archived_at  timestamptz,
  deleted_at   timestamptz,
  primary key (user_id, message_id)
);
alter table public.mailbox_flags enable row level security;

-- p_state: 'inbox' (un-archive), 'archived', or 'deleted'
create function public.set_letter_state(p_message uuid, p_state text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_state not in ('inbox', 'archived', 'deleted') then
    raise exception 'Unknown state %', p_state;
  end if;
  if not exists (select 1 from public.messages where id = p_message and (sender_id = me or recipient_id = me)) then
    raise exception 'That letter isn''t yours';
  end if;
  insert into public.mailbox_flags (user_id, message_id, archived_at, deleted_at)
  values (me, p_message,
          case when p_state = 'archived' then now() end,
          case when p_state = 'deleted' then now() end)
  on conflict (user_id, message_id) do update
    set archived_at = excluded.archived_at,
        deleted_at = coalesce(public.mailbox_flags.deleted_at, excluded.deleted_at);
end;
$$;

-- ---------------------------------------------------------------------------
-- Deleting an account. Letters they carried for others keep travelling.
-- ---------------------------------------------------------------------------

alter table public.legs alter column carrier_id drop not null;
alter table public.legs drop constraint legs_carrier_id_fkey;
alter table public.legs add constraint legs_carrier_id_fkey
  foreign key (carrier_id) references public.profiles (id) on delete set null;

create function public.delete_account()
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
begin
  delete from auth.users where id = public._require_user();
end;
$$;

-- ---------------------------------------------------------------------------
-- Updated reads: nicknames, precise coordinates, archive flags.
-- ---------------------------------------------------------------------------

create or replace function public.get_me()
returns jsonb
language plpgsql stable security definer
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
  return jsonb_build_object(
    'id', p.id,
    'username', p.username,
    'display_name', p.display_name,
    'home', public._coords(p.home, 6),
    'home_label', p.home_label,
    'share_precise_home', p.share_precise_home,
    'stats', jsonb_build_object(
      'sent',      (select count(*) from public.messages where sender_id = me),
      'received',  (select count(*) from public.messages m where m.recipient_id = me and public._message_status(m.id) = 'delivered'),
      'lost',      (select count(*) from public.messages m where m.sender_id = me and public._message_status(m.id) in ('lost', 'found')),
      'found',     (select count(*) from public.leg_fates where found_by = me)
    )
  );
end;
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
  with mine as (
    select m.*, public._message_status(m.id) as status,
           case when m.sender_id = me then 'sent' else 'received' end as role,
           fl.archived_at is not null as archived
    from public.messages m
    left join public.mailbox_flags fl on fl.user_id = me and fl.message_id = m.id
    where (m.sender_id = me or m.recipient_id = me)
      and fl.deleted_at is null
  ),
  latest as (
    select distinct on (l.message_id) l.message_id, l.id as leg_id, l.arrives_at
    from public.legs l
    join mine on mine.id = l.message_id
    order by l.message_id, l.leg_no desc
  )
  select coalesce(jsonb_agg(jsonb_build_object(
    'id', mine.id,
    'role', mine.role,
    'status', mine.status,
    'archived', mine.archived,
    'created_at', mine.created_at,
    'read_at', mine.read_at,
    'delivered_at', case when mine.status = 'delivered'
                         then coalesce(mine.found_by_recipient_at, latest.arrives_at) end,
    'body', case when mine.role = 'sent' or mine.status = 'delivered' then mine.body end,
    'other', public._person(case when mine.role = 'sent' then mine.recipient_id else mine.sender_id end, me),
    'legs', (
      select jsonb_agg(jsonb_build_object(
        'leg_no', l.leg_no,
        'transport_id', l.transport_id,
        'carrier', case when l.carrier_id = me then 'you'
                        when l.carrier_id = mine.sender_id then 'sender'
                        else 'stranger' end,
        'departed_at', l.departed_at,
        'arrives_at', l.arrives_at,
        'distance_km', round(l.distance_km::numeric, 1),
        'origin', public._shared_coords(l.origin, l.carrier_id, me),
        'destination', public._shared_coords(l.destination, mine.recipient_id, me),
        -- a leg's outcome stays secret until it was due, unless something later happened
        'outcome', case
          when l.id = latest.leg_id and mine.status = 'in_transit' then 'in_transit'
          when not f.fails then 'arrived'
          when f.found_by = mine.recipient_id then 'found_by_recipient'
          when f.forwarded then 'forwarded'
          when f.found_by is not null then 'found'
          else 'lost' end,
        'fail_reason', case when f.fails and not (l.id = latest.leg_id and mine.status = 'in_transit')
                            then f.fail_reason end,
        'last_seen', case when f.fails and not (l.id = latest.leg_id and mine.status = 'in_transit')
                          then public._coords(f.fail_point, 1) end,
        'opened_by_finder', f.opened_at is not null and f.found_by <> mine.recipient_id
      ) order by l.leg_no)
      from public.legs l
      join public.leg_fates f on f.leg_id = l.id
      where l.message_id = mine.id
    )
  ) order by mine.created_at desc), '[]'::jsonb)
  into result
  from mine
  join latest on latest.message_id = mine.id;

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
    'found_at', f.found_at,
    'opened_at', f.opened_at,
    'forwarded', f.forwarded,
    'status', public._message_status(m.id),
    'from', public._person(m.sender_id, f.found_by),
    'to', public._person(m.recipient_id, f.found_by),
    'body', case when f.opened_at is not null then m.body end
  ) order by f.found_at desc), '[]'::jsonb)
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  join public.messages m on m.id = l.message_id
  where f.found_by = public._require_user()
    and m.recipient_id <> f.found_by;
$$;

create or replace function public.forward_found(p_leg uuid, p_transport text, p_lat double precision, p_lng double precision)
returns uuid
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  f public.leg_fates;
  m public.messages;
  v_to extensions.geography;
begin
  select * into f from public.leg_fates where leg_id = p_leg for update;
  if not found or f.found_by is distinct from me then
    raise exception 'That letter isn''t in your satchel';
  end if;
  if f.forwarded then
    raise exception 'You already sent this one on';
  end if;

  select m2.* into m from public.messages m2 join public.legs l on l.message_id = m2.id where l.id = p_leg;
  select home into v_to from public.profiles where id = m.recipient_id;
  if v_to is null then
    raise exception 'The recipient no longer has a mailbox';
  end if;

  update public.leg_fates set forwarded = true where leg_id = p_leg;
  perform public._create_leg(m.id, me, p_transport, public._point(p_lat, p_lng, 6), v_to);
  return m.id;
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions for everything new.
-- ---------------------------------------------------------------------------

revoke all on function
  public._shared_coords(extensions.geography, uuid, uuid),
  public._person(uuid, uuid),
  public.set_share_precise_home(boolean),
  public.save_contact(uuid, text),
  public.remove_contact(uuid),
  public.get_contacts(),
  public.set_letter_state(uuid, text),
  public.delete_account()
from public, anon, authenticated;

grant execute on function
  public.set_share_precise_home(boolean),
  public.save_contact(uuid, text),
  public.remove_contact(uuid),
  public.get_contacts(),
  public.set_letter_state(uuid, text),
  public.delete_account()
to authenticated;
