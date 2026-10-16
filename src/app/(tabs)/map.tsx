import * as Haptics from 'expo-haptics';
import * as Location from 'expo-location';
import { router, useFocusEffect } from 'expo-router';
import { useCallback, useMemo, useRef, useState } from 'react';
import { Alert, Linking, Platform, Pressable, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { currentLeg } from '@/components/letter-row';
import { SlowMap, type MapPin, type MapRoute } from '@/components/slow-map';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, ErrorText } from '@/components/ui';
import { BottomTabInset, Radius, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import { api, type LatLng, type Wreck } from '@/lib/api';
import { displayName, formatAgo, formatMeters } from '@/lib/format';
import { distanceMeters, greatCircle, interpolate, progress } from '@/lib/geo';
import { PICKUP_RADIUS_M } from '@/lib/found-alerts';
import { useApp } from '@/providers/app-state';

/** Re-scan for wrecks after moving this far. */
const RESCAN_AFTER_M = 500;

export default function MapScreen() {
  const { mail, me, transport, units, refreshMail, refreshMe } = useApp();
  const theme = useTheme();
  const now = useNow(5000);
  const [here, setHere] = useState<LatLng | null>(null);
  const [wrecks, setWrecks] = useState<Wreck[]>([]);
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);
  const lastScan = useRef<LatLng | null>(null);
  // Frame the camera once, after the first scan finds lost letters; never yank it around
  // while someone is panning.
  const [framed, setFramed] = useState(false);

  const scan = useCallback(async (at: LatLng) => {
    lastScan.current = at;
    try {
      const found = await api.nearbyWrecks(at[0], at[1]);
      setWrecks(found);
      if (found.length > 0) setFramed(true);
      setError(null);
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    }
  }, []);

  // Track position only while this tab is visible.
  useFocusEffect(
    useCallback(() => {
      let sub: Location.LocationSubscription | null = null;
      let cancelled = false;
      (async () => {
        const { status } = await Location.requestForegroundPermissionsAsync();
        if (status !== 'granted') {
          setError('Turn on location to find lost letters near you.');
          return;
        }
        sub = await Location.watchPositionAsync(
          { accuracy: Location.Accuracy.High, distanceInterval: 15 },
          (loc) => {
            const at: LatLng = [loc.coords.latitude, loc.coords.longitude];
            setHere(at);
            if (!lastScan.current || distanceMeters(lastScan.current, at) > RESCAN_AFTER_M) scan(at);
          },
        );
        if (cancelled) sub.remove();
      })().catch((e) => setError(String(e)));
      return () => {
        cancelled = true;
        sub?.remove();
        lastScan.current = null;
      };
    }, [scan]),
  );

  // Only your own letters in flight; incoming ones are a surprise.
  const flying = mail.filter((l) => l.role === 'sent' && l.status === 'in_transit');

  const routes: MapRoute[] = useMemo(
    () =>
      flying.map((l) => {
        const leg = currentLeg(l);
        return { id: l.id, points: greatCircle(leg.origin, leg.destination) };
      }),
    [flying],
  );

  const pins: MapPin[] = [
    ...flying.map((l) => {
      const leg = currentLeg(l);
      return {
        id: `fly-${l.id}`,
        coord: interpolate(leg.origin, leg.destination, progress(leg.departed_at, leg.arrives_at, now)),
        emoji: transport(leg.transport_id)?.emoji ?? '✉️',
        title: `To ${displayName(l.other)}`,
        subtitle: 'Tap for details',
        onPress: () => router.push({ pathname: '/letter/[id]', params: { id: l.id } }),
      };
    }),
    ...wrecks.map((w) => ({
      id: `wreck-${w.leg_id}`,
      coord: w.coords,
      emoji: '📜',
      onPress: () => setSelectedId(w.leg_id),
    })),
  ];
  if (me?.home) pins.push({ id: 'home', coord: me.home, emoji: '📫', title: 'Your mailbox' });

  const withDistance = wrecks
    .map((w) => ({ ...w, live_m: here ? distanceMeters(here, w.coords) : w.distance_m }))
    .sort((a, b) => a.live_m - b.live_m);
  const selected = withDistance.find((w) => w.leg_id === selectedId) ?? withDistance[0];
  const inReach = selected && selected.live_m <= PICKUP_RADIUS_M;

  async function pickUp() {
    if (!selected || !here) return;
    setBusy(true);
    try {
      const result = await api.pickUp(selected.leg_id, here[0], here[1]);
      Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
      setSelectedId(null);
      await Promise.all([refreshMail(), refreshMe(), scan(here)]);
      if (result.outcome === 'delivered') {
        Alert.alert('It was for you!', 'This lost letter was addressed to you. Delivered by hand.');
        router.push({ pathname: '/letter/[id]', params: { id: result.message_id } });
      } else {
        router.push({ pathname: '/found/[legId]', params: { legId: result.leg_id } });
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
      scan(here);
    } finally {
      setBusy(false);
    }
  }

  function directions(to: LatLng) {
    const [lat, lng] = to;
    const url =
      Platform.OS === 'ios'
        ? `http://maps.apple.com/?daddr=${lat},${lng}&dirflg=w`
        : `https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}&travelmode=walking`;
    Linking.openURL(url).catch(() => {});
  }

  return (
    <ThemedView style={{ flex: 1 }}>
      <SlowMap
        routes={routes}
        pins={pins}
        showsUserLocation
        fit={here ? [here, ...wrecks.slice(0, 3).map((w) => w.coords)] : []}
        fitKey={framed ? 'first-scan' : undefined}
        center={me?.home ?? null}
      />

      <SafeAreaView edges={['top']} pointerEvents="box-none" style={styles.overlay}>
        <View style={[styles.chip, { backgroundColor: theme.background }]}>
          <ThemedText type="smallBold">
            {flying.length > 0 ? `${flying.length} in the air` : 'Nothing in the air'} ·{' '}
            {wrecks.length === 0
              ? 'no lost letters out there'
              : `${wrecks.length} lost letter${wrecks.length > 1 ? 's' : ''} out there`}
          </ThemedText>
        </View>
      </SafeAreaView>

      <View style={[styles.sheet, { backgroundColor: theme.background, bottom: BottomTabInset + Spacing.three }]}>
        <ErrorText>{error}</ErrorText>
        {selected ? (
          <>
            <View style={styles.row}>
              <ThemedText style={{ fontSize: 32, lineHeight: 40 }}>{transport(selected.transport_id)?.emoji ?? '📜'}</ThemedText>
              <View style={{ flex: 1 }}>
                <ThemedText style={{ fontWeight: 700 }}>
                  A {transport(selected.transport_id)?.name ?? 'carrier'} went down
                  {selected.town ? ` near ${selected.town}` : ' here'}
                </ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {selected.fail_reason} · {formatAgo(selected.lost_at, now)}
                </ThemedText>
              </View>
              <ThemedText style={{ fontWeight: 700 }}>{formatMeters(selected.live_m, units)}</ThemedText>
            </View>
            {inReach ? (
              <Button title="Pick it up" onPress={pickUp} loading={busy} />
            ) : (
              <View style={styles.row}>
                <Button
                  title={selected.live_m < 5000 ? 'Walk there' : 'Get directions'}
                  variant="secondary"
                  onPress={() => directions(selected.coords)}
                  style={{ flex: 1 }}
                />
                <ThemedText type="small" themeColor="textSecondary" style={{ flex: 1 }}>
                  Get within {formatMeters(PICKUP_RADIUS_M, units)} to pick it up.
                </ThemedText>
              </View>
            )}
            {withDistance.length > 1 && (
              <Pressable
                onPress={() => {
                  const i = withDistance.findIndex((w) => w.leg_id === selected.leg_id);
                  setSelectedId(withDistance[(i + 1) % withDistance.length].leg_id);
                }}>
                <ThemedText type="small" style={{ color: theme.accent, textAlign: 'center' }}>
                  Next lost letter ›
                </ThemedText>
              </Pressable>
            )}
          </>
        ) : (
          <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
            When a friend’s carrier goes down, its letter ends up in a nearby town. Get close and you can pick it up.
          </ThemedText>
        )}
      </View>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  overlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    alignItems: 'center',
    paddingTop: Spacing.two,
  },
  chip: {
    paddingHorizontal: Spacing.three,
    paddingVertical: Spacing.two,
    borderRadius: 999,
    shadowColor: '#000',
    shadowOpacity: 0.15,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  sheet: {
    position: 'absolute',
    left: Spacing.three,
    right: Spacing.three,
    padding: Spacing.three,
    borderRadius: Radius.large,
    gap: Spacing.three,
    shadowColor: '#000',
    shadowOpacity: 0.15,
    shadowRadius: 10,
    shadowOffset: { width: 0, height: 4 },
    elevation: 5,
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
