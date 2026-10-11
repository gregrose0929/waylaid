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

export type Person = {
  id: string;
  username: string;
  display_name: string | null;
};

export type Me = Person & {
  home: LatLng | null;
  home_label: string | null;
  stats: { sent: number; received: number; lost: number; found: number };
};

export type MessageStatus = 'in_transit' | 'delivered' | 'lost' | 'found';

export type LegOutcome =
  | 'in_transit'
  | 'arrived'
  | 'lost'
  | 'found'
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
  created_at: string;
  read_at: string | null;
  delivered_at: string | null;
  body: string | null;
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
  addressed_to_you: boolean;
};

export type FoundLetter = {
  leg_id: string;
  message_id: string;
  transport_id: string;
  fail_reason: string;
  found_at: string;
  opened_at: string | null;
  forwarded: boolean;
  status: MessageStatus;
  from: Person;
  to: Person;
  body: string | null;
};

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
  findUsers: (query: string) =>
    rpc<(Person & { has_home: boolean })[]>('find_users', { p_query: query }),
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
  nearbyWrecks: (lat: number, lng: number) =>
    rpc<Wreck[]>('nearby_wrecks', { p_lat: lat, p_lng: lng }),
  pickUp: (legId: string, lat: number, lng: number) =>
    rpc<PickUpResult>('pick_up', { p_leg: legId, p_lat: lat, p_lng: lng }),
  found: () => rpc<FoundLetter[]>('get_found'),
  openFound: (legId: string) => rpc<string>('open_found', { p_leg: legId }),
  forwardFound: (legId: string, transportId: string, lat: number, lng: number) =>
    rpc<string>('forward_found', { p_leg: legId, p_transport: transportId, p_lat: lat, p_lng: lng }),
};
