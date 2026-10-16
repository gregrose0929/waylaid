-- Phase 2: friends & blocking, "like real life" visibility, mailbox tools,
-- conversation preferences, and push notifications for arrivals.

-- ---------------------------------------------------------------------------
-- Friends and blocks
-- ---------------------------------------------------------------------------

create table public.friendships (
  requester_id  uuid not null references public.profiles (id) on delete cascade,
  addressee_id  uuid not null references public.profiles (id) on delete cascade,
  status        text not null check (status in ('pending', 'accepted')),
  created_at    timestamptz not null default now(),
  accepted_at   timestamptz,
  primary key (requester_id, addressee_id),
  check (requester_id <> addressee_id)
);
-- one row per pair, whichever direction it started in
create unique index friendships_pair_idx
  on public.friendships (least(requester_id, addressee_id), greatest(requester_id, addressee_id));

create table public.blocks (
  blocker_id  uuid not null references public.profiles (id) on delete cascade,
  blocked_id  uuid not null references public.profiles (id) on delete cascade,
  created_at  timestamptz not null default now(),
  primary key (blocker_id, blocked_id),
  check (blocker_id <> blocked_id)
);

alter table public.friendships enable row level security;
alter table public.blocks enable row level security;

create function public._are_friends(a uuid, b uuid)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select exists (
    select 1 from public.friendships
    where status = 'accepted'
      and ((requester_id = a and addressee_id = b) or (requester_id = b and addressee_id = a)));
$$;

-- How `viewer` relates to `other`. Being blocked by someone is never revealed.
create function public._relationship(viewer uuid, other uuid)
returns text
language sql stable
set search_path = public, extensions
as $$
  select case
    when exists (select 1 from public.blocks where blocker_id = viewer and blocked_id = other) then 'blocked'
    when public._are_friends(viewer, other) then 'friend'
    when exists (select 1 from public.friendships
                 where requester_id = viewer and addressee_id = other and status = 'pending') then 'outgoing'
    when exists (select 1 from public.friendships
                 where requester_id = other and addressee_id = viewer and status = 'pending')
         and not exists (select 1 from public.blocks where blocker_id = other and blocked_id = viewer) then 'incoming'
    else 'none' end;
$$;

create function public._blocked_either_way(a uuid, b uuid)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select exists (select 1 from public.blocks
                 where (blocker_id = a and blocked_id = b) or (blocker_id = b and blocked_id = a));
$$;

create function public.send_friend_request(p_user uuid)
returns text
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_user = me then raise exception 'That''s you!'; end if;
  if public._blocked_either_way(me, p_user) then raise exception 'You can''t add this person'; end if;
  if public._are_friends(me, p_user) then return 'friend'; end if;

  -- They already asked you: saying "add" back means yes.
  update public.friendships set status = 'accepted', accepted_at = now()
   where requester_id = p_user and addressee_id = me and status = 'pending';
  if found then return 'friend'; end if;

  insert into public.friendships (requester_id, addressee_id, status)
  values (me, p_user, 'pending')
  on conflict do nothing;
  return 'outgoing';
end;
$$;

create function public.respond_friend_request(p_user uuid, p_accept boolean)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_accept then
    update public.friendships set status = 'accepted', accepted_at = now()
     where requester_id = p_user and addressee_id = me and status = 'pending';
  else
    delete from public.friendships
     where requester_id = p_user and addressee_id = me and status = 'pending';
  end if;
  if not found then raise exception 'That request is gone'; end if;
end;
$$;

