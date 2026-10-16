import { StyleSheet, Text, View } from 'react-native';

import { displayName } from '@/lib/format';

// Warm, stamp-like colours that read well with white initials in light and dark mode.
const PALETTE = ['#C0452F', '#3C7D4F', '#2F6E9E', '#8A5A2B', '#7B4BA0', '#B0742A', '#4F7C7A', '#9E3D6B'];

function hash(s: string) {
  let h = 0;
  for (let i = 0; i < s.length; i++) h = (h * 31 + s.charCodeAt(i)) | 0;
  return Math.abs(h);
}

/** Round initials badge; the colour is stable per person. */
export function Avatar({
  person,
  size = 44,
}: {
  person: { id: string; username: string; display_name: string | null; nickname?: string | null };
  size?: number;
}) {
  const name = displayName(person).replace(/^@/, '');
  const initials = name
    .split(/\s+/)
    .filter(Boolean)
    .slice(0, 2)
    .map((w) => w[0]!.toUpperCase())
    .join('');
  return (
    <View
      style={[
        styles.circle,
        { width: size, height: size, borderRadius: size / 2, backgroundColor: PALETTE[hash(person.id) % PALETTE.length] },
      ]}>
      <Text style={[styles.text, { fontSize: size * 0.4 }]}>{initials || '?'}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  circle: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    color: '#FFFFFF',
    fontWeight: 700,
  },
});
