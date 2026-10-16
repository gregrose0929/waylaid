import { supabase } from '@/lib/supabase';

export type LatLng = [number, number];

export type Transport = {
  id: string;
  name: string;
  emoji: string;
  tagline: string;
  speed_kmh: number;
  route_factor: number;
  failure_rate: number;
  sort: number;
  /** available from the start; the rest are unlocked by achievements */
  starter: boolean;
};

export type Weather = 'clear' | 'cloudy' | 'fog' | 'rain' | 'snow' | 'storm' | 'wind';

export type WeatherEffect = {
  weather: Weather;
  transport_id: string;
  speed_mult: number;
  risk_mult: number;
};

export type Cosmetic = {
  id: string;
  kind: 'paper' | 'seal';
  name: string;
  /** achievement that unlocks it; null = everyone has it */
  unlocked_by: string | null;
  sort: number;
};

export type MadlibTemplate = { id: string; title: string; emoji: string; prompts: string[]; sort: number };

export type MadlibInfo = { id: string; template_id: string; is_reply: boolean; can_fill: boolean };

export type Chain = {
  id: string;
  max_links: number;
  finished: boolean;
  started_by: Person | null;
  links: { link: number; message_id: string; from: Person; to: Person; body: string; delivered: boolean; transport_id: string }[];
};

export type Achievement = {
  id: string;
  title: string;
  description: string;
  emoji: string;
  goal: number;
  progress: number;
  /** carrier this achievement unlocks, if any */
  unlocks: string | null;
  unlocked_at: string | null;
};

/** How you relate to someone. Being blocked by them always reads as 'none'. */
export type Relationship = 'friend' | 'incoming' | 'outgoing' | 'blocked' | 'none';

export type Person = {
  id: string;
  username: string;
  display_name: string | null;
  /** your private name for them, if they're in your contacts */
  nickname: string | null;
  is_contact: boolean;
  has_home: boolean;
  relationship: Relationship;
  pinned: boolean;
  muted: boolean;
};

export type Me = {
  id: string;
  username: string;
  display_name: string | null;
  home: LatLng | null;
  home_label: string | null;
  share_precise_home: boolean;
  unlocked_carriers: string[];
  unlocked_cosmetics?: string[];
  /** achievements earned since you last looked */
  new_achievements: { id: string; title: string; emoji: string; unlocks: string | null }[];
  stats: { sent: number; delivered: number; received: number; found: number; achievements: number };
};

export type Friends = {
  friends: Person[];
  incoming: Person[];
  outgoing: Person[];
  blocked: Person[];
};

/**
 * What you're allowed to know about a letter. Received letters are always 'delivered'
 * (you never see them before). Sent letters are 'in_transit' until due, then 'overdue'
 * forever unless they're eventually delivered.
 */
export type MessageStatus = 'in_transit' | 'delivered' | 'overdue';

export type LegOutcome =
  | 'in_transit'
  | 'overdue'
  | 'arrived'
  | 'lost'
  | 'forwarded'
  | 'found_by_recipient';

export type Leg = {
  leg_no: number;
  transport_id: string;
  carrier: 'you' | 'sender' | 'stranger';
  departed_at: string;
  arrives_at: string;
  distance_km: number;
  weather: Weather | null;
  origin: LatLng;
  destination: LatLng;
  outcome: LegOutcome;
  fail_reason: string | null;
  last_seen: LatLng | null;
  last_seen_town: string | null;
  opened_by_finder: boolean;
};

export type Letter = {
  id: string;
  role: 'sent' | 'received';
  status: MessageStatus;
  archived: boolean;
  marked_unread: boolean;
  created_at: string;
  read_at: string | null;
  delivered_at: string | null;
  body: string;
  /** postcard photo in the private "postcards" bucket */
  photo_path: string | null;
  paper?: string;
  seal?: string;
  chain_id?: string | null;
  chain_link?: number | null;
  /** you hold this chain letter and can pass it on or end it */
  chain_can_pass?: boolean;
  madlib?: MadlibInfo | null;
  other: Person;
  legs: Leg[];
};

