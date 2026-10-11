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

import { api, type FoundLetter, type Letter, type Me, type Transport } from '@/lib/api';
import type { Units } from '@/lib/format';
import { supabase } from '@/lib/supabase';

type AppState = {
  /** undefined while the stored session is still loading */
  session: Session | null | undefined;
  /** undefined while loading, null when signed in but no profile yet */
  me: Me | null | undefined;
  transports: Transport[];
  transport: (id: string) => Transport | undefined;
  mail: Letter[];
  found: FoundLetter[];
  units: Units;
  setUnits: (u: Units) => void;
  refreshMe: () => Promise<void>;
  refreshMail: () => Promise<void>;
  signOut: () => Promise<void>;
};

const Ctx = createContext<AppState | null>(null);
const UNITS_KEY = 'slowpost.units';

export function AppStateProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null | undefined>(undefined);
  // Profile is stored with the user it belongs to, so switching accounts never shows a stale one.
  const [profile, setProfile] = useState<{ userId: string; me: Me | null } | null>(null);
  const [transports, setTransports] = useState<Transport[]>([]);
  const [mail, setMail] = useState<Letter[]>([]);
  const [found, setFound] = useState<FoundLetter[]>([]);
  const [units, setUnitsState] = useState<Units>('mi');

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const { data } = supabase.auth.onAuthStateChange((event, s) => {
      setSession(s);
      if (event === 'SIGNED_OUT') {
        setProfile(null);
        setMail([]);
        setFound([]);
      }
    });
    AsyncStorage.getItem(UNITS_KEY)
      .then((u) => (u === 'km' || u === 'mi') && setUnitsState(u))
      .catch(() => {});
    return () => data.subscription.unsubscribe();
  }, []);

  // Keyed on the user id, not the session object, which changes on every token refresh.
  const userId = session?.user.id;
  const me = session === undefined ? undefined : !userId ? null : profile?.userId === userId ? profile.me : undefined;

  const refreshMe = useCallback(async () => {
    if (!userId) return;
    try {
      setProfile({ userId, me: await api.me() });
    } catch {
      setProfile({ userId, me: null });
    }
  }, [userId]);

  const refreshMail = useCallback(async () => {
    const [m, f] = await Promise.all([api.mail(), api.found()]);
    setMail(m);
    setFound(f);
  }, []);

  useEffect(() => {
    if (!userId) return;
    api
      .me()
      .then((me) => setProfile({ userId, me }))
      .catch(() => setProfile({ userId, me: null }));
    api.transports().then(setTransports).catch(() => {});
  }, [userId]);

  const setUnits = useCallback((u: Units) => {
    setUnitsState(u);
    AsyncStorage.setItem(UNITS_KEY, u).catch(() => {});
  }, []);

  const value = useMemo<AppState>(
    () => ({
      session,
      me,
      transports,
      transport: (id) => transports.find((t) => t.id === id),
      mail,
      found,
      units,
      setUnits,
      refreshMe,
      refreshMail,
      signOut: async () => {
        await supabase.auth.signOut();
      },
    }),
    [session, me, transports, mail, found, units, setUnits, refreshMe, refreshMail],
  );

  return <Ctx.Provider value={value}>{children}</Ctx.Provider>;
}

export function useApp() {
  const ctx = useContext(Ctx);
  if (!ctx) throw new Error('useApp must be used inside AppStateProvider');
  return ctx;
}
