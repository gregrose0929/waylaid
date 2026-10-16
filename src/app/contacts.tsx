import { router, useFocusEffect } from 'expo-router';
import { useCallback, useEffect, useState } from 'react';
import { FlatList, StyleSheet } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, EmptyState, Field } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { api, type Person } from '@/lib/api';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

export default function ContactsScreen() {
  const { contacts, refreshContacts } = useApp();
  const [query, setQuery] = useState('');
  const [found, setFound] = useState<{ query: string; users: Person[] }>({ query: '', users: [] });

  useFocusEffect(
    useCallback(() => {
      refreshContacts().catch(() => {});
    }, [refreshContacts]),
  );

  // Typing searches all usernames so you can add new people; empty shows your contacts.
  const searching = query.trim().length > 0;
  useEffect(() => {
    if (!searching) return;
    let cancelled = false;
    const id = setTimeout(() => {
      api
        .findUsers(query)
        .then((users) => !cancelled && setFound({ query, users }))
        .catch(() => {});
    }, 250);
    return () => {
      cancelled = true;
      clearTimeout(id);
    };
  }, [query, searching]);
  const list = searching ? (found.query === query ? found.users : []) : contacts;

  return (
    <ThemedView style={{ flex: 1 }}>
      <FlatList
        data={list}
        keyExtractor={(p) => p.id}
        contentContainerStyle={styles.list}
        keyboardShouldPersistTaps="handled"
        ListHeaderComponent={
          <Field
            placeholder="Search or add by username"
            autoCapitalize="none"
            autoCorrect={false}
            value={query}
            onChangeText={setQuery}
          />
        }
        ListEmptyComponent={
          searching ? null : (
            <EmptyState
              emoji="📇"
              title="No contacts yet"
              body="Search for a username to add someone, and give them a name only you will see."
            />
          )
        }
        renderItem={({ item }) => (
          <Card
            onPress={() =>
              router.push({
                pathname: '/contact/[id]',
                params: { id: item.id, username: item.username, name: item.display_name ?? '' },
              })
            }>
            <ThemedText style={{ fontWeight: 700 }}>{displayName(item)}</ThemedText>
            <ThemedText type="small" themeColor="textSecondary">
              @{item.username}
              {searching && item.is_contact ? ' · in your contacts' : ''}
            </ThemedText>
          </Card>
        )}
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
