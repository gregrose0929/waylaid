import * as Haptics from 'expo-haptics';
import { router, useLocalSearchParams } from 'expo-router';
import { useState } from 'react';
import { Alert, Platform, ScrollView, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { TransportPicker } from '@/components/transport-picker';
import { Button, Card, EmptyState, ErrorText } from '@/components/ui';
import { Fonts, MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api } from '@/lib/api';
import { displayName, formatDistance, formatWhen } from '@/lib/format';
import { getHere, type Here } from '@/lib/location';
import { useApp } from '@/providers/app-state';

export default function FoundLetterScreen() {
  const { legId } = useLocalSearchParams<{ legId: string }>();
  const { found, transport, units, refreshMail } = useApp();
  const theme = useTheme();
  const item = found.find((f) => f.leg_id === legId);

  const [mode, setMode] = useState<'view' | 'forward'>('view');
  const [here, setHere] = useState<Here | null>(null);
  const [distanceKm, setDistanceKm] = useState<number | null>(null);
  const [carrier, setCarrier] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  if (!item) return <EmptyState emoji="🤷" title="Not in your satchel" body="This letter may have moved on." />;

  const wreckedBy = transport(item.transport_id);
  const canAct = !item.forwarded && item.status !== 'delivered';

  async function breakSeal() {
    setBusy(true);
    setError(null);
    try {
      await api.openFound(legId);
      await refreshMail();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  }

  function confirmPeek() {
    const message = 'Once the seal is broken it stays broken. The sender and recipient will both know someone read it.';
    if (Platform.OS === 'web') {
      breakSeal();
      return;
    }
    Alert.alert('Break the seal?', message, [
      { text: 'Leave it sealed', style: 'cancel' },
      { text: 'Peek inside', style: 'destructive', onPress: breakSeal },
    ]);
  }

  async function startForward() {
    setMode('forward');
    setError(null);
    try {
      const pos = await getHere();
      setHere(pos);
      setDistanceKm(await api.quoteDistance(item!.to.id, pos));
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }

  async function forward() {
    if (!here || !carrier) return;
    setBusy(true);
    setError(null);
    try {
      await api.forwardFound(legId, carrier, here.lat, here.lng);
      Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
      await refreshMail();
      router.back();
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setBusy(false);
    }
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.content}>
        {/* The envelope */}
        <View style={[styles.envelope, { backgroundColor: theme.backgroundElement, borderColor: theme.border }]}>
          <View style={styles.between}>
            <View style={{ gap: 2 }}>
              <ThemedText type="small" themeColor="textSecondary">
                FROM
              </ThemedText>
              <ThemedText style={styles.address}>{displayName(item.from)}</ThemedText>
            </View>
            <ThemedText style={{ fontSize: 30, lineHeight: 38 }}>{wreckedBy?.emoji ?? '📜'}</ThemedText>
          </View>
          <View style={{ gap: 2, alignSelf: 'center', alignItems: 'center' }}>
            <ThemedText type="small" themeColor="textSecondary">
              TO
            </ThemedText>
            <ThemedText style={[styles.address, { fontSize: 24, lineHeight: 32 }]}>{displayName(item.to)}</ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              @{item.to.username}
            </ThemedText>
          </View>
          <View style={[styles.seal, { backgroundColor: item.opened_at ? theme.backgroundSelected : theme.accent }]}>
            <ThemedText style={{ color: theme.accentText, fontWeight: 700 }}>
              {item.opened_at ? 'opened' : 'sealed'}
            </ThemedText>
          </View>
        </View>

        <Card>
          <ThemedText type="small" themeColor="textSecondary">
            You found this {formatWhen(item.found_at)} where a {wreckedBy?.name ?? 'carrier'} went down. Cause:{' '}
            {item.fail_reason.toLowerCase()}.
          </ThemedText>
        </Card>

        {item.body && (
          <View style={[styles.paper, { backgroundColor: theme.backgroundElement, borderColor: theme.border }]}>
            <ThemedText style={styles.letter}>{item.body}</ThemedText>
          </View>
        )}

        <ErrorText>{error}</ErrorText>

        {!canAct ? (
          <Card>
            <ThemedText>
              {item.status === 'delivered'
                ? '✅ It made it! You helped deliver this letter.'
                : '📨 You sent it on its way. Fingers crossed.'}
            </ThemedText>
          </Card>
        ) : mode === 'view' ? (
          <View style={{ gap: Spacing.two }}>
            <Button title="Send it on" onPress={startForward} />
            {!item.opened_at && <Button title="Peek inside" variant="secondary" onPress={confirmPeek} loading={busy} />}
            <Button title="Keep it" variant="ghost" onPress={() => router.back()} />
            <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
              Kept letters stay in your satchel. You can still send them on later.
            </ThemedText>
          </View>
        ) : (
          <View style={{ gap: Spacing.three }}>
            <ThemedText type="smallBold" themeColor="textSecondary">
              {distanceKm == null
                ? 'FINDING YOUR LOCATION…'
                : `${formatDistance(distanceKm, units).toUpperCase()} TO ${displayName(item.to).toUpperCase()}. CHOOSE A CARRIER`}
            </ThemedText>
            <TransportPicker distanceKm={distanceKm} value={carrier} onChange={setCarrier} />
            <Button
              title="Send it on"
              onPress={forward}
              loading={busy}
              disabled={!carrier || distanceKm == null}
            />
            <Button title="Cancel" variant="ghost" onPress={() => setMode('view')} />
          </View>
        )}
      </ScrollView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.three,
    paddingBottom: Spacing.six,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  envelope: {
    borderRadius: Radius.medium,
    borderWidth: StyleSheet.hairlineWidth,
    padding: Spacing.four,
    gap: Spacing.four,
    minHeight: 220,
  },
  between: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
  },
  address: {
    fontFamily: Fonts.serif,
    fontSize: 18,
    lineHeight: 24,
    fontWeight: 700,
  },
  seal: {
    alignSelf: 'center',
    paddingHorizontal: Spacing.three,
    paddingVertical: Spacing.one,
    borderRadius: 999,
  },
  paper: {
    borderRadius: Radius.medium,
    borderWidth: StyleSheet.hairlineWidth,
    padding: Spacing.four,
  },
  letter: {
    fontFamily: Fonts.serif,
    fontSize: 18,
    lineHeight: 28,
  },
});
