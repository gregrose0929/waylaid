import { useState } from 'react';
import { KeyboardAvoidingView, Platform, Pressable, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, Card, ErrorText, Field } from '@/components/ui';
import { Spacing } from '@/constants/theme';
import { api } from '@/lib/api';
import { getHere, placeName } from '@/lib/location';
import { useApp } from '@/providers/app-state';

/** Two steps: pick a username, then plant your mailbox. */
export default function OnboardingScreen() {
  const { me, refreshMe, signOut } = useApp();
  const [username, setUsername] = useState('');
  const [name, setName] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function run(task: () => Promise<void>) {
    setBusy(true);
    setError(null);
    try {
      await task();
      await refreshMe();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  }

  const saveProfile = () => run(() => api.saveProfile(username, name));

  const plantMailbox = () =>
    run(async () => {
      const here = await getHere({ precise: true });
      const label = (await placeName(here.lat, here.lng)) ?? '';
      await api.setHome(here.lat, here.lng, label);
    });

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : undefined}
          style={styles.container}>
          {!me ? (
            <>
              <View style={styles.hero}>
                <ThemedText style={styles.emoji}>✍️</ThemedText>
                <ThemedText type="subtitle">Who’s writing?</ThemedText>
                <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
                  Friends will find you by your username.
                </ThemedText>
              </View>
              <View style={{ gap: Spacing.three }}>
                <Field
                  label="Username"
                  placeholder="e.g. pigeon_fan"
                  autoCapitalize="none"
                  autoCorrect={false}
                  value={username}
                  onChangeText={(t) => setUsername(t.toLowerCase().replace(/[^a-z0-9_]/g, ''))}
                  maxLength={20}
                />
                <Field
                  label="Name (optional)"
                  placeholder="What should letters be signed as?"
                  value={name}
                  onChangeText={setName}
                  maxLength={40}
                />
                <ErrorText>{error}</ErrorText>
                <Button title="Continue" onPress={saveProfile} loading={busy} disabled={username.length < 3} />
              </View>
            </>
          ) : (
            <>
              <View style={styles.hero}>
                <ThemedText style={styles.emoji}>📫</ThemedText>
                <ThemedText type="subtitle">Plant your mailbox</ThemedText>
                <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
                  Letters travel between mailboxes, so the distance to yours decides how long they take.
                </ThemedText>
              </View>
              <Card>
                <ThemedText type="small" themeColor="textSecondary">
                  📍 Your mailbox goes exactly where you’re standing, so plant it at home. People you write
                  to can see where it is; you can switch to showing just your general area in Me → Mailbox, and
                  move your mailbox any time.
                </ThemedText>
              </Card>
              <View style={{ gap: Spacing.three }}>
                <ErrorText>{error}</ErrorText>
                <Button title="Use my current location" onPress={plantMailbox} loading={busy} />
              </View>
            </>
          )}
          <Pressable onPress={signOut}>
            <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
              Sign out
            </ThemedText>
          </Pressable>
        </KeyboardAvoidingView>
      </SafeAreaView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: Spacing.four,
    justifyContent: 'center',
    gap: Spacing.four,
    width: '100%',
    maxWidth: 480,
    alignSelf: 'center',
  },
  hero: {
    alignItems: 'center',
    gap: Spacing.two,
  },
  emoji: {
    fontSize: 56,
    lineHeight: 68,
  },
});
