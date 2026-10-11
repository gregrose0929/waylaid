-- Waylaid: messages that travel at the speed of their carrier.
--
-- Design notes
-- * Every table has RLS enabled and (apart from `transports`) no client policies.
--   All reads/writes go through SECURITY DEFINER functions so the server alone
--   decides when a message has arrived and whether its carrier survived.
-- * Delivery is time-derived: a leg "arrives" once now() >= arrives_at. No cron job
--   is needed; status is computed whenever someone asks.
-- * A leg's fate (does it fail, where, why) is rolled at send time and stored in
--   `leg_fates`, which clients can never read directly.
-- * Homes are stored rounded to ~1 km and shown to other people rounded to ~10 km.

create extension if not exists postgis with schema extensions;

-- ---------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------

create table public.transports (
  id               text primary key,
  name             text not null,
  emoji            text not null,
  tagline          text not null,
  speed_kmh        double precision not null check (speed_kmh > 0),
  -- multiplier on great-circle distance for things that can't fly straight
  route_factor     double precision not null default 1.0 check (route_factor >= 1),
  -- chance a single trip fails, 0..1
  failure_rate     double precision not null check (failure_rate between 0 and 1),
  failure_reasons  text[] not null check (array_length(failure_reasons, 1) > 0),
  sort             int not null
);

create table public.profiles (
  id            uuid primary key references auth.users (id) on delete cascade,
  username      text not null unique check (username ~ '^[a-z0-9_]{3,20}$'),
  display_name  text check (char_length(display_name) <= 40),
  home          extensions.geography(Point, 4326),
  home_label    text check (char_length(home_label) <= 80),
  created_at    timestamptz not null default now()
);

create table public.messages (
  id                     uuid primary key default gen_random_uuid(),
  sender_id              uuid not null references public.profiles (id) on delete cascade,
  recipient_id           uuid not null references public.profiles (id) on delete cascade,
  body                   text not null check (char_length(body) between 1 and 2000),
  created_at             timestamptz not null default now(),
  read_at                timestamptz,
  -- set when the recipient personally stumbles on the wreck of their own letter
  found_by_recipient_at  timestamptz
);

create table public.legs (
  id              uuid primary key default gen_random_uuid(),
  message_id      uuid not null references public.messages (id) on delete cascade,
  leg_no          int not null,
  carrier_id      uuid not null references public.profiles (id) on delete cascade,
  transport_id    text not null references public.transports (id),
  origin          extensions.geography(Point, 4326) not null,
  destination     extensions.geography(Point, 4326) not null,
  distance_km     double precision not null,
  departed_at     timestamptz not null default now(),
  arrives_at      timestamptz not null,
  unique (message_id, leg_no)
);

create table public.leg_fates (
  leg_id       uuid primary key references public.legs (id) on delete cascade,
  fails        boolean not null,
  fail_point   extensions.geography(Point, 4326),
  fails_at     timestamptz,
  fail_reason  text,
  found_by     uuid references public.profiles (id) on delete set null,
  found_at     timestamptz,
  opened_at    timestamptz,
  forwarded    boolean not null default false
);

create index messages_sender_idx    on public.messages (sender_id);
create index messages_recipient_idx on public.messages (recipient_id);
create index legs_message_idx       on public.legs (message_id, leg_no desc);
create index leg_fates_found_by_idx on public.leg_fates (found_by);
create index leg_fates_wreck_idx    on public.leg_fates using gist (fail_point)
  where fails and found_by is null;

alter table public.transports enable row level security;
alter table public.profiles   enable row level security;
alter table public.messages   enable row level security;
alter table public.legs       enable row level security;
alter table public.leg_fates  enable row level security;

create policy "transports are public" on public.transports for select using (true);

-- ---------------------------------------------------------------------------
-- Carriers
-- ---------------------------------------------------------------------------