create function public.cancel_friend_request(p_user uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  delete from public.friendships
   where requester_id = public._require_user() and addressee_id = p_user and status = 'pending';
$$;

create function public.remove_friend(p_user uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  delete from public.friendships
   where (requester_id = public._require_user() and addressee_id = p_user)
      or (requester_id = p_user and addressee_id = public._require_user());
$$;

create function public.block_user(p_user uuid)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_user = me then raise exception 'You can''t block yourself'; end if;
  insert into public.blocks (blocker_id, blocked_id) values (me, p_user) on conflict do nothing;
  delete from public.friendships
   where (requester_id = me and addressee_id = p_user) or (requester_id = p_user and addressee_id = me);
end;
$$;

create function public.unblock_user(p_user uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  delete from public.blocks where blocker_id = public._require_user() and blocked_id = p_user;
$$;

-- ---------------------------------------------------------------------------
-- Per-conversation preferences (pin to top, mute notifications)
-- ---------------------------------------------------------------------------

create table public.conversation_prefs (
  owner_id   uuid not null references public.profiles (id) on delete cascade,
  other_id   uuid not null references public.profiles (id) on delete cascade,
  pinned_at  timestamptz,
  muted      boolean not null default false,
  primary key (owner_id, other_id)
);
alter table public.conversation_prefs enable row level security;

create function public.set_conversation_pref(p_other uuid, p_pinned boolean default null, p_muted boolean default null)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  insert into public.conversation_prefs (owner_id, other_id, pinned_at, muted)
  values (me, p_other, case when p_pinned then now() end, coalesce(p_muted, false))
  on conflict (owner_id, other_id) do update set
    pinned_at = case when p_pinned is null then public.conversation_prefs.pinned_at
                     when p_pinned then coalesce(public.conversation_prefs.pinned_at, now())
                     else null end,
    muted = coalesce(p_muted, public.conversation_prefs.muted);
end;
$$;

-- How `viewer` sees person `p_id`, now with relationship and conversation prefs.
create or replace function public._person(p_id uuid, viewer uuid)
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
    'has_home', p.home is not null,
    'relationship', public._relationship(viewer, p.id),
    'pinned', cp.pinned_at is not null,
    'muted', coalesce(cp.muted, false))
  from public.profiles p
  left join public.contacts c on c.owner_id = viewer and c.contact_id = p.id
  left join public.conversation_prefs cp on cp.owner_id = viewer and cp.other_id = p.id
  where p.id = p_id;
$$;

create function public.get_friends()
returns jsonb
language plpgsql stable security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  return jsonb_build_object(
    'friends', coalesce((
      select jsonb_agg(public._person(other, me) order by lower(coalesce(c.nickname, p.display_name, p.username)))
      from (select case when requester_id = me then addressee_id else requester_id end as other
            from public.friendships
            where status = 'accepted' and (requester_id = me or addressee_id = me)) f
      join public.profiles p on p.id = f.other
      left join public.contacts c on c.owner_id = me and c.contact_id = f.other), '[]'::jsonb),
    'incoming', coalesce((
      select jsonb_agg(public._person(requester_id, me) order by created_at desc)
      from public.friendships f
      where addressee_id = me and status = 'pending'
        and not exists (select 1 from public.blocks where blocker_id = f.requester_id and blocked_id = me)), '[]'::jsonb),
    'outgoing', coalesce((
      select jsonb_agg(public._person(addressee_id, me) order by created_at desc)
      from public.friendships where requester_id = me and status = 'pending'), '[]'::jsonb),
    'blocked', coalesce((
      select jsonb_agg(public._person(blocked_id, me) order by created_at desc)
      from public.blocks where blocker_id = me), '[]'::jsonb)
  );
end;
$$;

-- People who blocked you don't show up in search.
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
      and not exists (select 1 from public.blocks b where b.blocker_id = p.id and b.blocked_id = q.me)
    order by c.owner_id is not null desc, p.username
    limit 10
  ) s;
$$;

-- ---------------------------------------------------------------------------
-- Friends-only letters
-- ---------------------------------------------------------------------------

create or replace function public.send_message(p_recipient uuid, p_body text, p_transport text)
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
  if not public._are_friends(me, p_recipient) then raise exception 'You can only write to friends'; end if;
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

-- Quoting from your own mailbox needs a friend; quoting from a spot (forwarding a found letter) doesn't.
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
    if not public._are_friends(me, p_recipient) then raise exception 'You can only write to friends'; end if;
    select home into v_from from public.profiles where id = me;
  end if;
  select home into v_to from public.profiles where id = p_recipient;
  if v_from is null then raise exception 'Set your mailbox location first'; end if;
  if v_to is null then raise exception 'They haven''t set up a mailbox yet'; end if;
  return ST_Distance(v_from, v_to) / 1000.0;
end;
$$;

-- ---------------------------------------------------------------------------
-- Mailbox tools: bulk actions, undo, mark unread
-- ---------------------------------------------------------------------------

alter table public.mailbox_flags add column marked_unread boolean not null default false;

-- p_state: inbox | archived | deleted | restored (undo delete) | unread | read
create function public.set_letters_state(p_messages uuid[], p_state text)
returns void
language plpgsql volatile security definer
set search_path = public, extensions
as $$
declare
  me uuid := public._require_user();
begin
  if p_state not in ('inbox', 'archived', 'deleted', 'restored', 'unread', 'read') then
    raise exception 'Unknown state %', p_state;
  end if;
  if exists (select 1 from unnest(p_messages) as x(mid)
             where not exists (select 1 from public.messages m
                               where m.id = x.mid and (m.sender_id = me or m.recipient_id = me))) then
    raise exception 'That letter isn''t yours';
  end if;

  insert into public.mailbox_flags (user_id, message_id)
  select me, x.mid from unnest(p_messages) as x(mid)
  on conflict do nothing;

  update public.mailbox_flags set
    archived_at   = case p_state when 'archived' then now() when 'inbox' then null else archived_at end,
    deleted_at    = case p_state when 'deleted' then coalesce(deleted_at, now()) when 'restored' then null else deleted_at end,
    marked_unread = case p_state when 'unread' then true when 'read' then false else marked_unread end
  where user_id = me and message_id = any (p_messages);

  if p_state = 'read' then
    update public.messages set read_at = now()
     where id = any (p_messages) and recipient_id = me and read_at is null
       and public._message_status(id) = 'delivered';
  end if;
end;
$$;

-- Kept so the Phase 1 app keeps working until it updates.
create or replace function public.set_letter_state(p_message uuid, p_state text)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  select public.set_letters_state(array[p_message], p_state);
$$;

create or replace function public.mark_read(p_message uuid)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  select public.set_letters_state(array[p_message], 'read')
  where exists (select 1 from public.messages where id = p_message and recipient_id = public._require_user());
$$;

-- ---------------------------------------------------------------------------
-- "Like real life": recipients see nothing until a letter arrives; senders see
-- it in transit, then "overdue" forever, unless it's eventually delivered —
-- only then is the whole journey revealed.
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
          'origin', public._shared_coords(l.origin, l.carrier_id, me),
          'destination', public._shared_coords(l.destination, mine.recipient_id, me),
          'outcome', case
            when not f.fails then 'arrived'
            when f.found_by = mine.recipient_id then 'found_by_recipient'
            when f.forwarded then 'forwarded'
            else 'lost' end,
          'fail_reason', case when f.fails then f.fail_reason end,
          'last_seen', case when f.fails then public._coords(f.fail_point, 1) end,
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
        'origin', public._coords((mine.first_leg).origin, 5),
        'destination', public._shared_coords((mine.first_leg).destination, mine.recipient_id, me),
        'outcome', case when now() < (mine.first_leg).arrives_at then 'in_transit' else 'overdue' end,
        'fail_reason', null,
        'last_seen', null,
        'opened_by_finder', false))
      end
  ) order by coalesce(case when mine.delivered then coalesce(mine.found_by_recipient_at, (mine.last_leg).arrives_at) end,
                      mine.created_at) desc), '[]'::jsonb)
  into result
  from mine;

  return result;
