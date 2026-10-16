-- Phase 3 & 4: lost letters pulled into towns and visible anywhere, weather,
-- achievements that unlock faster carriers, and photo postcards.
-- Needs the towns tables from 20261018000000/1 to be loaded first.

-- ---------------------------------------------------------------------------
-- Weather. The app reports the weather at the starting point; each carrier
-- reacts differently (snails love rain, balloons hate storms, the SR-71
-- flies above all of it).
-- ---------------------------------------------------------------------------

create table public.weather_effects (
  weather       text not null check (weather in ('clear', 'cloudy', 'fog', 'rain', 'snow', 'storm', 'wind')),
  transport_id  text not null references public.transports (id) on delete cascade,
  speed_mult    double precision not null check (speed_mult > 0),
  risk_mult     double precision not null check (risk_mult > 0),
  primary key (weather, transport_id)
);
alter table public.weather_effects enable row level security;
create policy "weather effects are public" on public.weather_effects for select using (true);

insert into public.weather_effects (weather, transport_id, speed_mult, risk_mult) values
  ('storm', 'snail', 1.2, 0.6), ('storm', 'moth', 0.5, 1.15), ('storm', 'walk', 0.8, 1.5),
  ('storm', 'horse', 0.8, 2), ('storm', 'bicycle', 0.8, 2), ('storm', 'balloon', 0.6, 4),
  ('storm', 'train', 0.9, 2), ('storm', 'pigeon', 0.7, 3), ('storm', 'car', 0.85, 3),
  ('storm', 'jet', 0.9, 2),
  ('rain', 'snail', 1.5, 0.5), ('rain', 'moth', 0.7, 1.1), ('rain', 'walk', 0.9, 1.3),
  ('rain', 'horse', 0.9, 1.2), ('rain', 'bicycle', 0.85, 1.5), ('rain', 'balloon', 0.8, 2),
  ('rain', 'pigeon', 0.85, 1.5), ('rain', 'car', 0.95, 1.5),
  ('snow', 'snail', 0.3, 2), ('snow', 'moth', 0.5, 1.15), ('snow', 'walk', 0.6, 2),
  ('snow', 'horse', 0.7, 1.5), ('snow', 'bicycle', 0.5, 3), ('snow', 'balloon', 0.8, 2),
  ('snow', 'train', 0.85, 1.5), ('snow', 'pigeon', 0.8, 2), ('snow', 'car', 0.7, 5),
  ('snow', 'jet', 0.9, 1.5),
  ('wind', 'moth', 0.6, 1.15), ('wind', 'bicycle', 0.85, 1.2), ('wind', 'balloon', 1.6, 2),
  ('wind', 'pigeon', 0.9, 1.3), ('wind', 'jet', 1.05, 1),
  ('fog', 'pigeon', 0.9, 1.2), ('fog', 'train', 0.95, 1.2), ('fog', 'car', 0.85, 2),
  ('fog', 'jet', 0.9, 1.5);

alter table public.legs add column weather text;
alter table public.leg_fates add column fail_town text;

-- ---------------------------------------------------------------------------
-- Pulling a wreck into the nearest town (within 25 km), dropped a short
-- random walk from the centre, so it's somewhere a person could reach.
-- ---------------------------------------------------------------------------

create function public._snap_to_town(p extensions.geography, out point extensions.geography, out town text)
language plpgsql volatile
set search_path = public, extensions
as $$
declare
  t public.towns;
begin
  select * into t from public.towns
  where ST_DWithin(location, p, 25000)
  order by location <-> p
  limit 1;
  if not found then
    point := p;
    town := null;
    return;
  end if;
  point := ST_Project(t.location, 150 + random() * 550, radians(random() * 360));
  town := t.label;
end;
$$;

-- Rebuilt with weather and town-snapping. (Signature changes, so drop first.)
drop function public._create_leg(uuid, uuid, text, extensions.geography, extensions.geography);

