import * as Haptics from 'expo-haptics';
import { router } from 'expo-router';
import { useEffect } from 'react';
import { Modal, StyleSheet, View } from 'react-native';
import Animated, { ZoomIn } from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui';
import { Fonts, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api } from '@/lib/api';
import { playSound } from '@/lib/sounds';
import { useApp } from '@/providers/app-state';

/** Pops up whenever the server reports achievements you haven't seen yet. */
export function AchievementCelebration() {
  const { me, refreshMe, transport } = useApp();
  const theme = useTheme();
  const fresh = me?.new_achievements ?? [];
  const visible = fresh.length > 0;

  useEffect(() => {
    if (!visible) return;
    Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
    playSound('achievement');
  }, [visible]);

  const dismiss = async (thenSee?: boolean) => {
    await api.markAchievementsSeen().catch(() => {});
    await refreshMe();
    if (thenSee) router.push('/achievements');
  };

  const carriers = fresh.map((a) => (a.unlocks ? transport(a.unlocks) : undefined)).filter((t) => !!t);

  return (
    <Modal visible={visible} transparent animationType="fade" onRequestClose={() => dismiss()}>
      <View style={styles.scrim}>
        <Animated.View entering={ZoomIn.springify()} style={[styles.card, { backgroundColor: theme.background }]}>
          <ThemedText style={styles.trophy}>🏆</ThemedText>
          <ThemedText type="smallBold" themeColor="textSecondary">
            ACHIEVEMENT{fresh.length > 1 ? 'S' : ''} UNLOCKED
          </ThemedText>
          {fresh.map((a) => (
            <ThemedText key={a.id} style={styles.title}>
              {a.emoji} {a.title}
            </ThemedText>
          ))}
          {carriers.length > 0 && (
            <View style={[styles.unlock, { backgroundColor: theme.backgroundElement }]}>
              <ThemedText style={{ textAlign: 'center' }}>
                New carrier{carriers.length > 1 ? 's' : ''}:{' '}
                <ThemedText style={{ fontWeight: 700 }}>
                  {carriers.map((t) => `${t!.emoji} ${t!.name}`).join(', ')}
                </ThemedText>
              </ThemedText>
            </View>
          )}
          <Button title="Nice!" onPress={() => dismiss()} style={{ alignSelf: 'stretch' }} />
          <Button title="See all achievements" variant="ghost" onPress={() => dismiss(true)} />
        </Animated.View>
      </View>
    </Modal>
  );
}

const styles = StyleSheet.create({
  scrim: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.45)',
    alignItems: 'center',
    justifyContent: 'center',
    padding: Spacing.four,
  },
  card: {
    width: '100%',
    maxWidth: 420,
    borderRadius: Radius.large,
    padding: Spacing.four,
    alignItems: 'center',
    gap: Spacing.two,
  },
  trophy: {
    fontSize: 64,
    lineHeight: 76,
  },
  title: {
    fontFamily: Fonts.serif,
    fontSize: 22,
    lineHeight: 30,
    fontWeight: 700,
    textAlign: 'center',
  },
  unlock: {
    alignSelf: 'stretch',
    borderRadius: Radius.medium,
    padding: Spacing.three,
    marginVertical: Spacing.two,
  },
});
