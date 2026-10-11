// End-to-end test of the Waylaid database API, run against an in-process
// Postgres + PostGIS (PGlite). No Supabase project or Docker needed.
//
//   npm run test:db
//
// It fakes the bits of Supabase the migration relies on (auth.users, auth.uid(),
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
const C = '00000000-0000-0000-0000-00000000000c'; // a stranger

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
await db.exec(`insert into auth.users values ('${A}'), ('${B}'), ('${C}')`);

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
const mailOf = async (uid, messageId) => (await as(uid, `select get_mail()`)).find((m) => m.id === messageId);

test('profiles and mailboxes', async () => {
  await as(A, `select save_profile('greg', 'Greg')`);
  await as(B, `select save_profile('kate', '')`);
  await as(C, `select save_profile('finder', null)`);
  await rejects(as(C, `select save_profile('greg', null)`), /taken/);
  await rejects(as(C, `select save_profile('A!', null)`), /3-20 characters/);
  await rejects(as(A, `select send_message('${B}', 'hi', 'pigeon')`), /mailbox/);

  await as(A, `select set_home(39.9568, -86.0134, 'Fishers, IN')`);
  await as(B, `select set_home(39.1031, -84.5120, 'Cincinnati, OH')`);

  const me = await as(A, `select get_me()`);
  assert.deepEqual(me.home, [39.96, -86.01], 'home is stored to ~1 km');
  const found = await as(A, `select find_users('k')`);
  assert.deepEqual(found.map((u) => u.username), ['kate']);
  const km = await as(A, `select quote_distance('${B}')`);
  assert.ok(km > 155 && km < 165, `Fishers to Cincinnati is ~160 km, got ${km}`);

  await rejects(as(A, `select send_message('${A}', 'hi', 'pigeon')`), /yourself/);
  await rejects(as(A, `select send_message('${B}', 'hi', 'teleporter')`), /Unknown carrier/);
});

test('a letter stays sealed until it arrives', async () => {
  const id = await as(A, `select send_message('${B}', 'Hello by car', 'car')`);
  const leg = await legOf(id);
  await forceSuccess(leg);

  let seen = await mailOf(B, id);
  assert.equal(seen.status, 'in_transit');
  assert.equal(seen.body, null, 'recipient cannot read it in transit');
  assert.deepEqual(seen.legs[0].origin, [40, -86], 'other people see homes to ~10 km');

  await shiftLeg(leg, '3 hours', '-1 minute');
  seen = await mailOf(B, id);
  assert.equal(seen.status, 'delivered');
  assert.equal(seen.body, 'Hello by car');

  await as(B, `select mark_read('${id}')`);
  assert.ok((await mailOf(A, id)).read_at, 'sender sees the read receipt');
});

