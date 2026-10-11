import { ScrollView, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { formatDuration, formatRisk, formatSpeed } from '@/lib/format';
import { estimateTripMs } from '@/lib/trip';
import { useApp } from '@/providers/app-state';

/** A 100-mile trip, roughly Fishers, IN to Cincinnati, OH. */
const SAMPLE_KM = 160.9;

export default function CarriersScreen() {
  const { transports, units } = useApp();
  return (
    <ThemedView style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.content}>
        <ThemedText themeColor="textSecondary">
          Every carrier has its own speed and its own way of failing. Times below are for a{' '}
          {units === 'mi' ? '100 mile' : '160 km'} trip.
        </ThemedText>
        {transports.map((t) => (
          <Card key={t.id} style={styles.row}>
            <ThemedText style={styles.emoji}>{t.emoji}</ThemedText>
            <View style={{ flex: 1, gap: 2 }}>
              <ThemedText style={{ fontWeight: 700 }}>{t.name}</ThemedText>
              <ThemedText type="small" themeColor="textSecondary">
                {t.tagline}
              </ThemedText>
              <ThemedText type="small">
                {formatSpeed(t.speed_kmh, units)} · {formatDuration(estimateTripMs(SAMPLE_KM, t))} ·{' '}
                {formatRisk(t.failure_rate)}
              </ThemedText>
            </View>
          </Card>
        ))}
      </ScrollView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.two,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  emoji: {
    fontSize: 32,
    lineHeight: 40,
  },
});
