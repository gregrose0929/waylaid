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

import { api, type Friends, type FoundLetter, type Letter, type Me, type Transport } from '@/lib/api';
import type { Units } from '@/lib/format';
import { supabase } from '@/lib/supabase';

/** Device-local preferences. */
export type Settings = {
  units: Units;
  /** classic mailbox list, or letters grouped into conversations by person */
  mailView: 'mail' | 'conversations';
  /** notify when you walk near a lost letter (needs background location) */
  foundAlerts: boolean;
};

const DEFAULT_SETTINGS: Settings = { units: 'mi', mailView: 'mail', foundAlerts: false };
const SETTINGS_KEY = 'waylaid.settings';
const EMPTY_FRIENDS: Friends = { friends: [], incoming: [], outgoing: [], blocked: [] };

type AppState = {
  /** undefined while the stored session is still loading */
  session: Session | null | undefined;
  /** undefined while loading, null when signed in but no profile yet */
  me: Me | null | undefined;
  transports: Transport[];
  transport: (id: string) => Transport | undefined;
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
    [session, me, transports, mail, found, friends, settings, updateSettings, refreshMe, refreshMail, refreshFriends, loadError],
  );

  return <Ctx.Provider value={value}>{children}</Ctx.Provider>;
}

export function useApp() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error('useApp must be used inside AppStateProvider');
  return ctx;
}