insert into public.transports (id, name, emoji, tagline, speed_kmh, route_factor, failure_rate, failure_reasons, sort) values
  ('snail',   'Garden Snail',     '🐌', 'For when it can truly wait.',          0.048, 1.0,  0.30,
    array['Eaten by a thrush', 'Stepped on', 'Distracted by a lettuce leaf', 'Dried out on a sidewalk'], 1),
  ('walk',    'Foot Courier',     '🚶', 'One step at a time.',                  5,     1.3,  0.03,
    array['Blisters. Gave up.', 'Took a wrong turn at Albuquerque', 'Stopped for pie and never left'], 2),
  ('horse',   'Pony Express',     '🐎', 'Hold onto your hat.',                  16,    1.25, 0.02,
    array['Thrown from the saddle', 'Horse spooked by a plastic bag', 'Bandits!'], 3),
  ('bicycle', 'Bike Messenger',   '🚲', 'Weaving through traffic.',             20,    1.25, 0.01,
    array['Flat tire, no patch kit', 'Chain snapped', 'Doored by a parked car'], 4),
  ('balloon', 'Hot Air Balloon',  '🎈', 'Wherever the wind blows.',             25,    1.0,  0.04,
    array['Drifted into a thunderstorm', 'Ran out of propane', 'Snagged on a power line'], 5),
  ('pigeon',  'Carrier Pigeon',   '🕊️', 'The classic.',                         80,    1.0,  0.02,
    array['Snatched by a hawk', 'Flew into a window', 'Distracted by bread crumbs', 'Joined a different flock'], 7),
  ('train',   'Steam Train',      '🚂', 'All aboard!',                          65,    1.2,  0.005,
    array['Cow on the tracks', 'Mailbag fell off at a junction', 'Boiler trouble'], 6),
  ('car',     'Car',              '🚗', 'Reliable, mostly.',                    95,    1.25, 0.00001,
    array['Letter blew out the window', 'Blew a tire into a ditch', 'Ran out of gas'], 8),
  ('jet',     'Airmail Jet',      '✈️', 'Cruising at 35,000 ft.',               800,   1.05, 0.0005,
    array['Lost in baggage', 'Rerouted through Newark and forgotten', 'Fell out of the cargo hold'], 9),
  ('sr71',    'SR-71 Blackbird',  '🛩️', 'Mach 3.3. Leaks fuel on the runway.',  3540,  1.0,  0.01,
    array['Pilot ejected over a cornfield', 'Classified. This never happened.', 'Fuel leak (it always leaks)'], 10);

-- ---------------------------------------------------------------------------
-- Internal helpers (not callable by clients)
-- ---------------------------------------------------------------------------

-- Point a fraction `f` of the way along the great circle from a to b.
create function public._gc_interpolate(a extensions.geography, b extensions.geography, f double precision)
returns extensions.geography
language plpgsql immutable
set search_path = public, extensions
as $$
declare
  lat1 double precision := radians(ST_Y(a::geometry));
  lon1 double precision := radians(ST_X(a::geometry));
  lat2 double precision := radians(ST_Y(b::geometry));
  lon2 double precision := radians(ST_X(b::geometry));
  d double precision;
  ka double precision;
  kb double precision;
  x double precision;
  y double precision;
  z double precision;
begin
  d := 2 * asin(sqrt(sin((lat2 - lat1) / 2) ^ 2 + cos(lat1) * cos(lat2) * sin((lon2 - lon1) / 2) ^ 2));
  if sin(d) < 1e-9 then
    return a;
  end if;
  ka := sin((1 - f) * d) / sin(d);
  kb := sin(f * d) / sin(d);
  x := ka * cos(lat1) * cos(lon1) + kb * cos(lat2) * cos(lon2);
  y := ka * cos(lat1) * sin(lon1) + kb * cos(lat2) * sin(lon2);
  z := ka * sin(lat1) + kb * sin(lat2);
  return ST_SetSRID(ST_MakePoint(degrees(atan2(y, x)), degrees(atan2(z, sqrt(x * x + y * y)))), 4326)::geography;
end;
$$;

