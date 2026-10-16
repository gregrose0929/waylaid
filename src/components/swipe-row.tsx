import { useRef, type ReactNode } from 'react';
import { Pressable, StyleSheet, Text } from 'react-native';
import Swipeable, { type SwipeableMethods } from 'react-native-gesture-handler/ReanimatedSwipeable';

import { Icon, type IconName } from '@/components/icon';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

type Action = { label: string; icon: IconName; color: string; onPress: () => void };

/**
 * Swipe right to reveal the left action (e.g. Archive), left to reveal the right
 * action (e.g. Delete); tap it to act. Disabled while multi-selecting.
 */
export function SwipeRow({
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
  const ref = useRef<SwipeableMethods>(null);
  const theme = useTheme();

  const panel = (a: Action, align: 'flex-start' | 'flex-end') => (
    <Pressable
      accessibilityRole="button"
      accessibilityLabel={a.label}
      onPress={() => {
        ref.current?.close();
        a.onPress();
      }}
      style={[styles.action, { backgroundColor: a.color, alignItems: align }]}>
      <Icon name={a.icon} color={theme.accentText} />
      <Text style={[styles.label, { color: theme.accentText }]}>{a.label}</Text>
    </Pressable>
  );

  return (
    <Swipeable
      ref={ref}
      enabled={enabled}
      friction={1.5}
      overshootLeft={false}
      overshootRight={false}
      renderLeftActions={left ? () => panel(left, 'flex-start') : undefined}
      renderRightActions={right ? () => panel(right, 'flex-end') : undefined}
      containerStyle={styles.container}>
      {children}
    </Swipeable>
  );
}

const styles = StyleSheet.create({
  container: {
    borderRadius: Radius.medium,
  },
  action: {
    width: 96,
    justifyContent: 'center',
    paddingHorizontal: Spacing.four,
    borderRadius: Radius.medium,
    gap: 2,
  },
  label: {
    fontSize: 12,
    fontWeight: 700,
  },
});
