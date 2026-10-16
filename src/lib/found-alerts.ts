/**
 * "You found a lost letter": geofences around nearby lost letters, so the phone
 * itself tells us when you walk into pickup range, even with the app in the background.
 *
 * Limits worth knowing:
 * - Android watches at most 100 geofences, so we register the closest 100.
 * - The list is refreshed whenever the app is opened; letters lost while the app
 *   was closed are watched from the next open.
 * - Android doesn't relaunch an app that was swiped away for a geofence event.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Location from 'expo-location';
import * as TaskManager from 'expo-task-manager';
import { Platform } from 'react-native';

import { api } from '@/lib/api';
import { notifyNow } from '@/lib/notifications';

const TASK = 'waylaid-found-alerts';
const ALERTED_KEY = 'waylaid.alertedWrecks';
/** Must match the pickup radius enforced by pick_up() on the server. */
export const PICKUP_RADIUS_M = 300;

// Must be defined at module scope so Android can run it in the background. (Not on web.)
if (Platform.OS !== 'web')
  TaskManager.defineTask<{
    eventType: Location.GeofencingEventType;
    region: Location.LocationRegion;
  }>(TASK, async ({ data, error }) => {
    if (error || !data || data.eventType !== Location.GeofencingEventType.Enter) return;
    const id = data.region.identifier;
    if (!id) return;
    // One alert per lost letter.
    const alerted: string[] = JSON.parse((await AsyncStorage.getItem(ALERTED_KEY)) ?? '[]');
    if (alerted.includes(id)) return;
    await AsyncStorage.setItem(ALERTED_KEY, JSON.stringify([...alerted, id].slice(-500)));
    await notifyNow(
      '📜 You found a lost letter!',
      'A fallen carrier’s letter is lying right near you. Open Waylaid to pick it up.',
      '/map',
      'found',
    );
  });

/** Ask for "Allow all the time" location. Returns true if granted. */
export async function requestFoundAlertPermission(): Promise<boolean> {
  if (Platform.OS === 'web') return false;
  const fg = await Location.requestForegroundPermissionsAsync();
  if (fg.status !== 'granted') return false;
  const bg = await Location.requestBackgroundPermissionsAsync();
  return bg.status === 'granted';
}

/** Point the geofences at the lost letters currently near `here`. */
export async function syncFoundAlerts(here: { lat: number; lng: number }): Promise<void> {
  if (Platform.OS === 'web') return;
  const bg = await Location.getBackgroundPermissionsAsync();
  if (bg.status !== 'granted') return;
  const wrecks = await api.nearbyWrecks(here.lat, here.lng);
  const regions: Location.LocationRegion[] = wrecks.slice(0, 100).map((w) => ({
    identifier: w.leg_id,
    latitude: w.coords[0],
    longitude: w.coords[1],
    radius: PICKUP_RADIUS_M,
    notifyOnEnter: true,
    notifyOnExit: false,
  }));
  if (regions.length > 0) {
    await Location.startGeofencingAsync(TASK, regions);
  } else {
    await stopFoundAlerts();
  }
}

export async function stopFoundAlerts(): Promise<void> {
  if (Platform.OS === 'web') return;
  if (await Location.hasStartedGeofencingAsync(TASK).catch(() => false)) {
    await Location.stopGeofencingAsync(TASK);
  }
}
