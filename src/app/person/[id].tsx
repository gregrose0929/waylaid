import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useCallback, useState } from 'react';
import { Alert, KeyboardAvoidingView, Platform, ScrollView, StyleSheet, Switch, View } from 'react-native';

import { Avatar } from '@/components/avatar';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { useToast } from '@/components/toast';
import { Button, Card, ErrorText, Field } from '@/components/ui';
import { Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api, type Person } from '@/lib/api';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

/** Someone's card: friendship, your private name for them, pin/mute, block. */
export default function PersonScreen() {
  const params = useLocalSearchParams<{ id: string; username?: string; name?: string }>();
  const { friends, mail, refreshFriends, refreshMail } = useApp();

  const known: Person | undefined =
    [...friends.friends, ...friends.incoming, ...friends.outgoing, ...friends.blocked].find((p) => p.id === params.id) ??
    mail.find((l) => l.other.id === params.id)?.other;
  const [fresh, setFresh] = useState<Person | null>(null);
  const person: Person | undefined =
    fresh ??
    known ??
    (params.username
      ? {
          id: params.id,
          username: params.username,
          display_name: params.name || null,
          nickname: null,
          is_contact: false,
          has_home: true,
          relationship: 'none',
          pinned: false,
          muted: false,
        }
      : undefined);

  if (!person) {
    return (
      <ThemedView style={styles.flex}>
        <ThemedText style={{ padding: Spacing.four }}>We couldn’t find that person.</ThemedText>
      </ThemedView>
    );
  }
  return (
    <PersonView
      person={person}
      onChanged={async () => {
        const [results] = await Promise.all([api.findUsers(person.username), refreshFriends(), refreshMail()]);
        const updated = results.find((p) => p.id === person.id);
        if (updated) setFresh(updated);
      }}
    />
  );
}

