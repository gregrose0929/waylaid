# 🕊️ Waylaid

**Send it your own way.**

Waylaid is a messenger for iPhone and Android where messages aren't instant. When you send a letter, you choose
how it travels: a carrier pigeon, a steam train, a garden snail, an SR-71 Blackbird. The app works out the real
distance between your mailbox and theirs, and the letter takes exactly as long as that carrier would to get there.

Carriers can also fail. Pigeons get snatched by hawks, balloons drift into thunderstorms, and SR-71 pilots eject
over cornfields. When a carrier goes down, the letter stays where it fell. Anyone who walks within 300 m of the
spot can pick it up. Then they decide whether to **peek inside**, **send it on** with a carrier of their choice, or
**keep it**.

## Features

- **11 carriers**, from 🐌 0.03 mph and a hopeless 🦋 moth to 🛩️ 2,200 mph, each with its own failure odds and ways to go wrong
- **Real distances** between mailboxes, with great-circle routes and a detour factor for ground travel
- **Live tracking** of every letter in the air, with ETA countdowns and a moving carrier on the map
- **Hidden fate**: whether a carrier fails is decided in secret at send time and revealed when the letter is due
- **Lost & found**: wrecks appear on the map, and you can walk to one, pick it up, and choose what to do with it
- **Broken seals**: if a stranger reads your letter, both you and the recipient find out
- **Delivered by hand**: if you find a lost letter addressed to *you*, it counts as delivered
- **Contacts** with private nicknames, **archive** and **delete** (only from your own mailbox)
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

Mailboxes are precise, so letters go to your actual door. Each person chooses whether others see that exact spot
(the default) or only a ~10 km area.

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
2. Open **SQL Editor** and run each file in [`supabase/migrations`](supabase/migrations) **in order** (paste its
   contents, click **Run**). When a new migration is added later, run just that one.
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

## Building an installable app

[EAS Build](https://docs.expo.dev/build/introduction/) compiles the app in the cloud. The Supabase URL and
publishable key are set in [`eas.json`](eas.json), because `.env` isn't uploaded.

Android needs a Google Maps key (Maps SDK for Android). [`app.config.js`](app.config.js) reads it from an EAS
environment variable, so it never lands in git:

```bash
npx eas-cli@latest env:create --name GOOGLE_MAPS_ANDROID_KEY --value YOUR_KEY --environment preview --environment production --visibility sensitive
```

Then build an APK you can install directly on an Android phone:

```bash
npx eas-cli@latest build --platform android --profile preview
```

iPhone builds need an Apple Developer account.

## Ideas for later

- Push notifications when a letter arrives or a carrier goes down near you
- Friends list and blocking
- Postcards with photos, stamps to collect, and achievements ("Lost 10 pigeons")
- Weather that affects balloons and pigeons
- Letters that can be dropped mid-route at a "post office" waypoint