end;
$$;

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
      'delivered', (select count(*) from public.messages m where m.sender_id = me and public._message_status(m.id) = 'delivered'),
      'received',  (select count(*) from public.messages m where m.recipient_id = me and public._message_status(m.id) = 'delivered'),
      'found',     (select count(*) from public.leg_fates where found_by = me)
    )
  );
end;
$$;

-- ---------------------------------------------------------------------------
-- Lost letters are only visible to you if they're yours (sent or addressed to
-- you), or both the sender and the recipient are your friends. Unmarked.
-- ---------------------------------------------------------------------------

create function public._can_see_wreck(viewer uuid, p_message uuid)
returns boolean
language sql stable
set search_path = public, extensions
as $$
  select m.sender_id = viewer or m.recipient_id = viewer
      or (public._are_friends(viewer, m.sender_id) and public._are_friends(viewer, m.recipient_id))
  from public.messages m where m.id = p_message;
$$;

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
  select coalesce(jsonb_agg(jsonb_build_object(
    'leg_id', l.id,
    'transport_id', l.transport_id,
    'fail_reason', f.fail_reason,
    'lost_at', f.fails_at,
    'coords', public._coords(f.fail_point, 6),
    'distance_m', round(ST_Distance(f.fail_point, here))
  ) order by ST_Distance(f.fail_point, here)), '[]'::jsonb)
  into result
  from public.leg_fates f
  join public.legs l on l.id = f.leg_id
  where f.fails
    and f.found_by is null
    and f.fails_at <= now()
    and now() < l.arrives_at + interval '30 days'
    and ST_DWithin(f.fail_point, here, 50000)
    and public._can_see_wreck(me, l.message_id);
  return result;
