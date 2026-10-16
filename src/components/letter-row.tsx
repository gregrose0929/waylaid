import { Pressable, StyleSheet, View } from 'react-native';

import { Avatar } from '@/components/avatar';
import { Icon } from '@/components/icon';
import { ThemedText } from '@/components/themed-text';
import { ProgressBar } from '@/components/ui';
import { Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { activityAt, isUnread, type Letter, type Person } from '@/lib/api';
import type { Conversation } from '@/lib/conversations';
import { displayName, formatDuration, formatWhen } from '@/lib/format';
import { progress } from '@/lib/geo';
import { useApp } from '@/providers/app-state';

export function currentLeg(letter: Letter) {
  return letter.legs[letter.legs.length - 1];
}

/** One-line status for a letter, from your point of view. */
export function letterStatusLine(letter: Letter, now: number, carrierName?: string): string {
  const leg = currentLeg(letter);
  switch (letter.status) {
    case 'in_transit':
      return `${carrierName ?? 'On its way'} · ${formatDuration(Date.parse(leg.arrives_at) - now)} away`;
    case 'overdue':
      return 'Should have arrived by now…';
    case 'delivered':
      if (letter.role === 'received') return firstLine(letter.body);
      return letter.read_at ? `Read ${formatWhen(letter.read_at)}` : `Delivered ${formatWhen(activityAt(letter))}`;
  }
}

const firstLine = (s: string) => s.split('\n').find((l) => l.trim()) ?? '';

type RowProps = {
  now: number;
  selecting?: boolean;
  selected?: boolean;
  onPress: () => void;
  onLongPress?: () => void;
};

export function LetterRow({ letter, now, selecting, selected, onPress, onLongPress }: RowProps & { letter: Letter }) {
  const { transport } = useApp();
  const theme = useTheme();
  const leg = currentLeg(letter);
  const t = transport(leg.transport_id);
  const unread = isUnread(letter);

  return (
    <RowShell selecting={selecting} selected={selected} onPress={onPress} onLongPress={onLongPress}>
      <SelectableAvatar person={letter.other} selecting={selecting} selected={selected} />
      <View style={styles.body}>
        <View style={styles.titleRow}>
          <ThemedText style={[styles.name, unread && { color: theme.accent }]} numberOfLines={1}>
            {letter.role === 'sent' ? `To ${displayName(letter.other)}` : displayName(letter.other)}
          </ThemedText>
          <ThemedText type="small" themeColor="textSecondary">
            {formatWhen(activityAt(letter))}
          </ThemedText>
        </View>
        <View style={styles.titleRow}>
          <ThemedText
            type="small"
            themeColor={letter.status === 'overdue' ? 'textSecondary' : unread ? 'text' : 'textSecondary'}
            style={[styles.preview, unread && { fontWeight: 700 }, letter.status === 'overdue' && { fontStyle: 'italic' }]}
            numberOfLines={1}>
            {letter.status === 'in_transit' ? `${t?.emoji ?? '✉️'} ` : ''}
            {letterStatusLine(letter, now, t?.name)}
          </ThemedText>
          {unread && <View style={[styles.dot, { backgroundColor: theme.accent }]} />}
        </View>
        {letter.status === 'in_transit' && (
          <ProgressBar value={progress(leg.departed_at, leg.arrives_at, now)} />
        )}
      </View>
    </RowShell>
  );
}

export function ConversationRow({ convo, now, selecting, selected, onPress, onLongPress }: RowProps & { convo: Conversation }) {
  const { transport } = useApp();
  const theme = useTheme();
  const last = convo.letters[0]!;
  const t = transport(currentLeg(last).transport_id);
  const line = letterStatusLine(last, now, t?.name);

  return (
    <RowShell selecting={selecting} selected={selected} onPress={onPress} onLongPress={onLongPress}>
      <SelectableAvatar person={convo.person} selecting={selecting} selected={selected} />
      <View style={styles.body}>
        <View style={styles.titleRow}>
          <View style={styles.nameWrap}>
            <ThemedText style={[styles.name, convo.unread > 0 && { color: theme.accent }]} numberOfLines={1}>
              {displayName(convo.person)}
            </ThemedText>
            {convo.person.pinned && <Icon name="pin" size={14} color={theme.textSecondary} />}
            {convo.person.muted && <Icon name="mute" size={14} color={theme.textSecondary} />}
          </View>
          <ThemedText type="small" themeColor="textSecondary">
            {formatWhen(activityAt(last))}
          </ThemedText>
        </View>
        <View style={styles.titleRow}>
          <ThemedText
            type="small"
            themeColor={convo.unread > 0 ? 'text' : 'textSecondary'}
            style={[styles.preview, convo.unread > 0 && { fontWeight: 700 }]}
            numberOfLines={1}>
            {last.role === 'sent' ? 'You: ' : ''}
            {last.status === 'delivered' ? firstLine(last.body) : line}
          </ThemedText>
          {convo.unread > 0 && (
            <View style={[styles.badge, { backgroundColor: theme.accent }]}>
              <ThemedText style={[styles.badgeText, { color: theme.accentText }]}>{convo.unread}</ThemedText>
            </View>
          )}
        </View>
      </View>
    </RowShell>
  );
}

function RowShell({
  children,
  selecting,
  selected,
  onPress,
  onLongPress,
}: Omit<RowProps, 'now'> & { children: React.ReactNode }) {
  const theme = useTheme();
  return (
    <Pressable
      onPress={onPress}
      onLongPress={onLongPress}
      delayLongPress={300}
      accessibilityState={selecting ? { selected } : undefined}
      style={({ pressed }) => [
        styles.row,
        { backgroundColor: selected ? theme.backgroundSelected : theme.backgroundElement },
        pressed && !selecting && { opacity: 0.85 },
      ]}>
      {children}
    </Pressable>
  );
}

function SelectableAvatar({ person, selecting, selected }: { person: Person; selecting?: boolean; selected?: boolean }) {
  const theme = useTheme();
  if (selecting && selected) {
    return (
      <View style={[styles.check, { backgroundColor: theme.accent }]}>
        <Icon name="check" color={theme.accentText} />
      </View>
    );
  }
  if (selecting) return <View style={[styles.check, { borderWidth: 2, borderColor: theme.textSecondary }]} />;
  return <Avatar person={person} />;
}

const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
    padding: Spacing.three,
    borderRadius: Radius.medium,
  },
  body: {
    flex: 1,
    gap: 4,
  },
  titleRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: Spacing.two,
  },
  nameWrap: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.one,
    flexShrink: 1,
  },
  name: {
    fontWeight: 700,
    flexShrink: 1,
  },
  preview: {
    flex: 1,
  },
  dot: {
    width: 10,
    height: 10,
    borderRadius: 5,
  },
  badge: {
    minWidth: 22,
    height: 22,
    borderRadius: 11,
    paddingHorizontal: 6,
    alignItems: 'center',
    justifyContent: 'center',
  },
  badgeText: {
    fontSize: 12,
    lineHeight: 16,
    fontWeight: 700,
  },
  check: {
    width: 44,
    height: 44,
    borderRadius: 22,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
