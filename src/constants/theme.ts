/**
 * Slowpost's look: warm paper, ink, and a wax-seal red.
 */

import '@/global.css';

import { Platform } from 'react-native';

export const Colors = {
  light: {
    text: '#2B2620',
    background: '#FBF7F0',
    backgroundElement: '#F2EBDF',
    backgroundSelected: '#E6DCCB',
    textSecondary: '#7A6F62',
    accent: '#C0452F',
    accentText: '#FFFFFF',
    success: '#3C7D4F',
    danger: '#B33A3A',
    border: '#E2D8C7',
  },
  dark: {
    text: '#F3EDE3',
    background: '#15130F',
    backgroundElement: '#211E19',
    backgroundSelected: '#2E2A23',
    textSecondary: '#A79C8C',
    accent: '#E0664E',
    accentText: '#FFFFFF',
    success: '#6DB582',
    danger: '#E07070',
    border: '#332E26',
  },
} as const;

export type ThemeColor = keyof typeof Colors.light & keyof typeof Colors.dark;

export const Fonts = Platform.select({
  ios: {
    /** iOS `UIFontDescriptorSystemDesignDefault` */
    sans: 'system-ui',
    /** iOS `UIFontDescriptorSystemDesignSerif` */
    serif: 'ui-serif',
    /** iOS `UIFontDescriptorSystemDesignRounded` */
    rounded: 'ui-rounded',
    /** iOS `UIFontDescriptorSystemDesignMonospaced` */
    mono: 'ui-monospace',
  },
  default: {
    sans: 'normal',
    serif: 'serif',
    rounded: 'normal',
    mono: 'monospace',
  },
  web: {
    sans: 'var(--font-display)',
    serif: 'var(--font-serif)',
    rounded: 'var(--font-rounded)',
    mono: 'var(--font-mono)',
  },
});

export const Spacing = {
  half: 2,
  one: 4,
  two: 8,
  three: 16,
  four: 24,
  five: 32,
  six: 64,
} as const;

export const Radius = {
  small: 10,
  medium: 16,
  large: 24,
} as const;

export const BottomTabInset = Platform.select({ ios: 50, android: 80 }) ?? 0;
export const MaxContentWidth = 800;
