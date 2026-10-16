import * as Haptics from 'expo-haptics';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useEffect, useMemo, useState } from 'react';
import { FlatList, KeyboardAvoidingView, Platform, Pressable, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ActionSheet } from '@/components/action-sheet';
import { Avatar } from '@/components/avatar';
import { CarrierSheet } from '@/components/carrier-sheet';
import { Icon } from '@/components/icon';
import { currentLeg, letterStatusLine } from '@/components/letter-row';
import { Postcard } from '@/components/postcard';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { useToast } from '@/components/toast';
import { EmptyState, ProgressBar } from '@/components/ui';
import { Fonts, Radius, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import { activityAt, api, isUnread, type Letter } from '@/lib/api';
import { displayName, formatDuration } from '@/lib/format';
import { progress } from '@/lib/geo';
import { useLetterActions } from '@/lib/letter-actions';
import { estimateTripMs } from '@/lib/trip';
import { weatherAt, type WeatherNow } from '@/lib/weather';
import { useApp } from '@/providers/app-state';

type Item = { kind: 'letter'; letter: Letter } | { kind: 'day'; label: string; key: string };

function dayLabel(iso: string) {
  const d = new Date(iso);
  const today = new Date();
  const yesterday = new Date(Date.now() - 86_400_000);
  if (d.toDateString() === today.toDateString()) return 'Today';
  if (d.toDateString() === yesterday.toDateString()) return 'Yesterday';
  return d.toLocaleDateString([], {
    weekday: 'short',
    month: 'short',
    day: 'numeric',
    year: d.getFullYear() === today.getFullYear() ? undefined : 'numeric',
  });
}

/** One conversation, chat-style: newest at the bottom, reply bar underneath. */
export default function ConversationScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const { mail, friends, refreshMail } = useApp();
  const theme = useTheme();
  const now = useNow();

  const letters = useMemo(
    () => mail.filter((l) => l.other.id === id).sort((a, b) => activityAt(b).localeCompare(activityAt(a))),
    [mail, id],
  );
  const person = letters[0]?.other ?? friends.friends.find((f) => f.id === id);

  // Opening the conversation reads everything in it.
  const unreadIds = letters.filter(isUnread).map((l) => l.id).join(',');
  useEffect(() => {
    if (unreadIds) api.setLettersState(unreadIds.split(','), 'read').then(refreshMail).catch(() => {});
  }, [unreadIds, refreshMail]);

  // Inverted list: newest first, with a day header after (i.e. above) each day's last letter.
  const items: Item[] = [];
  letters.forEach((l, i) => {
    items.push({ kind: 'letter', letter: l });
    const day = dayLabel(activityAt(l));
    const next = letters[i + 1];
    if (!next || dayLabel(activityAt(next)) !== day) items.push({ kind: 'day', label: day, key: `day-${l.id}` });
  });

  if (!person) return <EmptyState emoji="🤷" title="Conversation not found" body="It may still be loading." />;

  return (
    <ThemedView style={{ flex: 1 }}>
      <Stack.Screen
        options={{
          headerTitle: () => (
            <Pressable
              onPress={() => router.push({ pathname: '/person/[id]', params: { id: person.id } })}
              style={styles.headerTitle}>
              <Avatar person={person} size={32} />
              <View>
                <ThemedText style={{ fontWeight: 700 }} numberOfLines={1}>
                  {displayName(person)}
                </ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  @{person.username}
                </ThemedText>
              </View>
            </Pressable>
          ),
        }}
      />
      <KeyboardAvoidingView
        style={{ flex: 1 }}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        keyboardVerticalOffset={Platform.OS === 'ios' ? 90 : 0}>
        <FlatList
          inverted
          data={items}
          keyExtractor={(it) => (it.kind === 'letter' ? it.letter.id : it.key)}
          contentContainerStyle={styles.list}
          renderItem={({ item }) =>
            item.kind === 'day' ? (
              <ThemedText type="small" themeColor="textSecondary" style={styles.day}>
                {item.label}
              </ThemedText>
            ) : (
              <Bubble letter={item.letter} now={now} />
            )
          }
          ListEmptyComponent={
            <View style={{ transform: [{ scaleY: -1 }] }}>
              <EmptyState emoji="✍️" title="Start the conversation" body="Your first letter is just a carrier away." />
            </View>
          }
        />
        <ReplyBar personId={person.id} canWrite={person.relationship === 'friend' && person.has_home} />
      </KeyboardAvoidingView>
      <SafeAreaView edges={['bottom']} style={{ backgroundColor: theme.background }} />
    </ThemedView>
  );
}

