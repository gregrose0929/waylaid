import { useEffect, useRef, useState } from 'react';
import { StyleSheet, Text, type StyleProp, type ViewStyle } from 'react-native';
import MapView, { Marker, Polyline, type Region } from 'react-native-maps';

import { useTheme } from '@/hooks/use-theme';
import type { LatLng } from '@/lib/api';
import { toLatLng } from '@/lib/geo';

export type MapRoute = { id: string; points: LatLng[]; dashed?: boolean; faded?: boolean };
export type MapPin = { id: string; coord: LatLng; emoji: string; title?: string; subtitle?: string; onPress?: () => void };

type Props = {
  routes?: MapRoute[];
  pins?: MapPin[];
  /** Points the camera should frame when they change (by identity of `fitKey`). */
  fit?: LatLng[];
  fitKey?: string;
  /** Where to start when there's nothing to fit yet (e.g. your mailbox). */
  center?: LatLng | null;
  showsUserLocation?: boolean;
  style?: StyleProp<ViewStyle>;
};

/** A region that comfortably contains all the points (or a ~10 km view around one). */
function regionFor(points: LatLng[]): Region {
  const lats = points.map((p) => p[0]);
  const lngs = points.map((p) => p[1]);
  const [minLat, maxLat, minLng, maxLng] = [Math.min(...lats), Math.max(...lats), Math.min(...lngs), Math.max(...lngs)];
  return {
    latitude: (minLat + maxLat) / 2,
    longitude: (minLng + maxLng) / 2,
    latitudeDelta: Math.max((maxLat - minLat) * 1.5, 0.08),
    longitudeDelta: Math.max((maxLng - minLng) * 1.5, 0.08),
  };
}

export function SlowMap({ routes = [], pins = [], fit = [], fitKey, center, showsUserLocation, style }: Props) {
  const ref = useRef<MapView>(null);
  const theme = useTheme();
  // Start the camera in the right place instead of flying in from the middle of the Atlantic.
  const [initialRegion] = useState<Region | undefined>(() =>
    fit.length > 0 ? regionFor(fit) : center ? regionFor([center]) : undefined,
  );
  const startedWith = useRef(fit.length > 0 ? fitKey : undefined);

  // Only re-frame when the caller says the subject changed, not on every tick.
  useEffect(() => {
    if (fitKey === startedWith.current) return;
    const coords = fit.map(toLatLng);
    if (coords.length === 0) return;
    const pad = { top: 80, right: 60, bottom: 120, left: 60 };
    const id = setTimeout(() => {
      if (coords.length === 1) {
        ref.current?.animateToRegion({ ...coords[0], latitudeDelta: 0.3, longitudeDelta: 0.3 }, 400);
      } else {
        ref.current?.fitToCoordinates(coords, { edgePadding: pad, animated: true });
      }
    }, 300);
    return () => clearTimeout(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [fitKey]);

  return (
    <MapView
      ref={ref}
      style={[StyleSheet.absoluteFill, style]}
      initialRegion={initialRegion}
      showsUserLocation={showsUserLocation}>
      {routes.map((r) => (
        <Polyline
          key={r.id}
          coordinates={r.points.map(toLatLng)}
          strokeColor={r.faded ? theme.textSecondary : theme.accent}
          strokeWidth={3}
          lineDashPattern={r.dashed ? [8, 8] : undefined}
          geodesic={false}
        />
      ))}
      {pins.map((p) => (
        <Marker
          key={p.id}
          coordinate={toLatLng(p.coord)}
          title={p.title}
          description={p.subtitle}
          onCalloutPress={p.onPress}
          onPress={p.onPress && !p.title ? p.onPress : undefined}
          anchor={{ x: 0.5, y: 0.5 }}>
          <Text style={styles.pin}>{p.emoji}</Text>
        </Marker>
      ))}
    </MapView>
  );
}

const styles = StyleSheet.create({
  pin: {
    fontSize: 28,
  },
});
