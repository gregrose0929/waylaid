import { router } from 'expo-router';
import { FlatList, StyleSheet } from 'react-native';

import { LetterRow } from '@/components/letter-row';
import { SwipeRow } from '@/components/swipe-row';
import { ThemedView } from '@/components/themed-view';
import { EmptyState } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useTheme } from '@/hooks/use-theme';
import { useLetterActions } from '@/lib/letter-actions';
import { useApp } from '@/providers/app-state';

export default function ArchivedScreen() {
  const { mail } = useApp();
  const theme = useTheme();
  const now = useNow();
  const actions = useLetterActions();
  const archived = mail.filter((l) => l.archived);

  return (
    <ThemedView style={{ flex: 1 }}>
      <FlatList
        data={archived}
        keyExtractor={(l) => l.id}
        renderItem={({ item }) => (
          <SwipeRow
            left={{ label: 'Unarchive', icon: 'unarchive', color: theme.success, onPress: () => actions.unarchive([item.id]) }}
            right={{ label: 'Delete', icon: 'trash', color: theme.danger, onPress: () => actions.remove([item.id]) }}>
            <LetterRow
              letter={item}
              now={now}
              onPress={() => router.push({ pathname: '/letter/[id]', params: { id: item.id } })}
            />
          </SwipeRow>
        )}
        contentContainerStyle={styles.list}
        ListEmptyComponent={
          <EmptyState emoji="🗄️" title="Nothing archived" body="Swipe a letter to the right to archive it." />
        }
      />
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  list: {
    padding: Spacing.three,
    gap: Spacing.two,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
});
