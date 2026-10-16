-- Phase 5: crash reports, stationery & wax seals, chain letters, two-player Mad Libs.

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


-- ---------------------------------------------------------------------------
-- Two-player Mad Libs: you fill the odd-numbered blanks, your friend fills the
-- even ones when it arrives, and the finished story travels back to you.
-- Nobody sees the story until their part is done.
-- ---------------------------------------------------------------------------

create table public.madlib_templates (
  id       text primary key,
  title    text not null,
  emoji    text not null,
  prompts  text[] not null,
  story    text not null,
  sort     int not null
);
alter table public.madlib_templates enable row level security;
-- Prompts are public; the story text itself is only revealed by the server.
create policy "madlib prompts are public" on public.madlib_templates for select using (true);
revoke select on public.madlib_templates from anon, authenticated;
grant select (id, title, emoji, prompts, sort) on public.madlib_templates to anon, authenticated;

insert into public.madlib_templates (id, title, emoji, prompts, story, sort) values
  ('vacation', 'Postcard from Vacation', '🏖️', array['adjective', 'place', 'noun (plural)', 'verb ending in -ing', 'animal', 'body part', 'food', 'exclamation', 'number', 'adjective'], 'Greetings from {2}! The weather here is {1} and the locals keep handing me {3}. Yesterday I went {4} with a {5} and nearly lost my {6}. The {7} is incredible. {8}! I''ve decided to stay {9} more weeks. Wish you were here, it''s {10}.', 1),
  ('postmaster', 'Complaint to the Postmaster', '📮', array['carrier animal', 'adjective', 'noun', 'verb (past tense)', 'number', 'body part', 'liquid', 'famous person', 'adjective', 'noun'], 'Dear Postmaster, I am writing to complain about your {1}. It arrived looking {2} and carrying a {3} instead of my letter. When I asked about it, it simply {4} at me for {5} minutes and then sat on my {6}. My letter was soaked in {7}. Even {8} would have done a better job. I expect a {9} apology and a free {10}. Yours, furiously.', 2),
  ('love', 'A Very Serious Love Letter', '💌', array['adjective', 'noun', 'body part (plural)', 'vegetable', 'verb', 'number', 'animal', 'adjective', 'place', 'noun'], 'My dearest, your {3} are as {1} as a {2} at sunrise. Every time I eat a {4}, I think of you. I would {5} across {6} oceans for you, riding nothing but a {7}. Our love is {8}, like a Tuesday in {9}. Please accept this {10} as a token of my devotion.', 3),
  ('job', 'Job Application', '💼', array['job title', 'adjective', 'skill ending in -ing', 'number', 'noun (plural)', 'animal', 'verb', 'adjective', 'famous person', 'noun'], 'To whom it may concern, I am applying for the position of {1}. I am extremely {2} and have {4} years of experience {3}. At my last job I managed a team of {5} and one very difficult {6}. I can {7} faster than anyone. My references describe me as {8}. {9} once called me a genius. I am available to start immediately, salary: one {10}.', 4),
  ('pirate', 'Message in a Bottle', '🏴‍☠️', array['adjective', 'noun', 'number', 'animal (plural)', 'verb ending in -ing', 'food', 'exclamation', 'body part', 'adjective', 'place'], 'To whoever finds this: I have been stranded on this {1} island for {3} days with nothing but a {2}. The only company I have is a gang of {4} who spend all day {5}. I have survived by eating {6}. {7}! A ship just passed and I waved my {8} but they were too {9} to notice. Please send help to {10}. Also snacks.', 5),
  ('thankyou', 'Overly Grateful Thank-You Note', '🎁', array['noun', 'adjective', 'verb', 'number', 'room in a house', 'animal', 'adjective', 'verb ending in -ing', 'noun', 'emotion'], 'Thank you SO much for the {1}! It is the most {2} gift I have ever received. I have already used it to {3} {4} times. It now has its own shelf in the {5}, although my {6} keeps trying to eat it. It is {7}. I find myself {8} with it at night. I will treasure it forever, like a {9}. With deep and lasting {10},', 6),
  ('weather', 'Weather Report from the Road', '⛈️', array['weather', 'adjective', 'carrier', 'noun', 'verb (past tense)', 'number', 'sound', 'body part', 'adjective', 'food'], 'Update from the road: it has been {1} for three days straight. Visibility is {2}. My {3} refused to go any further and is now hiding under a {4}. This morning a cloud {5} directly onto me {6} times. The thunder sounds like {7}. I can no longer feel my {8}. Morale is {9}. Please send {10}.', 7),
  ('alien', 'First Contact', '👽', array['planet name', 'adjective', 'number', 'body part (plural)', 'noun', 'verb', 'Earth food', 'adjective', 'dance move', 'noun'], 'Greetings, Earthling. We come from the planet {1}, which is very {2}. We have {3} {4} and we communicate exclusively by {5}. We have come to {6} your planet and also to try {7}, which we hear is {8}. In exchange, we will teach you the {9}. Please take us to your leader, or failing that, a {10}.', 8);