test('a lost carrier can be found, opened, and sent on', async () => {
  const id = await as(A, `select send_message('${B}', 'Secret pigeon letter', 'pigeon')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '1 hour', '1 hour');
  await forceFailure(leg, 0.4, 'Snatched by a hawk');

  const early = await mailOf(A, id);
  assert.equal(early.status, 'in_transit', 'failure stays secret until the letter is due');
  assert.equal(early.legs[0].fail_reason, null);

  const [lat, lng] = (await db.query(`select ST_Y(fail_point::geometry) lat, ST_X(fail_point::geometry) lng from leg_fates where leg_id = $1`, [leg])).rows.map((r) => [r.lat, r.lng])[0];

  const wrecks = await as(C, `select nearby_wrecks($1, $2)`, [lat + 0.1, lng]);
  assert.equal(wrecks.length, 1, 'wreck shows up within 50 km');
  assert.equal(wrecks[0].addressed_to_you, false);
  await rejects(as(C, `select pick_up('${leg}', $1, $2)`, [lat + 0.1, lng]), /within 300 m/);

  const picked = await as(C, `select pick_up('${leg}', $1, $2)`, [lat + 0.001, lng]);
  assert.equal(picked.outcome, 'found');
  await rejects(as(A, `select pick_up('${leg}', $1, $2)`, [lat, lng]), /beat you/);

  let satchel = await as(C, `select get_found()`);
  assert.equal(satchel[0].to.username, 'kate');
  assert.equal(satchel[0].body, null, 'still sealed');
  assert.equal(await as(C, `select open_found('${leg}')`), 'Secret pigeon letter');
  await rejects(as(A, `select open_found('${leg}')`), /isn't yours/);

  await as(C, `select forward_found('${leg}', 'bicycle', $1, $2)`, [lat, lng]);
  await rejects(as(C, `select forward_found('${leg}', 'car', 39, -85)`), /already/);

  const after = await mailOf(A, id);
  assert.equal(after.status, 'in_transit');
  assert.deepEqual(
    after.legs.map((l) => [l.transport_id, l.carrier, l.outcome, l.opened_by_finder]),
    [
      ['pigeon', 'you', 'forwarded', true],
      ['bicycle', 'stranger', 'in_transit', false],
    ],
  );
  satchel = await as(C, `select get_found()`);
  assert.equal(satchel[0].forwarded, true);
});

test('the recipient can find their own lost letter', async () => {
  const id = await as(A, `select send_message('${B}', 'Snail mail', 'snail')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '10 days', '-1 day');
  await forceFailure(leg, 0.5, 'Stepped on');

  const lost = await mailOf(B, id);
  assert.equal(lost.status, 'lost');
  assert.equal(lost.legs[0].fail_reason, 'Stepped on');
  assert.ok(lost.legs[0].last_seen, 'everyone learns roughly where it went down');

  const [lat, lng] = (await db.query(`select ST_Y(fail_point::geometry) lat, ST_X(fail_point::geometry) lng from leg_fates where leg_id = $1`, [leg])).rows.map((r) => [r.lat, r.lng])[0];
  const wrecks = await as(B, `select nearby_wrecks($1, $2)`, [lat, lng]);
  assert.equal(wrecks.find((w) => w.leg_id === leg).addressed_to_you, true);

  const picked = await as(B, `select pick_up('${leg}', $1, $2)`, [lat, lng]);
  assert.equal(picked.outcome, 'delivered');
  const got = await mailOf(B, id);
  assert.equal(got.status, 'delivered');
  assert.equal(got.body, 'Snail mail');
  assert.equal(got.legs[0].outcome, 'found_by_recipient');
  assert.equal((await as(B, `select get_found()`)).length, 0, "your own letters don't go in your satchel");
});

test('wrecks crumble 30 days after the letter was due', async () => {
  const id = await as(A, `select send_message('${B}', 'Old news', 'walk')`);
  const leg = await legOf(id);
  await shiftLeg(leg, '40 days', '-31 days');
  await forceFailure(leg, 0.5, 'Blisters. Gave up.');
  const [lat, lng] = (await db.query(`select ST_Y(fail_point::geometry) lat, ST_X(fail_point::geometry) lng from leg_fates where leg_id = $1`, [leg])).rows.map((r) => [r.lat, r.lng])[0];
  const wrecks = await as(C, `select nearby_wrecks($1, $2)`, [lat, lng]);
  assert.equal(wrecks.some((w) => w.leg_id === leg), false);
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
});

test('clients cannot touch tables or private helpers', async () => {
  // Supabase grants table access to these roles by default; RLS must still hide everything.
  await db.exec(`grant usage on schema public to anon, authenticated;
                 grant select, insert, update, delete on all tables in schema public to anon, authenticated;`);
  await db.query(`select set_config('test.uid', '${A}', false)`);
  for (const role of ['anon', 'authenticated']) {
    await db.exec(`set role ${role}`);
    try {
      for (const table of ['profiles', 'messages', 'legs', 'leg_fates']) {
        const { rows } = await db.query(`select count(*)::int n from ${table}`);
        assert.equal(rows[0].n, 0, `${role} must not read ${table}`);
      }
      assert.ok((await db.query(`select count(*)::int n from transports`)).rows[0].n > 0, 'carriers are public');
      await rejects(db.query(`select _message_status(gen_random_uuid())`), /permission denied/);
      await rejects(db.query(`select _create_leg(null, null, 'car', null, null)`), /permission denied/);
      if (role === 'anon') await rejects(db.query(`select get_mail()`), /permission denied/);
      else await db.query(`select get_mail()`);
    } finally {
      await db.exec(`reset role`);
    }
  }
});