create function public._point(lat double precision, lng double precision, decimals int)
returns extensions.geography
language sql immutable
set search_path = public, extensions
as $$
  select ST_SetSRID(ST_MakePoint(round(lng::numeric, decimals)::float8, round(lat::numeric, decimals)::float8), 4326)::geography;
$$;

-- [lat, lng] as JSON, rounded for display to other people.
create function public._coords(g extensions.geography, decimals int default 1)
returns jsonb
language sql immutable
set search_path = public, extensions
as $$
  select case when g is null then null
    else jsonb_build_array(round(ST_Y(g::geometry)::numeric, decimals), round(ST_X(g::geometry)::numeric, decimals)) end;
$$;

-- Create a leg and secretly roll its fate.
create function public._create_leg(
  p_message uuid, p_carrier uuid, p_transport text,
  p_origin extensions.geography, p_destination extensions.geography
) returns uuid
language plpgsql volatile
set search_path = public, extensions
as $$
declare
  t public.transports;
  v_leg uuid;
  v_dist double precision;
  v_secs double precision;
  v_departed timestamptz := now();
  v_arrives timestamptz;
  v_frac double precision;
  v_no int;
begin
  select * into t from public.transports where id = p_transport;
  if not found then
    raise exception 'Unknown carrier: %', p_transport;
  end if;

  v_dist := ST_Distance(p_origin, p_destination) / 1000.0 * t.route_factor;
  v_secs := greatest(v_dist / t.speed_kmh * 3600, 60);  -- even next door takes a minute
  v_arrives := v_departed + make_interval(secs => v_secs);

  select coalesce(max(leg_no), 0) + 1 into v_no from public.legs where message_id = p_message;

  insert into public.legs (message_id, leg_no, carrier_id, transport_id, origin, destination, distance_km, departed_at, arrives_at)
  values (p_message, v_no, p_carrier, p_transport, p_origin, p_destination, v_dist, v_departed, v_arrives)
  returning id into v_leg;

  if random() < t.failure_rate then
    v_frac := 0.05 + random() * 0.9;
    insert into public.leg_fates (leg_id, fails, fail_point, fails_at, fail_reason)
    values (
      v_leg, true,
      public._gc_interpolate(p_origin, p_destination, v_frac),
      v_departed + (v_arrives - v_departed) * v_frac,
      t.failure_reasons[1 + floor(random() * array_length(t.failure_reasons, 1))::int]
    );
  else
    insert into public.leg_fates (leg_id, fails) values (v_leg, false);
  end if;

  return v_leg;
end;
$$;

-- Public status of a message: in_transit | delivered | lost | found
create function public._message_status(p_message uuid)
returns text
language plpgsql stable
set search_path = public, extensions
as $$
declare
  m public.messages;
  l public.legs;
  f public.leg_fates;
begin
  select * into m from public.messages where id = p_message;
  if m.found_by_recipient_at is not null then
    return 'delivered';
  end if;
  select * into l from public.legs where message_id = p_message order by leg_no desc limit 1;
  select * into f from public.leg_fates where leg_id = l.id;
  if now() < l.arrives_at then
    return 'in_transit';
  elsif not f.fails then
    return 'delivered';
  elsif f.found_by is not null then
    return 'found';
  else
    return 'lost';
  end if;
end;
$$;

create function public._require_user()
returns uuid
language plpgsql stable
as $$
begin
  if auth.uid() is null then
    raise exception 'Not signed in';
  end if;
  return auth.uid();
end;
$$;

-- ---------------------------------------------------------------------------
-- Client API (RPC)
-- ---------------------------------------------------------------------------

create function public.get_me()
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
    'home', public._coords(p.home, 2),
    'home_label', p.home_label,
    'stats', jsonb_build_object(
      'sent',      (select count(*) from public.messages where sender_id = me),
      'received',  (select count(*) from public.messages m where m.recipient_id = me and public._message_status(m.id) = 'delivered'),
      'lost',      (select count(*) from public.messages m where m.sender_id = me and public._message_status(m.id) in ('lost', 'found')),
      'found',     (select count(*) from public.leg_fates where found_by = me)
    )
  );
