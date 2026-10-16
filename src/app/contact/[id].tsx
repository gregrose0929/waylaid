import { router, useLocalSearchParams } from 'expo-router';
import { useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, ErrorText, Field } from '@/components/ui';
import { Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { api, type Person } from '@/lib/api';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

/** Add someone to your contacts, give them a private nickname, or remove them. */
export default function ContactScreen() {
  const params = useLocalSearchParams<{ id: string; username?: string; name?: string }>();
  const { contacts, mail, refreshContacts, refreshMail } = useApp();

  const person: Person | undefined =
    contacts.find((c) => c.id === params.id) ??
    mail.find((l) => l.other.id === params.id)?.other ??
    (params.username
      ? {
          id: params.id,
          username: params.username,
          display_name: params.name || null,
          nickname: null,
          is_contact: false,
          has_home: true,
        }
      : undefined);

  const [nickname, setNickname] = useState(person?.nickname ?? '');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!person) {
    return (
      <ThemedView style={styles.flex}>
        <ThemedText style={{ padding: Spacing.four }}>We couldn’t find that person.</ThemedText>
      </ThemedView>
    );
  }

  async function run(task: () => Promise<void>) {
    setBusy(true);
    setError(null);
    try {
      await task();
      await Promise.all([refreshContacts(), refreshMail()]);
      router.back();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  }

  return (
    <ThemedView style={styles.flex}>
      <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.flex}>
        <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="handled">
          <View style={{ gap: 2 }}>
            <ThemedText style={styles.name}>{displayName({ ...person, nickname: nickname || null })}</ThemedText>
            <ThemedText themeColor="textSecondary">
              @{person.username}
              {person.display_name ? ` · calls themselves “${person.display_name}”` : ''}
            </ThemedText>
          </View>

          <Field
            label="Your name for them"
            placeholder={person.display_name ?? 'e.g. Carrie Rose'}
            value={nickname}
            onChangeText={setNickname}
            maxLength={40}
            autoFocus={!person.is_contact}
          />
          <ThemedText type="small" themeColor="textSecondary">
            Only you see this name. It replaces @{person.username} everywhere in your app.
          </ThemedText>

          <ErrorText>{error}</ErrorText>
          <Button
            title={person.is_contact ? 'Save' : 'Add to contacts'}
            loading={busy}
            onPress={() => run(() => api.saveContact(person.id, nickname))}
          />
          {person.has_home && (
            <Button
              title="Write them a letter"
              variant="secondary"
              onPress={() => {
                router.back();
                router.push({ pathname: '/compose', params: { to: person.id } });
              }}
            />
          )}
          {person.is_contact && (
            <Button title="Remove from contacts" variant="ghost" onPress={() => run(() => api.removeContact(person.id))} />
          )}
        </ScrollView>
      </KeyboardAvoidingView>
    </ThemedView>
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
  name: {
    fontFamily: Fonts.serif,
    fontSize: 28,
    lineHeight: 36,
    fontWeight: 700,
  },
});
