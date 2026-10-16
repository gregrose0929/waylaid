import * as Haptics from 'expo-haptics';
import { router } from 'expo-router';
import { Pressable, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { useToast } from '@/components/toast';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import type { Weather, WeatherEffect } from '@/lib/api';
import { formatDuration, formatRisk, formatSpeed } from '@/lib/format';
import { estimateTripMs, tripRisk } from '@/lib/trip';
import { weatherLook } from '@/lib/weather';
import { useApp } from '@/providers/app-state';

/** How the weather changes this carrier, in a few words. */
function weatherNote(weather: Weather, fx: WeatherEffect | undefined) {
  if (!fx) return null;
  const { emoji } = weatherLook(weather);
  const parts: string[] = [];
  if (fx.speed_mult > 1.05) parts.push('faster');
  else if (fx.speed_mult < 0.95) parts.push('slower');
  if (fx.risk_mult >= 1.5) parts.push(`${Math.round(fx.risk_mult * 10) / 10}× the risk`);
  else if (fx.risk_mult < 0.95) parts.push('safer');
  if (parts.length === 0) return null;
  return `${emoji} ${parts.join(', ')}`;
}

/**
 * List of carriers with the ETA and risk for this particular trip (and weather).
 * Locked carriers show which achievement unlocks them. Long-press any for its profile.
 */
export function TransportPicker({
  distanceKm,
  value,
  onChange,
  weather,
}: {
  distanceKm: number | null;
  value: string | null;
  onChange: (id: string) => void;
  weather?: Weather | null;
}) {
  const { transports, units, isUnlocked, unlockedBy, weatherEffect } = useApp();
  const theme = useTheme();
  const toast = useToast();

  return (
    <View style={{ gap: Spacing.two }}>
      {transports.map((t) => {
        const selected = t.id === value;
        const locked = !isUnlocked(t.id);
        const fx = weatherEffect(weather, t.id);
        const note = weather ? weatherNote(weather, fx) : null;
        const unlock = unlockedBy(t.id);
        return (
          <Pressable
            key={t.id}
            accessibilityRole="radio"
            accessibilityState={{ selected, disabled: locked }}
            onPress={() => {
              if (locked) {
                toast(unlock ? `🔒 Unlock with “${unlock.title}”` : '🔒 Not unlocked yet', {
                  label: 'See how',
                  onPress: () => router.push('/achievements'),
                });
                return;
              }
              Haptics.selectionAsync().catch(() => {});
              onChange(t.id);
            }}
            onLongPress={() => router.push({ pathname: '/carrier/[id]', params: { id: t.id } })}
            style={[
              styles.row,
              {
                backgroundColor: selected ? theme.backgroundSelected : theme.backgroundElement,
                borderColor: selected ? theme.accent : 'transparent',
                opacity: locked ? 0.55 : 1,
              },
            ]}>
            <ThemedText style={styles.emoji}>{locked ? '🔒' : t.emoji}</ThemedText>
            <View style={{ flex: 1 }}>
              <ThemedText style={styles.name}>{t.name}</ThemedText>
              <ThemedText type="small" themeColor="textSecondary">
                {locked
                  ? `Unlock: ${unlock?.emoji ?? ''} ${unlock?.title ?? 'keep playing'}`
                  : `${formatSpeed(t.speed_kmh * (fx?.speed_mult ?? 1), units)} · ${formatRisk(tripRisk(t, fx))}`}
              </ThemedText>
              {!locked && note && (
                <ThemedText type="small" style={{ color: theme.accent }}>
                  {note}
                </ThemedText>
              )}
            </View>
            {distanceKm != null && !locked && (
              <View style={{ alignItems: 'flex-end' }}>
                <ThemedText style={styles.eta}>{formatDuration(estimateTripMs(distanceKm, t, fx))}</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  to arrive
                </ThemedText>
              </View>
            )}
          </Pressable>
        );
      })}
      <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
        Long-press a carrier to read its file.
      </ThemedText>
    </View>
  );
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
    padding: Spacing.three,
    borderRadius: Radius.medium,
    borderWidth: 2,
  },
  emoji: {
    fontSize: 30,
    lineHeight: 38,
  },
  name: {
    fontWeight: 700,
  },
  eta: {
    fontWeight: 700,
    fontVariant: ['tabular-nums'],
  },
});