function Bubble({ letter, now }: { letter: Letter; now: number }) {
  const { transport } = useApp();
  const theme = useTheme();
  const actions = useLetterActions();
  const mine = letter.role === 'sent';
  const leg = currentLeg(letter);
  const t = transport(leg.transport_id);
  const time = new Date(activityAt(letter)).toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' });

  const status = mine
    ? letter.status === 'delivered'
      ? letter.read_at
        ? 'Read'
        : 'Delivered'
      : letterStatusLine(letter, now, t?.name)
    : null;

  const [menu, setMenu] = useState(false);
  const openJourney = () => router.push({ pathname: '/letter/[id]', params: { id: letter.id } });

  return (
    <View style={[styles.bubbleRow, mine ? styles.right : styles.left]}>
      <ActionSheet
        visible={menu}
        title={letter.body.split('\n')[0] || (letter.photo_path ? 'Postcard' : undefined)}
        onClose={() => setMenu(false)}
        options={[
          { label: 'See its journey', icon: 'send', onPress: openJourney },
          ...(mine
            ? []
            : [{ label: 'Mark as unread', icon: 'unread' as const, onPress: () => actions.markUnread([letter.id]) }]),
          { label: 'Archive', icon: 'archive', onPress: () => actions.archive([letter.id]) },
          { label: 'Delete', icon: 'trash', destructive: true, onPress: () => actions.remove([letter.id]) },
        ]}
      />
      <Pressable
        onPress={openJourney}
        onLongPress={() => {
          Haptics.selectionAsync().catch(() => {});
          setMenu(true);
        }}
        style={({ pressed }) => [
          styles.bubble,
          mine
            ? { backgroundColor: theme.accent, borderBottomRightRadius: 4 }
            : { backgroundColor: theme.backgroundElement, borderBottomLeftRadius: 4 },
          letter.status === 'overdue' && { opacity: 0.6 },
          pressed && { opacity: 0.85 },
        ]}>
        {letter.photo_path && <Postcard path={letter.photo_path} width={240} maxHeight={320} />}
        {!!letter.body && (
          <ThemedText style={[styles.body, mine && { color: theme.accentText }]}>{letter.body}</ThemedText>
        )}
        {letter.status === 'in_transit' && (
          <ProgressBar value={progress(leg.departed_at, leg.arrives_at, now)} color={theme.accentText} />
        )}
        <ThemedText type="small" style={[styles.meta, { color: mine ? theme.accentText : theme.textSecondary }]}>
          {t?.emoji} {time}
          {status ? ` · ${status}` : ''}
        </ThemedText>
      </Pressable>
    </View>
  );
}

