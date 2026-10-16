import { useLocalSearchParams } from 'expo-router';
import { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';

import { Avatar } from '@/components/avatar';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Card, EmptyState, ErrorText } from '@/components/ui';
import { Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { api, type Chain } from '@/lib/api';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

/** A chain letter, line by line, as far as you're allowed to read it. */
export default function ChainScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const { transport } = useApp();
  const [chain, setChain] = useState<Chain | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    api
      .getChain(id)
      .then(setChain)
      .catch((e) => setError(e instanceof Error ? e.message : String(e)));
  }, [id]);

  if (error) return <EmptyState emoji="🔗" title="Can’t open this chain" body={error} />;
  if (!chain) return <ErrorText>{null}</ErrorText>;

  return (
    <ThemedView style={{ flex: 1 }}>
      <ScrollView contentContainerStyle={styles.content}>
        <View style={{ alignItems: 'center', gap: Spacing.one }}>
          <ThemedText style={{ fontSize: 48, lineHeight: 60 }}>🔗</ThemedText>
          <ThemedText style={styles.title}>Chain letter</ThemedText>
          <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
            {chain.finished
              ? `Finished after ${chain.links.length} links. Here’s the whole thing.`
              : `${chain.links.length} of ${chain.max_links} links so far. You can read up to your own line; when the chain ends, everyone can read it all.`}
          </ThemedText>
        </View>
        {chain.links.map((l) => (
          <Card key={l.link} style={styles.link}>
            <Avatar person={l.from} size={36} />
            <View style={{ flex: 1, gap: 2 }}>
              <ThemedText type="small" themeColor="textSecondary">
                {l.link}. {displayName(l.from)} → {displayName(l.to)} by {transport(l.transport_id)?.emoji ?? '✉️'}
                {l.delivered ? '' : ' (still travelling)'}
              </ThemedText>
              <ThemedText style={styles.line}>{l.body}</ThemedText>
            </View>
          </Card>
        ))}
      </ScrollView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.two,
    paddingBottom: Spacing.six,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  title: {
    fontFamily: Fonts.serif,
    fontSize: 26,
    lineHeight: 34,
    fontWeight: 700,
  },
  link: {
    flexDirection: 'row',
    gap: Spacing.three,
    alignItems: 'flex-start',
  },
  line: {
    fontFamily: Fonts.serif,
    fontSize: 17,
    lineHeight: 25,
  },
});
