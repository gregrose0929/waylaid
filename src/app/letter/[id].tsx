import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useEffect } from 'react';
import { Pressable, ScrollView, StyleSheet, View } from 'react-native';

import { currentLeg } from '@/components/letter-row';
import { SlowMap, type MapPin, type MapRoute } from '@/components/slow-map';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, Card, EmptyState, ProgressBar } from '@/components/ui';
import { Fonts, MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import { api, type Leg, type Letter } from '@/lib/api';
import { displayName, formatDistance, formatDuration, formatWhen } from '@/lib/format';
import { greatCircle, interpolate, progress } from '@/lib/geo';
import { confirmDelete, toggleArchive } from '@/lib/letter-actions';
import { useApp } from '@/providers/app-state';

export default function LetterScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const { mail, refreshMail } = useApp();
  const letter = mail.find((l) => l.id === id);
  const now = useNow();

  const shouldMarkRead = letter?.role === 'received' && letter.status === 'delivered' && !letter.read_at;
  useEffect(() => {
    if (shouldMarkRead) api.markRead(id).then(refreshMail).catch(() => {});
  }, [shouldMarkRead, id, refreshMail]);

  if (!letter) return <EmptyState emoji="🤷" title="Letter not found" body="It may still be loading." />;

  return <LetterView letter={letter} now={now} />;
}

function LetterView({ letter, now }: { letter: Letter; now: number }) {
  const { transport, units, refreshMail } = useApp();
  const theme = useTheme();
  const leg = currentLeg(letter);
  const t = transport(leg.transport_id);
  const who = displayName(letter.other);
  const inTransit = letter.status === 'in_transit';
  const p = progress(leg.departed_at, leg.arrives_at, now);

  const routes: MapRoute[] = letter.legs.map((l) => ({
      id: String(l.leg_no),
      points: greatCircle(l.origin, l.destination),
      dashed: l.outcome !== 'arrived' && l.outcome !== 'in_transit',
      faded: l !== leg,
    }));
    const pins: MapPin[] = [];
    letter.legs.forEach((l) => {
      if (l.last_seen) {
        pins.push({ id: `wreck-${l.leg_no}`, coord: l.last_seen, emoji: '🪦', title: 'Last seen near here', subtitle: l.fail_reason ?? undefined });
      }
    });
    pins.push({ id: 'dest', coord: leg.destination, emoji: '📫', title: letter.role === 'sent' ? `${who}'s mailbox` : 'Your mailbox' });
  const fit = letter.legs.flatMap((l) => [l.origin, l.destination]);

  const movingPin: MapPin[] = inTransit
    ? [{ id: 'carrier', coord: interpolate(leg.origin, leg.destination, p), emoji: t?.emoji ?? '✉️' }]
    : [];

  return (
    <ThemedView style={{ flex: 1 }}>
      <Stack.Screen
        options={{
          title: letter.role === 'sent' ? `To ${who}` : `From ${who}`,
          headerRight: () => (
            <View style={styles.headerActions}>
              <Pressable
                hitSlop={8}
                accessibilityLabel={letter.archived ? 'Unarchive' : 'Archive'}
                onPress={() => toggleArchive(letter, refreshMail).then(() => router.back(), () => {})}>
                <ThemedText type="smallBold" style={{ color: theme.accent }}>
                  {letter.archived ? 'Unarchive' : 'Archive'}
                </ThemedText>
              </Pressable>
              <Pressable
                hitSlop={8}
                accessibilityLabel="Delete"
                onPress={() => confirmDelete(letter, refreshMail).then((gone) => gone && router.back())}>
                <ThemedText type="smallBold" themeColor="danger">
                  Delete
                </ThemedText>
              </Pressable>
            </View>
          ),
        }}
      />
      <ScrollView contentContainerStyle={styles.content}>
        <View style={[styles.map, { backgroundColor: theme.backgroundElement }]}>
          <SlowMap routes={routes} pins={[...pins, ...movingPin]} fit={fit} fitKey={letter.id} />
        </View>

        <StatusBanner letter={letter} now={now} />

        <Card style={styles.person}>
          <View style={{ flex: 1 }}>
            <ThemedText style={{ fontWeight: 700 }}>{who}</ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              @{letter.other.username}
            </ThemedText>
          </View>
          <Pressable
            hitSlop={8}
            onPress={() => router.push({ pathname: '/contact/[id]', params: { id: letter.other.id } })}>
            <ThemedText type="smallBold" style={{ color: theme.accent }}>
              {letter.other.is_contact ? 'Edit contact' : 'Add contact'}
            </ThemedText>
          </Pressable>
        </Card>

        {inTransit && (
          <Card>
            <View style={styles.between}>
              <ThemedText style={{ fontWeight: 700 }}>
                {t?.emoji} {Math.round(p * 100)}% of the way
              </ThemedText>
              <ThemedText style={{ fontWeight: 700, fontVariant: ['tabular-nums'] }}>
                {formatDuration(Date.parse(leg.arrives_at) - now)}
              </ThemedText>
            </View>
            <ProgressBar value={p} />
            <ThemedText type="small" themeColor="textSecondary">
              {formatDistance(leg.distance_km * (1 - p), units)} to go · due {formatWhen(leg.arrives_at)}
            </ThemedText>
          </Card>
        )}

        {letter.body ? (
          <View style={[styles.paper, { backgroundColor: theme.backgroundElement, borderColor: theme.border }]}>
            <ThemedText style={styles.letter}>{letter.body}</ThemedText>
            <ThemedText style={[styles.letter, styles.signature]} themeColor="textSecondary">
              — {letter.role === 'sent' ? 'you' : who}
            </ThemedText>
          </View>
        ) : (
          <Card style={{ alignItems: 'center', paddingVertical: Spacing.four }}>
            <ThemedText style={{ fontSize: 44, lineHeight: 54 }}>✉️</ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              {inTransit ? 'Sealed until it arrives.' : 'This letter never reached you.'}
            </ThemedText>
          </Card>
        )}

        <ThemedText type="smallBold" themeColor="textSecondary">
          JOURNEY
        </ThemedText>
        <View style={{ gap: Spacing.two }}>
          {letter.legs.map((l) => (
            <LegRow key={l.leg_no} leg={l} letter={letter} />
          ))}
        </View>

        {letter.role === 'received' && letter.status === 'delivered' && (
          <Button
            title="Write back"
            onPress={() =>
              router.push({
                pathname: '/compose',
                params: { to: letter.other.id },
              })
            }
          />
        )}
      </ScrollView>
    </ThemedView>
  );
}