end;
$$;

create function public.save_profile(p_username text, p_display_name text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  insert into public.profiles (id, username, display_name)
  values (me, lower(trim(p_username)), nullif(trim(p_display_name), ''))
  on conflict (id) do update
    set username = excluded.username, display_name = excluded.display_name;
exception
  when unique_violation then
    raise exception 'That username is taken';
  when check_violation then
    raise exception 'Usernames are 3-20 characters: letters, numbers, underscores';
end;
$$;

create function public.set_home(p_lat double precision, p_lng double precision, p_label text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  update public.profiles
     set home = public._point(p_lat, p_lng, 2), home_label = nullif(trim(p_label), '')
   where id = me;
  if not found then
    raise exception 'Create a profile first';
  end if;
end;
$$;

create function public.find_users(p_query text)
returns jsonb
language sql stable security definer
set search_path = public, extensions
as $$
  select coalesce(jsonb_agg(u order by u->>'username'), '[]'::jsonb)
  from (
    select jsonb_build_object('id', id, 'username', username, 'display_name', display_name,
                              'has_home', home is not null) as u
    from public.profiles
    where id <> public._require_user()
      and username like lower(trim(p_query)) || '%'
      and char_length(trim(p_query)) >= 1
    order by username
    limit 10
  ) s;
$$;

-- Distance (km, great circle) from me, or from a given point, to a recipient's mailbox.
create function public.quote_distance(p_recipient uuid, p_lat double precision default null, p_lng double precision default null)
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
    v_from := public._point(p_lat, p_lng, 2);
  else
    select home into v_from from public.profiles where id = me;
  end if;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;
  return ST_Distance(v_from, v_to) / 1000.0;
end;
$$;

create function public.send_message(p_recipient uuid, p_body text, p_transport text)
returns uuid
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
  select home into v_from from public.profiles where id = me;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;

  insert into public.messages (sender_id, recipient_id, body)
  values (me, p_recipient, trim(p_body))
  returning id into v_message;

  perform public._create_leg(v_message, me, p_transport, v_from, v_to);
  return v_message;
end;
$$;

-- Everything in my mailbox: letters I sent and letters addressed to me.
create function public.get_mail()
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
           case when m.sender_id = me then 'sent' else 'received' end as role
    from public.messages m
    where m.sender_id = me or m.recipient_id = me
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
    'created_at', mine.created_at,
    'read_at', mine.read_at,
    'delivered_at', case when mine.status = 'delivered'
                         then coalesce(mine.found_by_recipient_at, latest.arrives_at) end,
    'body', case when mine.role = 'sent' or mine.status = 'delivered' then mine.body end,
    'other', (select jsonb_build_object('id', p.id, 'username', p.username, 'display_name', p.display_name)
              from public.profiles p
              where p.id = case when mine.role = 'sent' then mine.recipient_id else mine.sender_id end),
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
        'origin', public._coords(l.origin),
        'destination', public._coords(l.destination),
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

create function public.mark_read(p_message uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  update public.messages
     set read_at = now()
   where id = p_message
     and recipient_id = public._require_user()
     and read_at is null
     and public._message_status(id) = 'delivered';
$$;

-- Wrecks of failed carriers within 50 km that nobody has picked up yet.
-- They become findable the moment the carrier goes down and crumble 30 days after
-- the letter was due, so the sender has time to learn it's lost and go looking.
create function public.nearby_wrecks(p_lat double precision, p_lng double precision)
returns jsonb
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  here extensions.geography := public._point(p_lat, p_lng, 6);
  result jsonb;
begin
  select coalesce(jsonb_agg(jsonb_build_object(
    'leg_id', l.id,
    'transport_id', l.transport_id,
    'fail_reason', f.fail_reason,
    'lost_at', f.fails_at,
    'coords', public._coords(f.fail_point, 6),
    'distance_m', round(ST_Distance(f.fail_point, here)),
    'addressed_to_you', m.recipient_id = me
  ) order by ST_Distance(f.fail_point, here)), '[]'::jsonb)
  into result
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  join public.messages m on m.id = l.message_id
  where f.fails
    and f.found_by is null
    and f.fails_at <= now()
    and now() < l.arrives_at + interval '30 days'
    and ST_DWithin(f.fail_point, here, 50000);
  return result;
end;
$$;

-- Pick up a wreck. You have to actually be there (within 300 m).
create function public.pick_up(p_leg uuid, p_lat double precision, p_lng double precision)
returns jsonb
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  f public.leg_fates;
  m public.messages;
begin
  select * into f from public.leg_fates where leg_id = p_leg for update;
  if not found or not f.fails or f.fails_at > now()
     or now() >= (select arrives_at from public.legs where id = p_leg) + interval '30 days' then
    raise exception 'There''s nothing here';
  end if;
  if f.found_by is not null then
    raise exception 'Someone beat you to it';
  end if;
  if not ST_DWithin(f.fail_point, public._point(p_lat, p_lng, 6), 300) then
    raise exception 'You need to be within 300 m to pick it up';
  end if;

  select m2.* into m from public.messages m2 join public.legs l on l.message_id = m2.id where l.id = p_leg;

  update public.leg_fates set found_by = me, found_at = now() where leg_id = p_leg;

  if m.recipient_id = me then
    update public.messages set found_by_recipient_at = now() where id = m.id;
    return jsonb_build_object('outcome', 'delivered', 'message_id', m.id);
  end if;
  return jsonb_build_object('outcome', 'found', 'leg_id', p_leg);
end;
$$;

-- Letters I've picked up off the ground.
create function public.get_found()
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
    'from', (select jsonb_build_object('id', p.id, 'username', p.username, 'display_name', p.display_name)
             from public.profiles p where p.id = m.sender_id),
    'to', (select jsonb_build_object('id', p.id, 'username', p.username, 'display_name', p.display_name)
           from public.profiles p where p.id = m.recipient_id),
    'body', case when f.opened_at is not null then m.body end
  ) order by f.found_at desc), '[]'::jsonb)
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  join public.messages m on m.id = l.message_id
  where f.found_by = public._require_user()
    and m.recipient_id <> f.found_by;
