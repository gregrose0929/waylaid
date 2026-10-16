import AsyncStorage from '@react-native-async-storage/async-storage';
import Constants from 'expo-constants';
import * as Device from 'expo-device';
import * as Notifications from 'expo-notifications';
import { router } from 'expo-router';
import { useEffect } from 'react';
import { Platform } from 'react-native';

import { api } from '@/lib/api';

const TOKEN_KEY = 'waylaid.pushToken';

// Show notifications even while the app is open.
Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowBanner: true,
    shouldShowList: true,
    shouldPlaySound: true,
    shouldSetBadge: false,
  }),
});

/** Android needs channels before it will even ask for permission. */
async function ensureChannels() {
  if (Platform.OS !== 'android') return;
  await Notifications.setNotificationChannelAsync('letters', {
    name: 'Letters',
    description: 'When a letter arrives in your mailbox',
    importance: Notifications.AndroidImportance.HIGH,
  });
  await Notifications.setNotificationChannelAsync('found', {
    name: 'Lost letters nearby',
    description: 'When you walk near a lost letter',
    importance: Notifications.AndroidImportance.HIGH,
  });
}

/**
 * Ask for permission and register this device for "a letter arrived" pushes.
 * Quietly does nothing on simulators, the web, or if the person says no.
 */
export async function registerForPush(): Promise<void> {
  if (Platform.OS === 'web' || !Device.isDevice) return;
  await ensureChannels();
  const current = await Notifications.getPermissionsAsync();
  const status = current.granted ? 'granted' : (await Notifications.requestPermissionsAsync()).status;
  if (status !== 'granted') return;

  const projectId = Constants.expoConfig?.extra?.eas?.projectId;
  const { data: token } = await Notifications.getExpoPushTokenAsync({ projectId });
  await api.registerPushToken(token);
  await AsyncStorage.setItem(TOKEN_KEY, token);
}

/** Stop pushes to this device for the signed-in account (call before signing out). */
export async function unregisterPush(): Promise<void> {
  const token = await AsyncStorage.getItem(TOKEN_KEY);
  if (!token) return;
  await api.unregisterPushToken(token).catch(() => {});
  await AsyncStorage.removeItem(TOKEN_KEY);
}

/** Show something right now from this device (used by lost-letter alerts). */
export async function notifyNow(title: string, body: string, url: string, channelId: 'letters' | 'found') {
  await ensureChannels();
  await Notifications.scheduleNotificationAsync({
    content: { title, body, data: { url } },
    // a channel-only trigger means "now, on this Android channel"
    trigger: Platform.OS === 'android' ? { channelId } : null,
  });
}

/** Tapping a notification opens the screen it points at. */
export function useNotificationRouting(enabled: boolean) {
  const response = Notifications.useLastNotificationResponse();
  useEffect(() => {
    if (!enabled || !response) return;
    const url = response.notification.request.content.data?.url;
    if (typeof url === 'string') router.push(url as never);
    Notifications.clearLastNotificationResponseAsync().catch(() => {});
  }, [enabled, response]);
}
