-- Unlocks never depend on luck: finding a lost letter stays an achievement, but the
-- Hot Air Balloon is now unlocked by sending 5 letters ("Getting the Hang of It").

update public.achievements set unlocks = null where id = 'finders_keepers';
update public.achievements set sort = sort + 1 where sort >= 3;
insert into public.achievements (id, title, description, emoji, goal, unlocks, sort) values
  ('warming_up', 'Getting the Hang of It', 'Send 5 letters. You’re a natural.', '✍️', 5, 'balloon', 3);

create or replace function public._achievement_progress(u uuid)
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
    ('warming_up',      (select count(*) from sent)::int),
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

revoke all on function public._achievement_progress(uuid) from public, anon, authenticated;
