import { useCallback } from 'react';

import { useToast } from '@/components/toast';
import { api, type LetterState } from '@/lib/api';
import { useApp } from '@/providers/app-state';

const count = (n: number, what = 'letter') => (n === 1 ? `1 ${what}` : `${n} ${what}s`);

/**
 * Mailbox actions on one or many letters, Gmail-style: act immediately and offer
 * Undo in a snackbar instead of asking "are you sure?". All of them only affect
 * your own mailbox.
 */
export function useLetterActions() {
  const { refreshMail } = useApp();
  const toast = useToast();

  const apply = useCallback(
    async (ids: string[], state: LetterState, message: string, undo?: LetterState) => {
      if (ids.length === 0) return;
      try {
        await api.setLettersState(ids, state);
        await refreshMail();
        toast(
          message,
          undo
            ? {
                label: 'Undo',
                onPress: () => {
                  api
                    .setLettersState(ids, undo)
                    .then(refreshMail)
                    .catch(() => {});
                },
              }
            : undefined,
        );
      } catch (e) {
        toast(e instanceof Error ? e.message : String(e));
      }
    },
    [refreshMail, toast],
  );

  return {
    archive: (ids: string[]) => apply(ids, 'archived', `${count(ids.length)} archived`, 'inbox'),
    unarchive: (ids: string[]) => apply(ids, 'inbox', `${count(ids.length)} moved to your mailbox`, 'archived'),
    remove: (ids: string[]) => apply(ids, 'deleted', `${count(ids.length)} deleted`, 'restored'),
    markRead: (ids: string[]) => apply(ids, 'read', `Marked as read`),
    markUnread: (ids: string[]) => apply(ids, 'unread', `Marked as unread`, 'read'),
  };
}
