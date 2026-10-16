import { SymbolView } from 'expo-symbols';

import { useTheme } from '@/hooks/use-theme';

/** SF Symbols on iOS, Material Symbols on Android and web. */
const NAMES = {
  archive: { ios: 'archivebox', android: 'archive' },
  unarchive: { ios: 'tray.and.arrow.up', android: 'unarchive' },
  trash: { ios: 'trash', android: 'delete' },
  unread: { ios: 'envelope.badge', android: 'mark_email_unread' },
  read: { ios: 'envelope.open', android: 'drafts' },
  search: { ios: 'magnifyingglass', android: 'search' },
  close: { ios: 'xmark', android: 'close' },
  check: { ios: 'checkmark', android: 'check' },
  selectAll: { ios: 'checkmark.circle', android: 'select_all' },
  pin: { ios: 'pin', android: 'push_pin' },
  mute: { ios: 'bell.slash', android: 'notifications_off' },
  settings: { ios: 'gearshape', android: 'settings' },
  addPerson: { ios: 'person.badge.plus', android: 'person_add' },
  people: { ios: 'person.2', android: 'group' },
  send: { ios: 'paperplane.fill', android: 'send' },
  write: { ios: 'square.and.pencil', android: 'edit_square' },
  edit: { ios: 'pencil', android: 'edit' },
  chevron: { ios: 'chevron.right', android: 'chevron_right' },
  block: { ios: 'hand.raised', android: 'block' },
  more: { ios: 'ellipsis.circle', android: 'more_vert' },
  location: { ios: 'location', android: 'my_location' },
  bell: { ios: 'bell', android: 'notifications' },
} as const;

export type IconName = keyof typeof NAMES;

export function Icon({ name, size = 22, color }: { name: IconName; size?: number; color?: string }) {
  const theme = useTheme();
  const n = NAMES[name];
  return (
    <SymbolView
      name={{ ios: n.ios, android: n.android, web: n.android } as never}
      size={size}
      tintColor={color ?? theme.text}
    />
  );
}
