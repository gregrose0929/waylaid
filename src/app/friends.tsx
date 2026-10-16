import { router, useFocusEffect } from 'expo-router';
import { useCallback, useEffect, useState } from 'react';
import { FlatList, Pressable, Share, StyleSheet, View } from 'react-native';

import { Avatar } from '@/components/avatar';
import { Icon } from '@/components/icon';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { useToast } from '@/components/toast';
import { Button, EmptyState, Field, Segmented } from '@/components/ui';
import { MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api, type Person } from '@/lib/api';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

type Tab = 'friends' | 'requests' | 'blocked';

export default function FriendsScreen() {
  const { friends, refreshFriends, me } = useApp();

  // Always points at the newest Android build on GitHub.
  const invite = () =>
    Share.share({
      message:
        `Write to me on Waylaid, the messenger where letters travel by pigeon, snail, or SR-71, and sometimes get lost on the way! 🕊️\n\n` +
        `1. Download it (Android): https://github.com/gregrose0929/waylaid/releases/latest/download/waylaid.apk\n` +
        `2. Add me as a friend: @${me?.username ?? ''}`,
    }).catch(() => {});
  const [tab, setTab] = useState<Tab>(friends.incoming.length > 0 ? 'requests' : 'friends');
  const [query, setQuery] = useState('');
  const [found, setFound] = useState<{ query: string; users: Person[] }>({ query: '', users: [] });

  useFocusEffect(
    useCallback(() => {
      refreshFriends().catch(() => {});
    }, [refreshFriends]),
  );

  // Typing searches every username, so this is also where you add new friends.
  const searching = query.trim().length > 0;
  useEffect(() => {
    if (!searching) return;
    let cancelled = false;
    const id = setTimeout(() => {
      api
        .findUsers(query)
        .then((users) => !cancelled && setFound({ query, users }))
        .catch(() => {});
    }, 250);
    return () => {
      cancelled = true;
      clearTimeout(id);
    };
  }, [query, searching]);

  const refreshSearch = async () => {
    await refreshFriends();
    if (searching) setFound({ query, users: await api.findUsers(query) });
  };

  const list: Person[] = searching
    ? found.query === query
      ? found.users
      : []
    : tab === 'friends'
      ? friends.friends
      : tab === 'requests'
        ? [...friends.incoming, ...friends.outgoing]
        : friends.blocked;

  return (
    <ThemedView style={{ flex: 1 }}>
      <FlatList
        data={list}
        keyExtractor={(p) => p.id}
        contentContainerStyle={styles.list}
        keyboardShouldPersistTaps="handled"
        ListHeaderComponent={
          <View style={{ gap: Spacing.three, paddingBottom: Spacing.two }}>
            <Button title="📨 Invite a friend to Waylaid" variant="secondary" onPress={invite} />
            <Field
              placeholder="🔍  Find people by username"
              autoCapitalize="none"
              autoCorrect={false}
              value={query}
              onChangeText={setQuery}
            />
            {!searching && (
              <Segmented
                options={[
                  { value: 'friends', label: 'Friends', badge: friends.friends.length },
                  { value: 'requests', label: 'Requests', badge: friends.incoming.length },
                  { value: 'blocked', label: 'Blocked' },
                ]}
                value={tab}
                onChange={setTab}
              />
            )}
          </View>
        }
        ListEmptyComponent={
          searching ? (
            found.query === query ? (
              <EmptyState emoji="🔍" title="No one by that name" body="Usernames are lowercase letters, numbers, and _." />
            ) : null
          ) : tab === 'friends' ? (
            <EmptyState
              emoji="🤝"
              title="No friends yet"
              body="Search for a username above and send a request. You can only write to friends."
            />
          ) : tab === 'requests' ? (
            <EmptyState emoji="📭" title="No requests" body="Friend requests you send or receive show up here." />
          ) : (
            <EmptyState emoji="🕊️" title="Nobody blocked" body="Blocked people can’t find you or write to you." />
          )
        }
        renderItem={({ item }) => <PersonRow person={item} onChanged={refreshSearch} />}
      />
    </ThemedView>
  );
}

function PersonRow({ person, onChanged }: { person: Person; onChanged: () => Promise<void> }) {
  const theme = useTheme();
  const toast = useToast();
  const [busy, setBusy] = useState(false);

  const act = async (task: () => Promise<unknown>, done?: string) => {
    setBusy(true);
    try {
      await task();
      await onChanged();
      if (done) toast(done);
    } catch (e) {
      toast(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  };

  let trailing: React.ReactNode;
  switch (person.relationship) {
    case 'incoming':
      trailing = (
        <View style={styles.actions}>
          <RoundButton
            icon="check"
            color={theme.accentText}
            bg={theme.accent}
            disabled={busy}
            label="Accept"
            onPress={() => act(() => api.respondFriend(person.id, true), 'You’re friends now')}
          />
          <RoundButton
            icon="close"
            color={theme.text}
            bg={theme.backgroundSelected}
            disabled={busy}
            label="Decline"
            onPress={() => act(() => api.respondFriend(person.id, false))}
          />
        </View>
      );
      break;
    case 'none':
      trailing = (
        <RoundButton
          icon="addPerson"
          color={theme.accentText}
          bg={theme.accent}
          disabled={busy}
          label="Add friend"
          onPress={() => act(() => api.addFriend(person.id), 'Friend request sent')}
        />
      );
      break;
    case 'outgoing':
      trailing = (
        <ThemedText type="small" themeColor="textSecondary">
          Requested
        </ThemedText>
      );
      break;
    case 'blocked':
      trailing = (
        <ThemedText type="small" themeColor="danger">
          Blocked
        </ThemedText>
      );
      break;
    default:
      trailing = <Icon name="chevron" size={20} color={theme.textSecondary} />;
  }

  return (
    <Pressable
      onPress={() =>
        router.push({
          pathname: '/person/[id]',
          params: { id: person.id, username: person.username, name: person.display_name ?? '' },
        })
      }
      style={({ pressed }) => [styles.row, { backgroundColor: theme.backgroundElement, opacity: pressed ? 0.8 : 1 }]}>
      <Avatar person={person} />
      <View style={{ flex: 1 }}>
        <ThemedText style={{ fontWeight: 700 }} numberOfLines={1}>
          {displayName(person)}
        </ThemedText>
        <ThemedText type="small" themeColor="textSecondary" numberOfLines={1}>
          @{person.username}
        </ThemedText>
      </View>
      {trailing}
    </Pressable>
  );
}

function RoundButton({
  icon,
  color,
  bg,
  label,
  onPress,
  disabled,
}: {
  icon: 'check' | 'close' | 'addPerson';
  color: string;
  bg: string;
  label: string;
  onPress: () => void;
  disabled?: boolean;
}) {
  return (
    <Pressable
      accessibilityRole="button"
      accessibilityLabel={label}
      disabled={disabled}
      onPress={onPress}
      hitSlop={6}
      style={({ pressed }) => [styles.round, { backgroundColor: bg, opacity: disabled ? 0.5 : pressed ? 0.7 : 1 }]}>
      <Icon name={icon} size={20} color={color} />
    </Pressable>
  );
}

const styles = StyleSheet.create({
  list: {
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
    padding: Spacing.three,
    borderRadius: Radius.medium,
  },
  actions: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  round: {
    width: 38,
    height: 38,
    borderRadius: 19,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