end;
$$;

create or replace function public.pick_up(p_leg uuid, p_lat double precision, p_lng double precision)
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
  select m2.* into m from public.messages m2 join public.legs l on l.message_id = m2.id where l.id = p_leg;
  if not found or not f.fails or f.fails_at > now()
     or now() >= (select arrives_at from public.legs where id = p_leg) + interval '30 days'
     or not public._can_see_wreck(me, m.id) then
    raise exception 'There''s nothing here';
  end if;
  if f.found_by is not null then
    raise exception 'Someone beat you to it';
  end if;
  if not ST_DWithin(f.fail_point, public._point(p_lat, p_lng, 6), 300) then
    raise exception 'You need to be within 300 m to pick it up';
  end if;

  update public.leg_fates set found_by = me, found_at = now() where leg_id = p_leg;

  if m.recipient_id = me then
    -- Delivered by hand: no push needed, you're holding it.
    update public.messages set found_by_recipient_at = now(), notified_at = now() where id = m.id;
    return jsonb_build_object('outcome', 'delivered', 'message_id', m.id);
  end if;
  return jsonb_build_object('outcome', 'found', 'leg_id', p_leg);
end;
$$;

-- ---------------------------------------------------------------------------
-- Push notifications: "a letter arrived". Nothing else is ever pushed.
-- ---------------------------------------------------------------------------

create table public.push_tokens (
  token       text primary key,
  user_id     uuid not null references public.profiles (id) on delete cascade,
  updated_at  timestamptz not null default now()
);
alter table public.push_tokens enable row level security;

create function public.register_push_token(p_token text)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  insert into public.push_tokens (token, user_id) values (p_token, public._require_user())
  on conflict (token) do update set user_id = excluded.user_id, updated_at = now();
$$;

create function public.unregister_push_token(p_token text)
returns void
language sql volatile security definer
set search_path = public, extensions
as $$
  delete from public.push_tokens where token = p_token and user_id = public._require_user();
$$;

alter table public.messages add column notified_at timestamptz;
-- Everything that already exists counts as already announced.
update public.messages set notified_at = now();
create index messages_unnotified_idx on public.messages (id) where notified_at is null;

-- Finds letters that have arrived but weren't announced yet, marks them, and
-- returns the Expo push messages to send (one per device, skipping muted chats).
create function public._due_arrival_pushes()
returns jsonb
language plpgsql volatile
set search_path = public, extensions
as $$
declare
  result jsonb;
