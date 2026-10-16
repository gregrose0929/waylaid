import { Image } from 'expo-image';
import { ActivityIndicator, StyleSheet, View } from 'react-native';

import { Radius } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { usePostcardUrl } from '@/lib/postcards';

/** The photo on a postcard. `uri` shows a local photo before it's uploaded. */
export function Postcard({ path, uri, height = 220 }: { path?: string | null; uri?: string | null; height?: number }) {
  const theme = useTheme();
  const remote = usePostcardUrl(uri ? null : path);
  const source = uri ?? remote;
  return (
    <View style={[styles.frame, { height, backgroundColor: theme.backgroundSelected, borderColor: theme.border }]}>
      {source ? (
        <Image source={{ uri: source }} style={StyleSheet.absoluteFill} contentFit="cover" transition={200} />
      ) : (
        <ActivityIndicator color={theme.textSecondary} />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  frame: {
    borderRadius: Radius.medium,
    borderWidth: 6,
    overflow: 'hidden',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
