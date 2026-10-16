import { StyleSheet, View, type StyleProp, type ViewStyle } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { useTheme } from '@/hooks/use-theme';
import type { LatLng } from '@/lib/api';

export type MapRoute = { id: string; points: LatLng[]; dashed?: boolean; faded?: boolean };
export type MapPin = { id: string; coord: LatLng; emoji: string; title?: string; subtitle?: string; onPress?: () => void };

type Props = {
  routes?: MapRoute[];
  pins?: MapPin[];
  fit?: LatLng[];
  fitKey?: string;
  center?: LatLng | null;
  showsUserLocation?: boolean;
  style?: StyleProp<ViewStyle>;
};

/** react-native-maps has no web build; show a placeholder so the web preview still works. */
export function SlowMap({ pins = [], style }: Props) {
  const theme = useTheme();
  return (
    <View style={[StyleSheet.absoluteFill, styles.box, { backgroundColor: theme.backgroundElement }, style]}>
      <ThemedText style={{ fontSize: 40 }}>🗺️</ThemedText>
      <ThemedText type="small" themeColor="textSecondary">
        The map runs on iOS and Android. {pins.length > 0 ? `${pins.length} thing(s) to show.` : ''}
      </ThemedText>
    </View>
  );
}

const styles = StyleSheet.create({
  box: {
    alignItems: 'center',
    justifyContent: 'center',
    gap: 8,
    padding: 24,
  },
});
