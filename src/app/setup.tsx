import { ScrollView, StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card } from '@/components/ui';
import { Spacing } from '@/constants/theme';

/** Shown when the Supabase keys are missing from .env. */
export default function SetupScreen() {
  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView style={{ flex: 1 }}>
        <ScrollView contentContainerStyle={styles.content}>
          <ThemedText style={styles.emoji}>🛠️</ThemedText>
          <ThemedText type="subtitle">Almost there</ThemedText>
          <ThemedText themeColor="textSecondary">
            Waylaid needs a Supabase project to carry letters. Follow the steps in the README, then put your
            keys in a file called .env at the root of the project:
          </ThemedText>
          <Card>
            <ThemedText type="code">EXPO_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co</ThemedText>
            <ThemedText type="code">EXPO_PUBLIC_SUPABASE_KEY=sb_publishable_...</ThemedText>
          </Card>
          <ThemedText themeColor="textSecondary">Then restart the dev server.</ThemedText>
        </ScrollView>
      </SafeAreaView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.four,
    gap: Spacing.three,
  },
  emoji: {
    fontSize: 56,
    lineHeight: 68,
  },
});
