import { router, useFocusEffect } from 'expo-router';
import { useCallback } from 'react';
import { Pressable, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Avatar } from '@/components/avatar';
import { Icon, type IconName } from '@/components/icon';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { Button, Card } from '@/components/ui';
import { BottomTabInset, Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { displayName } from '@/lib/format';
import { useApp } from '@/providers/app-state';

export default function MeScreen() {
  const { me, refreshMe, friends } = useApp();

  useFocusEffect(
    useCallback(() => {
      refreshMe().catch(() => {});
    }, [refreshMe]),
  );

  if (!me) return null;

  const stats = [
    { label: 'Sent', value: me.stats.sent, emoji: '📤' },
    { label: 'Delivered', value: me.stats.delivered, emoji: '📬' },
    { label: 'Received', value: me.stats.received, emoji: '📥' },
    { label: 'Found', value: me.stats.found, emoji: '🔍' },
  ];
  const unlocked = me.unlocked_carriers?.length;

  return (
    <ThemedView style={{ flex: 1 }}>
      <SafeAreaView edges={['top']} style={{ flex: 1 }}>
        <ScrollView contentContainerStyle={styles.content}>
          <View style={styles.topBar}>
            <Pressable
              accessibilityRole="button"
              accessibilityLabel="Settings"
              hitSlop={8}
              onPress={() => router.push('/settings')}
              style={{ padding: Spacing.two }}>
              <Icon name="settings" />
            </Pressable>
          </View>

          <View style={styles.hero}>
            <Avatar person={me} size={96} />
            <ThemedText style={styles.name}>{displayName(me)}</ThemedText>
            <ThemedText themeColor="textSecondary">@{me.username}</ThemedText>
            <Button
              title="Edit profile"
              variant="secondary"
              onPress={() => router.push('/edit-profile')}
              style={styles.editButton}
            />
          </View>

          <View style={styles.stats}>
            {stats.map((s) => (
              <Card key={s.label} style={styles.stat}>
                <ThemedText style={{ fontSize: 22, lineHeight: 28 }}>{s.emoji}</ThemedText>
                <ThemedText style={styles.statValue}>{s.value}</ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {s.label}
                </ThemedText>
              </Card>
            ))}
          </View>

          <View style={{ gap: Spacing.two }}>
            <LinkRow
              icon="people"
              label="Friends"
              detail={
                friends.incoming.length
                  ? `${friends.incoming.length} new request${friends.incoming.length > 1 ? 's' : ''}`
                  : `${friends.friends.length}`
              }
              highlight={friends.incoming.length > 0}
              onPress={() => router.push('/friends')}
            />
            <LinkRow
              icon="check"
              label="Achievements"
              detail={me.stats.achievements != null ? `🏆 ${me.stats.achievements}` : undefined}
              onPress={() => router.push('/achievements')}
            />
            <LinkRow
              icon="send"
              label="Meet the carriers"
              detail={unlocked ? `${unlocked} unlocked` : undefined}
              onPress={() => router.push('/carriers')}
            />
            <LinkRow icon="archive" label="Archived letters" onPress={() => router.push('/archived')} />
            <LinkRow
              icon="location"
              label="Mailbox"
              detail={me.home_label || 'Set'}
              onPress={() => router.push('/settings')}
            />
          </View>
          <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
            Waylaid · send it your own way
          </ThemedText>
        </ScrollView>
      </SafeAreaView>
    </ThemedView>
  );
}

function LinkRow({
  icon,
  label,
  detail,
  highlight,
  onPress,
}: {
  icon: IconName;
  label: string;
  detail?: string;
  highlight?: boolean;
  onPress: () => void;
}) {
  const theme = useTheme();
  return (
    <Card onPress={onPress} style={styles.link}>
      <Icon name={icon} color={theme.accent} />
      <ThemedText style={{ flex: 1 }}>{label}</ThemedText>
      {detail ? (
        <ThemedText type="small" themeColor={highlight ? 'accent' : 'textSecondary'}>
          {detail}
        </ThemedText>
      ) : null}
      <Icon name="chevron" size={18} color={theme.textSecondary} />
    </Card>
  );
}

const styles = StyleSheet.create({
  content: {
    padding: Spacing.three,
    gap: Spacing.four,
    paddingBottom: BottomTabInset + Spacing.four,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  topBar: {
    flexDirection: 'row',
    justifyContent: 'flex-end',
    marginBottom: -Spacing.four,
  },
  hero: {
    alignItems: 'center',
    gap: Spacing.one,
  },
  name: {
    fontFamily: Fonts.serif,
    fontSize: 30,
    lineHeight: 38,
    fontWeight: 700,
    marginTop: Spacing.two,
  },
  editButton: {
    minHeight: 40,
    marginTop: Spacing.two,
  },
  stats: {
    flexDirection: 'row',
    gap: Spacing.two,
  },
  stat: {
    flex: 1,
    alignItems: 'center',
    gap: 0,
    paddingHorizontal: Spacing.one,
  },
  statValue: {
    fontSize: 22,
    lineHeight: 28,
    fontWeight: 700,
  },
  link: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
});
