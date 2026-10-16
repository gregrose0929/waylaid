import * as Location from 'expo-location';
import { Platform } from 'react-native';

export type Here = { lat: number; lng: number };

/**
 * Ask for permission (if needed) and return the device's position.
 * `precise` skips cached fixes and asks for the best accuracy, for planting a mailbox.
 */
export async function getHere({ precise = false } = {}): Promise<Here> {
  const { status } = await Location.requestForegroundPermissionsAsync();
  if (status !== 'granted') {
    throw new Error('Waylaid needs your location to know where your mailbox is.');
  }
  // Never trigger Google's "turn on Location Accuracy" prompt: on Android that check fails
  // outright when someone has (reasonably) said no, even though plain GPS works fine.
  // Skipping it makes the request go straight to the phone's location hardware.
  const current = (accuracy: Location.Accuracy) => () =>
    Location.getCurrentPositionAsync({ accuracy, mayShowUserSettingsDialog: false });
  // Try the best accuracy first, then settle for less.
  const attempts: (() => Promise<Location.LocationObject | null>)[] = precise
    ? [
        current(Location.Accuracy.Highest),
        current(Location.Accuracy.Balanced),
        () => Location.getLastKnownPositionAsync({ maxAge: 5 * 60_000 }),
      ]
    : [
        () => Location.getLastKnownPositionAsync({ maxAge: 60_000 }),
        current(Location.Accuracy.Balanced),
        current(Location.Accuracy.Low),
      ];
  for (const attempt of attempts) {
    const pos = await attempt().catch(() => null);
    if (pos) return { lat: pos.coords.latitude, lng: pos.coords.longitude };
  }
  throw new Error('Couldn’t find your location. Make sure Location is turned on in your phone’s settings.');
}

/** "Fishers, IN" style label for a point, or null if unknown. */
export async function placeName(lat: number, lng: number): Promise<string | null> {
  if (Platform.OS === 'web') return null;
  try {
    const [a] = await Location.reverseGeocodeAsync({ latitude: lat, longitude: lng });
    if (!a) return null;
    const town = a.city ?? a.subregion ?? a.district;
    const region = a.isoCountryCode === 'US' ? a.region : (a.country ?? a.region);
    return [town, region].filter(Boolean).join(', ') || null;
  } catch {
    return null;
  }
}
