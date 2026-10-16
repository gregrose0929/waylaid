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
  stats: { sent: number; delivered: number; received: number; found: number };
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
  origin: LatLng;
  destination: LatLng;
  outcome: LegOutcome;
  fail_reason: string | null;
  last_seen: LatLng | null;
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
  other: Person;
  legs: Leg[];
};

export type Wreck = {
  leg_id: string;
  transport_id: string;
  fail_reason: string;
  lost_at: string;
  coords: LatLng;
  distance_m: number;
};

export type FoundLetter = {
  leg_id: string;
  message_id: string;
  transport_id: string;
  fail_reason: string;
  found_at: string;
  opened_at: string | null;
  forwarded: boolean;
  /** the letter's true state (finders get to see it) */
  status: 'in_transit' | 'delivered' | 'lost' | 'found';
  from: Person;
  to: Person;
  body: string | null;
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
  send: (recipientId: string, body: string, transportId: string) =>
    rpc<string>('send_message', { p_recipient: recipientId, p_body: body, p_transport: transportId }),
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
  forwardFound: (legId: string, transportId: string, lat: number, lng: number) =>
    rpc<string>('forward_found', { p_leg: legId, p_transport: transportId, p_lat: lat, p_lng: lng }),

  // push
  registerPushToken: (token: string) => rpc<void>('register_push_token', { p_token: token }),
  unregisterPushToken: (token: string) => rpc<void>('unregister_push_token', { p_token: token }),
};

/** Unread = arrived to you and either never opened or marked unread. */
export const isUnread = (l: Letter) => l.role === 'received' && (!l.read_at || l.marked_unread);

/** When a letter last "happened": arrival for delivered letters, sending otherwise. */
export const activityAt = (l: Letter) => l.delivered_at ?? l.created_at;