function PersonView({ person, onChanged }: { person: Person; onChanged: () => Promise<void> }) {
  const theme = useTheme();
  const toast = useToast();
  const [nickname, setNickname] = useState(person.nickname ?? '');
  const [busy, setBusy] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const rel = person.relationship;

  const run = useCallback(
    async (label: string, task: () => Promise<unknown>, done?: string) => {
      setBusy(label);
      setError(null);
      try {
        await task();
        await onChanged();
        if (done) toast(done);
      } catch (e) {
        setError(e instanceof Error ? e.message : String(e));
      } finally {
        setBusy(null);
      }
    },
    [onChanged, toast],
  );

  function confirmBlock() {
    const go = () => run('block', () => api.block(person.id), `Blocked @${person.username}`);
    if (Platform.OS === 'web') return go();
    Alert.alert(
      `Block @${person.username}?`,
      'They won’t be able to find you, send you friend requests, or write to you. They aren’t told.',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Block', style: 'destructive', onPress: go },
      ],
    );
  }

  const name = displayName({ ...person, nickname: nickname || null });

  return (
    <ThemedView style={styles.flex}>
      <Stack.Screen options={{ title: '' }} />
      <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.flex}>
        <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="handled">
          <View style={styles.hero}>
            <Avatar person={{ ...person, nickname: nickname || null }} size={88} />
            <ThemedText style={styles.name}>{name}</ThemedText>
            <ThemedText themeColor="textSecondary">
              @{person.username}
              {person.display_name && person.display_name !== name ? ` · “${person.display_name}”` : ''}
            </ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              {rel === 'friend'
                ? '🤝 Friends'
                : rel === 'incoming'
                  ? '👋 Wants to be your friend'
                  : rel === 'outgoing'
                    ? '⏳ Friend request sent'
                    : rel === 'blocked'
                      ? '🚫 Blocked'
                      : 'Not friends yet'}
            </ThemedText>
          </View>

          <ErrorText>{error}</ErrorText>

          {rel === 'friend' && (
            <Button
              title="Write a letter"
              onPress={() => router.push({ pathname: '/compose', params: { to: person.id } })}
              disabled={!person.has_home}
            />
          )}
          {rel === 'incoming' && (
            <View style={styles.row}>
              <Button
                title="Accept"
                style={styles.flex}
                loading={busy === 'accept'}
                onPress={() => run('accept', () => api.respondFriend(person.id, true), 'You’re friends now')}
              />
              <Button
                title="Decline"
                variant="secondary"
                style={styles.flex}
                loading={busy === 'decline'}
                onPress={() => run('decline', () => api.respondFriend(person.id, false))}
              />
            </View>
          )}
          {rel === 'outgoing' && (
            <Button
              title="Cancel friend request"
              variant="secondary"
              loading={busy === 'cancel'}
              onPress={() => run('cancel', () => api.cancelFriendRequest(person.id))}
            />
          )}
          {rel === 'none' && (
            <Button
              title="Add friend"
              loading={busy === 'add'}
              onPress={() => run('add', () => api.addFriend(person.id), 'Friend request sent')}
            />
          )}
          {rel === 'blocked' && (
            <Button
              title="Unblock"
              variant="secondary"
              loading={busy === 'unblock'}
              onPress={() => run('unblock', () => api.unblock(person.id), 'Unblocked')}
            />
          )}

          {rel !== 'blocked' && (
            <Card>
              <Field
                label="YOUR NAME FOR THEM"
                placeholder={person.display_name ?? 'e.g. Carrie Rose'}
                value={nickname}
                onChangeText={setNickname}
                maxLength={40}
              />
              <ThemedText type="small" themeColor="textSecondary">
                Only you see this. It replaces @{person.username} everywhere in your app.
              </ThemedText>
              <Button
                title="Save name"
                variant="secondary"
                loading={busy === 'nickname'}
                disabled={(person.nickname ?? '') === nickname}
                onPress={() =>
                  run(
                    'nickname',
                    () => (nickname.trim() ? api.saveContact(person.id, nickname) : api.removeContact(person.id)),
                    'Saved',
                  )
                }
              />
            </Card>
          )}

          {rel === 'friend' && (
            <Card>
              <ToggleRow
                label="📌 Pin conversation"
                detail="Keep them at the top of your mailbox"
                value={person.pinned}
                onChange={(v) => run('pin', () => api.setConversationPref(person.id, { pinned: v }))}
                tint={theme.accent}
              />
              <ToggleRow
                label="🔕 Mute"
                detail="No notifications when their letters arrive"
                value={person.muted}
                onChange={(v) => run('mute', () => api.setConversationPref(person.id, { muted: v }))}
                tint={theme.accent}
              />
            </Card>
          )}

          <View style={{ gap: Spacing.one }}>
            {rel === 'friend' && (
              <Button
                title="Remove friend"
                variant="ghost"
                onPress={() => run('remove', () => api.removeFriend(person.id), 'Removed from friends')}
              />
            )}
            {rel !== 'blocked' && <Button title="Block" variant="ghost" onPress={confirmBlock} />}
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </ThemedView>
  );
}

function ToggleRow({
  label,
  detail,
  value,
  onChange,
  tint,
}: {
  label: string;
  detail: string;
  value: boolean;
  onChange: (v: boolean) => void;
  tint: string;
}) {
  return (
    <View style={styles.toggle}>
      <View style={styles.flex}>
        <ThemedText>{label}</ThemedText>
        <ThemedText type="small" themeColor="textSecondary">
          {detail}
        </ThemedText>
      </View>
      <Switch value={value} onValueChange={onChange} trackColor={{ true: tint }} />
    </View>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  content: {
    padding: Spacing.four,
    gap: Spacing.three,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  hero: {
    alignItems: 'center',
    gap: Spacing.one,
    paddingBottom: Spacing.two,
  },
  name: {
    fontFamily: Fonts.serif,
    fontSize: 28,
    lineHeight: 36,
    fontWeight: 700,
    textAlign: 'center',
    marginTop: Spacing.two,
  },
  row: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  toggle: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
