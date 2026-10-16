import AsyncStorage from '@react-native-async-storage/async-storage';
import type { Session } from '@supabase/supabase-js';
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
  type ReactNode,
} from 'react';

import {
  api,
  type Achievement,
  type Cosmetic,
  type Friends,
  type FoundLetter,
  type Letter,
  type MadlibTemplate,
  type Me,
  type Transport,
  type Weather,
  type WeatherEffect,
} from '@/lib/api';
import type { Units } from '@/lib/format';
import { supabase } from '@/lib/supabase';

/** Device-local preferences. */
export type Settings = {
  units: Units;
  /** classic mailbox list, or letters grouped into conversations by person */
  mailView: 'mail' | 'conversations';
  /** push notification when a letter lands in your mailbox */
  arrivalAlerts: boolean;
  /** notify when you walk near a lost letter (needs background location) */
  foundAlerts: boolean;
  /** carrier sounds, arrival chime, achievement fanfare */
  sounds: boolean;
  /** last stationery used, so quick replies match */
  paper: string;
  seal: string;
};

const DEFAULT_SETTINGS: Settings = {
  units: 'mi',
  mailView: 'mail',
  arrivalAlerts: true,
  foundAlerts: false,
  sounds: true,
  paper: 'classic',
  seal: 'red',
};
const SETTINGS_KEY = 'waylaid.settings';
const EMPTY_FRIENDS: Friends = { friends: [], incoming: [], outgoing: [], blocked: [] };

type AppState = {
  /** undefined while the stored session is still loading */
  session: Session | null | undefined;
  /** undefined while loading, null when signed in but no profile yet */
  me: Me | null | undefined;
  transports: Transport[];
  transport: (id: string) => Transport | undefined;
  /** has this carrier been unlocked (starter or via an achievement)? */
  isUnlocked: (transportId: string) => boolean;
  /** the achievement that unlocks a carrier */
  unlockedBy: (transportId: string) => Pick<Achievement, 'id' | 'title' | 'emoji'> | undefined;
  /** how a weather kind affects a carrier, if at all */
  weatherEffect: (weather: Weather | null | undefined, transportId: string) => WeatherEffect | undefined;
  /** stationery and wax seals */
  cosmetics: Cosmetic[];
  isCosmeticUnlocked: (id: string) => boolean;
  /** the achievement that unlocks a paper or seal */
  cosmeticUnlockedBy: (id: string) => Pick<Achievement, 'id' | 'title' | 'emoji'> | undefined;
  madlibTemplates: MadlibTemplate[];
  mail: Letter[];
  found: FoundLetter[];
  friends: Friends;
  settings: Settings;
  updateSettings: (patch: Partial<Settings>) => void;
  /** shorthand for settings.units */
  units: Units;
  refreshMe: () => Promise<void>;
  refreshMail: () => Promise<void>;
  refreshFriends: () => Promise<void>;
  /** set when the profile couldn't be loaded (e.g. offline at launch) */
  loadError: string | null;
  signOut: () => Promise<void>;
};

const Ctx = createContext<AppState | null>(null);

