import * as Updates from 'expo-updates';
import { useEffect } from 'react';
import { AppState, Pressable, StyleSheet, Text } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

/**
 * "New version ready — tap to restart". expo-updates downloads updates on launch;
 * we also check whenever the app comes back to the foreground.
 */
export function UpdateBanner() {
  const { isUpdatePending } = Updates.useUpdates();
  const theme = useTheme();
  const insets = useSafeAreaInsets();

  useEffect(() => {
    if (!Updates.isEnabled) return;
    const sub = AppState.addEventListener('change', async (state) => {
      if (state !== 'active') return;
      try {
        const check = await Updates.checkForUpdateAsync();
        if (check.isAvailable) await Updates.fetchUpdateAsync();
      } catch {
        // offline or no update server; try again next time
      }
    });
    return () => sub.remove();
  }, []);

  if (!isUpdatePending) return null;
  return (
    <Pressable
      accessibilityRole="button"
      onPress={() => Updates.reloadAsync().catch(() => {})}
      style={[styles.banner, { backgroundColor: theme.accent, paddingTop: insets.top + Spacing.two }]}>
      <Text style={[styles.text, { color: theme.accentText }]}>✨ New version ready — tap to restart</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  banner: {
    paddingBottom: Spacing.two,
    paddingHorizontal: Spacing.three,
    alignItems: 'center',
  },
  text: {
    fontWeight: 700,
  },
});
