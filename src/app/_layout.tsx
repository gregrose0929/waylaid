import { DarkTheme, DefaultTheme, Stack, ThemeProvider } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect, useState } from 'react';
import { AppState, StyleSheet, useColorScheme, View } from 'react-native';
import { GestureHandlerRootView } from 'react-native-gesture-handler';

import { AchievementCelebration } from '@/components/achievement-celebration';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ToastProvider } from '@/components/toast';
import { Button } from '@/components/ui';
import { UpdateBanner } from '@/components/update-banner';
import { Colors, Spacing } from '@/constants/theme';
import { installCrashReporting, reportError } from '@/lib/crash-reporting';
// Importing found-alerts also registers its background geofence task at startup.
import { stopFoundAlerts, syncFoundAlerts } from '@/lib/found-alerts';
import { getHere } from '@/lib/location';
import { registerForPush, useNotificationRouting } from '@/lib/notifications';
import { setSoundsEnabled } from '@/lib/sounds';
import { isConfigured } from '@/lib/supabase';
import { AppStateProvider, useApp } from '@/providers/app-state';

SplashScreen.preventAutoHideAsync();
installCrashReporting();

/** Shown instead of a blank screen if any screen crashes while rendering. */
export function ErrorBoundary({ error, retry }: { error: Error; retry: () => Promise<void> }) {
  useEffect(() => {
    reportError(error, { source: 'render' });
  }, [error]);
  return (
    <ThemedView style={styles.offline}>
      <View style={{ alignItems: 'center', gap: Spacing.two }}>
        <ThemedText style={{ fontSize: 56, lineHeight: 68 }}>🪶</ThemedText>
        <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
          A carrier tripped
        </ThemedText>
        <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
          Something went wrong on this screen. It’s been reported so it can be fixed.
        </ThemedText>
      </View>
      <Button title="Try again" onPress={() => retry()} />
    </ThemedView>
  );
}

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
    <GestureHandlerRootView style={{ flex: 1 }}>
      <ThemeProvider value={navTheme}>
        <AppStateProvider>
          <ToastProvider>
            <UpdateBanner />
            <RootStack />
          </ToastProvider>
        </AppStateProvider>
      </ThemeProvider>
    </GestureHandlerRootView>
  );
}

/** Once signed in: register for pushes, and keep lost-letter geofences fresh on every open. */
function useBackgroundServices(ready: boolean, arrivalAlerts: boolean, foundAlerts: boolean) {
  useEffect(() => {
    if (ready && arrivalAlerts) registerForPush().catch(() => {});
  }, [ready, arrivalAlerts]);

  useEffect(() => {
    if (!ready) return;
    if (!foundAlerts) {
      stopFoundAlerts().catch(() => {});
      return;
    }
    const sync = () =>
      getHere()
        .then(syncFoundAlerts)
        .catch(() => {});
    sync();
    const sub = AppState.addEventListener('change', (s) => s === 'active' && sync());
    return () => sub.remove();
  }, [ready, foundAlerts]);
}

function RootStack() {
  const { session, me, loadError, settings } = useApp();
  const loading = isConfigured && (session === undefined || (session && me === undefined));
  const signedIn = !!session;
  const ready = signedIn && !!me?.home;
  useBackgroundServices(ready, settings.arrivalAlerts, settings.foundAlerts);
  useEffect(() => setSoundsEnabled(settings.sounds), [settings.sounds]);
  useNotificationRouting(ready);

  useEffect(() => {
    if (!loading || loadError) SplashScreen.hideAsync();
  }, [loading, loadError]);

  if (loading) return loadError ? <Offline /> : null;

  return (
    <>
      {ready && <AchievementCelebration />}
      <Stack screenOptions={{ headerBackButtonDisplayMode: 'minimal' }}>
        {/* Reached from the password-reset email link, signed in or not. */}
        <Stack.Screen name="reset-password" options={{ headerShown: false }} />
        <Stack.Screen name="auth-callback" options={{ headerShown: false }} />

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
          <Stack.Screen name="conversation/[id]" options={{ title: '' }} />
          <Stack.Screen name="carriers" options={{ title: 'Carriers' }} />
          <Stack.Screen name="carrier/[id]" options={{ title: '' }} />
          <Stack.Screen name="achievements" options={{ title: 'Achievements' }} />
          <Stack.Screen name="madlib" options={{ title: 'Mad Lib', presentation: 'modal' }} />
          <Stack.Screen name="chain/[id]" options={{ title: '' }} />
          <Stack.Screen name="friends" options={{ title: 'Friends' }} />
          <Stack.Screen name="person/[id]" options={{ title: '' }} />
          <Stack.Screen name="archived" options={{ title: 'Archived' }} />
          <Stack.Screen name="settings" options={{ title: 'Settings' }} />
          <Stack.Screen name="edit-profile" options={{ title: 'Edit profile', presentation: 'modal' }} />
        </Stack.Protected>
      </Stack>
    </>
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
