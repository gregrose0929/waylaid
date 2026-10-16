import * as Linking from 'expo-linking';
import { useState } from 'react';
import { KeyboardAvoidingView, Platform, Pressable, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, ErrorText, Field } from '@/components/ui';
import { Fonts, Spacing } from '@/constants/theme';
import { supabase } from '@/lib/supabase';

export default function SignInScreen() {
  const [mode, setMode] = useState<'sign-in' | 'sign-up' | 'reset'>('sign-in');
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

  if (mode === 'reset') {
    return <ResetPassword initialEmail={email} onDone={() => setMode('sign-in')} />;
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView
          behavior={Platform.OS === 'ios' ? 'padding' : undefined}
          style={styles.container}>
          <View style={styles.hero}>
            <ThemedText style={styles.logo}>🕊️</ThemedText>
            <ThemedText style={styles.title}>Waylaid</ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              Send it your own way.{'\n'}Pick a carrier. Hope it makes it.
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
            {mode === 'sign-in' && (
              <Pressable onPress={() => setMode('reset')}>
                <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
                  Forgot your password?
                </ThemedText>
              </Pressable>
            )}
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

/**
 * Forgot password: Supabase emails a link that opens the app at /reset-password,
 * where you choose a new one. (waylaid://** must be in Supabase's allowed redirect URLs.)
 */
function ResetPassword({ initialEmail, onDone }: { initialEmail: string; onDone: () => void }) {
  const [email, setEmail] = useState(initialEmail);
  const [sent, setSent] = useState(false);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function send() {
    setBusy(true);
    setError(null);
    const { error: err } = await supabase.auth.resetPasswordForEmail(email.trim(), {
      redirectTo: Linking.createURL('reset-password'),
    });
    setBusy(false);
    if (err) setError(err.message);
    else setSent(true);
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.container}>
          <View style={styles.hero}>
            <ThemedText style={styles.logo}>{sent ? '📬' : '🔑'}</ThemedText>
            <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
              {sent ? 'Check your email' : 'Reset your password'}
            </ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              {sent
                ? `We sent a link to ${email.trim()}. Open that email on this phone and tap the link; Waylaid will open so you can choose a new password. (It came by email, not by pigeon.)`
                : 'We’ll email you a link to choose a new password.'}
            </ThemedText>
          </View>
          <View style={{ gap: Spacing.three }}>
            {!sent && (
              <Field
                placeholder="Email"
                autoCapitalize="none"
                autoComplete="email"
                keyboardType="email-address"
                value={email}
                onChangeText={setEmail}
              />
            )}
            <ErrorText>{error}</ErrorText>
            <Button
              title={sent ? 'Send it again' : 'Email me a link'}
              variant={sent ? 'secondary' : 'primary'}
              onPress={send}
              loading={busy}
              disabled={!email.includes('@')}
            />
            <Pressable onPress={onDone}>
              <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
                Back to sign in
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