create function public._create_leg(
  p_message uuid, p_carrier uuid, p_transport text,
  p_origin extensions.geography, p_destination extensions.geography,
  p_weather text default null
) returns uuid
language plpgsql volatile
set search_path = public, extensions
as $$
declare
  t public.transports;
  fx public.weather_effects;
  v_leg uuid;
  v_dist double precision;
  v_secs double precision;
  v_departed timestamptz := now();
  v_arrives timestamptz;
  v_frac double precision;
  v_risk double precision;
  v_snap record;
  v_no int;
begin
  select * into t from public.transports where id = p_transport;
  if not found then
    raise exception 'Unknown carrier: %', p_transport;
  end if;
  select * into fx from public.weather_effects where weather = p_weather and transport_id = p_transport;

  v_dist := ST_Distance(p_origin, p_destination) / 1000.0 * t.route_factor;
  v_secs := greatest(v_dist / (t.speed_kmh * coalesce(fx.speed_mult, 1)) * 3600, 60);  -- even next door takes a minute
  v_arrives := v_departed + make_interval(secs => v_secs);
  v_risk := least(t.failure_rate * coalesce(fx.risk_mult, 1), 0.99);

  select coalesce(max(leg_no), 0) + 1 into v_no from public.legs where message_id = p_message;

  insert into public.legs (message_id, leg_no, carrier_id, transport_id, origin, destination, distance_km,
                           departed_at, arrives_at, weather)
  values (p_message, v_no, p_carrier, p_transport, p_origin, p_destination, v_dist, v_departed, v_arrives, p_weather)
  returning id into v_leg;

  if random() < v_risk then
    v_frac := 0.05 + random() * 0.9;
    select * into v_snap from public._snap_to_town(public._gc_interpolate(p_origin, p_destination, v_frac));
    insert into public.leg_fates (leg_id, fails, fail_point, fail_town, fails_at, fail_reason)
    values (
      v_leg, true, v_snap.point, v_snap.town,
      v_departed + (v_arrives - v_departed) * v_frac,
      t.failure_reasons[1 + floor(random() * array_length(t.failure_reasons, 1))::int]
    );
  else
    insert into public.leg_fates (leg_id, fails) values (v_leg, false);
  end if;

  return v_leg;
end;
$$;

-- ---------------------------------------------------------------------------
-- Achievements. Everyone starts with the slow, unreliable carriers; earning
-- achievements unlocks faster ones.
-- ---------------------------------------------------------------------------

create table public.achievements (
  id           text primary key,
  title        text not null,
  description  text not null,
  emoji        text not null,
  goal         int not null default 1,
  unlocks      text references public.transports (id),
  sort         int not null
);
alter table public.achievements enable row level security;
create policy "achievements are public" on public.achievements for select using (true);

alter table public.transports add column starter boolean not null default false;
update public.transports set starter = true where id in ('snail', 'moth', 'walk', 'pigeon');

