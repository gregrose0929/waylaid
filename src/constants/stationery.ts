/** How each paper and wax seal looks. Unlocks live in the `cosmetics` table. */

export type PaperStyle = {
  /** paper colour in light and dark mode */
  light: string;
  dark: string;
  /** ink colour on that paper (null = normal theme text) */
  inkLight: string | null;
  inkDark: string | null;
  border: string;
  /** decoration in the corner, if any */
  corner?: string;
  /** airmail's red-and-blue edge */
  airmail?: boolean;
};

export const PAPERS: Record<string, PaperStyle> = {
  classic: { light: '#F2EBDF', dark: '#211E19', inkLight: null, inkDark: null, border: '#E2D8C7' },
  airmail: { light: '#F7F4EE', dark: '#1F2228', inkLight: null, inkDark: null, border: '#C0452F', airmail: true, corner: '✈️' },
  parchment: { light: '#EADBB8', dark: '#3A3020', inkLight: '#4A3B22', inkDark: '#EADBB8', border: '#CDB98A', corner: '📜' },
  botanical: { light: '#EEF3E6', dark: '#1C2619', inkLight: '#2F4A26', inkDark: '#D8E8CC', border: '#C9D9B8', corner: '🌿' },
  love: { light: '#FBE4EA', dark: '#3A1F27', inkLight: '#7A2944', inkDark: '#F8D4DE', border: '#F2BACA', corner: '💕' },
  storm: { light: '#DCE1E8', dark: '#1E232B', inkLight: '#2D3846', inkDark: '#D3DAE4', border: '#B9C2CE', corner: '⛈️' },
  midnight: { light: '#1E2233', dark: '#141726', inkLight: '#E9E6F5', inkDark: '#E9E6F5', border: '#33395A', corner: '🌙' },
};

export const SEALS: Record<string, string> = {
  red: '#C0452F',
  navy: '#24376B',
  green: '#2F6B45',
  purple: '#6B3FA0',
  pink: '#D9668C',
  black: '#1E1E1E',
  silver: '#9AA1AA',
  gold: '#C9A227',
};

export const paperStyle = (id?: string | null) => PAPERS[id ?? 'classic'] ?? PAPERS.classic!;
export const sealColor = (id?: string | null) => SEALS[id ?? 'red'] ?? SEALS.red!;
