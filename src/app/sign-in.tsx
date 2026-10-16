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
 * Reset by emailed code: request a 6-digit code, then enter it with a new password.
 * (The Supabase "Reset Password" email template must include {{ .Token }}.)
 */
function ResetPassword({ initialEmail, onDone }: { initialEmail: string; onDone: () => void }) {
  const [step, setStep] = useState<'email' | 'code'>('email');
  const [email, setEmail] = useState(initialEmail);
  const [code, setCode] = useState('');
  const [password, setPassword] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function sendCode() {
    setBusy(true);
    setError(null);
    const { error: err } = await supabase.auth.resetPasswordForEmail(email.trim());
    setBusy(false);
    if (err) setError(err.message);
    else setStep('code');
  }

  async function reset() {
    setBusy(true);
    setError(null);
    const { error: verifyError } = await supabase.auth.verifyOtp({
      email: email.trim(),
      token: code.trim(),
      type: 'recovery',
    });
    if (verifyError) {
      setBusy(false);
      setError(verifyError.message.includes('expired') ? 'That code has expired. Send a new one.' : verifyError.message);
      return;
    }
    // The code signed you in; now set the new password. The app moves on to your mailbox.
    const { error: updateError } = await supabase.auth.updateUser({ password });
    setBusy(false);
    if (updateError) setError(updateError.message);
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.container}>
          <View style={styles.hero}>
            <ThemedText style={styles.logo}>🔑</ThemedText>
            <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
              Reset your password
            </ThemedText>
            <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
              {step === 'email'
                ? 'We’ll email you a 6-digit code. (By email, not by pigeon.)'
                : `Enter the code we sent to ${email.trim()} and choose a new password.`}
            </ThemedText>
          </View>
          <View style={{ gap: Spacing.three }}>
            {step === 'email' ? (
              <Field
                placeholder="Email"
                autoCapitalize="none"
                autoComplete="email"
                keyboardType="email-address"
                value={email}
                onChangeText={setEmail}
              />
            ) : (
              <>
                <Field
                  placeholder="6-digit code"
                  keyboardType="number-pad"
                  autoComplete="one-time-code"
                  maxLength={6}
                  value={code}
                  onChangeText={(t) => setCode(t.replace(/[^0-9]/g, ''))}
                />
                <Field
                  placeholder="New password (6+ characters)"
                  secureTextEntry
                  autoComplete="new-password"
                  value={password}
                  onChangeText={setPassword}
                />
              </>
            )}
            <ErrorText>{error}</ErrorText>
            {step === 'email' ? (
              <Button title="Email me a code" onPress={sendCode} loading={busy} disabled={!email.includes('@')} />
            ) : (
              <>
                <Button
                  title="Set new password"
                  onPress={reset}
                  loading={busy}
                  disabled={code.length < 6 || password.length < 6}
                />
                <Pressable onPress={sendCode}>
                  <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
                    Didn’t get it? Send another code
                  </ThemedText>
                </Pressable>
              </>
            )}
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