insert into public.achievements (id, title, description, emoji, goal, unlocks, sort) values
  ('first_letter',    'Return to Sender… Eventually', 'Send your first letter.', '✉️', 1, 'horse', 1),
  ('first_delivered', 'You’ve Got (Slow) Mail', 'Get a letter all the way to someone.', '📬', 1, 'bicycle', 2),
  ('finders_keepers', 'Finders Keepers', 'Pick up someone else’s lost letter.', '🔍', 1, 'balloon', 3),
  ('pen_pals',        'Pen Pals', 'Make 3 friends.', '🤝', 3, 'train', 4),
  ('prolific',        'Prolific Correspondent', 'Send 10 letters. Your hand must be tired.', '🖋️', 10, 'car', 5),
  ('collector',       'Fleet Manager', 'Send letters by 5 different carriers.', '🗂️', 5, 'jet', 6),
  ('frequent_flyer',  'Frequent Flyer', 'Send 25 letters. The post office knows your name.', '🎟️', 25, 'sr71', 7),
  ('sr71',            'Wow, It’s Almost Like Instant Messaging', 'Send a letter by SR-71 Blackbird.', '🛩️', 1, null, 8),
  ('snail_delivered', 'Worth the Wait', 'Get a letter delivered by Garden Snail. Congratulations on your patience.', '🐌', 1, null, 9),
  ('moth_delivered',  'The Eagles Are Coming!', 'Get a letter delivered by Moth. Against all odds.', '🦋', 1, null, 10),
  ('good_samaritan',  'Good Samaritan', 'Send a found letter on its way.', '😇', 1, null, 11),
  ('neither_snow',    'Neither Snow nor Rain', 'A letter you rescued reached its recipient.', '🦸', 1, null, 12),
  ('nosy',            'Nosy Neighbor', 'Break the seal on a letter that isn’t yours.', '👀', 1, null, 13),
  ('special_delivery','Special Delivery', 'Find a lost letter that was addressed to you.', '💌', 1, null, 14),
  ('left_on_read',    'Left on Read', 'Someone read your letter. Will they write back? Who knows.', '👁️', 1, null, 15),
  ('ghosted',         'Ghosted', 'Have 3 letters that should have arrived by now. Carriers, am I right?', '👻', 3, null, 16),
  ('fan_mail',        'Fan Mail', 'Receive 10 letters.', '🌟', 10, null, 17),
  ('long_distance',   'Long Distance Relationship', 'Get a letter delivered over 1,000 km.', '🌍', 1, null, 18),
  ('marathon',        'Marathon Man', 'Get a Foot Courier letter delivered over 42 km.', '🏃', 1, null, 19),
  ('storm_chaser',    'Storm Chaser', 'Send a letter in a thunderstorm. Bold.', '⛈️', 1, null, 20);

update public.transports t set starter = false
  from public.achievements a where a.unlocks = t.id;

create table public.user_achievements (
  user_id         uuid not null references public.profiles (id) on delete cascade,
  achievement_id  text not null references public.achievements (id) on delete cascade,
  unlocked_at     timestamptz not null default now(),
  seen            boolean not null default false,
  primary key (user_id, achievement_id)
);
alter table public.user_achievements enable row level security;

-- Progress toward every achievement for one person.
create function public._achievement_progress(u uuid)
returns table (achievement_id text, progress int)
language sql stable
set search_path = public, extensions
as $$
  with sent as (
    select m.*, public._message_status(m.id) = 'delivered' as delivered,
           (select l from public.legs l where l.message_id = m.id and l.leg_no = 1) as first_leg
    from public.messages m where m.sender_id = u
  ),
  my_finds as (
    select f.*, m.recipient_id, public._message_status(m.id) = 'delivered' as delivered
    from public.leg_fates f
    join public.legs l on l.id = f.leg_id
    join public.messages m on m.id = l.message_id
    where f.found_by = u
  )
  select * from (values
    ('first_letter',    (select count(*) from sent)::int),
    ('first_delivered', (select count(*) from sent where delivered)::int),
    ('finders_keepers', (select count(*) from my_finds where recipient_id <> u)::int),
    ('pen_pals',        (select count(*) from public.friendships
                         where status = 'accepted' and (requester_id = u or addressee_id = u))::int),
    ('prolific',        (select count(*) from sent)::int),
    ('collector',       (select count(distinct (first_leg).transport_id) from sent)::int),
    ('frequent_flyer',  (select count(*) from sent)::int),
    ('sr71',            (select count(*) from sent where (first_leg).transport_id = 'sr71')::int),
    ('snail_delivered', (select count(*) from sent where delivered and (first_leg).transport_id = 'snail')::int),
    ('moth_delivered',  (select count(*) from sent where delivered and (first_leg).transport_id = 'moth')::int),
    ('good_samaritan',  (select count(*) from my_finds where forwarded)::int),
    ('neither_snow',    (select count(*) from my_finds where forwarded and delivered)::int),
    ('nosy',            (select count(*) from my_finds where opened_at is not null and recipient_id <> u)::int),
    ('special_delivery',(select count(*) from my_finds where recipient_id = u)::int),
    ('left_on_read',    (select count(*) from sent where read_at is not null)::int),
    ('ghosted',         (select count(*) from sent where not delivered and (first_leg).arrives_at < now())::int),
    ('fan_mail',        (select count(*) from public.messages m
                         where m.recipient_id = u and public._message_status(m.id) = 'delivered')::int),
    ('long_distance',   (select count(*) from sent where delivered and (first_leg).distance_km >= 1000)::int),
    ('marathon',        (select count(*) from sent where delivered and (first_leg).transport_id = 'walk'
                                                   and (first_leg).distance_km >= 42)::int),
    ('storm_chaser',    (select count(*) from sent where (first_leg).weather = 'storm')::int)
  ) as v(achievement_id, progress);
