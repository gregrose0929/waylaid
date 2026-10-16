import * as Haptics from 'expo-haptics';
import { router, useLocalSearchParams } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, Pressable, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Avatar } from '@/components/avatar';
import { Icon } from '@/components/icon';
import { Postcard } from '@/components/postcard';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { TransportPicker } from '@/components/transport-picker';
import { Button, Card, ErrorText, Field } from '@/components/ui';
import { Fonts, MaxContentWidth, Radius, Spacing } from '@/constants/theme';
import { useTheme } from '@/hooks/use-theme';
import { api, type Person } from '@/lib/api';
import { displayName, formatDistance, formatDuration } from '@/lib/format';
import { pickPhoto, uploadPostcard } from '@/lib/postcards';
import { estimateTripMs } from '@/lib/trip';
import { weatherAt, type WeatherNow } from '@/lib/weather';
import { useApp } from '@/providers/app-state';

export default function ComposeScreen() {
  const params = useLocalSearchParams<{ to?: string }>();
  const { me, transport, units, refreshMail, refreshMe, friends, weatherEffect } = useApp();
  const theme = useTheme();

  const [query, setQuery] = useState('');
  // You can only write to friends, so the recipient is picked from your friends list.
  const [to, setTo] = useState<Person | null>(() => friends.friends.find((f) => f.id === params.to) ?? null);
  const [quote, setQuote] = useState<{ recipientId: string; km: number } | null>(null);
  const [body, setBody] = useState('');
  const [carrier, setCarrier] = useState<string | null>('pigeon');
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [sent, setSent] = useState<{ emoji: string; eta: number } | null>(null);
  const [photo, setPhoto] = useState<string | null>(null);
  const [weather, setWeather] = useState<WeatherNow | null>(null);

  // The weather where the letter sets off (your mailbox) affects every carrier differently.
  const home = me?.home;
  useEffect(() => {
    if (!home) return;
    weatherAt(home[0], home[1]).then(setWeather);
  }, [home]);

  const q = query.trim().toLowerCase();
  const results = friends.friends.filter(
    (f) => !q || [f.username, f.display_name, f.nickname].some((s) => s?.toLowerCase().includes(q)),
  );

  // Distance decides every carrier's ETA.
  const distanceKm = to && quote?.recipientId === to.id ? quote.km : null;
  useEffect(() => {
    if (!to) return;
    api
      .quoteDistance(to.id)
      .then((km) => setQuote({ recipientId: to.id, km }))
      .catch((e) => setError(e.message));
  }, [to]);

  async function send() {
    if (!to || !carrier) return;
    setSending(true);
    setError(null);
    try {
      const photoPath = photo && me ? await uploadPostcard(photo, me.id) : null;
      await api.send(to.id, body, carrier, weather?.kind, photoPath);
      Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success).catch(() => {});
      const t = transport(carrier);
      const fx = weatherEffect(weather?.kind, carrier);
      setSent({ emoji: t?.emoji ?? '✉️', eta: t && distanceKm != null ? estimateTripMs(distanceKm, t, fx) : 0 });
      refreshMail().catch(() => {});
      refreshMe().catch(() => {});
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e));
    } finally {
      setSending(false);
    }
  }

  if (sent) {
    return (
      <ThemedView style={[styles.flex, styles.sent]}>
        <ThemedText style={styles.sentEmoji}>{sent.emoji}</ThemedText>
        <ThemedText type="subtitle" style={{ textAlign: 'center' }}>
          It’s on its way!
        </ThemedText>
        <ThemedText themeColor="textSecondary" style={{ textAlign: 'center' }}>
          If all goes well, {to ? displayName(to) : 'they'} will have it in about {formatDuration(sent.eta)}.
        </ThemedText>
        <Button title="Done" onPress={() => router.back()} style={{ alignSelf: 'stretch' }} />
      </ThemedView>
    );
  }

  const chosen = carrier ? transport(carrier) : undefined;
  const canSend = !!to && !!carrier && (body.trim().length > 0 || !!photo) && distanceKm != null;

  return (
    <ThemedView style={styles.flex}>
      <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? 'padding' : undefined} style={styles.flex}>
        <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="handled">
          {/* To */}
          {to ? (
            <Card style={styles.toCard}>
              <Avatar person={to} size={40} />
              <View style={{ flex: 1 }}>
                <ThemedText type="small" themeColor="textSecondary">
                  To
                </ThemedText>
                <ThemedText style={{ fontWeight: 700 }}>
                  {displayName(to)} {to.display_name ? <ThemedText themeColor="textSecondary">@{to.username}</ThemedText> : null}
                </ThemedText>
                {distanceKm != null && (
                  <ThemedText type="small" themeColor="textSecondary">
                    {formatDistance(distanceKm, units)} away
                  </ThemedText>
                )}
              </View>
              <Pressable onPress={() => setTo(null)} hitSlop={12}>
                <ThemedText type="smallBold" style={{ color: theme.accent }}>
                  Change
                </ThemedText>
              </Pressable>
            </Card>
          ) : (
            <View style={{ gap: Spacing.two }}>
              {friends.friends.length === 0 ? (
                <Card style={{ alignItems: 'center', paddingVertical: Spacing.four }}>
                  <ThemedText style={{ fontSize: 40, lineHeight: 50 }}>🤝</ThemedText>
                  <ThemedText style={{ fontWeight: 700 }}>Add a friend first</ThemedText>
                  <ThemedText type="small" themeColor="textSecondary" style={{ textAlign: 'center' }}>
                    Letters can only go to friends. Send someone a friend request and write once they accept.
                  </ThemedText>
                  <Button
                    title="Find friends"
                    variant="secondary"
                    onPress={() => {
                      router.back();
                      router.push('/friends');
                    }}
                  />
                </Card>
              ) : (
                <>
                  <Field
                    label="To"
                    placeholder="Search your friends"
                    autoCapitalize="none"
                    autoCorrect={false}
                    value={query}
                    onChangeText={setQuery}
                  />
                  {results.map((r) => (
                    <Card
                      key={r.id}
                      onPress={() => {
                        if (!r.has_home) return;
                        setTo(r);
                        setQuery('');
                        setError(null);
                      }}
                      style={[styles.toCard, !r.has_home && { opacity: 0.5 }]}>
                      <Avatar person={r} size={36} />
                      <View style={{ flex: 1 }}>
                        <ThemedText style={{ fontWeight: 700 }}>{displayName(r)}</ThemedText>
                        <ThemedText type="small" themeColor="textSecondary">
                          @{r.username}
                          {r.has_home ? '' : ' · hasn’t set up a mailbox yet'}
                        </ThemedText>
                      </View>
                    </Card>
                  ))}
                </>
              )}
            </View>
          )}

          {/* Letter (and optional postcard photo) */}
          {photo && (
            <View>
              <Postcard uri={photo} />
              <Pressable
                onPress={() => setPhoto(null)}
                accessibilityLabel="Remove photo"
                style={[styles.removePhoto, { backgroundColor: theme.text }]}>
                <Icon name="close" size={18} color={theme.background} />
              </Pressable>
            </View>
          )}
          <View style={[styles.paper, { backgroundColor: theme.backgroundElement, borderColor: theme.border }]}>
            <TextInput
              multiline
              placeholder={photo ? 'Wish you were here…' : 'Dear friend…'}
              placeholderTextColor={theme.textSecondary}
              value={body}
              onChangeText={setBody}
              maxLength={2000}
              style={[styles.letter, { color: theme.text }]}
            />
            <View style={styles.paperFooter}>
              {!photo && Platform.OS !== 'web' && (
                <Pressable
                  onPress={() =>
                    pickPhoto()
                      .then((uri) => uri && setPhoto(uri))
                      .catch((e) => setError(String(e)))
                  }
                  style={styles.addPhoto}
                  accessibilityRole="button">
                  <ThemedText type="smallBold" style={{ color: theme.accent }}>
                    📷 Make it a postcard
                  </ThemedText>
                </Pressable>
              )}
              <ThemedText type="small" themeColor="textSecondary" style={{ marginLeft: 'auto' }}>
                {body.length}/2000
              </ThemedText>
            </View>
          </View>

          {/* Weather + carrier */}
          {weather && (
            <Card style={styles.weather}>
              <ThemedText style={{ fontSize: 28, lineHeight: 34 }}>{weather.emoji}</ThemedText>
              <View style={{ flex: 1 }}>
                <ThemedText style={{ fontWeight: 700 }}>
                  {weather.label} at your mailbox{weather.tempC != null ? ` · ${Math.round(weather.tempC)}°C` : ''}
                </ThemedText>
                <ThemedText type="small" themeColor="textSecondary">
                  {weather.kind === 'clear' || weather.kind === 'cloudy'
                    ? 'Good flying weather.'
                    : 'Some carriers handle this better than others.'}
                </ThemedText>
              </View>
            </Card>
          )}
          <ThemedText type="smallBold" themeColor="textSecondary">
            CHOOSE A CARRIER
          </ThemedText>
          <TransportPicker distanceKm={distanceKm} value={carrier} onChange={setCarrier} weather={weather?.kind} />
        </ScrollView>

        <SafeAreaView edges={['bottom']} style={[styles.footer, { borderColor: theme.border }]}>
          <ErrorText>{error}</ErrorText>
          <Button
            title={chosen ? `Send by ${chosen.name} ${chosen.emoji}` : 'Send'}
            onPress={send}
            loading={sending}
            disabled={!canSend}
          />
        </SafeAreaView>
      </KeyboardAvoidingView>
    </ThemedView>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  content: {
    padding: Spacing.three,
    gap: Spacing.three,
    width: '100%',
    maxWidth: MaxContentWidth,
    alignSelf: 'center',
  },
  removePhoto: {
    position: 'absolute',
    top: Spacing.two,
    right: Spacing.two,
    width: 32,
    height: 32,
    borderRadius: 16,
    alignItems: 'center',
    justifyContent: 'center',
  },
  paperFooter: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  addPhoto: {
    paddingVertical: Spacing.one,
  },
  weather: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  toCard: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.three,
  },
  paper: {
    borderRadius: Radius.medium,
    borderWidth: StyleSheet.hairlineWidth,
    padding: Spacing.three,
  },
  letter: {
    minHeight: 160,
    fontFamily: Fonts.serif,
    fontSize: 18,
    lineHeight: 26,
    textAlignVertical: 'top',
  },
  footer: {
    padding: Spacing.three,
    gap: Spacing.two,
    borderTopWidth: StyleSheet.hairlineWidth,
  },
  sent: {
    padding: Spacing.four,
    alignItems: 'center',
    justifyContent: 'center',
    gap: Spacing.three,
  },
  sentEmoji: {
    fontSize: 80,
    lineHeight: 96,
  },
});
