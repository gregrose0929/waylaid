import * as Notifications from 'expo-notifications';
import { router, useFocusEffect } from 'expo-router';
import { useCallback, useEffect, useMemo, useState } from 'react';
import { BackHandler, FlatList, Pressable, RefreshControl, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Avatar } from '@/components/avatar';
import { Icon, type IconName } from '@/components/icon';
import { ConversationRow, LetterRow } from '@/components/letter-row';
import { SwipeRow } from '@/components/swipe-row';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, EmptyState, ErrorText, Field, Segmented } from '@/components/ui';
import { BottomTabInset, Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import { isUnread, type FoundLetter, type Letter } from '@/lib/api';
import { toConversations, type Conversation } from '@/lib/conversations';
import { displayName, formatAgo } from '@/lib/format';
import { useLetterActions } from '@/lib/letter-actions';
import { useApp } from '@/providers/app-state';

type Tab = 'inbox' | 'sent' | 'chats' | 'found';

const matches = (l: Letter, q: string) =>
  [l.other.username, l.other.display_name, l.other.nickname, l.body].some((s) => s?.toLowerCase().includes(q));

export default function MailScreen() {
  const { mail, found, friends, refreshMail, refreshFriends, transport, settings } = useApp();
  const theme = useTheme();
  const now = useNow(10_000);
  const actions = useLetterActions();
  const conversations = settings.mailView === 'conversations';

  const [tab, setTab] = useState<Tab>(conversations ? 'chats' : 'inbox');
  const [refreshing, setRefreshing] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [searchOpen, setSearchOpen] = useState(false);
  const [query, setQuery] = useState('');
  const [unreadOnly, setUnreadOnly] = useState(false);
  /** ids being multi-selected: letter ids in mail view, person ids in conversation view */
  const [selected, setSelected] = useState<Set<string> | null>(null);
  const selecting = selected !== null;

  // Switching views in Settings lands on that view's first tab.
  const activeTab: Tab = tab === 'found' ? 'found' : conversations ? 'chats' : tab === 'chats' ? 'inbox' : tab;

  const refresh = useCallback(async () => {
    try {
      await Promise.all([refreshMail(), refreshFriends()]);
      setError(null);
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }, [refreshMail, refreshFriends]);

  // Arrivals are a surprise, so we can't predict them: refresh on focus, every minute
  // while visible, and whenever a push notification comes in.
  useFocusEffect(
    useCallback(() => {
      refresh();
      const id = setInterval(refresh, 60_000);
      const sub = Notifications.addNotificationReceivedListener(() => refresh());
      return () => {
        clearInterval(id);
        sub.remove();
      };
    }, [refresh]),
  );

  // Android back button leaves selection mode first.
  useEffect(() => {
    if (!selecting) return;
    const sub = BackHandler.addEventListener('hardwareBackPress', () => {
      setSelected(null);
      return true;
    });
    return () => sub.remove();
  }, [selecting]);

  const q = query.trim().toLowerCase();
  const visible = useMemo(
    () => mail.filter((l) => !l.archived && (!q || matches(l, q)) && (!unreadOnly || isUnread(l))),
    [mail, q, unreadOnly],
  );
  const inbox = visible.filter((l) => l.role === 'received');
  const sent = visible.filter((l) => l.role === 'sent');
  const convos = useMemo(() => toConversations(visible), [visible]);
  const archivedCount = mail.filter((l) => l.archived).length;
  const unread = mail.filter((l) => !l.archived && isUnread(l)).length;
  const satchel = found.filter((f) => !f.forwarded && f.status !== 'delivered');

  const tabs: { value: Tab; label: string; badge?: number }[] = conversations
    ? [{ value: 'chats', label: 'Conversations', badge: unread }]
    : [
        { value: 'inbox', label: 'Inbox', badge: unread },
        { value: 'sent', label: 'Sent' },
      ];
  if (found.length > 0) tabs.push({ value: 'found', label: 'Found', badge: satchel.length });

  // ----- multi-select -----
  const toggle = (id: string) =>
    setSelected((prev) => {
      const next = new Set(prev ?? []);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next.size === 0 ? null : next;
    });
  const startSelecting = (id: string) => setSelected(new Set([id]));
  const done = () => setSelected(null);
  const selectedLetters: Letter[] = !selected
    ? []
    : activeTab === 'chats'
      ? convos.filter((c) => selected.has(c.person.id)).flatMap((c) => c.letters)
      : mail.filter((l) => selected.has(l.id));
  const allIds =
    activeTab === 'chats' ? convos.map((c) => c.person.id) : (activeTab === 'inbox' ? inbox : sent).map((l) => l.id);
  const anyUnread = selectedLetters.some(isUnread);
  const bulk = (fn: (ids: string[]) => Promise<void>) => () => {
    fn(selectedLetters.map((l) => l.id));
    done();
  };

  const onRefresh = async () => {
    setRefreshing(true);
    await refresh();
    setRefreshing(false);
  };

  const openLetter = (l: Letter) => router.push({ pathname: '/letter/[id]', params: { id: l.id } });
  const openConversation = (c: Conversation) =>
    router.push({ pathname: '/conversation/[id]', params: { id: c.person.id } });

  const header = (
    <View style={{ gap: Spacing.three, paddingBottom: Spacing.two }}>
      {selecting ? (
        <View style={styles.selectionBar}>
          <HeaderButton icon="close" label="Cancel selection" onPress={done} />
          <ThemedText style={styles.selectionCount}>{selected.size} selected</ThemedText>
          <HeaderButton icon="selectAll" label="Select all" onPress={() => setSelected(new Set(allIds))} />
          <HeaderButton
            icon={anyUnread ? 'read' : 'unread'}
            label={anyUnread ? 'Mark as read' : 'Mark as unread'}
            onPress={bulk(anyUnread ? actions.markRead : actions.markUnread)}
          />
          <HeaderButton icon="archive" label="Archive" onPress={bulk(actions.archive)} />
          <HeaderButton icon="trash" label="Delete" onPress={bulk(actions.remove)} />
        </View>
      ) : (
        <View style={styles.titleRow}>
          <ThemedText style={styles.title}>Waylaid</ThemedText>
          <View style={styles.headerIcons}>
            <HeaderButton
              icon="search"
              label="Search"
              onPress={() => {
                setSearchOpen((o) => !o);
                setQuery('');
              }}
            />
            <View>
              <HeaderButton icon="people" label="Friends" onPress={() => router.push('/friends')} />
              {friends.incoming.length > 0 && <View style={[styles.reqDot, { backgroundColor: theme.accent }]} />}
            </View>
          </View>
        </View>
      )}
      {searchOpen && !selecting && (
        <Field placeholder="Search letters and people" value={query} onChangeText={setQuery} autoFocus />
      )}
      <Segmented
        options={tabs}
        value={activeTab}
        onChange={(t) => {
          setTab(t);
          done();
        }}
      />
      {(activeTab === 'inbox' || activeTab === 'chats') && (
        <View style={styles.chips}>
          <Chip label="All" active={!unreadOnly} onPress={() => setUnreadOnly(false)} />
          <Chip label={`Unread${unread ? ` (${unread})` : ''}`} active={unreadOnly} onPress={() => setUnreadOnly(true)} />
        </View>
      )}
      {friends.incoming.length > 0 && !selecting && (
        <Card onPress={() => router.push('/friends')} style={styles.requestCard}>
          <View style={styles.avatars}>
            {friends.incoming.slice(0, 3).map((p) => (
              <Avatar key={p.id} person={p} size={28} />
            ))}
          </View>
          <ThemedText style={{ flex: 1 }} numberOfLines={1}>
            {friends.incoming.length === 1
              ? `${displayName(friends.incoming[0]!)} wants to be friends`
              : `${friends.incoming.length} friend requests`}
          </ThemedText>
          <Icon name="chevron" size={18} color={theme.textSecondary} />
        </Card>
      )}
      <ErrorText>{error}</ErrorText>
    </View>
  );

  const footer =
    archivedCount > 0 && activeTab !== 'found' ? (
      <Pressable onPress={() => router.push('/archived')} style={styles.archivedLink}>
        <ThemedText type="small" themeColor="textSecondary">
          🗄️ Archived ({archivedCount}) ›
        </ThemedText>
      </Pressable>
    ) : null;

  const empty = q ? (
    <EmptyState emoji="🔍" title="Nothing matches" body={`No letters or people match “${query}”.`} />
  ) : unreadOnly && activeTab !== 'sent' && activeTab !== 'found' ? (
    <EmptyState emoji="✅" title="All caught up" body="You’ve read everything." />
  ) : activeTab === 'inbox' || activeTab === 'chats' ? (
    <EmptyState
      emoji="📭"
      title="Nothing yet"
      body={
        friends.friends.length === 0
          ? 'Add some friends first, then you can write to each other. Tap the people icon above.'
          : 'Letters appear here the moment they land. You won’t know one is coming until it arrives.'
      }
    />
  ) : activeTab === 'sent' ? (
    <EmptyState emoji="🕊️" title="No letters sent" body="Write a friend a letter and choose how it gets there." />
  ) : (
    <EmptyState emoji="🔍" title="Satchel empty" body="Lost letters lie where their carrier went down. Check the map." />
  );

  const common = {
    ListHeaderComponent: header,
    ListEmptyComponent: empty,
    ListFooterComponent: footer,
    contentContainerStyle: styles.list,
    keyboardShouldPersistTaps: 'handled' as const,
    refreshControl: <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />,
  };

  let list: React.ReactNode;
  if (activeTab === 'found') {
    list = (
      <FlatList
        {...common}
        data={found}
        keyExtractor={(f) => f.leg_id}
        renderItem={({ item }) => <FoundRow item={item} emoji={transport(item.transport_id)?.emoji} now={now} />}
      />
    );
  } else if (activeTab === 'chats') {
    list = (
      <FlatList
        {...common}
        data={convos}
        keyExtractor={(c) => c.person.id}
        renderItem={({ item }) => (
          <SwipeRow
            enabled={!selecting}
            left={{
              label: 'Archive',
              icon: 'archive',
              color: theme.success,
              onPress: () => actions.archive(item.letters.map((l) => l.id)),
            }}
            right={{
              label: 'Delete',
              icon: 'trash',
              color: theme.danger,
              onPress: () => actions.remove(item.letters.map((l) => l.id)),
            }}>
            <ConversationRow
              convo={item}
              now={now}
              selecting={selecting}
              selected={selected?.has(item.person.id)}
              onPress={() => (selecting ? toggle(item.person.id) : openConversation(item))}
              onLongPress={() => (selecting ? toggle(item.person.id) : startSelecting(item.person.id))}
            />
          </SwipeRow>
        )}
      />
    );
  } else {
    list = (
      <FlatList
        {...common}
        data={activeTab === 'inbox' ? inbox : sent}
        keyExtractor={(l) => l.id}
        renderItem={({ item }) => (
          <SwipeRow
            enabled={!selecting}
            left={{ label: 'Archive', icon: 'archive', color: theme.success, onPress: () => actions.archive([item.id]) }}
            right={{ label: 'Delete', icon: 'trash', color: theme.danger, onPress: () => actions.remove([item.id]) }}>
            <LetterRow
              letter={item}
              now={now}
              selecting={selecting}
              selected={selected?.has(item.id)}
              onPress={() => (selecting ? toggle(item.id) : openLetter(item))}
              onLongPress={() => (selecting ? toggle(item.id) : startSelecting(item.id))}
            />
          </SwipeRow>
        )}
      />
    );
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView edges={['top']} style={styles.safe}>
        {list}
        {!selecting && (
          <Pressable
            accessibilityRole="button"
            accessibilityLabel="Write a letter"
            onPress={() => router.push('/compose')}
            style={({ pressed }) => [styles.fab, { backgroundColor: theme.accent, opacity: pressed ? 0.85 : 1 }]}>
            <Icon name="write" color={theme.accentText} />
            <ThemedText style={[styles.fabText, { color: theme.accentText }]}>Write</ThemedText>
          </Pressable>
        )}
      </SafeAreaView>
    </ThemedView>
  );
}

function HeaderButton({ icon, label, onPress }: { icon: IconName; label: string; onPress: () => void }) {
  return (
    <Pressable
      accessibilityRole="button"
      accessibilityLabel={label}
      onPress={onPress}
      hitSlop={8}
      style={({ pressed }) => [styles.headerButton, pressed && { opacity: 0.6 }]}>
      <Icon name={icon} />
    </Pressable>
  );
}

function Chip({ label, active, onPress }: { label: string; active: boolean; onPress: () => void }) {
  const theme = useTheme();
  return (
    <Pressable
      onPress={onPress}
      accessibilityRole="button"
      accessibilityState={{ selected: active }}
      style={[
        styles.chip,
        { backgroundColor: active ? theme.text : 'transparent', borderColor: active ? theme.text : theme.border },
      ]}>
      <ThemedText type="smallBold" style={{ color: active ? theme.background : theme.textSecondary }}>
        {label}
      </ThemedText>
    </Pressable>
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
  titleRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingTop: Spacing.two,
  },
  title: {
    fontFamily: Fonts.serif,
    fontSize: 34,
    lineHeight: 42,
    fontWeight: 700,
  },
  headerIcons: {
    flexDirection: 'row',
    gap: Spacing.one,
  },
  headerButton: {
    padding: Spacing.two,
  },
  reqDot: {
    position: 'absolute',
    top: 6,
    right: 6,
    width: 10,
    height: 10,
    borderRadius: 5,
  },
  selectionBar: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingTop: Spacing.two,
    minHeight: 50,
  },
  selectionCount: {
    flex: 1,
    fontWeight: 700,
    fontSize: 18,
    marginLeft: Spacing.one,
  },
  chips: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  chip: {
    paddingHorizontal: Spacing.three,
    paddingVertical: 6,
    borderRadius: 999,
    borderWidth: 1,
  },
  requestCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  avatars: {
    flexDirection: 'row',
    gap: -8,
  },
  fab: {
    position: 'absolute',
    right: Spacing.four,
    bottom: BottomTabInset + Spacing.four,
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.two,
    paddingHorizontal: Spacing.four,
    height: 56,
    borderRadius: 18,
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
  archivedLink: {
    alignItems: 'center',
    paddingVertical: Spacing.three,
  },
  foundRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