$$;

-- Record anything newly earned. Called whenever we hand out profile data or check a carrier.
create function public._refresh_achievements(u uuid)
returns void
language sql volatile
set search_path = public, extensions
as $$
  insert into public.user_achievements (user_id, achievement_id)
  select u, a.id
  from public._achievement_progress(u) p
  join public.achievements a on a.id = p.achievement_id
  where p.progress >= a.goal
  on conflict do nothing;
$$;

create function public._carrier_unlocked(u uuid, p_transport text)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select coalesce(t.starter, false)
      or exists (select 1 from public.achievements a
                 join public.user_achievements ua on ua.achievement_id = a.id and ua.user_id = u
                 where a.unlocks = p_transport)
  from public.transports t where t.id = p_transport;
$$;

create function public.get_achievements()
returns jsonb
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  perform public._refresh_achievements(me);
  return (
    select coalesce(jsonb_agg(jsonb_build_object(
      'id', a.id,
      'title', a.title,
      'description', a.description,
      'emoji', a.emoji,
      'goal', a.goal,
      'progress', least(p.progress, a.goal),
      'unlocks', a.unlocks,
      'unlocked_at', ua.unlocked_at
    ) order by (ua.unlocked_at is null), a.sort), '[]'::jsonb)
    from public.achievements a
    join public._achievement_progress(me) p on p.achievement_id = a.id
    left join public.user_achievements ua on ua.user_id = me and ua.achievement_id = a.id
  );
end;
$$;

create function public.mark_achievements_seen()
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  update public.user_achievements set seen = true where user_id = public._require_user() and not seen;
$$;

-- get_me now also refreshes achievements and reports unlocked carriers and anything new.
drop function public.get_me();
create function public.get_me()
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
-- Photo postcards (one photo per letter, stored privately).
-- ---------------------------------------------------------------------------

alter table public.messages add column photo_path text;
alter table public.messages drop constraint messages_body_check;
alter table public.messages add constraint messages_body_check
  check (char_length(body) <= 2000 and (char_length(body) >= 1 or photo_path is not null));

-- Who may look at a postcard photo: the sender, the recipient once it's arrived, and
-- anyone who found the letter and broke the seal. Also the uploader, before sending.
create function public.can_view_postcard(p_path text)
returns boolean
language sql stable security definer
set search_path = public, extensions
as $$
  select split_part(p_path, '/', 1) = auth.uid()::text
      or exists (
        select 1 from public.messages m
        where m.photo_path = p_path
          and (m.sender_id = auth.uid()
               or (m.recipient_id = auth.uid() and public._message_status(m.id) = 'delivered')
               or exists (select 1 from public.legs l join public.leg_fates f on f.leg_id = l.id
                          where l.message_id = m.id and f.found_by = auth.uid() and f.opened_at is not null)));
$$;

do $$
begin
  if exists (select 1 from pg_namespace where nspname = 'storage') then
    insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
    values ('postcards', 'postcards', false, 5242880, array['image/jpeg'])
    on conflict (id) do nothing;
    execute $p$create policy "postcards: upload your own" on storage.objects for insert to authenticated
      with check (bucket_id = 'postcards' and split_part(name, '/', 1) = auth.uid()::text)$p$;
    execute $p$create policy "postcards: view if allowed" on storage.objects for select to authenticated
      using (bucket_id = 'postcards' and public.can_view_postcard(name))$p$;
  end if;
end;
$$;

-- ---------------------------------------------------------------------------
-- Sending and forwarding: unlocked carriers only, with weather and photos.
-- ---------------------------------------------------------------------------

