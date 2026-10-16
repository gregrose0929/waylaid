import { router } from 'expo-router';
import { useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { useToast } from '@/components/toast';
import { Button, ErrorText, Field } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { api } from '@/lib/api';
import { useApp } from '@/providers/app-state';

export default function EditProfileScreen() {
  const { me, refreshMe, refreshMail } = useApp();
  const toast = useToast();
  const [username, setUsername] = useState(me?.username ?? '');
  const [name, setName] = useState(me?.display_name ?? '');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!me) return null;
  const changed = username !== me.username || name !== (me.display_name ?? '');

  async function save() {
    setBusy(true);
    setError(null);
    try {
      await api.saveProfile(username, name);
      await Promise.all([refreshMe(), refreshMail()]);
      toast('Profile updated');
      router.back();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={{ flex: 1 }}>
        <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="handled">
          <Field
            label="NAME"
            placeholder="How your letters are signed"
            value={name}
            onChangeText={setName}
            maxLength={40}
          />
          <Field
            label="USERNAME"
            autoCapitalize="none"
            autoCorrect={false}
            value={username}
            onChangeText={(t) => setUsername(t.toLowerCase().replace(/[^a-z0-9_]/g, ''))}
            maxLength={20}
          />
          <ThemedText type="small" themeColor="textSecondary">
            3–20 letters, numbers, or underscores. Friends keep you either way: changing it just changes how people
            find you.
          </ThemedText>
          <ErrorText>{error}</ErrorText>
          <Button title="Save" onPress={save} loading={busy} disabled={!changed || username.length < 3} />
        </ScrollView>
      </KeyboardAvoidingView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.four,
    gap: Spacing.three,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
});