create table public.madlibs (
  id             uuid primary key default gen_random_uuid(),
  template_id    text not null references public.madlib_templates (id),
  starter_id     uuid references public.profiles (id) on delete set null,
  partner_id     uuid references public.profiles (id) on delete set null,
  starter_words  text[] not null,
  partner_words  text[],
  first_message  uuid references public.messages (id) on delete set null,
  reply_message  uuid references public.messages (id) on delete set null,
  created_at     timestamptz not null default now()
);
alter table public.madlibs enable row level security;

alter table public.messages add column madlib_id uuid references public.madlibs (id) on delete set null;

-- Fill a template: blank n comes from the starter if n is odd, the partner if even.
-- Filled-in words are wrapped in «» so the app can highlight them.
create function public._render_madlib(p_template text, a text[], b text[])
returns text
language plpgsql stable
set search_path = public, extensions
as $$
declare
  t public.madlib_templates;
  out text;
  n int;
  word text;
begin
  select * into t from public.madlib_templates where id = p_template;
  out := t.story;
  for n in reverse array_length(t.prompts, 1)..1 loop
    word := case when n % 2 = 1 then a[(n + 1) / 2] else b[n / 2] end;
    out := replace(out, '{' || n || '}', '«' || coalesce(word, '???') || '»');
  end loop;
  return t.emoji || ' ' || t.title || E'\n\n' || out;
end;
$$;

create function public._clean_words(words text[], expected int)
returns text[]
language plpgsql immutable
as $$
declare
  cleaned text[] := array(select left(trim(w), 40) from unnest(words) w);
begin
  if coalesce(array_length(cleaned, 1), 0) <> expected
     or exists (select 1 from unnest(cleaned) w where w = '') then
    raise exception 'Fill in every blank';
  end if;
  return cleaned;
end;
$$;

-- Start a Mad Lib: your words go with the first letter.
create function public.send_madlib(
  p_recipient uuid, p_template text, p_words text[], p_transport text, p_weather text default null
) returns uuid
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  t public.madlib_templates;
  v_ml uuid;
  v_message uuid;
  v_name text;
begin
  select * into t from public.madlib_templates where id = p_template;
  if not found then raise exception 'Unknown Mad Lib'; end if;
  insert into public.madlibs (template_id, starter_id, partner_id, starter_words)
  values (p_template, me, p_recipient,
          public._clean_words(p_words, (array_length(t.prompts, 1) + 1) / 2))
  returning id into v_ml;
  select coalesce(display_name, '@' || username) into v_name from public.profiles where id = me;
  v_message := public.send_message(
    p_recipient,
    t.emoji || ' ' || v_name || ' started a Mad Lib: “' || t.title || '”. Your turn to fill in the blanks!',
    p_transport, p_weather);
  update public.messages set madlib_id = v_ml where id = v_message;
  update public.madlibs set first_message = v_message where id = v_ml;
  return v_message;
end;
$$;

-- Finish a Mad Lib you received: your words complete the story, which travels back.
create function public.reply_madlib(p_message uuid, p_words text[], p_transport text, p_weather text default null)
returns uuid
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  ml public.madlibs;
  t public.madlib_templates;
  v_words text[];
  v_reply uuid;
begin
  select * into ml from public.madlibs where first_message = p_message for update;
  if not found or ml.partner_id is distinct from me
     or public._message_status(p_message) <> 'delivered' then
    raise exception 'That Mad Lib isn''t waiting on you';
  end if;
  if ml.reply_message is not null then raise exception 'You already filled this one in'; end if;
  select * into t from public.madlib_templates where id = ml.template_id;
  v_words := public._clean_words(p_words, array_length(t.prompts, 1) / 2);
  update public.madlibs set partner_words = v_words where id = ml.id;
  v_reply := public.send_message(ml.starter_id, public._render_madlib(ml.template_id, ml.starter_words, v_words),
                                 p_transport, p_weather);
  update public.messages set madlib_id = ml.id where id = v_reply;
  update public.madlibs set reply_message = v_reply where id = ml.id;
  return v_reply;
end;
$$;

revoke all on function
  public._render_madlib(text, text[], text[]),
  public._clean_words(text[], int),
  public.send_madlib(uuid, text, text[], text, text),
  public.reply_madlib(uuid, text[], text, text)
from public, anon, authenticated;
grant execute on function
  public.send_madlib(uuid, text, text[], text, text),
  public.reply_madlib(uuid, text[], text, text)
to authenticated;

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
    'madlib', case when mine.madlib_id is not null then (
      select jsonb_build_object(
        'id', ml.id,
        'template_id', ml.template_id,
        'is_reply', ml.reply_message = mine.id,
        'can_fill', ml.first_message = mine.id and mine.role = 'received' and mine.delivered
                    and ml.reply_message is null)
      from public.madlibs ml where ml.id = mine.madlib_id) end,
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