drop function public.send_message(uuid, text, text);
create function public.send_message(
  p_recipient uuid, p_body text, p_transport text,
  p_weather text default null, p_photo text default null
) returns uuid
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  v_from extensions.geography;
  v_to extensions.geography;
  v_message uuid;
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
  select home into v_from from public.profiles where id = me;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;

  insert into public.messages (sender_id, recipient_id, body, photo_path)
  values (me, p_recipient, trim(coalesce(p_body, '')), p_photo)
  returning id into v_message;

  perform public._create_leg(v_message, me, p_transport, v_from, v_to, p_weather);
  return v_message;
end;
$$;

drop function public.forward_found(uuid, text, double precision, double precision);
create function public.forward_found(
  p_leg uuid, p_transport text, p_lat double precision, p_lng double precision, p_weather text default null
) returns uuid
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
  perform public._refresh_achievements(me);
  if not public._carrier_unlocked(me, p_transport) then
    raise exception 'You haven''t unlocked that carrier yet';
  end if;
  if p_weather is not null and p_weather not in ('clear', 'cloudy', 'fog', 'rain', 'snow', 'storm', 'wind') then
    raise exception 'Unknown weather';
  end if;

  select m2.* into m from public.messages m2 join public.legs l on l.message_id = m2.id where l.id = p_leg;
  select home into v_to from public.profiles where id = m.recipient_id;
  if v_to is null then
    raise exception 'The recipient no longer has a mailbox';
  end if;

  update public.leg_fates set forwarded = true where leg_id = p_leg;
  perform public._create_leg(m.id, me, p_transport, public._point(p_lat, p_lng, 6), v_to, p_weather);
  return m.id;
end;
$$;

-- ---------------------------------------------------------------------------
-- Reads: photos, weather, and towns.
-- ---------------------------------------------------------------------------

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
    'photo_path', case when f.opened_at is not null then m.photo_path end
  ) order by f.found_at desc), '[]'::jsonb)
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  join public.messages m on m.id = l.message_id
  where f.found_by = public._require_user()
    and m.recipient_id <> f.found_by;
$$;

-- Every lost letter you're allowed to see, wherever it fell (nearest first, up to 300).
create or replace function public.nearby_wrecks(p_lat double precision, p_lng double precision)
returns jsonb
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  here extensions.geography := public._point(p_lat, p_lng, 6);
  result jsonb;
begin
  select coalesce(jsonb_agg(w order by (w->>'distance_m')::float8), '[]'::jsonb)
  into result
  from (
    select jsonb_build_object(
      'leg_id', l.id,
      'transport_id', l.transport_id,
      'fail_reason', f.fail_reason,
      'town', f.fail_town,
      'lost_at', f.fails_at,
      'coords', public._coords(f.fail_point, 6),
      'distance_m', round(ST_Distance(f.fail_point, here))
    ) as w
    from public.leg_fates f
    join public.legs l on l.id = f.leg_id
    where f.fails
      and f.found_by is null
      and f.fails_at <= now()
      and now() < l.arrives_at + interval '30 days'
      and public._can_see_wreck(me, l.message_id)
    order by f.fail_point <-> here
    limit 300
  ) s;
  return result;
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions
-- ---------------------------------------------------------------------------

revoke all on function
  public._snap_to_town(extensions.geography),
  public._create_leg(uuid, uuid, text, extensions.geography, extensions.geography, text),
  public._achievement_progress(uuid),
  public._refresh_achievements(uuid),
  public._carrier_unlocked(uuid, text),
  public.get_achievements(),
  public.mark_achievements_seen(),
  public.get_me(),
  public.can_view_postcard(text),
  public.send_message(uuid, text, text, text, text),
  public.forward_found(uuid, text, double precision, double precision, text)
from public, anon, authenticated;

grant execute on function
  public.get_achievements(),
  public.mark_achievements_seen(),
  public.get_me(),
  public.can_view_postcard(text),
  public.send_message(uuid, text, text, text, text),
  public.forward_found(uuid, text, double precision, double precision, text)
to authenticated;
