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
  const pos = precise
    ? await Location.getCurrentPositionAsync({ accuracy: Location.Accuracy.Highest })
    : ((await Location.getLastKnownPositionAsync({ maxAge: 60_000 })) ??
      (await Location.getCurrentPositionAsync({ accuracy: Location.Accuracy.Balanced })));
  return { lat: pos.coords.latitude, lng: pos.coords.longitude };
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
