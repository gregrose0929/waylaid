import { Modal, Pressable, ScrollView, StyleSheet, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { TransportPicker } from '@/components/transport-picker';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import type { Weather } from '@/lib/api';
import { formatDistance } from '@/lib/format';
import { weatherLook } from '@/lib/weather';
import { useApp } from '@/providers/app-state';

/** Bottom sheet for choosing a carrier, used by the conversation reply bar. */
export function CarrierSheet({
  visible,
  distanceKm,
  value,
  onChange,
  onClose,
  weather,
}: {
  weather?: Weather | null;
  visible: boolean;
  distanceKm: number | null;
  value: string;
  onChange: (id: string) => void;
  onClose: () => void;
}) {
  const theme = useTheme();
  const insets = useSafeAreaInsets();
  const { units } = useApp();
  return (
    <Modal visible={visible} transparent animationType="slide" onRequestClose={onClose}>
      <Pressable style={styles.scrim} onPress={onClose} accessibilityLabel="Close" />
      <View style={[styles.sheet, { backgroundColor: theme.background, paddingBottom: insets.bottom + Spacing.three }]}>
        <View style={[styles.grabber, { backgroundColor: theme.border }]} />
        <ThemedText type="smallBold" themeColor="textSecondary" style={{ paddingHorizontal: Spacing.three }}>
          CHOOSE A CARRIER{distanceKm != null ? ` · ${formatDistance(distanceKm, units).toUpperCase()}` : ''}
          {weather ? ` · ${weatherLook(weather).emoji} ${weatherLook(weather).label.toUpperCase()}` : ''}
        </ThemedText>
        <ScrollView contentContainerStyle={{ padding: Spacing.three }}>
          <TransportPicker
            weather={weather}
            distanceKm={distanceKm}
            value={value}
            onChange={(id) => {
              onChange(id);
              onClose();
            }}
          />
        </ScrollView>
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
    maxHeight: '75%',
    borderTopLeftRadius: Radius.large,
    borderTopRightRadius: Radius.large,
    paddingTop: Spacing.two,
    gap: Spacing.two,
  },
  grabber: {
    alignSelf: 'center',
    width: 40,
    height: 5,
    borderRadius: 3,
    marginBottom: Spacing.two,
  },
});
