import { useState } from 'react';
import { KeyboardAvoidingView, Platform, Pressable, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, ErrorText, Field } from '@/components/ui';
import { Fonts, Spacing } from '@/constants/theme';
import { supabase } from '@/lib/supabase';

export default function SignInScreen() {
  const [mode, setMode] = useState<'sign-in' | 'sign-up'>('sign-in');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [notice, setNotice] = useState<string | null>(null);

  async function submit() {
    setBusy(true);
    setError(null);
    setNotice(null);
    const creds = { email: email.trim(), password };
    const { data, error: err } =
      mode === 'sign-in'
        ? await supabase.auth.signInWithPassword(creds)
        : await supabase.auth.signUp(creds);
    setBusy(false);
    if (err) {
      setError(err.message);
    } else if (mode === 'sign-up' && !data.session) {
      setNotice('Check your email to confirm your account, then sign in.');
      setMode('sign-in');
    }
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : undefined}
          style={styles.container}>
          <View style={styles.hero}>
            <ThemedText style={styles.logo}>🕊️</ThemedText>
            <ThemedText style={styles.title}>Slowpost</ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              Letters that take their time.{'\n'}Pick a carrier. Hope it makes it.
            </ThemedText>
          </View>

          <View style={{ gap: Spacing.three }}>
            <Field
              placeholder="Email"
              autoCapitalize="none"
              autoComplete="email"
              keyboardType="email-address"
              value={email}
              onChangeText={setEmail}
            />
            <Field
              placeholder="Password"
              secureTextEntry
              autoComplete={mode === 'sign-in' ? 'current-password' : 'new-password'}
              value={password}
              onChangeText={setPassword}
              onSubmitEditing={submit}
            />
            <ErrorText>{error}</ErrorText>
            {notice && (
              <ThemedText type="small" themeColor="success">
                {notice}
              </ThemedText>
            )}
            <Button
              title={mode === 'sign-in' ? 'Sign in' : 'Create account'}
              onPress={submit}
              loading={busy}
              disabled={!email || password.length < 6}
            />
            <Pressable onPress={() => setMode(mode === 'sign-in' ? 'sign-up' : 'sign-in')}>
              <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
                {mode === 'sign-in' ? 'New here? Create an account' : 'Have an account? Sign in'}
              </ThemedText>
            </Pressable>
          </View>
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
  title: {
    fontFamily: Fonts.serif,
    fontSize: 40,
    lineHeight: 48,
    fontWeight: 700,
  },
});
