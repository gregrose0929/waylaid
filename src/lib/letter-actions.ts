import { Alert, Platform } from 'react-native';

import { api, type Letter } from '@/lib/api';

/** Archive, or move back to the mailbox if already archived. */
export async function toggleArchive(letter: Letter, refresh: () => Promise<void>) {
  await api.setLetterState(letter.id, letter.archived ? 'inbox' : 'archived');
  await refresh();
}

/** Ask, then delete the letter from your own mailbox only. Resolves true if deleted. */
export function confirmDelete(letter: Letter, refresh: () => Promise<void>): Promise<boolean> {
  const run = async () => {
    await api.setLetterState(letter.id, 'deleted');
    await refresh();
    return true;
  };
  if (Platform.OS === 'web') return run();
  return new Promise((resolve) => {
    Alert.alert(
      'Delete this letter?',
      'It disappears from your mailbox for good. The other person keeps their copy.',
      [
        { text: 'Cancel', style: 'cancel', onPress: () => resolve(false) },
        { text: 'Delete', style: 'destructive', onPress: () => run().then(resolve, () => resolve(false)) },
      ],
    );
  });
}

/** Long-press menu for a letter in a list. Android allows at most three buttons. */
export function showLetterMenu(letter: Letter, refresh: () => Promise<void>) {
  Alert.alert('Letter', undefined, [
    { text: 'Cancel', style: 'cancel' },
    { text: letter.archived ? 'Unarchive' : 'Archive', onPress: () => toggleArchive(letter, refresh).catch(() => {}) },
    { text: 'Delete', style: 'destructive', onPress: () => confirmDelete(letter, refresh) },
  ]);
}
