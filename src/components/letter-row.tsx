import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { Card, ProgressBar } from '@/components/ui';
import { Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import type { Letter } from '@/lib/api';
import { displayName, formatDuration, formatWhen } from '@/lib/format';
import { progress } from '@/lib/geo';
import { showLetterMenu } from '@/lib/letter-actions';
import { useApp } from '@/providers/app-state';

export function currentLeg(letter: Letter) {
  return letter.legs[letter.legs.length - 1];
}

export function LetterRow({ letter, now }: { letter: Letter; now: number }) {
  const { transport, refreshMail } = useApp();
  const theme = useTheme();
  const leg = currentLeg(letter);
  const t = transport(leg.transport_id);
  const unread = letter.role === 'received' && letter.status === 'delivered' && !letter.read_at;
  const who = displayName(letter.other);

  let headline: string;
  let detail: string;
  switch (letter.status) {
    case 'in_transit':
      headline = letter.role === 'sent' ? `To ${who}` : `Incoming from ${who}`;
      detail = `${t?.name ?? 'Carrier'} · ${formatDuration(Date.parse(leg.arrives_at) - now)} away`;
      if (letter.legs.length > 1) detail += ' · rerouted';
      break;
    case 'delivered':
      headline = letter.role === 'sent' ? `To ${who}` : who;
      detail =
        letter.role === 'received'
          ? (letter.body ?? '').split('\n')[0]
          : letter.read_at
            ? `Read · ${formatWhen(letter.read_at)}`
            : `Delivered · ${formatWhen(letter.delivered_at ?? leg.arrives_at)}`;
      break;
    case 'lost':
      headline = letter.role === 'sent' ? `To ${who}` : `From ${who}`;
      detail = `Never arrived · ${leg.fail_reason ?? 'lost in transit'}`;
      break;
    case 'found':
      headline = letter.role === 'sent' ? `To ${who}` : `From ${who}`;
      detail = 'Picked up by a stranger';
      break;
  }

  const icon =
    letter.status === 'lost' ? '🪦' : letter.status === 'found' ? '🫳' : letter.status === 'delivered' ? '✉️' : (t?.emoji ?? '✉️');

  return (
    <Card
      onPress={() => router.push({ pathname: '/letter/[id]', params: { id: letter.id } })}
      onLongPress={() => showLetterMenu(letter, refreshMail)}>
      <View style={styles.row}>
        <ThemedText style={styles.icon}>{icon}</ThemedText>
        <View style={{ flex: 1, gap: 2 }}>
          <View style={styles.titleRow}>
            <ThemedText style={[styles.headline, unread && { color: theme.accent }]} numberOfLines={1}>
              {headline}
            </ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              {formatWhen(letter.created_at)}
            </ThemedText>
          </View>
          <ThemedText
            type="small"
            themeColor={letter.status === 'lost' ? 'danger' : 'textSecondary'}
            numberOfLines={1}
            style={unread && { fontWeight: 700 }}>
            {detail}
          </ThemedText>
        </View>
        {unread && <View style={[styles.dot, { backgroundColor: theme.accent }]} />}
      </View>
      {letter.status === 'in_transit' && <ProgressBar value={progress(leg.departed_at, leg.arrives_at, now)} />}
    </Card>
  );
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  icon: {
    fontSize: 28,
    lineHeight: 36,
  },
  titleRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: Spacing.two,
  },
  headline: {
    fontWeight: 700,
    flexShrink: 1,
  },
  dot: {
    width: 10,
    height: 10,
    borderRadius: 5,
  },
});
