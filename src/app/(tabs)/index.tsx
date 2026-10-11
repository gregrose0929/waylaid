import { router, useFocusEffect } from 'expo-router';
import { useCallback, useEffect, useMemo, useState } from 'react';
import { FlatList, Pressable, RefreshControl, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { LetterRow, currentLeg } from '@/components/letter-row';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, EmptyState, ErrorText, Segmented } from '@/components/ui';
import { BottomTabInset, Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import type { FoundLetter } from '@/lib/api';
import { displayName, formatAgo } from '@/lib/format';
import { useApp } from '@/providers/app-state';

type Tab = 'inbox' | 'sent' | 'found';

export default function MailScreen() {
  const { mail, found, refreshMail, transport } = useApp();
  const theme = useTheme();
  const now = useNow();
  const [tab, setTab] = useState<Tab>('inbox');
  const [refreshing, setRefreshing] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const refresh = useCallback(async () => {
    try {
      await refreshMail();
      setError(null);
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }, [refreshMail]);

  useFocusEffect(
    useCallback(() => {
      refresh();
    }, [refresh]),
  );

  // Re-fetch the moment the next carrier is due, so arrivals pop in on their own.
  const nextArrival = useMemo(() => {
    const due = mail
      .filter((l) => l.status === 'in_transit')
      .map((l) => Date.parse(currentLeg(l).arrives_at));
    return due.length ? Math.min(...due) : null;
  }, [mail]);
  useEffect(() => {
    if (nextArrival == null) return;
    const wait = Math.max(nextArrival - Date.now() + 1500, 1000);
    if (wait > 2 ** 31 - 1) return;
    const id = setTimeout(refresh, wait);
    return () => clearTimeout(id);
  }, [nextArrival, refresh]);

  const inbox = mail.filter((l) => l.role === 'received');
  const sent = mail.filter((l) => l.role === 'sent');
  const unread = inbox.filter((l) => l.status === 'delivered' && !l.read_at).length;
  const satchel = found.filter((f) => !f.forwarded && f.status !== 'delivered');

  const tabs: { value: Tab; label: string; badge?: number }[] = [
    { value: 'inbox', label: 'Inbox', badge: unread },
    { value: 'sent', label: 'Sent' },
  ];
  if (found.length > 0) tabs.push({ value: 'found', label: 'Found', badge: satchel.length });

  const onRefresh = async () => {
    setRefreshing(true);
    await refresh();
    setRefreshing(false);
  };

  const header = (
    <View style={{ gap: Spacing.three, paddingBottom: Spacing.two }}>
      <ThemedText style={styles.title}>Slowpost</ThemedText>
      <Segmented options={tabs} value={tab} onChange={setTab} />
      <ErrorText>{error}</ErrorText>
    </View>
  );

  const empty =
    tab === 'inbox' ? (
      <EmptyState emoji="📭" title="Nothing yet" body="Letters to you will show up here — even while they're still on the way." />
    ) : tab === 'sent' ? (
      <EmptyState emoji="🕊️" title="No letters sent" body="Write someone a letter and choose how it gets there." />
    ) : (
      <EmptyState emoji="🔍" title="Satchel empty" body="Lost letters lie where their carrier went down. Check the map." />
    );

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView edges={['top']} style={styles.safe}>
        {tab === 'found' ? (
          <FlatList
            data={found}
            keyExtractor={(f) => f.leg_id}
            renderItem={({ item }) => <FoundRow item={item} emoji={transport(item.transport_id)?.emoji} now={now} />}
            ListHeaderComponent={header}
            ListEmptyComponent={empty}
            contentContainerStyle={styles.list}
            refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
          />
        ) : (
          <FlatList
            data={tab === 'inbox' ? inbox : sent}
            keyExtractor={(l) => l.id}
            renderItem={({ item }) => <LetterRow letter={item} now={now} />}
            ListHeaderComponent={header}
            ListEmptyComponent={empty}
            contentContainerStyle={styles.list}
            refreshControl={<RefreshControl refreshing={refreshing} onRefresh={onRefresh} />}
          />
        )}
        <Pressable
          accessibilityRole="button"
          accessibilityLabel="Write a letter"
          onPress={() => router.push('/compose')}
          style={({ pressed }) => [styles.fab, { backgroundColor: theme.accent, opacity: pressed ? 0.8 : 1 }]}>
          <ThemedText style={[styles.fabText, { color: theme.accentText }]}>✍️  Write</ThemedText>
        </Pressable>
      </SafeAreaView>
    </ThemedView>
  );
}

function FoundRow({ item, emoji, now }: { item: FoundLetter; emoji?: string; now: number }) {
  const state = item.forwarded
    ? 'Sent on its way'
    : item.status === 'delivered'
      ? 'Delivered'
      : item.opened_at
        ? 'Seal broken · in your satchel'
        : 'Sealed · in your satchel';
  return (
    <Card onPress={() => router.push({ pathname: '/found/[legId]', params: { legId: item.leg_id } })}>
      <View style={styles.foundRow}>
        <ThemedText style={{ fontSize: 28, lineHeight: 36 }}>{item.forwarded ? (emoji ?? '📨') : '📜'}</ThemedText>
        <View style={{ flex: 1 }}>
          <ThemedText style={{ fontWeight: 700 }} numberOfLines={1}>
            To {displayName(item.to)}
          </ThemedText>
          <ThemedText type="small" themeColor="textSecondary" numberOfLines={1}>
            {state} · found {formatAgo(item.found_at, now)}
          </ThemedText>
        </View>
      </View>
    </Card>
  );
}

const styles = StyleSheet.create({
  safe: {
    flex: 1,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  list: {
    padding: Spacing.three,
    gap: Spacing.two,
    paddingBottom: BottomTabInset + 96,
  },
  title: {
    fontFamily: Fonts.serif,
    fontSize: 34,
    lineHeight: 42,
    fontWeight: 700,
    paddingTop: Spacing.two,
  },
  fab: {
    position: 'absolute',
    right: Spacing.four,
    bottom: BottomTabInset + Spacing.four,
    paddingHorizontal: Spacing.four,
    height: 54,
    borderRadius: 27,
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 8,
    shadowOffset: { width: 0, height: 4 },
    elevation: 4,
  },
  fabText: {
    fontWeight: 700,
    fontSize: 16,
  },
  foundRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
