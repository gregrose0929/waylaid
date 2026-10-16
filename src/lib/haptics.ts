import * as Haptics from 'expo-haptics';
import { Platform } from 'react-native';

/**
 * Haptics that actually feel right on each platform. On Android we use the system's
 * tuned effects (performHapticFeedback), which are much crisper than simulated
 * vibrations. They follow the phone's "touch feedback" setting.
 */
export const haptic = {
  /** a swipe crossing its "let go to act" point */
  arm: () =>
    (Platform.OS === 'android'
      ? Haptics.performAndroidHapticsAsync(Haptics.AndroidHaptics.Toggle_On)
      : Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium)
    ).catch(() => {}),
  /** a swipe falling back below that point */
  disarm: () =>
    (Platform.OS === 'android'
      ? Haptics.performAndroidHapticsAsync(Haptics.AndroidHaptics.Toggle_Off)
      : Haptics.selectionAsync()
    ).catch(() => {}),
  /** an action completed */
  confirm: () =>
    (Platform.OS === 'android'
      ? Haptics.performAndroidHapticsAsync(Haptics.AndroidHaptics.Confirm)
      : Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Heavy)
    ).catch(() => {}),
};
