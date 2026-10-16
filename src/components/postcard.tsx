import { Image } from 'expo-image';
import { useState } from 'react';
import { ActivityIndicator, StyleSheet, View } from 'react-native';

import { Radius } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { usePostcardUrl } from '@/lib/postcards';

/**
 * The photo on a postcard, shown whole at its own shape (nothing is cropped off).
 * `uri` shows a local photo before it's uploaded; `maxHeight` keeps tall photos in check.
 */
export function Postcard({
  path,
  uri,
  maxHeight = 420,
  width = '100%',
}: {
  path?: string | null;
  uri?: string | null;
  maxHeight?: number;
  /** fixed width, e.g. inside a chat bubble that would otherwise shrink to its text */
  width?: number | '100%';
}) {
  const theme = useTheme();
  const remote = usePostcardUrl(uri ? null : path);
  const source = uri ?? remote;
  // Until the photo loads we don't know its shape; assume a classic 4:3 postcard.
  const [ratio, setRatio] = useState(4 / 3);
  return (
    <View
      style={[
        styles.frame,
        { width, aspectRatio: ratio, maxHeight, backgroundColor: theme.backgroundSelected, borderColor: theme.border },
      ]}>
      {source ? (
        <Image
          source={{ uri: source }}
          style={StyleSheet.absoluteFill}
          contentFit="contain"
          transition={200}
          onLoad={(e) => {
            const { width, height } = e.source;
            if (width > 0 && height > 0) setRatio(width / height);
          }}
        />
      ) : (
        <ActivityIndicator color={theme.textSecondary} />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  frame: {
    alignSelf: 'center',
    borderRadius: Radius.medium,
    borderWidth: 6,
    overflow: 'hidden',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