begin
  with due as (
    select m.id, m.sender_id, m.recipient_id, l.transport_id
    from public.messages m
    join lateral (select * from public.legs l where l.message_id = m.id order by leg_no desc limit 1) l on true
    join public.leg_fates f on f.leg_id = l.id
    where m.notified_at is null and not f.fails and l.arrives_at <= now()
  ),
  marked as (
    update public.messages m set notified_at = now() from due where m.id = due.id returning m.id
  )
  select coalesce(jsonb_agg(jsonb_build_object(
    'to', t.token,
    'title', '✉️ A letter from ' || coalesce(c.nickname, p.display_name, '@' || p.username),
    'body', 'It just arrived by ' || tr.name || ' ' || tr.emoji,
    'sound', 'default',
    'channelId', 'letters',
    'data', jsonb_build_object('url', '/letter/' || due.id)
  )), '[]'::jsonb)
  into result
  from due
  join marked on marked.id = due.id
  join public.push_tokens t on t.user_id = due.recipient_id
  join public.profiles p on p.id = due.sender_id
  join public.transports tr on tr.id = due.transport_id
  left join public.contacts c on c.owner_id = due.recipient_id and c.contact_id = due.sender_id
  left join public.conversation_prefs cp on cp.owner_id = due.recipient_id and cp.other_id = due.sender_id
  where not coalesce(cp.muted, false);
  return result;
end;
$$;

-- Runs every minute (pg_cron) and hands the messages to Expo (pg_net), 100 at a time.
create function public._send_arrival_pushes()
returns int
language plpgsql volatile
set search_path = public, extensions
as $$
declare
  msgs jsonb := public._due_arrival_pushes();
  n int := jsonb_array_length(msgs);
  i int := 0;
begin
  while i < n loop
    perform net.http_post(
      url := 'https://exp.host/--/api/v2/push/send',
      body := (select jsonb_agg(value) from jsonb_array_elements(msgs) with ordinality e(value, idx)
               where idx > i and idx <= i + 100),
      headers := '{"Content-Type": "application/json", "Accept": "application/json"}'::jsonb);
    i := i + 100;
  end loop;
  return n;
end;
$$;

do $$
begin
  if exists (select 1 from pg_available_extensions where name = 'pg_cron')
     and exists (select 1 from pg_available_extensions where name = 'pg_net') then
    execute 'create extension if not exists pg_net with schema extensions';
    execute 'create extension if not exists pg_cron';
    perform cron.schedule('waylaid-arrival-pushes', '* * * * *', 'select public._send_arrival_pushes()');
  end if;
end;
$$;

-- ---------------------------------------------------------------------------
-- Permissions
-- ---------------------------------------------------------------------------

revoke all on function
  public._are_friends(uuid, uuid),
  public._relationship(uuid, uuid),
  public._blocked_either_way(uuid, uuid),
  public._can_see_wreck(uuid, uuid),
  public._due_arrival_pushes(),
  public._send_arrival_pushes(),
  public.send_friend_request(uuid),
  public.respond_friend_request(uuid, boolean),
  public.cancel_friend_request(uuid),
  public.remove_friend(uuid),
  public.block_user(uuid),
  public.unblock_user(uuid),
  public.set_conversation_pref(uuid, boolean, boolean),
  public.get_friends(),
  public.set_letters_state(uuid[], text),
  public.register_push_token(text),
  public.unregister_push_token(text)
from public, anon, authenticated;

grant execute on function
  public.send_friend_request(uuid),
  public.respond_friend_request(uuid, boolean),
  public.cancel_friend_request(uuid),
  public.remove_friend(uuid),
  public.block_user(uuid),
  public.unblock_user(uuid),
  public.set_conversation_pref(uuid, boolean, boolean),
  public.get_friends(),
  public.set_letters_state(uuid[], text),
  public.register_push_token(text),
  public.unregister_push_token(text)
to authenticated;
