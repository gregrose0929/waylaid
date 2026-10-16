import * as Haptics from 'expo-haptics';
import { router } from 'expo-router';
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

import { WaxSeal } from '@/components/letter-paper';
import { ThemedText } from '@/components/themed-text';
import { useToast } from '@/components/toast';
import { Radius, Spacing } from '@/constants/theme';
import { paperStyle } from '@/constants/stationery';
import { useColorScheme } from '@/hooks/use-color-scheme';
import { useTheme } from '@/hooks/use-theme';
import { useApp } from '@/providers/app-state';

/** Pick a paper and a wax seal. Locked ones say which achievement unlocks them. */
export function StationeryPicker({
  paper,
  seal,
  onChange,
}: {
  paper: string;
  seal: string;
  onChange: (next: { paper: string; seal: string }) => void;
}) {
  const { cosmetics, isCosmeticUnlocked, cosmeticUnlockedBy } = useApp();
  const theme = useTheme();
  const dark = useColorScheme() === 'dark';
  const toast = useToast();

  const choose = (id: string, kind: 'paper' | 'seal') => {
    if (!isCosmeticUnlocked(id)) {
      const a = cosmeticUnlockedBy(id);
      toast(a ? `🔒 Unlock with “${a.title}”` : '🔒 Not unlocked yet', {
        label: 'See how',
        onPress: () => router.push('/achievements'),
      });
      return;
    }
    Haptics.selectionAsync().catch(() => {});
    onChange(kind === 'paper' ? { paper: id, seal } : { paper, seal: id });
  };

  const row = (kind: 'paper' | 'seal') => (
    <ScrollView horizontal showsHorizontalScrollIndicator={false} contentContainerStyle={styles.row}>
      {cosmetics
        .filter((c) => c.kind === kind)
        .map((c) => {
          const selected = (kind === 'paper' ? paper : seal) === c.id;
          const locked = !isCosmeticUnlocked(c.id);
          const p = paperStyle(c.id);
          return (
            <Pressable
              key={c.id}
              onPress={() => choose(c.id, kind)}
              accessibilityRole="radio"
              accessibilityLabel={`${c.name}${locked ? ', locked' : ''}`}
              accessibilityState={{ selected, disabled: locked }}
              style={[styles.option, { borderColor: selected ? theme.accent : 'transparent', opacity: locked ? 0.45 : 1 }]}>
              {kind === 'paper' ? (
                <View style={[styles.swatch, { backgroundColor: dark ? p.dark : p.light, borderColor: p.border }]}>
                  <Text style={styles.swatchEmoji}>{locked ? '🔒' : (p.corner ?? '')}</Text>
                </View>
              ) : (
                <View style={styles.sealWrap}>
                  <WaxSeal seal={c.id} size={40} />
                  {locked && <Text style={styles.lock}>🔒</Text>}
                </View>
              )}
              <ThemedText type="small" themeColor={selected ? 'text' : 'textSecondary'} numberOfLines={1} style={styles.label}>
                {c.name}
              </ThemedText>
            </Pressable>
          );
        })}
    </ScrollView>
  );

  return (
    <View style={{ gap: Spacing.two }}>
      <ThemedText type="smallBold" themeColor="textSecondary">
        PAPER
      </ThemedText>
      {row('paper')}
      <ThemedText type="smallBold" themeColor="textSecondary">
        WAX SEAL
      </ThemedText>
      {row('seal')}
    </View>
  );
}

const styles = StyleSheet.create({
  row: {
    gap: Spacing.two,
    paddingRight: Spacing.three,
  },
  option: {
    width: 84,
    alignItems: 'center',
    gap: 4,
    padding: 4,
    borderRadius: Radius.small,
    borderWidth: 2,
  },
  swatch: {
    width: 64,
    height: 48,
    borderRadius: 8,
    borderWidth: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  swatchEmoji: {
    fontSize: 18,
  },
  sealWrap: {
    height: 48,
    justifyContent: 'center',
  },
  lock: {
    position: 'absolute',
    right: -6,
    bottom: 2,
    fontSize: 14,
  },
  label: {
    fontSize: 11,
    lineHeight: 14,
    textAlign: 'center',
  },
});
