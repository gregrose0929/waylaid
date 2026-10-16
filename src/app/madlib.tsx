import * as Haptics from 'expo-haptics';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, Pressable, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Avatar } from '@/components/avatar';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { TransportPicker } from '@/components/transport-picker';
import { Button, Card, ErrorText, ProgressBar } from '@/components/ui';
import { Fonts, MaxContentWidth, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api, type MadlibTemplate, type Person } from '@/lib/api';
import { displayName, formatDuration } from '@/lib/format';
import { playCarrier } from '@/lib/sounds';
import { estimateTripMs } from '@/lib/trip';
import { weatherAt, type WeatherNow } from '@/lib/weather';
import { useApp } from '@/providers/app-state';

/**
 * Two-player Mad Libs.
 *  - Start one (`to` optional): pick a template, fill the odd-numbered blanks, send.
 *  - Reply (`reply` = the letter that arrived): fill the even-numbered blanks and send the
 *    finished story back. Neither of you sees the story until your part is done.
 */
export default function MadlibScreen() {
  const params = useLocalSearchParams<{ to?: string; reply?: string }>();
  const { madlibTemplates, friends, mail, me, refreshMail, refreshMe, transport, weatherEffect } = useApp();
  const theme = useTheme();

  const replyTo = params.reply ? mail.find((l) => l.id === params.reply) : undefined;
  const replying = !!params.reply;
  const [template, setTemplate] = useState<MadlibTemplate | null>(null);
  const activeTemplate =
    template ?? (replyTo?.madlib ? (madlibTemplates.find((t) => t.id === replyTo.madlib!.template_id) ?? null) : null);

  // Starting: blanks 1, 3, 5… Replying: blanks 2, 4, 6…
  const myPrompts = (activeTemplate?.prompts ?? []).filter((_, i) => (replying ? i % 2 === 1 : i % 2 === 0));
  const [words, setWords] = useState<string[]>([]);
  const [step, setStep] = useState(0);
  const [toId, setToId] = useState<string | null>(params.to ?? null);
  const to: Person | null = replying
    ? (replyTo?.other ?? null)
    : (friends.friends.find((f) => f.id === toId) ?? null);
  const [carrier, setCarrier] = useState<string | null>('pigeon');
  const [distanceKm, setDistanceKm] = useState<number | null>(null);
  const [weather, setWeather] = useState<WeatherNow | null>(null);
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [done, setDone] = useState<string | null>(null);

  const home = me?.home;
  useEffect(() => {
    if (!home) return;
    weatherAt(home[0], home[1]).then(setWeather);
  }, [home]);
  const toPersonId = to?.id;
  useEffect(() => {
    if (!toPersonId) return;
    api
      .quoteDistance(toPersonId)
      .then(setDistanceKm)
      .catch(() => {});
  }, [toPersonId]);

  const filling = activeTemplate && step < myPrompts.length;
  const current = words[step] ?? '';
  const advance = () => {
    if ((words[step] ?? '').trim()) setStep((s) => s + 1);
  };

  async function send() {
    if (!activeTemplate || !to || !carrier) return;
    setSending(true);
    setError(null);
    try {
      if (replying) await api.replyMadlib(params.reply!, words, carrier, weather?.kind);
      else await api.sendMadlib(to.id, activeTemplate.id, words, carrier, weather?.kind);
      Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
      playCarrier(carrier);
      const t = transport(carrier);
      const eta = t && distanceKm != null ? formatDuration(estimateTripMs(distanceKm, t, weatherEffect(weather?.kind, carrier))) : null;
      setDone(
        replying
          ? `The finished story is flying back to ${displayName(to)}${eta ? ` (about ${eta})` : ''}. You can read it in your Sent letters.`
          : `Your half is on its way to ${displayName(to)}${eta ? ` (about ${eta})` : ''}. When they fill in theirs, the story comes back to you.`,
      );
      refreshMail().catch(() => {});
      refreshMe().catch(() => {});
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setSending(false);
    }
  }

  if (done) {
    return (
      <ThemedView style={[styles.flex, styles.center]}>
        <ThemedText style={styles.big}>🎭</ThemedText>
        <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
          {replying ? 'Story complete!' : 'Your turn is done!'}
        </ThemedText>
        <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
          {done}
        </ThemedText>
        <Button title="Done" onPress={() => router.back()} style={{ alignSelf: 'stretch' }} />
      </ThemedView>
    );
  }

  return (
    <ThemedView style={styles.flex}>
      <Stack.Screen options={{ title: replying ? 'Your turn' : 'Mad Lib' }} />
      <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : 'height'} style={styles.flex}>
        <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="always">
          {!activeTemplate ? (
            replying ? (
              <ThemedText themeColor="textSecondary">Loading this Mad Lib…</ThemedText>
            ) : (
              <>
                <ThemedText themeColor="textSecondary">
                  Pick a story. You’ll fill in half the blanks without seeing it; your friend fills in the rest when it
                  arrives, and the finished story comes back to you.
                </ThemedText>
                {madlibTemplates.map((t) => (
                  <Card key={t.id} onPress={() => setTemplate(t)} style={styles.row}>
                    <ThemedText style={{ fontSize: 30, lineHeight: 38 }}>{t.emoji}</ThemedText>
                    <View style={{ flex: 1 }}>
                      <ThemedText style={{ fontWeight: 700 }}>{t.title}</ThemedText>
                      <ThemedText type="small" themeColor="textSecondary">
                        {Math.ceil(t.prompts.length / 2)} blanks for you, {Math.floor(t.prompts.length / 2)} for them
                      </ThemedText>
                    </View>
                  </Card>
                ))}
              </>
            )
          ) : filling ? (
            <View style={{ gap: Spacing.four }}>
              <View style={{ gap: Spacing.two }}>
                <ThemedText type="small" themeColor="textSecondary">
                  {activeTemplate.emoji} {activeTemplate.title} · blank {step + 1} of {myPrompts.length}
                </ThemedText>
                <ProgressBar value={step / myPrompts.length} />
              </View>
              <ThemedText style={styles.prompt}>
                Give me {/^[aeiou]/i.test(myPrompts[step]!) ? 'an' : 'a'}…
              </ThemedText>
              <ThemedText style={[styles.prompt, { color: theme.accent }]}>{myPrompts[step]}</ThemedText>
              <TextInput
                // a fresh box for every blank, so nothing carries over between steps
                key={step}
                autoFocus
                value={current}
                onChangeText={(t) =>
                  setWords((w) => {
                    const next = [...w];
                    next[step] = t;
                    return next;
                  })
                }
                onSubmitEditing={advance}
                submitBehavior="submit"
                maxLength={40}
                // words land mid-sentence, so don't capitalise them
                autoCapitalize="none"
                returnKeyType="next"
                // No placeholder: on Android a centred box with a placeholder puts the cursor at the far right.
                style={[styles.input, { color: theme.text, borderBottomColor: theme.accent }]}
                selectionColor={theme.accent}
                cursorColor={theme.accent}
              />
              <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center', marginTop: -Spacing.two }}>
                write your {myPrompts[step]} on the line
              </ThemedText>
              <View style={styles.row}>
                {step > 0 && (
                  <Button title="Back" variant="secondary" onPress={() => setStep(step - 1)} style={styles.flex} />
                )}
                <Button title="Next" onPress={advance} disabled={!current.trim()} style={styles.flex} />
              </View>
            </View>
          ) : (
            <>
              <Card style={{ gap: Spacing.two }}>
                <ThemedText style={{ fontWeight: 700 }}>
                  {activeTemplate.emoji} Your words are in!
                </ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {words.map((w, i) => `${myPrompts[i]}: “${w}”`).join(' · ')}
                </ThemedText>
                <Pressable onPress={() => setStep(0)}>
                  <ThemedText type="smallBold" style={{ color: theme.accent }}>
                    Change my words
                  </ThemedText>
                </Pressable>
              </Card>

              {!replying && (
                <View style={{ gap: Spacing.two }}>
                  <ThemedText type="smallBold" themeColor="textSecondary">
                    SEND IT TO
                  </ThemedText>
                  {friends.friends
                    .filter((f) => f.has_home)
                    .map((f) => (
                      <Card
                        key={f.id}
                        onPress={() => setToId(f.id)}
                        style={[styles.row, { borderWidth: 2, borderColor: toId === f.id ? theme.accent : 'transparent' }]}>
                        <Avatar person={f} size={36} />
                        <ThemedText style={{ fontWeight: 700, flex: 1 }}>{displayName(f)}</ThemedText>
                      </Card>
                    ))}
                </View>
              )}
              {replying && to && (
                <ThemedText themeColor="textSecondary">
                  The finished story goes back to {displayName(to)}. Pick how it travels:
                </ThemedText>
              )}

              {to && (
                <>
                  <ThemedText type="smallBold" themeColor="textSecondary">
                    CHOOSE A CARRIER
                  </ThemedText>
                  <TransportPicker distanceKm={distanceKm} value={carrier} onChange={setCarrier} weather={weather?.kind} />
                </>
              )}
            </>
          )}
        </ScrollView>
        {activeTemplate && !filling && (
          <SafeAreaView edges={['bottom']} style={[styles.footer, { borderColor: theme.border }]}>
            <ErrorText>{error}</ErrorText>
            <Button
              title={replying ? 'Send the story back' : 'Send my half'}
              onPress={send}
              loading={sending}
              disabled={!to || !carrier || words.length < myPrompts.length}
            />
          </SafeAreaView>
        )}
      </KeyboardAvoidingView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  center: {
    padding: Spacing.four,
    alignItems: 'center',
    justifyContent: 'center',
    gap: Spacing.three,
  },
  big: {
    fontSize: 72,
    lineHeight: 86,
  },
  content: {
    padding: Spacing.three,
    gap: Spacing.three,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  prompt: {
    fontFamily: Fonts.serif,
    fontSize: 28,
    lineHeight: 36,
    fontWeight: 700,
    textAlign: 'center',
  },
  // A "fill in the blank" line, like writing on a letter.
  input: {
    alignSelf: 'center',
    width: '80%',
    minHeight: 60,
    borderBottomWidth: 2,
    paddingHorizontal: Spacing.two,
    paddingBottom: Spacing.one,
    fontFamily: Fonts.serif,
    fontSize: 28,
    fontStyle: 'italic',
    textAlign: 'center',
  },
  footer: {
    padding: Spacing.three,
    gap: Spacing.two,
    borderTopWidth: StyleSheet.hairlineWidth,
  },
});
