import { Stack, useLocalSearchParams } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, EmptyState } from '@/components/ui';
import { Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { CARRIER_PROFILES } from '@/lib/carrier-profiles';
import { formatDuration, formatRisk, formatSpeed } from '@/lib/format';
import { estimateTripMs } from '@/lib/trip';
import { useApp } from '@/providers/app-state';

/** A 100-mile trip, roughly Fishers, IN to Cincinnati, OH. */
const SAMPLE_KM = 160.9;

/** A carrier's (entirely fictional) personnel file. */
export default function CarrierScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const { transport, units } = useApp();
  const theme = useTheme();
  const t = transport(id);
  const p = CARRIER_PROFILES[id];

  if (!t || !p) return <EmptyState emoji="🤷" title="Unknown carrier" body="They may have wandered off." />;

  return (
    <ThemedView style={{ flex: 1 }}>
      <Stack.Screen options={{ title: t.name }} />
      <ScrollView contentContainerStyle={styles.content}>
        <View style={styles.hero}>
          <ThemedText style={styles.emoji}>{t.emoji}</ThemedText>
          <ThemedText style={styles.name}>{p.name}</ThemedText>
          <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
            a.k.a. “{p.nickname}”
          </ThemedText>
        </View>

        <View style={styles.stats}>
          <Stat label="Speed" value={formatSpeed(t.speed_kmh, units)} />
          <Stat label={units === 'mi' ? '100 mi' : '160 km'} value={formatDuration(estimateTripMs(SAMPLE_KM, t))} />
          <Stat label="Odds of trouble" value={formatRisk(t.failure_rate)} />
        </View>

        <Card style={[styles.quote, { borderLeftColor: theme.accent }]}>
          <ThemedText style={styles.quoteText}>{p.quote}</ThemedText>
        </Card>

        <Section title="THE BASICS">
          <ThemedText>
            <ThemedText style={{ fontWeight: 700 }}>Age: </ThemedText>
            {p.age}
          </ThemedText>
          <ThemedText>
            <ThemedText style={{ fontWeight: 700 }}>Hometown: </ThemedText>
            {p.hometown}
          </ThemedText>
        </Section>

        <Section title="HOW THEY GOT INTO THE MAIL BUSINESS">
          <ThemedText>{p.origin}</ThemedText>
        </Section>

        <Section title="👍 LIKES">
          <Bullets items={p.likes} />
        </Section>
        <Section title="👎 DISLIKES">
          <Bullets items={p.dislikes} />
        </Section>
        <Section title="😱 FEARS">
          <Bullets items={p.fears} />
        </Section>

        <Section title="FUN FACT">
          <ThemedText>{p.funFact}</ThemedText>
        </Section>

        <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
          Any resemblance to real snails, moths, or minivans is purely coincidental.
        </ThemedText>
      </ScrollView>
    </ThemedView>
  );
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <Card style={styles.stat}>
      <ThemedText style={{ fontWeight: 700, textAlign: 'center' }}>{value}</ThemedText>
      <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
        {label}
      </ThemedText>
    </Card>
  );
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <View style={{ gap: Spacing.two }}>
      <ThemedText type="smallBold" themeColor="textSecondary">
        {title}
      </ThemedText>
      <Card>{children}</Card>
    </View>
  );
}

function Bullets({ items }: { items: string[] }) {
  return (
    <View style={{ gap: Spacing.one }}>
      {items.map((i) => (
        <ThemedText key={i}>• {i}</ThemedText>
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.four,
    paddingBottom: Spacing.six,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  hero: {
    alignItems: 'center',
    gap: Spacing.one,
  },
  emoji: {
    fontSize: 80,
    lineHeight: 96,
  },
  name: {
    fontFamily: Fonts.serif,
    fontSize: 28,
    lineHeight: 36,
    fontWeight: 700,
    textAlign: 'center',
  },
  stats: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  stat: {
    flex: 1,
    gap: 2,
    paddingHorizontal: Spacing.two,
  },
  quote: {
    borderLeftWidth: 4,
  },
  quoteText: {
    fontFamily: Fonts.serif,
    fontStyle: 'italic',
    fontSize: 18,
    lineHeight: 26,
  },
});
