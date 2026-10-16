import { createContext, useCallback, useContext, useEffect, useRef, useState, type ReactNode } from 'react';
import { Platform, Pressable, StyleSheet, Text, View } from 'react-native';
import Animated, { FadeInDown, FadeOutDown } from 'react-native-reanimated';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

/** The toast lives above every screen (including the tab bar), so it clears the bar's full height. */
const TAB_BAR_CLEARANCE = Platform.select({ ios: 50, android: 80 }) ?? 0;

type Toast = { id: number; message: string; action?: { label: string; onPress: () => void } };
type ShowToast = (message: string, action?: Toast['action']) => void;

const Ctx = createContext<ShowToast>(() => {});
const DURATION_MS = 5000;

/** Gmail-style snackbar at the bottom of the screen, optionally with an Undo button. */
export function ToastProvider({ children }: { children: ReactNode }) {
  const [toast, setToast] = useState<Toast | null>(null);
  const nextId = useRef(0);

  const show = useCallback<ShowToast>((message, action) => {
    nextId.current += 1;
    setToast({ id: nextId.current, message, action });
  }, []);

  return (
    <Ctx.Provider value={show}>
      {children}
      {toast && <ToastView key={toast.id} toast={toast} onDone={() => setToast((t) => (t?.id === toast.id ? null : t))} />}
    </Ctx.Provider>
  );
}

function ToastView({ toast, onDone }: { toast: Toast; onDone: () => void }) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  useEffect(() => {
    const id = setTimeout(onDone, DURATION_MS);
    return () => clearTimeout(id);
  }, [onDone]);

  return (
    <View pointerEvents="box-none" style={[styles.wrap, { bottom: insets.bottom + TAB_BAR_CLEARANCE + Spacing.three }]}>
      <Animated.View entering={FadeInDown} exiting={FadeOutDown} style={[styles.toast, { backgroundColor: theme.text }]}>
        <Text style={[styles.message, { color: theme.background }]} numberOfLines={2}>
          {toast.message}
        </Text>
        {toast.action && (
          <Pressable
            hitSlop={8}
            onPress={() => {
              toast.action!.onPress();
              onDone();
            }}>
            <Text style={[styles.action, { color: theme.accent }]}>{toast.action.label}</Text>
          </Pressable>
        )}
      </Animated.View>
    </View>
  );
}

export const useToast = () => useContext(Ctx);

const styles = StyleSheet.create({
  wrap: {
    position: 'absolute',
    left: Spacing.three,
    right: Spacing.three,
    alignItems: 'center',
  },
  toast: {
    width: '100%',
    maxWidth: 560,
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
    paddingVertical: Spacing.three,
    paddingHorizontal: Spacing.four,
    borderRadius: Radius.small,
    shadowColor: '#000',
    shadowOpacity: 0.25,
    shadowRadius: 8,
    shadowOffset: { width: 0, height: 4 },
    elevation: 6,
  },
  message: {
    flex: 1,
    fontSize: 15,
  },
  action: {
    fontSize: 15,
    fontWeight: 700,
    textTransform: 'uppercase',
  },
});
