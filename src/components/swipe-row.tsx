import * as Haptics from 'expo-haptics';
import { memo, type ReactNode } from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { Gesture, GestureDetector } from 'react-native-gesture-handler';
import Animated, { useAnimatedStyle, useSharedValue, withSpring, withTiming } from 'react-native-reanimated';
import { scheduleOnRN } from 'react-native-worklets';

import { Icon, type IconName } from '@/components/icon';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

type Action = { label: string; icon: IconName; color: string; onPress: () => void };

/** How far a partial swipe stays open to show the button. */
const REVEAL = 96;
/** Past this fraction of the row width, letting go performs the action (Gmail-style). */
const FULL = 0.45;
const SPRING = { damping: 20, stiffness: 220, mass: 0.6 };

/**
 * Swipe right for the left action (e.g. Archive), left for the right action (e.g. Delete).
 * A long swipe acts immediately; a short one reveals a button to tap.
 *
 * Both coloured backgrounds sit permanently behind the row, so nothing has to be measured
 * or mounted mid-gesture (the cause of flicker with the stock Swipeable).
 */
export const SwipeRow = memo(function SwipeRow({
  children,
  left,
  right,
  enabled = true,
}: {
  children: ReactNode;
  left?: Action;
  right?: Action;
  enabled?: boolean;
}) {
  const theme = useTheme();
  const x = useSharedValue(0);
  const start = useSharedValue(0);
  const width = useSharedValue(0);
  const hasLeft = !!left;
  const hasRight = !!right;

  const fire = (which: 'left' | 'right') => {
    Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium).catch(() => {});
    (which === 'left' ? left : right)?.onPress();
  };

  const pan = Gesture.Pan()
    .enabled(enabled)
    .activeOffsetX([-12, 12])
    .failOffsetY([-10, 10])
    .onBegin(() => {
      start.value = x.value;
    })
    .onUpdate((e) => {
      let t = start.value + e.translationX;
      if (!hasLeft && t > 0) t = 0;
      if (!hasRight && t < 0) t = 0;
      x.value = t;
    })
    .onEnd(() => {
      const w = width.value || 360;
      if (x.value > w * FULL) {
        x.value = withTiming(w, { duration: 160 }, () => {
          x.value = 0;
        });
        scheduleOnRN(fire, 'left');
      } else if (x.value < -w * FULL) {
        x.value = withTiming(-w, { duration: 160 }, () => {
          x.value = 0;
        });
        scheduleOnRN(fire, 'right');
      } else if (x.value > REVEAL / 2) {
        x.value = withSpring(REVEAL, SPRING);
      } else if (x.value < -REVEAL / 2) {
        x.value = withSpring(-REVEAL, SPRING);
      } else {
        x.value = withSpring(0, SPRING);
      }
    });

  const rowStyle = useAnimatedStyle(() => ({ transform: [{ translateX: x.value }] }));
  // Show only the background on the side being revealed.
  const leftBg = useAnimatedStyle(() => ({ opacity: x.value > 0 ? 1 : 0 }));
  const rightBg = useAnimatedStyle(() => ({ opacity: x.value < 0 ? 1 : 0 }));

  const tap = (a: Action) => () => {
    x.value = withSpring(0, SPRING);
    a.onPress();
  };

  return (
    <View onLayout={(e) => (width.value = e.nativeEvent.layout.width)} style={styles.container}>
      {left && (
        <Animated.View style={[styles.bg, { backgroundColor: left.color, alignItems: 'flex-start' }, leftBg]}>
          <Pressable onPress={tap(left)} style={styles.button} accessibilityRole="button" accessibilityLabel={left.label}>
            <Icon name={left.icon} color={theme.accentText} />
            <Text style={[styles.label, { color: theme.accentText }]}>{left.label}</Text>
          </Pressable>
        </Animated.View>
      )}
      {right && (
        <Animated.View style={[styles.bg, { backgroundColor: right.color, alignItems: 'flex-end' }, rightBg]}>
          <Pressable onPress={tap(right)} style={styles.button} accessibilityRole="button" accessibilityLabel={right.label}>
            <Icon name={right.icon} color={theme.accentText} />
            <Text style={[styles.label, { color: theme.accentText }]}>{right.label}</Text>
          </Pressable>
        </Animated.View>
      )}
      <GestureDetector gesture={pan}>
        <Animated.View style={rowStyle}>{children}</Animated.View>
      </GestureDetector>
    </View>
  );
});

const styles = StyleSheet.create({
  container: {
    borderRadius: Radius.medium,
    overflow: 'hidden',
  },
  bg: {
    position: 'absolute',
    top: 0,
    bottom: 0,
    left: 0,
    right: 0,
    justifyContent: 'center',
    borderRadius: Radius.medium,
  },
  button: {
    width: REVEAL,
    height: '100%',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 2,
    paddingHorizontal: Spacing.two,
  },
  label: {
    fontSize: 12,
    fontWeight: 700,
  },
});
