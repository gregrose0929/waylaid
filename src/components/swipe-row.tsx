import * as Haptics from 'expo-haptics';
import { memo, useEffect, useRef, type ReactNode } from 'react';
import { StyleSheet, Text } from 'react-native';
import { Gesture, GestureDetector } from 'react-native-gesture-handler';
import Animated, {
  Extrapolation,
  interpolate,
  interpolateColor,
  useAnimatedStyle,
  useDerivedValue,
  useSharedValue,
  withSpring,
  withTiming,
} from 'react-native-reanimated';
import { scheduleOnRN } from 'react-native-worklets';

import { Icon, type IconName } from '@/components/icon';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

type Action = { label: string; icon: IconName; color: string; onPress: () => void };

/** Fraction of the row width past which letting go performs the action. */
const ARM_AT = 0.33;
const SPRING = { damping: 22, stiffness: 260, mass: 0.7 };

/**
 * Gmail-style swipe: swipe right for `left` (e.g. Archive), left for `right` (e.g. Delete).
 * Past a third of the way the action "arms" (colour deepens, icon pops, haptic tick).
 * Let go while armed and the row slides away, the gap closes, then the action runs.
 * Let go before that and it springs back. No half-open state.
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
  const width = useSharedValue(0);
  const height = useSharedValue(-1); // -1 = natural height (not collapsing)
  const naturalHeight = useSharedValue(0);
  const armed = useSharedValue(0); // -1 right action, 0 none, 1 left action
  const hasLeft = !!left;
  const hasRight = !!right;
  const resetTimer = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => () => {
    if (resetTimer.current) clearTimeout(resetTimer.current);
  }, []);

  const tick = () => Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light).catch(() => {});

  const run = (which: 'left' | 'right') => {
    Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium).catch(() => {});
    (which === 'left' ? left : right)?.onPress();
    // Normally the list drops this row before this fires. If it's still here (the
    // action failed, or was undone instantly), put it back.
    resetTimer.current = setTimeout(() => {
      height.value = -1;
      x.value = withSpring(0, SPRING);
      armed.value = 0;
    }, 2500);
  };

  const pan = Gesture.Pan()
    .enabled(enabled)
    .activeOffsetX([-14, 14])
    .failOffsetY([-10, 10])
    .onUpdate((e) => {
      let t = e.translationX;
      if (!hasLeft && t > 0) t = 0;
      if (!hasRight && t < 0) t = 0;
      x.value = t;
      const w = width.value || 360;
      const next = t > w * ARM_AT ? 1 : t < -w * ARM_AT ? -1 : 0;
      if (next !== armed.value) {
        armed.value = next;
        if (next !== 0) scheduleOnRN(tick);
      }
    })
    .onEnd((e) => {
      const w = width.value || 360;
      // A quick flick counts too, even if it didn't travel far.
      const flick = Math.abs(e.velocityX) > 1200 && Math.sign(e.velocityX) === Math.sign(x.value);
      const go = armed.value !== 0 || (flick && Math.abs(x.value) > w * 0.15);
      if (!go) {
        armed.value = 0;
        x.value = withSpring(0, SPRING);
        return;
      }
      const dir = x.value > 0 ? 1 : -1;
      armed.value = dir;
      // Slide off, collapse the gap, then act, so nothing jumps back into place.
      x.value = withTiming(dir * w, { duration: 170 }, () => {
        height.value = naturalHeight.value;
        height.value = withTiming(0, { duration: 180 }, () => {
          scheduleOnRN(run, dir > 0 ? 'left' : 'right');
        });
      });
    });

  const progress = (v: number, w: number) => Math.min(Math.abs(v) / ((w || 360) * ARM_AT), 1);

  const wrapStyle = useAnimatedStyle(() =>
    height.value < 0 ? {} : { height: height.value, opacity: height.value / (naturalHeight.value || 1) },
  );
  const rowStyle = useAnimatedStyle(() => ({ transform: [{ translateX: x.value }] }));

  // Background: neutral while dragging, full action colour once armed.
  const armedAnim = useDerivedValue(() => withTiming(armed.value !== 0 ? 1 : 0, { duration: 120 }));
  // grey (like Gmail) until armed, so the white icon stays readable in light and dark mode
  const neutral = theme.textSecondary;
  const leftColor = left?.color ?? neutral;
  const rightColor = right?.color ?? neutral;
  const bgStyle = useAnimatedStyle(() => ({
    opacity: interpolate(Math.abs(x.value), [0, 24], [0, 1], Extrapolation.CLAMP),
    backgroundColor: interpolateColor(armedAnim.value, [0, 1], [neutral, x.value >= 0 ? leftColor : rightColor]),
  }));
  const leftIcon = useAnimatedStyle(() => {
    const p = x.value > 0 ? progress(x.value, width.value) : 0;
    return {
      opacity: p,
      transform: [{ scale: withSpring(armed.value === 1 ? 1.15 : 0.7 + 0.3 * p, SPRING) }],
    };
  });
  const rightIcon = useAnimatedStyle(() => {
    const p = x.value < 0 ? progress(x.value, width.value) : 0;
    return {
      opacity: p,
      transform: [{ scale: withSpring(armed.value === -1 ? 1.15 : 0.7 + 0.3 * p, SPRING) }],
    };
  });

  return (
    <Animated.View
      style={[styles.container, wrapStyle]}
      onLayout={(e) => {
        width.value = e.nativeEvent.layout.width;
        if (height.value < 0) naturalHeight.value = e.nativeEvent.layout.height;
      }}>
      <Animated.View style={[styles.bg, bgStyle]}>
        {left && (
          <Animated.View style={[styles.side, styles.leftSide, leftIcon]}>
            <Icon name={left.icon} color={theme.accentText} />
            <Text style={[styles.label, { color: theme.accentText }]}>{left.label}</Text>
          </Animated.View>
        )}
        {right && (
          <Animated.View style={[styles.side, styles.rightSide, rightIcon]}>
            <Icon name={right.icon} color={theme.accentText} />
            <Text style={[styles.label, { color: theme.accentText }]}>{right.label}</Text>
          </Animated.View>
        )}
      </Animated.View>
      <GestureDetector gesture={pan}>
        <Animated.View style={rowStyle}>{children}</Animated.View>
      </GestureDetector>
    </Animated.View>
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
    borderRadius: Radius.medium,
    justifyContent: 'center',
  },
  side: {
    position: 'absolute',
    top: 0,
    bottom: 0,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 2,
  },
  leftSide: {
    left: Spacing.four,
  },
  rightSide: {
    right: Spacing.four,
  },
  label: {
    fontSize: 12,
    fontWeight: 700,
  },
});
