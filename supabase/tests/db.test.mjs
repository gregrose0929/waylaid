// End-to-end test of the Waylaid database API, run against an in-process
// Postgres + PostGIS (PGlite). No Supabase project or Docker needed.
//
//   npm run test:db
//
// It fakes the bits of Supabase the migrations rely on (auth.users, auth.uid(),
// the anon/authenticated roles), applies every migration, then plays out the game.

import { PGlite } from '@electric-sql/pglite';
import { postgis } from '@electric-sql/pglite-postgis';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { test } from 'node:test';

const migrations = path.join(import.meta.dirname, '..', 'migrations');

const A = '00000000-0000-0000-0000-00000000000a'; // greg, Fishers IN
const B = '00000000-0000-0000-0000-00000000000b'; // kate, Cincinnati OH
const C = '00000000-0000-0000-0000-00000000000c'; // a friend of both
const E = '00000000-0000-0000-0000-00000000000e'; // a stranger to everyone

const db = new PGlite({ extensions: { postgis } });
await db.exec(`
  create schema auth; create schema extensions;
  create role anon; create role authenticated;
  create table auth.users (id uuid primary key);
  create function auth.uid() returns uuid language sql stable
    as $$ select nullif(current_setting('test.uid', true), '')::uuid $$;
`);
for (const f of fs.readdirSync(migrations).sort()) {
  await db.exec(fs.readFileSync(path.join(migrations, f), 'utf8'));
}
await db.exec(`set search_path = public, extensions`);
await db.exec(`insert into auth.users values ('${A}'), ('${B}'), ('${C}'), ('${E}')`);

/** Run SQL as a user and return the first column of the first row. */
async function as(uid, sql, params) {
  await db.query(`select set_config('test.uid', $1, false)`, [uid]);
  const { rows } = await db.query(sql, params);
  return rows[0] ? Object.values(rows[0])[0] : undefined;
}
const rejects = (promise, pattern) => assert.rejects(promise, pattern);
const legOf = (messageId) => as(A, `select id from legs where message_id = $1 order by leg_no desc limit 1`, [messageId]);
const forceSuccess = (legId) =>
  db.query(`update leg_fates set fails = false, fail_point = null, fails_at = null, fail_reason = null where leg_id = $1`, [legId]);
const forceFailure = (legId, fraction, reason) =>
  db.query(
    `update leg_fates set fails = true, fail_reason = $3,
       fail_point = (select _gc_interpolate(origin, destination, $2) from legs where id = $1),
       fails_at = (select departed_at + (arrives_at - departed_at) * $2 from legs where id = $1)
     where leg_id = $1`,
    [legId, fraction, reason],
  );
const shiftLeg = (legId, departedAgo, arrivesIn) =>
  db.query(`update legs set departed_at = now() - $2::interval, arrives_at = now() + $3::interval where id = $1`, [
    legId,
    departedAgo,
    arrivesIn,
  ]);
const wreckAt = async (legId) =>
  (await db.query(`select ST_Y(fail_point::geometry) lat, ST_X(fail_point::geometry) lng from leg_fates where leg_id = $1`, [legId]))
    .rows.map((r) => [r.lat, r.lng])[0];
const mailOf = async (uid, messageId) => (await as(uid, `select get_mail()`)).find((m) => m.id === messageId);
const befriend = async (x, y) => {
  await as(x, `select send_friend_request('${y}')`);
  await as(y, `select send_friend_request('${x}')`); // asking back = accepting
};
/** Send a letter that has already been delivered. */
async function delivered(from, to, body, carrier = 'car') {
  const id = await as(from, `select send_message('${to}', '${body}', '${carrier}')`);
  const leg = await legOf(id);
  await forceSuccess(leg);
  await shiftLeg(leg, '3 hours', '-1 minute');
  return id;
}

test('profiles and mailboxes', async () => {
  await as(A, `select save_profile('greg', 'Greg')`);
  await as(B, `select save_profile('kate', '')`);
  await as(C, `select save_profile('finder', null)`);
  await as(E, `select save_profile('stranger', null)`);
  await rejects(as(C, `select save_profile('greg', null)`), /taken/);
  await rejects(as(C, `select save_profile('A!', null)`), /3-20 characters/);

  await as(A, `select set_home(39.9568, -86.0134, 'Fishers, IN')`);
  await as(B, `select set_home(39.1031, -84.5120, 'Cincinnati, OH')`);
  await as(C, `select set_home(39.5, -85.2, null)`);
  await as(E, `select set_home(39.6, -85.3, null)`);

  const me = await as(A, `select get_me()`);
  assert.deepEqual(me.home, [39.9568, -86.0134], 'home is stored precisely');
  assert.equal(me.share_precise_home, true, 'precise by default');

  await as(A, `select save_profile('greg_r', 'Greg R')`);
  assert.equal((await as(A, `select get_me()`)).username, 'greg_r', 'usernames can be changed');
  await as(A, `select save_profile('greg', 'Greg')`);
});