export type Wreck = {
  leg_id: string;
  transport_id: string;
  fail_reason: string;
  /** the town it was pulled into, e.g. "Muncie, IN" */
  town: string | null;
  lost_at: string;
  coords: LatLng;
  distance_m: number;
};

export type FoundLetter = {
  leg_id: string;
  message_id: string;
  transport_id: string;
  fail_reason: string;
  town: string | null;
  found_at: string;
  opened_at: string | null;
  forwarded: boolean;
  /** the letter's true state (finders get to see it) */
  status: 'in_transit' | 'delivered' | 'lost' | 'found';
  from: Person;
  to: Person;
  body: string | null;
  has_photo: boolean;
  photo_path: string | null;
  seal?: string;
  paper?: string | null;
  chain_id?: string | null;
};

export type LetterState = 'inbox' | 'archived' | 'deleted' | 'restored' | 'unread' | 'read';

export type PickUpResult =
  | { outcome: 'delivered'; message_id: string }
  | { outcome: 'found'; leg_id: string };

async function rpc<T>(fn: string, args?: Record<string, unknown>): Promise<T> {
  const { data, error } = await supabase.rpc(fn, args);
  if (error) throw new Error(error.message);
  return data as T;
}

export const api = {
  transports: async () => {
    const { data, error } = await supabase.from('transports').select('*').order('sort');
    if (error) throw new Error(error.message);
    return data as Transport[];
  },
  me: () => rpc<Me | null>('get_me'),
  achievements: () => rpc<Achievement[]>('get_achievements'),
  markAchievementsSeen: () => rpc<void>('mark_achievements_seen'),
  achievementCatalog: async () => {
    const { data, error } = await supabase.from('achievements').select('id, title, emoji, unlocks').order('sort');
    if (error) throw new Error(error.message);
    return data as Pick<Achievement, 'id' | 'title' | 'emoji' | 'unlocks'>[];
  },
  cosmetics: async () => {
    const { data, error } = await supabase.from('cosmetics').select('*').order('sort');
    if (error) throw new Error(error.message);
    return data as Cosmetic[];
  },
  madlibTemplates: async () => {
    const { data, error } = await supabase.from('madlib_templates').select('id, title, emoji, prompts, sort').order('sort');
    if (error) throw new Error(error.message);
    return data as MadlibTemplate[];
  },
  weatherEffects: async () => {
    const { data, error } = await supabase.from('weather_effects').select('*');
    if (error) throw new Error(error.message);
    return data as WeatherEffect[];
  },
  saveProfile: (username: string, displayName: string) =>
    rpc<void>('save_profile', { p_username: username, p_display_name: displayName }),
  setHome: (lat: number, lng: number, label: string) =>
    rpc<void>('set_home', { p_lat: lat, p_lng: lng, p_label: label }),
  setSharePreciseHome: (share: boolean) => rpc<void>('set_share_precise_home', { p_share: share }),
  deleteAccount: () => rpc<void>('delete_account'),
  findUsers: (query: string) => rpc<Person[]>('find_users', { p_query: query }),

  // contacts (private nicknames)
  saveContact: (personId: string, nickname: string) =>
    rpc<void>('save_contact', { p_contact: personId, p_nickname: nickname }),
  removeContact: (personId: string) => rpc<void>('remove_contact', { p_contact: personId }),

  // friends
  friends: () => rpc<Friends>('get_friends'),
  addFriend: (personId: string) => rpc<Relationship>('send_friend_request', { p_user: personId }),
  respondFriend: (personId: string, accept: boolean) =>
    rpc<void>('respond_friend_request', { p_user: personId, p_accept: accept }),
  cancelFriendRequest: (personId: string) => rpc<void>('cancel_friend_request', { p_user: personId }),
  removeFriend: (personId: string) => rpc<void>('remove_friend', { p_user: personId }),
  block: (personId: string) => rpc<void>('block_user', { p_user: personId }),
  unblock: (personId: string) => rpc<void>('unblock_user', { p_user: personId }),

  // conversations
  setConversationPref: (personId: string, prefs: { pinned?: boolean; muted?: boolean }) =>
    rpc<void>('set_conversation_pref', {
      p_other: personId,
      p_pinned: prefs.pinned ?? null,
      p_muted: prefs.muted ?? null,
    }),

  // letters
  quoteDistance: (recipientId: string, from?: { lat: number; lng: number }) =>
    rpc<number>('quote_distance', {
      p_recipient: recipientId,
      p_lat: from?.lat ?? null,
      p_lng: from?.lng ?? null,
    }),
  send: (
    recipientId: string,
    body: string,
    transportId: string,
    extras: {
      weather?: Weather | null;
      photoPath?: string | null;
      paper?: string | null;
      seal?: string | null;
      startChain?: boolean;
      /** pass on the chain letter with this message id */
      chainFrom?: string | null;
    } = {},
  ) =>
    rpc<string>('send_message', {
      p_recipient: recipientId,
      p_body: body,
      p_transport: transportId,
      p_weather: extras.weather ?? null,
      p_photo: extras.photoPath ?? null,
      p_paper: extras.paper ?? null,
      p_seal: extras.seal ?? null,
      p_start_chain: extras.startChain ?? false,
      p_chain_from: extras.chainFrom ?? null,
    }),
  getChain: (chainId: string) => rpc<Chain>('get_chain', { p_chain: chainId }),
  endChain: (messageId: string) => rpc<void>('end_chain', { p_message: messageId }),
  sendMadlib: (recipientId: string, templateId: string, words: string[], transportId: string, weather?: Weather | null) =>
    rpc<string>('send_madlib', {
      p_recipient: recipientId,
      p_template: templateId,
      p_words: words,
      p_transport: transportId,
      p_weather: weather ?? null,
    }),
  replyMadlib: (messageId: string, words: string[], transportId: string, weather?: Weather | null) =>
    rpc<string>('reply_madlib', { p_message: messageId, p_words: words, p_transport: transportId, p_weather: weather ?? null }),
  mail: () => rpc<Letter[]>('get_mail'),
  markRead: (messageId: string) => rpc<void>('mark_read', { p_message: messageId }),
  setLettersState: (messageIds: string[], state: LetterState) =>
    rpc<void>('set_letters_state', { p_messages: messageIds, p_state: state }),

  // lost & found
  nearbyWrecks: (lat: number, lng: number) =>
    rpc<Wreck[]>('nearby_wrecks', { p_lat: lat, p_lng: lng }),
  pickUp: (legId: string, lat: number, lng: number) =>
    rpc<PickUpResult>('pick_up', { p_leg: legId, p_lat: lat, p_lng: lng }),
  found: () => rpc<FoundLetter[]>('get_found'),
  openFound: (legId: string) => rpc<string>('open_found', { p_leg: legId }),
  forwardFound: (legId: string, transportId: string, lat: number, lng: number, weather?: Weather | null) =>
    rpc<string>('forward_found', {
      p_leg: legId,
      p_transport: transportId,
      p_lat: lat,
      p_lng: lng,
      p_weather: weather ?? null,
    }),

  // push
  registerPushToken: (token: string) => rpc<void>('register_push_token', { p_token: token }),
  unregisterPushToken: (token: string) => rpc<void>('unregister_push_token', { p_token: token }),
};

/** Unread = arrived to you and either never opened or marked unread. */
export const isUnread = (l: Letter) => l.role === 'received' && (!l.read_at || l.marked_unread);

/** When a letter last "happened": arrival for delivered letters, sending otherwise. */
export const activityAt = (l: Letter) => l.delivered_at ?? l.created_at;
