import * as Notifications from 'expo-notifications';
import { router, useFocusEffect } from 'expo-router';
import { useCallback, useState } from 'react';
import { Alert, Linking, Platform, ScrollView, StyleSheet, Switch, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { useToast } from '@/components/toast';
import { Button, Card, ErrorText, Segmented } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api } from '@/lib/api';
import { requestFoundAlertPermission, stopFoundAlerts } from '@/lib/found-alerts';
import { getHere, placeName } from '@/lib/location';
import { registerForPush, unregisterPush } from '@/lib/notifications';
import { supabase } from '@/lib/supabase';
import { useApp } from '@/providers/app-state';

export default function SettingsScreen() {
  const { me, refreshMe, settings, updateSettings, signOut } = useApp();
  const theme = useTheme();
  const toast = useToast();
  const [moving, setMoving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [pushStatus, setPushStatus] = useState<Notifications.NotificationPermissionsStatus | null>(null);

  useFocusEffect(
    useCallback(() => {
      Notifications.getPermissionsAsync()
        .then(setPushStatus)
        .catch(() => {});
    }, []),
  );

  if (!me) return null;

  async function moveMailbox() {
    setMoving(true);
    setError(null);
    try {
      const here = await getHere({ precise: true });
      await api.setHome(here.lat, here.lng, (await placeName(here.lat, here.lng)) ?? '');
      await refreshMe();
      toast('📫 Mailbox moved here');
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setMoving(false);
    }
  }

  async function setPrecise(share: boolean) {
    try {
      await api.setSharePreciseHome(share);
      await refreshMe();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }

  async function turnOnPush() {
    if (pushStatus && !pushStatus.granted && !pushStatus.canAskAgain) {
      Linking.openSettings();
      return;
    }
    await registerForPush().catch(() => {});
    setPushStatus(await Notifications.getPermissionsAsync());
  }

  async function setFoundAlerts(on: boolean) {
    if (!on) {
      updateSettings({ foundAlerts: false });
      stopFoundAlerts().catch(() => {});
      return;
    }
    const ok = await requestFoundAlertPermission();
    if (ok) {
      updateSettings({ foundAlerts: true });
      toast('We’ll let you know when you’re near a lost letter');
    } else {
      Alert.alert(
        'Location “all the time” needed',
        'To notice lost letters while Waylaid is in the background, allow location access “All the time” in your phone’s settings.',
        [
          { text: 'Not now', style: 'cancel' },
          { text: 'Open settings', onPress: () => Linking.openSettings() },
        ],
      );
    }
  }

  async function doSignOut() {
    await unregisterPush();
    await stopFoundAlerts().catch(() => {});
    await signOut();
  }

  function confirmDeleteAccount() {
    const run = async () => {
      try {
        await unregisterPush();
        await api.deleteAccount();
        // The account is gone server-side, so just forget the session on this device.
        await supabase.auth.signOut({ scope: 'local' });
      } catch (e) {
        setError(e instanceof Error ? e.message : String(e));
      }
    };
    if (Platform.OS === 'web') return run();
    Alert.alert(
      'Delete your account?',
      'Your profile, mailbox, friends and letters are erased for good. Letters you were carrying for others keep travelling. This can’t be undone.',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Delete forever', style: 'destructive', onPress: run },
      ],
    );
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.content}>
        <Section title="ACCOUNT">
          <Row label="Name and username" detail={`@${me.username}`} />
          <Button title="Edit profile" variant="secondary" onPress={() => router.push('/edit-profile')} />
        </Section>

        <Section title="📫 MAILBOX">
          <Row label={me.home_label || 'Somewhere on Earth'} detail="Letters to you travel here" />
          <Button title="Move mailbox to where I am" variant="secondary" onPress={moveMailbox} loading={moving} />
          <Toggle
            label="Show friends my exact mailbox"
            detail={
              me.share_precise_home
                ? 'Friends see exactly where your mailbox is.'
                : 'Friends only see your general area (about 10 km).'
            }
            value={me.share_precise_home}
            onChange={setPrecise}
            tint={theme.accent}
          />
          <ErrorText>{error}</ErrorText>
        </Section>

        <Section title="MAILBOX VIEW">
          <Segmented
            options={[
              { value: 'mail', label: '✉️ Mail' },
              { value: 'conversations', label: '💬 Conversations' },
            ]}
            value={settings.mailView}
            onChange={(mailView) => updateSettings({ mailView })}
          />
          <ThemedText type="small" themeColor="textSecondary">
            {settings.mailView === 'mail'
              ? 'An inbox and a sent folder, like email.'
              : 'Letters grouped by person, like a (very slow) chat.'}
          </ThemedText>
        </Section>

        <Section title="🔔 NOTIFICATIONS">
          {pushStatus?.granted ? (
            <Row label="Letter arrivals" detail="On: you’ll know the moment a letter lands" />
          ) : (
            <>
              <Row label="Letter arrivals" detail="Off: you’ll only see new letters when you open the app" />
              <Button title="Turn on" variant="secondary" onPress={turnOnPush} />
            </>
          )}
          <Toggle
            label="Lost letters near me"
            detail="Get a heads-up when you walk near a lost letter, even with the app closed. Uses background location."
            value={settings.foundAlerts}
            onChange={setFoundAlerts}
            tint={theme.accent}
          />
          <ThemedText type="small" themeColor="textSecondary">
            You’re never notified when your own letters are delivered or lost. Like real mail, you just wait.
          </ThemedText>
        </Section>

        <Section title="UNITS">
          <Segmented
            options={[
              { value: 'mi', label: 'Miles' },
              { value: 'km', label: 'Kilometers' },
            ]}
            value={settings.units}
            onChange={(units) => updateSettings({ units })}
          />
        </Section>

        <View style={{ gap: Spacing.one }}>
          <Button title="Sign out" variant="ghost" onPress={doSignOut} />
          <Button title="Delete account" variant="ghost" onPress={confirmDeleteAccount} />
        </View>
      </ScrollView>
    </ThemedView>
  );
}

function Section({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <View style={{ gap: Spacing.two }}>
      <ThemedText type="smallBold" themeColor="textSecondary">
        {title}
      </ThemedText>
      <Card style={{ gap: Spacing.three }}>{children}</Card>
    </View>
  );
}

function Row({ label, detail }: { label: string; detail?: string }) {
  return (
    <View>
      <ThemedText>{label}</ThemedText>
      {detail && (
        <ThemedText type="small" themeColor="textSecondary">
          {detail}
        </ThemedText>
      )}
    </View>
  );
}

function Toggle({
  label,
  detail,
  value,
  onChange,
  tint,
}: {
  label: string;
  detail: string;
  value: boolean;
  onChange: (v: boolean) => void;
  tint: string;
}) {
  return (
    <View style={styles.toggle}>
      <View style={{ flex: 1 }}>
        <ThemedText>{label}</ThemedText>
        <ThemedText type="small" themeColor="textSecondary">
          {detail}
        </ThemedText>
      </View>
      <Switch value={value} onValueChange={onChange} trackColor={{ true: tint }} />
    </View>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.four,
    paddingBottom: Spacing.six,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  toggle: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
