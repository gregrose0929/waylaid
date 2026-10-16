import * as Linking from 'expo-linking';
import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, ErrorText, Field } from '@/components/ui';
import { Spacing } from '@/constants/theme';
import { supabase } from '@/lib/supabase';

/** Tokens Supabase puts after the # in a password-reset link. */
function recoveryTokens(url: string | null) {
  if (!url) return null;
  const fragment = url.includes('#') ? url.slice(url.indexOf('#') + 1) : (url.split('?')[1] ?? '');
  const params = new URLSearchParams(fragment);
  const access_token = params.get('access_token');
  const refresh_token = params.get('refresh_token');
  if (!access_token || !refresh_token) return null;
  return { access_token, refresh_token, error: params.get('error_description') };
}

/**
 * Where the "Reset your password" email link lands (waylaid://reset-password#access_token=…).
 * The link signs you in for this one purpose; here you choose the new password.
 */
export default function ResetPasswordScreen() {
  const url = Linking.useURL();
  const tokens = recoveryTokens(url);
  const [signedIn, setSignedIn] = useState<{ url: string; ok: boolean } | null>(null);
  const [password, setPassword] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const accessToken = tokens?.access_token;
  const refreshToken = tokens?.refresh_token;
  useEffect(() => {
    if (!url || !accessToken || !refreshToken) return;
    supabase.auth
      .setSession({ access_token: accessToken, refresh_token: refreshToken })
      .then(({ error: err }) => setSignedIn({ url, ok: !err }));
  }, [url, accessToken, refreshToken]);

  const state: 'checking' | 'ready' | 'invalid' = !url
    ? 'checking'
    : !tokens
      ? 'invalid'
      : signedIn?.url !== url
        ? 'checking'
        : signedIn.ok
          ? 'ready'
          : 'invalid';

  async function save() {
    setBusy(true);
    setError(null);
    const { error: err } = await supabase.auth.updateUser({ password });
    setBusy(false);
    if (err) setError(err.message);
    else router.replace('/');
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.container}>
          <View style={styles.hero}>
            <ThemedText style={styles.logo}>🔑</ThemedText>
            <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
              {state === 'invalid' ? 'That link didn’t work' : 'Choose a new password'}
            </ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              {state === 'invalid'
                ? 'Reset links expire after an hour and only work once. Request a new one from the sign-in screen.'
                : state === 'checking'
                  ? 'Checking your link…'
                  : 'Almost done. Pick something you’ll remember.'}
            </ThemedText>
          </View>
          {state === 'ready' && (
            <View style={{ gap: Spacing.three }}>
              <Field
                placeholder="New password (6+ characters)"
                secureTextEntry
                autoComplete="new-password"
                value={password}
                onChangeText={setPassword}
                onSubmitEditing={save}
              />
              <ErrorText>{error}</ErrorText>
              <Button title="Save new password" onPress={save} loading={busy} disabled={password.length < 6} />
            </View>
          )}
          {state === 'invalid' && <Button title="Back to sign in" onPress={() => router.replace('/')} />}
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
    gap: Spacing.five,
    width: '100%',
    maxWidth: 480,
    alignSelf: 'center',
  },
  hero: {
    alignItems: 'center',
    gap: Spacing.two,
  },
  logo: {
    fontSize: 64,
    lineHeight: 76,
  },
});
