import * as Haptics from 'expo-haptics';
import { router } from 'expo-router';
import { Pressable, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import type { Transport } from '@/lib/api';
import { formatDuration, formatRisk, formatSpeed } from '@/lib/format';
import { estimateTripMs } from '@/lib/trip';
import { useApp } from '@/providers/app-state';

/** List of carriers with the ETA and risk for this particular trip. */
export function TransportPicker({
  distanceKm,
  value,
  onChange,
}: {
  distanceKm: number | null;
  value: string | null;
  onChange: (id: string) => void;
}) {
  const { transports, units } = useApp();
  const theme = useTheme();

  return (
    <View style={{ gap: Spacing.two }}>
      {transports.map((t) => {
        const selected = t.id === value;
        return (
          <Pressable
            key={t.id}
            accessibilityRole="radio"
            accessibilityState={{ selected }}
            onPress={() => {
              Haptics.selectionAsync().catch(() => {});
              onChange(t.id);
            }}
            onLongPress={() => router.push({ pathname: '/carrier/[id]', params: { id: t.id } })}
            style={[
              styles.row,
              {
                backgroundColor: selected ? theme.backgroundSelected : theme.backgroundElement,
                borderColor: selected ? theme.accent : 'transparent',
              },
            ]}>
            <ThemedText style={styles.emoji}>{t.emoji}</ThemedText>
            <View style={{ flex: 1 }}>
              <ThemedText style={styles.name}>{t.name}</ThemedText>
              <ThemedText type="small" themeColor="textSecondary">
                {formatSpeed(t.speed_kmh, units)} · {formatRisk(t.failure_rate)}
              </ThemedText>
            </View>
            {distanceKm != null && <Eta distanceKm={distanceKm} transport={t} />}
          </Pressable>
        );
      })}
    </View>
  );
}

function Eta({ distanceKm, transport }: { distanceKm: number; transport: Transport }) {
  return (
    <View style={{ alignItems: 'flex-end' }}>
      <ThemedText style={styles.eta}>{formatDuration(estimateTripMs(distanceKm, transport))}</ThemedText>
      <ThemedText type="small" themeColor="textSecondary">
        to arrive
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
