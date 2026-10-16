import { router, useFocusEffect } from 'expo-router';
import { useCallback, useState } from 'react';
import { Alert, Platform, ScrollView, StyleSheet, Switch, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, Card, ErrorText, Segmented } from '@/components/ui';
import { BottomTabInset, Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api } from '@/lib/api';
import { supabase } from '@/lib/supabase';
import { displayName } from '@/lib/format';
import { getHere, placeName } from '@/lib/location';
import { useApp } from '@/providers/app-state';

export default function MeScreen() {
  const { me, refreshMe, units, setUnits, signOut, contacts } = useApp();
  const theme = useTheme();
  const [moving, setMoving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useFocusEffect(
    useCallback(() => {
      refreshMe().catch(() => {});
    }, [refreshMe]),
  );

  if (!me) return null;

  async function moveMailbox() {
    setMoving(true);
    setError(null);
    try {
      const here = await getHere({ precise: true });
      await api.setHome(here.lat, here.lng, (await placeName(here.lat, here.lng)) ?? '');
      await refreshMe();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setMoving(false);
    }
  }

  async function setPrecise(share: boolean) {
    setError(null);
    try {
      await api.setSharePreciseHome(share);
      await refreshMe();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }

  function confirmDeleteAccount() {
    const run = () =>
      api
        .deleteAccount()
        // The account is gone server-side, so just forget the session on this device.
        .then(() => supabase.auth.signOut({ scope: 'local' }))
        .catch((e) => setError(e instanceof Error ? e.message : String(e)));
    if (Platform.OS === 'web') return run();
    Alert.alert(
      'Delete your account?',
      'Your profile, mailbox and letters are erased for good. Letters you were carrying for others keep travelling. This can’t be undone.',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Delete forever', style: 'destructive', onPress: run },
      ],
    );
  }

  const stats = [
    { label: 'Sent', value: me.stats.sent, emoji: '📤' },
    { label: 'Received', value: me.stats.received, emoji: '📥' },
    { label: 'Lost', value: me.stats.lost, emoji: '🪦' },
    { label: 'Found', value: me.stats.found, emoji: '🔍' },
  ];

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView edges={['top']} style={{ flex: 1 }}>
        <ScrollView contentContainerStyle={styles.content}>
          <View style={{ gap: 2, paddingTop: Spacing.two }}>
            <ThemedText style={styles.name}>{displayName(me)}</ThemedText>
            <ThemedText themeColor="textSecondary">@{me.username}</ThemedText>
          </View>

          <View style={styles.stats}>
            {stats.map((s) => (
              <Card key={s.label} style={styles.stat}>
                <ThemedText style={{ fontSize: 22, lineHeight: 28 }}>{s.emoji}</ThemedText>
                <ThemedText style={styles.statValue}>{s.value}</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {s.label}
                </ThemedText>
              </Card>
            ))}
          </View>

          <Card>
            <ThemedText type="smallBold" themeColor="textSecondary">
              📫 MAILBOX
            </ThemedText>
            <ThemedText>{me.home_label || 'Somewhere on Earth'}</ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              Letters to you travel here. Moving it doesn’t affect letters already on the way.
            </ThemedText>
            <Button title="Move mailbox to where I am" variant="secondary" onPress={moveMailbox} loading={moving} />
            <View style={styles.switchRow}>
              <View style={{ flex: 1 }}>
                <ThemedText>Show my exact mailbox</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {me.share_precise_home
                    ? 'People you write to see exactly where your mailbox is.'
                    : 'Others only see your general area (about 10 km).'}
                </ThemedText>
              </View>
              <Switch
                value={me.share_precise_home}
                onValueChange={setPrecise}
                trackColor={{ true: theme.accent }}
              />
            </View>
            <ErrorText>{error}</ErrorText>
          </Card>

          <Card>
            <ThemedText type="smallBold" themeColor="textSecondary">
              UNITS
            </ThemedText>
            <Segmented
              options={[
                { value: 'mi', label: 'Miles' },
                { value: 'km', label: 'Kilometers' },
              ]}
              value={units}
              onChange={setUnits}
            />
          </Card>

          <Card onPress={() => router.push('/contacts')} style={styles.link}>
            <ThemedText>📇 Contacts{contacts.length ? ` (${contacts.length})` : ''}</ThemedText>
            <ThemedText themeColor="textSecondary">›</ThemedText>
          </Card>

          <Card onPress={() => router.push('/carriers')} style={styles.link}>
            <ThemedText>🕊️ Meet the carriers</ThemedText>
            <ThemedText themeColor="textSecondary">›</ThemedText>
          </Card>

          <Button title="Sign out" variant="ghost" onPress={signOut} />
          <Button title="Delete account" variant="ghost" onPress={confirmDeleteAccount} />
        </ScrollView>
      </SafeAreaView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.three,
    paddingBottom: BottomTabInset + Spacing.four,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  name: {
    fontFamily: Fonts.serif,
    fontSize: 30,
    lineHeight: 38,
    fontWeight: 700,
  },
  stats: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  stat: {
    flex: 1,
    alignItems: 'center',
    gap: 0,
    paddingHorizontal: Spacing.one,
  },
  statValue: {
    fontSize: 22,
    lineHeight: 28,
    fontWeight: 700,
  },
  switchRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
    paddingTop: Spacing.two,
  },
  link: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
});
