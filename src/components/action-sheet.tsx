import { Modal, Pressable, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Icon, type IconName } from '@/components/icon';
import { ThemedText } from '@/components/themed-text';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';

export type SheetOption = { label: string; icon: IconName; onPress: () => void; destructive?: boolean };

/** A bottom sheet of actions, in the app's own style (replaces system alert menus). */
export function ActionSheet({
  visible,
  title,
  options,
  onClose,
}: {
  visible: boolean;
  title?: string;
  options: SheetOption[];
  onClose: () => void;
}) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={onClose}>
      <Pressable style={styles.scrim} onPress={onClose} accessibilityLabel="Close" />
      <View style={[styles.sheet, { backgroundColor: theme.background, paddingBottom: insets.bottom + Spacing.two }]}>
        <View style={[styles.grabber, { backgroundColor: theme.border }]} />
        {title && (
          <ThemedText type="small" themeColor="textSecondary" numberOfLines={2} style={styles.title}>
            {title}
          </ThemedText>
        )}
        {options.map((o) => (
          <Pressable
            key={o.label}
            accessibilityRole="button"
            onPress={() => {
              onClose();
              o.onPress();
            }}
            style={({ pressed }) => [styles.option, pressed && { backgroundColor: theme.backgroundElement }]}>
            <Icon name={o.icon} color={o.destructive ? theme.danger : theme.text} />
            <ThemedText style={o.destructive ? { color: theme.danger } : undefined}>{o.label}</ThemedText>
          </Pressable>
        ))}
      </View>
    </Modal>
  );
}

const styles = StyleSheet.create({
  scrim: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.35)',
  },
  sheet: {
    borderTopLeftRadius: Radius.large,
    borderTopRightRadius: Radius.large,
    paddingTop: Spacing.two,
  },
  grabber: {
    alignSelf: 'center',
    width: 40,
    height: 5,
    borderRadius: 3,
    marginBottom: Spacing.two,
  },
  title: {
    paddingHorizontal: Spacing.four,
    paddingBottom: Spacing.two,
  },
  option: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
    paddingHorizontal: Spacing.four,
    paddingVertical: Spacing.three,
  },
});