function ReplyBar({ personId, canWrite }: { personId: string; canWrite: boolean }) {
  const { me, transport, refreshMail, refreshMe, weatherEffect } = useApp();
  const theme = useTheme();
  const toast = useToast();
  const [body, setBody] = useState('');
  const [carrier, setCarrier] = useState('pigeon');
  const [weather, setWeather] = useState<WeatherNow | null>(null);
  const home = me?.home;
  useEffect(() => {
    if (!home) return;
    weatherAt(home[0], home[1]).then(setWeather);
  }, [home]);
  const [sheet, setSheet] = useState(false);
  const [distanceKm, setDistanceKm] = useState<number | null>(null);
  const [sending, setSending] = useState(false);

  useEffect(() => {
    if (!canWrite) return;
    api
      .quoteDistance(personId)
      .then(setDistanceKm)
      .catch(() => {});
  }, [personId, canWrite]);

  if (!canWrite) {
    return (
      <View style={[styles.bar, { borderColor: theme.border }]}>
        <ThemedText type="small" themeColor="textSecondary" style={{ flex: 1, textAlign: 'center' }}>
          You can only write to friends with a mailbox.
        </ThemedText>
      </View>
    );
  }

  const t = transport(carrier);
  async function send() {
    setSending(true);
    try {
      await api.send(personId, body, carrier, weather?.kind);
      Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
      setBody('');
      await Promise.all([refreshMail(), refreshMe()]);
      const fx = weatherEffect(weather?.kind, carrier);
      if (t && distanceKm != null) toast(`${t.emoji} On its way, about ${formatDuration(estimateTripMs(distanceKm, t, fx))}`);
    } catch (e) {
      toast(e instanceof Error ? e.message : String(e));
    } finally {
      setSending(false);
    }
  }

  return (
    <View style={[styles.bar, { borderColor: theme.border, backgroundColor: theme.background }]}>
      <Pressable
        onPress={() => setSheet(true)}
        accessibilityLabel={`Carrier: ${t?.name ?? carrier}. Tap to change`}
        style={[styles.carrier, { backgroundColor: theme.backgroundElement }]}>
        <ThemedText style={{ fontSize: 22, lineHeight: 28 }}>{t?.emoji ?? '🕊️'}</ThemedText>
        {t && distanceKm != null && (
          <ThemedText type="small" themeColor="textSecondary" style={{ fontSize: 10, lineHeight: 12 }}>
            {formatDuration(estimateTripMs(distanceKm, t, weatherEffect(weather?.kind, carrier)))}
          </ThemedText>
        )}
      </Pressable>
      <TextInput
        multiline
        placeholder="Write a letter…"
        placeholderTextColor={theme.textSecondary}
        value={body}
        onChangeText={setBody}
        maxLength={2000}
        style={[styles.input, { color: theme.text, backgroundColor: theme.backgroundElement }]}
      />
      <Pressable
        onPress={send}
        disabled={!body.trim() || sending}
        accessibilityLabel="Send"
        style={[styles.send, { backgroundColor: theme.accent, opacity: !body.trim() || sending ? 0.4 : 1 }]}>
        <Icon name="send" size={20} color={theme.accentText} />
      </Pressable>
      <CarrierSheet
        visible={sheet}
        weather={weather?.kind}
        distanceKm={distanceKm}
        value={carrier}
        onChange={setCarrier}
        onClose={() => setSheet(false)}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  headerTitle: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.two,
  },
  list: {
    padding: Spacing.three,
    gap: Spacing.two,
  },
  day: {
    alignSelf: 'center',
    paddingVertical: Spacing.two,
  },
  bubbleRow: {
    flexDirection: 'row',
  },
  left: {
    justifyContent: 'flex-start',
  },
  right: {
    justifyContent: 'flex-end',
  },
  bubble: {
    maxWidth: '82%',
    borderRadius: Radius.medium,
    paddingHorizontal: Spacing.three,
    paddingVertical: Spacing.two,
    gap: 6,
  },
  body: {
    fontFamily: Fonts.serif,
    fontSize: 17,
    lineHeight: 24,
  },
  meta: {
    fontSize: 12,
    lineHeight: 16,
    alignSelf: 'flex-end',
  },
  bar: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    gap: Spacing.two,
    padding: Spacing.two,
    borderTopWidth: StyleSheet.hairlineWidth,
  },
  carrier: {
    width: 48,
    height: 48,
    borderRadius: 24,
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    flex: 1,
    minHeight: 48,
    maxHeight: 140,
    borderRadius: 24,
    paddingHorizontal: Spacing.three,
    paddingTop: 13,
    paddingBottom: 13,
    fontSize: 16,
    fontFamily: Fonts.serif,
  },
  send: {
    width: 48,
    height: 48,
    borderRadius: 24,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