export function AppStateProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null | undefined>(undefined);
  // Profile is stored with the user it belongs to, so switching accounts never shows a stale one.
  const [profile, setProfile] = useState<{ userId: string; me: Me | null } | null>(null);
  const [transports, setTransports] = useState<Transport[]>([]);
  const [effects, setEffects] = useState<WeatherEffect[]>([]);
  const [catalog, setCatalog] = useState<Pick<Achievement, 'id' | 'title' | 'emoji' | 'unlocks'>[]>([]);
  const [cosmetics, setCosmetics] = useState<Cosmetic[]>([]);
  const [madlibTemplates, setMadlibTemplates] = useState<MadlibTemplate[]>([]);
  const [mail, setMail] = useState<Letter[]>([]);
  const [found, setFound] = useState<FoundLetter[]>([]);
  const [friends, setFriends] = useState<Friends>(EMPTY_FRIENDS);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [settings, setSettings] = useState<Settings>(DEFAULT_SETTINGS);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const { data } = supabase.auth.onAuthStateChange((event, s) => {
      setSession(s);
      if (event === 'SIGNED_OUT') {
        setProfile(null);
        setMail([]);
        setFound([]);
        setFriends(EMPTY_FRIENDS);
      }
    });
    AsyncStorage.getItem(SETTINGS_KEY)
      .then((raw) => raw && setSettings({ ...DEFAULT_SETTINGS, ...JSON.parse(raw) }))
      .catch(() => {});
    return () => data.subscription.unsubscribe();
  }, []);

  // Keyed on the user id, not the session object, which changes on every token refresh.
  const userId = session?.user.id;
  const me = session === undefined ? undefined : !userId ? null : profile?.userId === userId ? profile.me : undefined;

  // A failed load leaves `me` undefined (still loading) and sets loadError, rather than
  // pretending there's no profile and sending the user back through onboarding.
  const refreshMe = useCallback(async () => {
    if (!userId) return;
    try {
      setLoadError(null);
      setProfile({ userId, me: await api.me() });
      api.transports().then(setTransports).catch(() => {});
    } catch (e) {
      setLoadError(e instanceof Error ? e.message : String(e));
    }
  }, [userId]);

  const refreshMail = useCallback(async () => {
    const [m, f] = await Promise.all([api.mail(), api.found()]);
    setMail(m);
    setFound(f);
  }, []);

  const refreshFriends = useCallback(async () => {
    setFriends(await api.friends());
  }, []);

  useEffect(() => {
    if (!userId) return;
    api
      .me()
      .then((me) => setProfile({ userId, me }))
      .catch((e) => setLoadError(e instanceof Error ? e.message : String(e)));
    api.transports().then(setTransports).catch(() => {});
    api.friends().then(setFriends).catch(() => {});
    api.weatherEffects().then(setEffects).catch(() => {});
    api.achievementCatalog().then(setCatalog).catch(() => {});
    api.cosmetics().then(setCosmetics).catch(() => {});
    api.madlibTemplates().then(setMadlibTemplates).catch(() => {});
  }, [userId]);

  const updateSettings = useCallback((patch: Partial<Settings>) => {
    setSettings((prev) => {
      const next = { ...prev, ...patch };
      AsyncStorage.setItem(SETTINGS_KEY, JSON.stringify(next)).catch(() => {});
      return next;
    });
  }, []);

  const value = useMemo<AppState>(
    () => ({
      session,
      me,
      transports,
      transport: (id) => transports.find((t) => t.id === id),
      // Before the server reports unlocks (older database), treat everything as available.
      isUnlocked: (id) => !me?.unlocked_carriers || me.unlocked_carriers.includes(id),
      unlockedBy: (id) => catalog.find((a) => a.unlocks === id),
      weatherEffect: (weather, id) =>
        weather ? effects.find((e) => e.weather === weather && e.transport_id === id) : undefined,
      cosmetics,
      isCosmeticUnlocked: (id) =>
        me?.unlocked_cosmetics ? me.unlocked_cosmetics.includes(id) : !cosmetics.find((c) => c.id === id)?.unlocked_by,
      cosmeticUnlockedBy: (id) => {
        const by = cosmetics.find((c) => c.id === id)?.unlocked_by;
        return by ? catalog.find((a) => a.id === by) : undefined;
      },
      madlibTemplates,
      mail,
      found,
      friends,
      settings,
      updateSettings,
      units: settings.units,
      refreshMe,
      refreshMail,
      refreshFriends,
      loadError,
      signOut: async () => {
        await supabase.auth.signOut();
      },
    }),
    [
      session,
      me,
      transports,
      effects,
      catalog,
      cosmetics,
      madlibTemplates,
      mail,
      found,
      friends,
      settings,
      updateSettings,
      refreshMe,
      refreshMail,
      refreshFriends,
      loadError,
    ],
  );

  return <Ctx.Provider value={value}>{children}</Ctx.Provider>;
}

export function useApp() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error('useApp must be used inside AppStateProvider');
  return ctx;
}
