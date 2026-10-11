import { DarkTheme, DefaultTheme, Stack, ThemeProvider } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect } from 'react';
import { useColorScheme } from 'react-native';

import { Colors } from '@/constants/theme';
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
  const { session, me } = useApp();
  const loading = isConfigured && (session === undefined || (session && me === undefined));
  const signedIn = !!session;
  const ready = signedIn && !!me?.home;

  useEffect(() => {
    if (!loading) SplashScreen.hideAsync();
  }, [loading]);

  if (loading) return null;

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
      </Stack.Protected>
    </Stack>
  );
}