$$;

-- Break the seal on a letter you found. The sender and recipient will know.
create function public.open_found(p_leg uuid)
returns text
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
  v_body text;
begin
  update public.leg_fates set opened_at = coalesce(opened_at, now())
   where leg_id = p_leg and found_by = me;
  if not found then
    raise exception 'That letter isn''t yours to open';
  end if;
  select m.body into v_body from public.messages m join public.legs l on l.message_id = m.id where l.id = p_leg;
  return v_body;
end;
$$;

-- Send a found letter on toward its recipient from where you are now.
create function public.forward_found(p_leg uuid, p_transport text, p_lat double precision, p_lng double precision)
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
  perform public._create_leg(m.id, me, p_transport, public._point(p_lat, p_lng, 2), v_to);
  return m.id;
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions: helpers are private, the API is for signed-in users only.
-- ---------------------------------------------------------------------------

revoke all on all functions in schema public from public, anon, authenticated;

grant execute on function
  public.get_me(),
  public.save_profile(text, text),
  public.set_home(double precision, double precision, text),
  public.find_users(text),
  public.quote_distance(uuid, double precision, double precision),
  public.send_message(uuid, text, text),
  public.get_mail(),
  public.mark_read(uuid),
  public.nearby_wrecks(double precision, double precision),
  public.pick_up(uuid, double precision, double precision),
  public.get_found(),
  public.open_found(uuid),
  public.forward_found(uuid, text, double precision, double precision)
to authenticated;

-- Helpers are called from SECURITY DEFINER functions, which run as the owner,
-- so they don't need to be granted to anyone.