function StatusBanner({ letter, now }: { letter: Letter; now: number }) {
  const who = displayName(letter.other);
  const leg = currentLeg(letter);
  let emoji = '';
  let text = '';
  switch (letter.status) {
    case 'in_transit':
      emoji = '⏳';
      text = letter.role === 'sent' ? `On its way to ${who}` : `${who} sent you something. It's on the way.`;
      break;
    case 'delivered':
      emoji = '✅';
      text =
        letter.role === 'sent'
          ? letter.read_at
            ? `Delivered and read ${formatWhen(letter.read_at)}`
            : `Delivered ${formatWhen(letter.delivered_at ?? leg.arrives_at)}`
          : `Arrived ${formatWhen(letter.delivered_at ?? leg.arrives_at)}`;
      break;
    case 'lost':
      emoji = '🪦';
      text = `Lost in transit. ${sentence(leg.fail_reason ?? '')} ${wreckNote(leg, now)}`;
      break;
    case 'found':
      emoji = '🫳';
      text = 'A stranger found the letter where its carrier went down. Maybe they will send it on…';
      break;
  }
  return (
    <Card style={styles.banner}>
      <ThemedText style={{ fontSize: 24, lineHeight: 30 }}>{emoji}</ThemedText>
      <ThemedText style={{ flex: 1 }}>{text}</ThemedText>
    </Card>
  );
}

const sentence = (s: string) => (s && !/[.!?)]$/.test(s) ? `${s}.` : s);

/** Wrecks crumble 30 days after the letter was due (see nearby_wrecks in the migration). */
function wreckNote(leg: Leg, now: number) {
  const left = Date.parse(leg.arrives_at) + 30 * 86_400_000 - now;
  return left > 0
    ? `It's still lying out there for someone to find, for about ${formatDuration(left)} more.`
    : 'It has crumbled to dust.';
}

function LegRow({ leg, letter }: { leg: Leg; letter: Letter }) {
  const { transport, units } = useApp();
  const t = transport(leg.transport_id);
  const who =
    leg.carrier === 'you' ? 'You' : leg.carrier === 'sender' ? (letter.role === 'sent' ? 'You' : displayName(letter.other)) : 'A stranger';
  const outcome: Record<Leg['outcome'], string> = {
    in_transit: 'In transit',
    arrived: 'Delivered',
    lost: `Lost · ${leg.fail_reason}`,
    found: `${leg.fail_reason} · picked up by a stranger`,
    forwarded: `${leg.fail_reason} · a stranger picked it up and sent it on`,
    found_by_recipient: `${leg.fail_reason} · the recipient found it themselves!`,
  };
  return (
    <Card style={styles.legRow}>
      <ThemedText style={{ fontSize: 26, lineHeight: 34 }}>{t?.emoji ?? '✉️'}</ThemedText>
      <View style={{ flex: 1, gap: 2 }}>
        <ThemedText style={{ fontWeight: 700 }}>
          {who} sent it by {t?.name ?? leg.transport_id}
        </ThemedText>
        <ThemedText type="small" themeColor="textSecondary">
          {formatWhen(leg.departed_at)} · {formatDistance(leg.distance_km, units)}
        </ThemedText>
        <ThemedText type="small" themeColor={leg.outcome === 'lost' ? 'danger' : 'textSecondary'}>
          {outcome[leg.outcome]}
        </ThemedText>
        {leg.opened_by_finder && (
          <ThemedText type="small" themeColor="danger">
            The seal was broken. Someone read it.
          </ThemedText>
        )}
      </View>
    </Card>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.three,
    paddingBottom: Spacing.six,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  map: {
    height: 220,
    borderRadius: Radius.medium,
    overflow: 'hidden',
  },
  between: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  banner: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  paper: {
    borderRadius: Radius.medium,
    borderWidth: StyleSheet.hairlineWidth,
    padding: Spacing.four,
    gap: Spacing.three,
  },
  letter: {
    fontFamily: Fonts.serif,
    fontSize: 18,
    lineHeight: 28,
  },
  signature: {
    textAlign: 'right',
    fontStyle: 'italic',
  },
  headerActions: {
    flexDirection: 'row',
    gap: Spacing.three,
  },
  person: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  legRow: {
    flexDirection: 'row',
    gap: Spacing.three,
    alignItems: 'flex-start',
  },
});
