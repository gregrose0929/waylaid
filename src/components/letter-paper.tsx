import type { ReactNode } from 'react';
import { StyleSheet, Text, View, type StyleProp, type TextStyle } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { Fonts, Radius, Spacing } from '@/constants/theme';
import { paperStyle, sealColor } from '@/constants/stationery';
import { useColorScheme } from '@/hooks/use-color-scheme';
import { useTheme } from '@/hooks/use-theme';

/**
 * Letter text where «words» (filled-in Mad Lib blanks) are highlighted.
 */
export function LetterText({ text, style, highlight }: { text: string; style?: StyleProp<TextStyle>; highlight: string }) {
  const parts = text.split(/(«[^»]*»)/g);
  return (
    <Text style={style}>
      {parts.map((p, i) =>
        p.startsWith('«') && p.endsWith('»') ? (
          <Text key={i} style={{ color: highlight, fontWeight: 700, textDecorationLine: 'underline' }}>
            {p.slice(1, -1)}
          </Text>
        ) : (
          p
        ),
      )}
    </Text>
  );
}

/** A wax seal stamped with W. */
export function WaxSeal({ seal, size = 40 }: { seal?: string | null; size?: number }) {
  return (
    <View style={[styles.seal, { width: size, height: size, borderRadius: size / 2, backgroundColor: sealColor(seal) }]}>
      <Text style={[styles.sealText, { fontSize: size * 0.45 }]}>W</Text>
    </View>
  );
}

/** A sheet of the chosen stationery with the letter written on it, signed and sealed. */
export function LetterPaper({
  body,
  paper,
  seal,
  signature,
  children,
}: {
  body: string;
  paper?: string | null;
  seal?: string | null;
  signature?: string;
  children?: ReactNode;
}) {
  const theme = useTheme();
  const scheme = useColorScheme();
  const dark = scheme === 'dark';
  const p = paperStyle(paper);
  const ink = (dark ? p.inkDark : p.inkLight) ?? theme.text;
  return (
    <View
      style={[
        styles.paper,
        { backgroundColor: dark ? p.dark : p.light, borderColor: p.border },
        p.airmail && styles.airmail,
      ]}>
      {p.airmail && <View style={[styles.airmailInner, { borderColor: '#2F5DA8' }]} pointerEvents="none" />}
      {p.corner && <Text style={styles.corner}>{p.corner}</Text>}
      {children}
      {!!body && <LetterText text={body} style={[styles.letter, { color: ink }]} highlight={theme.accent} />}
      <View style={styles.footer}>
        {signature ? (
          <ThemedText style={[styles.letter, styles.signature, { color: ink, opacity: 0.75 }]}>— {signature}</ThemedText>
        ) : (
          <View />
        )}
        <WaxSeal seal={seal} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  paper: {
    borderRadius: Radius.medium,
    borderWidth: StyleSheet.hairlineWidth,
    padding: Spacing.four,
    gap: Spacing.three,
    overflow: 'hidden',
  },
  airmail: {
    borderWidth: 6,
    borderStyle: 'dashed',
  },
  airmailInner: {
    position: 'absolute',
    top: 3,
    left: 3,
    right: 3,
    bottom: 3,
    borderWidth: 2,
    borderStyle: 'dashed',
    borderRadius: Radius.small,
  },
  corner: {
    position: 'absolute',
    top: Spacing.two,
    right: Spacing.two,
    fontSize: 22,
    opacity: 0.8,
  },
  letter: {
    fontFamily: Fonts.serif,
    fontSize: 18,
    lineHeight: 28,
  },
  footer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    gap: Spacing.three,
  },
  signature: {
    flex: 1,
    fontStyle: 'italic',
  },
  seal: {
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 2,
    borderColor: 'rgba(0,0,0,0.15)',
  },
  sealText: {
    color: 'rgba(255,255,255,0.9)',
    fontFamily: Fonts.serif,
    fontWeight: 700,
  },
});
