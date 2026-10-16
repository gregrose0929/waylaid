import { DarkTheme, DefaultTheme, Stack, ThemeProvider } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect, useState } from 'react';
import { StyleSheet, useColorScheme, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button } from '@/components/ui';
import { Colors, Spacing } from '@/constants/theme';
import { isConfigured } from '@/lib/supabase';
import { AppStateProvider, useApp } from '@/providers/app-state';

SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const scheme = useColorScheme();
  const dark = scheme === 'dark';
  const colors = Colors[dark ? 'dark' : 'light'];
  const base = dark ? DarkTheme : DefaultTheme;
  const navTheme = {
    ...base,
    colors: {
      ...base.colors,
      primary: colors.accent,
      background: colors.background,
      card: colors.background,
      text: colors.text,
      border: colors.border,
    },
  };

  return (
    <ThemeProvider value={navTheme}>
      <AppStateProvider>
        <RootStack />
      </AppStateProvider>
    </ThemeProvider>
  );
}

function RootStack() {
  const { session, me, loadError } = useApp();
  const loading = isConfigured && (session === undefined || (session && me === undefined));
  const signedIn = !!session;
  const ready = signedIn && !!me?.home;

  useEffect(() => {
    if (!loading || loadError) SplashScreen.hideAsync();
  }, [loading, loadError]);

  if (loading) return loadError ? <Offline /> : null;

  return (
    <Stack screenOptions={{ headerBackButtonDisplayMode: 'minimal' }}>
      <Stack.Protected guard={!isConfigured}>
        <Stack.Screen name="setup" options={{ headerShown: false }} />
      </Stack.Protected>

      <Stack.Protected guard={isConfigured && !signedIn}>
        <Stack.Screen name="sign-in" options={{ headerShown: false }} />
      </Stack.Protected>

      <Stack.Protected guard={signedIn && !ready}>
        <Stack.Screen name="onboarding" options={{ headerShown: false }} />
      </Stack.Protected>

      <Stack.Protected guard={ready}>
        <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
        <Stack.Screen name="compose" options={{ presentation: 'modal', title: 'New letter' }} />
        <Stack.Screen name="letter/[id]" options={{ title: '' }} />
        <Stack.Screen name="found/[legId]" options={{ title: 'Found letter' }} />
        <Stack.Screen name="carriers" options={{ title: 'Carriers' }} />
        <Stack.Screen name="contacts" options={{ title: 'Contacts' }} />
        <Stack.Screen name="contact/[id]" options={{ title: 'Contact', presentation: 'modal' }} />
        <Stack.Screen name="archived" options={{ title: 'Archived' }} />
      </Stack.Protected>
    </Stack>
  );
}

/** Shown when the profile can't be loaded at launch, instead of mistaking it for a new account. */
function Offline() {
  const { refreshMe, loadError } = useApp();
  const [busy, setBusy] = useState(false);
  return (
    <ThemedView style={styles.offline}>
      <View style={{ alignItems: 'center', gap: Spacing.two }}>
        <ThemedText style={{ fontSize: 56, lineHeight: 68 }}>📡</ThemedText>
        <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
          Can’t reach the post office
        </ThemedText>
        <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
          Check your connection and try again.
        </ThemedText>
        <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
          {loadError}
        </ThemedText>
      </View>
      <Button
        title="Try again"
        loading={busy}
        onPress={async () => {
          setBusy(true);
          await refreshMe();
          setBusy(false);
        }}
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  offline: {
    flex: 1,
    justifyContent: 'center',
    padding: Spacing.four,
    gap: Spacing.four,
  },
});
