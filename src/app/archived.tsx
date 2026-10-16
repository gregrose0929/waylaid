import { FlatList, StyleSheet } from 'react-native';

import { LetterRow } from '@/components/letter-row';
import { ThemedView } from '@/components/themed-view';
import { EmptyState } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { useNow } from '@/hooks/use-now';
import { useApp } from '@/providers/app-state';

export default function ArchivedScreen() {
  const { mail } = useApp();
  const now = useNow();
  const archived = mail.filter((l) => l.archived);

  return (
    <ThemedView style={{ flex: 1 }}>
      <FlatList
        data={archived}
        keyExtractor={(l) => l.id}
        renderItem={({ item }) => <LetterRow letter={item} now={now} />}
        contentContainerStyle={styles.list}
        ListEmptyComponent={
          <EmptyState emoji="🗄️" title="Nothing archived" body="Long-press a letter in your mailbox to archive it." />
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
