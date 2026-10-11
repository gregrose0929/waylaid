# 🕊️ Slowpost

**Letters that take their time.**

Slowpost is a messenger for iPhone and Android where messages aren't instant. When you send a letter, you choose
how it travels: a carrier pigeon, a steam train, a garden snail, an SR-71 Blackbird. The app works out the real
distance between your mailbox and theirs, and the letter takes exactly as long as that carrier would to get there.

Carriers can also fail. Pigeons get snatched by hawks, balloons drift into thunderstorms, and SR-71 pilots eject
over cornfields. When a carrier goes down, the letter stays where it fell. Anyone who walks within 300 m of the
spot can pick it up. Then they decide whether to **peek inside**, **send it on** with a carrier of their choice, or
**keep it**.

## Features

- **10 carriers**, from 🐌 0.03 mph to 🛩️ 2,200 mph, each with its own failure odds and ways to go wrong
- **Real distances** between mailboxes, with great-circle routes and a detour factor for ground travel
- **Live tracking** of every letter in the air, with ETA countdowns and a moving carrier on the map
- **Hidden fate**: whether a carrier fails is decided in secret at send time and revealed when the letter is due
- **Lost & found**: wrecks appear on the map, and you can walk to one, pick it up, and choose what to do with it
- **Broken seals**: if a stranger reads your letter, both you and the recipient find out
- **Delivered by hand**: if you find a lost letter addressed to *you*, it counts as delivered
- Read receipts, a journey log for each letter, stats, miles/km, and light/dark mode

## How it works

| Piece | Tech |
| --- | --- |
| App | [Expo](https://expo.dev) SDK 57 / React Native / TypeScript / Expo Router |
| Maps | `react-native-maps` (Apple Maps on iOS, Google Maps on Android) |
| Backend | [Supabase](https://supabase.com): Postgres + PostGIS, Auth |

All the game rules run **on the server**, in [`supabase/migrations`](supabase/migrations). The app can't read
the database tables directly. It calls a small set of functions (`send_message`, `get_mail`, `pick_up`, …), so
nobody can open a letter early or see their pigeon's fate ahead of time.

Delivery doesn't need a background job. A letter has "arrived" once `now() >= arrives_at`, and the server checks
this every time someone asks.

Privacy: mailboxes are stored to about 1 km, and other users only ever see them rounded to about 10 km.

```
src/
  app/            screens (Expo Router)
    (tabs)/       Mail · Map · Me
    compose.tsx   write a letter + choose a carrier
    letter/[id]   a letter, its journey, and its live map
    found/[legId] a letter you picked up: peek, send on, or keep
  components/     UI pieces
  lib/            Supabase client, API wrapper, geo math, formatting
  providers/      app-wide state
supabase/
  migrations/     schema, carriers, and all server logic
  tests/          end-to-end database tests (no Supabase needed)
```

## Getting started

### 1. Install

```bash
npm install
```

### 2. Create a Supabase project (free)

1. Sign up at [supabase.com](https://supabase.com) and create a new project.
2. Open **SQL Editor**, paste the contents of
   [`supabase/migrations/20261010000000_init.sql`](supabase/migrations/20261010000000_init.sql), and click **Run**.
3. For easy testing, go to **Authentication → Sign In / Providers → Email** and turn off **Confirm email**. You
   can turn it back on before launch.
4. Go to **Project Settings → API Keys** (or the **Connect** button) and copy the **Project URL** and the
   **publishable** key.

### 3. Add your keys

Copy `.env.example` to `.env` and fill it in:

```
EXPO_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
EXPO_PUBLIC_SUPABASE_KEY=sb_publishable_...
```

The publishable key is safe to ship in the app because the database is locked down with row-level security.
`.env` is git-ignored anyway.

### 4. Run it

```bash
npx expo start
```

Install **Expo Go** on your phone and scan the QR code. To try the whole loop, sign up with two accounts (two
phones, or one phone and one simulator) and send each other letters.

> Tip: to watch a letter fail, temporarily raise a carrier's `failure_rate` in the Supabase table editor
> (`transports` table) to `1`.

## Testing

```bash
npm run test:db     # plays out the game against an in-memory Postgres + PostGIS
npm run typecheck
npm run lint
```

## Building for the stores

Use [EAS Build](https://docs.expo.dev/build/introduction/):

```bash
npx eas-cli@latest build --platform all
```

Android builds need a Google Maps API key. See the
[react-native-maps config docs](https://docs.expo.dev/versions/latest/sdk/map-view/).

## Ideas for later

- Push notifications when a letter arrives or a carrier goes down near you
- Friends list and blocking
- Postcards with photos, stamps to collect, and achievements ("Lost 10 pigeons")
- Weather that affects balloons and pigeons
- Letters that can be dropped mid-route at a "post office" waypoint