test('friend requests, friends-only letters, and blocking', async () => {
  await rejects(as(A, `select send_message('${B}', 'hi', 'pigeon')`), /only write to friends/);
  await rejects(as(A, `select quote_distance('${B}')`), /only write to friends/);

  assert.equal(await as(A, `select send_friend_request('${B}')`), 'outgoing');
  assert.equal((await as(A, `select find_users('kate')`))[0].relationship, 'outgoing');
  let friends = await as(B, `select get_friends()`);
  assert.deepEqual(friends.incoming.map((p) => p.username), ['greg']);
  await as(B, `select respond_friend_request('${A}', true)`);
  assert.equal((await as(A, `select find_users('kate')`))[0].relationship, 'friend');

  const km = await as(A, `select quote_distance('${B}')`);
  assert.ok(km > 155 && km < 165, `Fishers to Cincinnati is ~160 km, got ${km}`);

  // decline and cancel
  await as(E, `select send_friend_request('${A}')`);
  await as(A, `select respond_friend_request('${E}', false)`);
  assert.equal((await as(A, `select get_friends()`)).incoming.length, 0);
  await as(E, `select send_friend_request('${A}')`);
  await as(E, `select cancel_friend_request('${A}')`);
  assert.equal((await as(A, `select get_friends()`)).incoming.length, 0);

  // blocking hides you from them and stops requests
  await as(A, `select block_user('${E}')`);
  assert.equal((await as(E, `select find_users('greg')`)).length, 0, 'blocked people cannot find you');
  await rejects(as(E, `select send_friend_request('${A}')`), /can't add/);
  assert.equal((await as(A, `select get_friends()`)).blocked[0].username, 'stranger');
  await as(A, `select unblock_user('${E}')`);

  await befriend(A, C);
  await befriend(B, C);
  friends = await as(C, `select get_friends()`);
  assert.deepEqual(friends.friends.map((p) => p.username).sort(), ['greg', 'kate']);

  await rejects(as(A, `select send_message('${A}', 'hi', 'pigeon')`), /yourself/);
  await rejects(as(A, `select send_message('${B}', 'hi', 'teleporter')`), /Unknown carrier/);
});

test('incoming letters are a surprise until they arrive', async () => {
  const id = await as(A, `select send_message('${B}', 'Hello by car', 'car')`);
  const leg = await legOf(id);
  await forceSuccess(leg);

  assert.equal(await mailOf(B, id), undefined, 'recipient sees nothing while it travels');
  const sent = await mailOf(A, id);
  assert.equal(sent.status, 'in_transit');
  assert.equal(sent.body, 'Hello by car', 'sender can read their own letter');

  await shiftLeg(leg, '3 hours', '-1 minute');
  let seen = await mailOf(B, id);
  assert.equal(seen.status, 'delivered');
  assert.equal(seen.body, 'Hello by car');
  assert.deepEqual(seen.legs[0].origin, [39.9568, -86.0134], 'precise mailbox is shared by default');
  await as(A, `select set_share_precise_home(false)`);
  seen = await mailOf(B, id);
  assert.deepEqual(seen.legs[0].origin, [40, -86], 'opting out shows only a ~10 km area');
  await as(A, `select set_share_precise_home(true)`);

  await as(B, `select mark_read('${id}')`);
  assert.ok((await mailOf(A, id)).read_at, 'sender sees the read receipt');
});

test('a lost letter is never confirmed lost — until someone delivers it', async () => {
  const id = await as(A, `select send_message('${B}', 'Secret pigeon letter', 'pigeon')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '3 hours', '-1 hour');
  await forceFailure(leg, 0.4, 'Snatched by a hawk');

  const overdue = await mailOf(A, id);
  assert.equal(overdue.status, 'overdue');
  assert.equal(overdue.legs.length, 1);
  assert.equal(overdue.legs[0].outcome, 'overdue');
  assert.equal(overdue.legs[0].fail_reason, null, 'no cause');
  assert.equal(overdue.legs[0].last_seen, null, 'no location');
  assert.equal(await mailOf(B, id), undefined, 'recipient never knew it existed');
  assert.equal((await as(A, `select get_me()`)).stats.delivered >= 1, true);

  const [lat, lng] = await wreckAt(leg);
  // C is friends with both A and B, so C can see it; E (a stranger) can't.
  const seenByC = await as(C, `select nearby_wrecks($1, $2)`, [lat + 0.1, lng]);
  assert.ok(seenByC.some((w) => w.leg_id === leg));
  assert.equal('addressed_to_you' in seenByC[0], false, 'wrecks are unmarked');
  assert.equal((await as(E, `select nearby_wrecks($1, $2)`, [lat, lng])).length, 0);
  await rejects(as(E, `select pick_up('${leg}', $1, $2)`, [lat, lng]), /nothing here/);
  assert.ok((await as(A, `select nearby_wrecks($1, $2)`, [lat, lng])).some((w) => w.leg_id === leg), 'your own show up too');

  await rejects(as(C, `select pick_up('${leg}', $1, $2)`, [lat + 0.1, lng]), /within 300 m/);
  assert.equal((await as(C, `select pick_up('${leg}', $1, $2)`, [lat + 0.001, lng])).outcome, 'found');
  await rejects(as(A, `select pick_up('${leg}', $1, $2)`, [lat, lng]), /beat you/);

  assert.equal((await as(C, `select get_found()`))[0].body, null, 'sealed');
  assert.equal(await as(C, `select open_found('${leg}')`), 'Secret pigeon letter');
  await rejects(as(A, `select open_found('${leg}')`), /isn't yours/);

  await as(C, `select forward_found('${leg}', 'bicycle', $1, $2)`, [lat, lng]);
  await rejects(as(C, `select forward_found('${leg}', 'car', 39, -85)`), /already/);
  const stillOverdue = await mailOf(A, id);
  assert.equal(stillOverdue.status, 'overdue', 'forwarding is not revealed either');
  assert.equal(stillOverdue.legs.length, 1);

  // The second leg arrives: now everyone learns the story.
  const leg2 = await legOf(id);
  await forceSuccess(leg2);
  await shiftLeg(leg2, '5 hours', '-1 minute');
  const story = await mailOf(A, id);
  assert.equal(story.status, 'delivered');
  assert.deepEqual(
    story.legs.map((l) => [l.transport_id, l.carrier, l.outcome, l.fail_reason, l.opened_by_finder]),
    [
      ['pigeon', 'you', 'forwarded', 'Snatched by a hawk', true],
      ['bicycle', 'stranger', 'arrived', null, false],
    ],
  );
  assert.equal((await mailOf(B, id)).status, 'delivered');
});

test('the recipient can find their own lost letter', async () => {
  const id = await as(A, `select send_message('${B}', 'Snail mail', 'snail')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '10 days', '-1 day');
  await forceFailure(leg, 0.5, 'Stepped on');
  assert.equal(await mailOf(B, id), undefined);

  const [lat, lng] = await wreckAt(leg);
  assert.ok((await as(B, `select nearby_wrecks($1, $2)`, [lat, lng])).some((w) => w.leg_id === leg));
  assert.equal((await as(B, `select pick_up('${leg}', $1, $2)`, [lat, lng])).outcome, 'delivered');
  const got = await mailOf(B, id);
  assert.equal(got.status, 'delivered');
  assert.equal(got.legs[0].outcome, 'found_by_recipient');
  assert.equal((await as(B, `select get_found()`)).length, 0, "your own letters don't go in your satchel");
});

test('wrecks crumble 30 days after the letter was due', async () => {
  const id = await as(A, `select send_message('${B}', 'Old news', 'walk')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '40 days', '-31 days');
  await forceFailure(leg, 0.5, 'Blisters. Gave up.');
  const [lat, lng] = await wreckAt(leg);
  assert.equal((await as(C, `select nearby_wrecks($1, $2)`, [lat, lng])).some((w) => w.leg_id === leg), false);
  await rejects(as(C, `select pick_up('${leg}', $1, $2)`, [lat, lng]), /nothing here/);
});

test('fate rolls match the failure rate and land on the route', async () => {
  await db.exec(`update transports set failure_rate = 0.5 where id = 'horse'`);
  for (let i = 0; i < 300; i++) await as(A, `select send_message('${B}', 'x', 'horse')`);
  const { rows } = await db.query(`
    select avg(fails::int)::float8 as rate,
           max(ST_Distance(f.fail_point, _gc_interpolate(l.origin, l.destination,
               extract(epoch from fails_at - departed_at) / extract(epoch from arrives_at - departed_at))))::float8 as off_route_m,
           min(extract(epoch from fails_at - departed_at) / extract(epoch from arrives_at - departed_at))::float8 as lo,
           max(extract(epoch from fails_at - departed_at) / extract(epoch from arrives_at - departed_at))::float8 as hi
    from leg_fates f join legs l on l.id = f.leg_id
    where l.transport_id = 'horse'`);
  const r = rows[0];
  assert.ok(r.rate > 0.38 && r.rate < 0.62, `~50% should fail, got ${r.rate}`);
  assert.ok(r.off_route_m < 1, 'wreck sits on the great-circle route');
  assert.ok(r.lo >= 0.05 && r.hi <= 0.95, 'never fails right at either mailbox');
  await db.exec(`delete from messages where body = 'x'`);
});

test('the moth is slow and rarely makes it', async () => {
  const moth = (await db.query(`select * from transports where id = 'moth'`)).rows[0];
  assert.ok(moth.speed_kmh < 5 && moth.failure_rate > 0.8);
  const order = (await db.query(`select id from transports order by sort`)).rows.map((r) => r.id);
  assert.deepEqual(order.slice(0, 3), ['snail', 'moth', 'walk']);
});

test('contacts have private nicknames', async () => {
  await as(A, `select save_contact('${B}', 'Kate Rose')`);
  const contacts = await as(A, `select get_contacts()`);
  assert.deepEqual(contacts.map((c) => [c.username, c.nickname]), [['kate', 'Kate Rose']]);
  assert.deepEqual((await as(A, `select find_users('rose')`)).map((u) => u.username), ['kate'], 'search by nickname');
  const letter = (await as(A, `select get_mail()`)).find((l) => l.other.id === B);
  assert.equal(letter.other.nickname, 'Kate Rose');
  assert.equal((await as(C, `select find_users('kate')`))[0].nickname, null, 'nicknames are private');
  await rejects(as(A, `select save_contact('${A}', 'me')`), /you/);
});

test('mailbox tools: bulk archive, delete with undo, mark unread', async () => {
  const one = await delivered(A, B, 'One');
  const two = await delivered(A, B, 'Two');
  await as(B, `select set_letters_state(array['${one}', '${two}']::uuid[], 'archived')`);
  assert.equal((await mailOf(B, one)).archived && (await mailOf(B, two)).archived, true);
  await as(B, `select set_letters_state(array['${one}', '${two}']::uuid[], 'inbox')`);
  assert.equal((await mailOf(B, one)).archived, false);

  await as(B, `select set_letters_state(array['${one}', '${two}']::uuid[], 'deleted')`);
  assert.equal(await mailOf(B, one), undefined, 'gone for the recipient');
  assert.ok(await mailOf(A, one), 'sender still has it');
  await as(B, `select set_letters_state(array['${one}']::uuid[], 'restored')`);
  assert.ok(await mailOf(B, one), 'undo brings it back');

  await as(B, `select set_letters_state(array['${one}']::uuid[], 'read')`);
  assert.ok((await mailOf(B, one)).read_at);
  await as(B, `select set_letters_state(array['${one}']::uuid[], 'unread')`);
  assert.equal((await mailOf(B, one)).marked_unread, true);
  await as(B, `select mark_read('${one}')`);
  assert.equal((await mailOf(B, one)).marked_unread, false, 'opening it clears the flag');

  await rejects(as(C, `select set_letters_state(array['${one}']::uuid[], 'deleted')`), /isn't yours/);
  await as(B, `select set_letter_state('${one}', 'archived')`); // Phase 1 app still works
  assert.equal((await mailOf(B, one)).archived, true);
});

test('pin and mute conversations', async () => {
  await as(B, `select set_conversation_pref('${A}', true, null)`);
  let other = (await as(B, `select get_mail()`))[0].other;
  assert.equal(other.pinned, true);
  await as(B, `select set_conversation_pref('${A}', null, true)`);
  other = (await as(B, `select get_mail()`))[0].other;
  assert.equal(other.pinned && other.muted, true, 'setting one keeps the other');
  await as(B, `select set_conversation_pref('${A}', false, false)`);
});

test('arrival pushes go out once, with nicknames, and respect mute', async () => {
  await as(B, `select register_push_token('ExponentPushToken[kate-phone]')`);
  await as(B, `select save_contact('${A}', 'Big Brother')`);
  await as(A, `select register_push_token('ExponentPushToken[greg-phone]')`);
  await db.exec(`select _due_arrival_pushes()`); // flush anything earlier tests delivered

  const id = await delivered(A, B, 'Ping!');
  let pushes = (await db.query(`select _due_arrival_pushes() p`)).rows[0].p;
  assert.equal(pushes.length, 1, 'only the recipient is notified, never the sender');
  assert.equal(pushes[0].to, 'ExponentPushToken[kate-phone]');
  assert.equal(pushes[0].title, '✉️ A letter from Big Brother');
  assert.equal(pushes[0].data.url, `/letter/${id}`);
  assert.equal((await db.query(`select _due_arrival_pushes() p`)).rows[0].p.length, 0, 'only once');

  const lost = await as(A, `select send_message('${B}', 'Doomed', 'moth')`);
  const lostLeg = await legOf(lost);
  await shiftLeg(lostLeg, '3 hours', '-1 minute');
  await forceFailure(lostLeg, 0.5, 'Eaten by a bat');
  assert.equal((await db.query(`select _due_arrival_pushes() p`)).rows[0].p.length, 0, 'nothing pushed for lost letters');

  await as(B, `select set_conversation_pref('${A}', null, true)`);
  await delivered(A, B, 'Shh');
  assert.equal((await db.query(`select _due_arrival_pushes() p`)).rows[0].p.length, 0, 'muted');
  await as(B, `select set_conversation_pref('${A}', null, false)`);
  await as(B, `select unregister_push_token('ExponentPushToken[kate-phone]')`);
});

test('deleting an account removes the person but not letters they carried', async () => {
  const D = '00000000-0000-0000-0000-00000000000d';
  await db.exec(`insert into auth.users values ('${D}')`);
  await as(D, `select save_profile('ghost', null)`);
  await as(D, `select set_home(39.5, -85.5, null)`);
  await befriend(D, A);
  await befriend(D, B);
  const id = await as(A, `select send_message('${B}', 'Carried by a ghost', 'pigeon')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '1 hour', '1 hour');
  await forceFailure(leg, 0.5, 'Snatched by a hawk');
  const [lat, lng] = await wreckAt(leg);
  await as(D, `select pick_up('${leg}', $1, $2)`, [lat, lng]);
  await as(D, `select forward_found('${leg}', 'car', $1, $2)`, [lat, lng]);
  await as(D, `select delete_account()`);
  assert.equal((await db.query(`select count(*)::int n from profiles where id = '${D}'`)).rows[0].n, 0);
  const leg2 = await legOf(id);
  await forceSuccess(leg2);
  await shiftLeg(leg2, '2 hours', '-1 minute');
  const letter = await mailOf(A, id);
  assert.equal(letter.legs.length, 2, 'the forwarded leg survives');
  assert.equal(letter.legs[1].carrier, 'stranger');
});

test('clients cannot touch tables or private helpers', async () => {
  // Supabase grants table access to these roles by default; RLS must still hide everything.
  await db.exec(`grant usage on schema public to anon, authenticated;
                 grant select, insert, update, delete on all tables in schema public to anon, authenticated;`);
  await db.query(`select set_config('test.uid', '${A}', false)`);
  const tables = ['profiles', 'messages', 'legs', 'leg_fates', 'contacts', 'mailbox_flags',
                  'friendships', 'blocks', 'conversation_prefs', 'push_tokens'];
  for (const role of ['anon', 'authenticated']) {
    await db.exec(`set role ${role}`);
    try {
      for (const table of tables) {
        const { rows } = await db.query(`select count(*)::int n from ${table}`);
        assert.equal(rows[0].n, 0, `${role} must not read ${table}`);
      }
      assert.ok((await db.query(`select count(*)::int n from transports`)).rows[0].n > 0, 'carriers are public');
      for (const fn of [
        `_message_status(gen_random_uuid())`,
        `_create_leg(null, null, 'car', null, null)`,
        `_person(gen_random_uuid(), gen_random_uuid())`,
        `_are_friends(gen_random_uuid(), gen_random_uuid())`,
        `_due_arrival_pushes()`,
      ]) {
        await rejects(db.query(`select ${fn}`), /permission denied/);
      }
      if (role === 'anon') await rejects(db.query(`select get_mail()`), /permission denied/);
      else await db.query(`select get_mail()`);
    } finally {
      await db.exec(`reset role`);
    }
  }
});
