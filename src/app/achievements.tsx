import { useFocusEffect } from 'expo-router';
import { useCallback, useState } from 'react';
import { FlatList, StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, ErrorText, ProgressBar } from '@/components/ui';
import { MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api, type Achievement } from '@/lib/api';
import { formatWhen } from '@/lib/format';
import { useApp } from '@/providers/app-state';

export default function AchievementsScreen() {
  const { transport, cosmetics } = useApp();
  const theme = useTheme();
  const [list, setList] = useState<Achievement[] | null>(null);
  const [error, setError] = useState<string | null>(null);

  useFocusEffect(
    useCallback(() => {
      api
        .achievements()
        .then(setList)
        .catch((e) => setError(e instanceof Error ? e.message : String(e)));
    }, []),
  );

  const earned = list?.filter((a) => a.unlocked_at).length ?? 0;

  return (
    <ThemedView style={{ flex: 1 }}>
      <FlatList
        data={list ?? []}
        keyExtractor={(a) => a.id}
        contentContainerStyle={styles.list}
        ListHeaderComponent={
          <View style={{ gap: Spacing.two, paddingBottom: Spacing.two }}>
            <ThemedText themeColor="textSecondary">
              {list ? `${earned} of ${list.length} earned. ` : ''}Some unlock faster carriers.
            </ThemedText>
            <ErrorText>{error}</ErrorText>
          </View>
        }
        renderItem={({ item }) => {
          const done = !!item.unlocked_at;
          const unlocks = item.unlocks ? transport(item.unlocks) : undefined;
          return (
            <Card style={[styles.row, !done && { opacity: 0.75 }]}>
              <View style={[styles.badge, { backgroundColor: done ? theme.accent : theme.backgroundSelected }]}>
                <ThemedText style={styles.emoji}>{done ? item.emoji : '🔒'}</ThemedText>
              </View>
              <View style={{ flex: 1, gap: 2 }}>
                <ThemedText style={{ fontWeight: 700 }}>{item.title}</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {item.description}
                </ThemedText>
                {cosmetics
                  .filter((c) => c.unlocked_by === item.id)
                  .map((c) => (
                    <ThemedText key={c.id} type="small" style={{ color: theme.accent }}>
                      {done ? 'Unlocked' : 'Unlocks'} {c.kind === 'paper' ? '📄' : '🔴'} {c.name}{' '}
                      {c.kind === 'paper' ? 'paper' : 'wax seal'}
                    </ThemedText>
                  ))}
                {unlocks && (
                  <ThemedText type="small" style={{ color: theme.accent }}>
                    {done ? 'Unlocked' : 'Unlocks'} {unlocks.emoji} {unlocks.name}
                  </ThemedText>
                )}
                {done ? (
                  <ThemedText type="small" themeColor="textSecondary">
                    Earned {formatWhen(item.unlocked_at!)}
                  </ThemedText>
                ) : (
                  item.goal > 1 && (
                    <View style={{ gap: 2, marginTop: 4 }}>
                      <ProgressBar value={item.progress / item.goal} />
                      <ThemedText type="small" themeColor="textSecondary">
                        {item.progress} / {item.goal}
                      </ThemedText>
                    </View>
                  )
                )}
              </View>
            </Card>
          );
        }}
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
  row: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: Spacing.three,
  },
  badge: {
    width: 52,
    height: 52,
    borderRadius: 26,
    alignItems: 'center',
    justifyContent: 'center',
  },
  emoji: {
    fontSize: 26,
    lineHeight: 32,
  },
});
