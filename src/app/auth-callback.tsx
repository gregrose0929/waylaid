import * as Linking from 'expo-linking';
import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button } from '@/components/ui';
import { Spacing } from '@/constants/theme';
import { linkTokens } from '@/lib/auth-links';
import { supabase } from '@/lib/supabase';

/**
 * Where the "Confirm your email" link lands (waylaid://auth-callback#access_token=…).
 * Confirming also signs you in, then the app carries on to choosing a username.
 */
export default function AuthCallbackScreen() {
  const url = Linking.useURL();
  const tokens = linkTokens(url);
  const [failed, setFailed] = useState<string | null>(null);

  const accessToken = tokens?.access_token;
  const refreshToken = tokens?.refresh_token;
  useEffect(() => {
    if (!accessToken || !refreshToken) return;
    supabase.auth.setSession({ access_token: accessToken, refresh_token: refreshToken }).then(({ error }) => {
      if (error) setFailed(url);
      else router.replace('/');
    });
  }, [url, accessToken, refreshToken]);

  const broken = (!!url && !tokens) || (failed !== null && failed === url);

  return (
    <ThemedView style={styles.container}>
      <View style={{ alignItems: 'center', gap: Spacing.two }}>
        <ThemedText style={{ fontSize: 64, lineHeight: 76 }}>{broken ? '🤔' : '✅'}</ThemedText>
        <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
          {broken ? 'That link didn’t work' : 'Email confirmed!'}
        </ThemedText>
        <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
          {broken
            ? 'Links expire and only work once. Sign in to get a fresh one.'
            : 'Signing you in…'}
        </ThemedText>
      </View>
      {broken && <Button title="Back to sign in" onPress={() => router.replace('/')} />}
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: Spacing.four,
    justifyContent: 'center',
    gap: Spacing.five,
  },
});
