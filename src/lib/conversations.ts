import { activityAt, isUnread, type Letter, type Person } from '@/lib/api';

export type Conversation = {
  person: Person;
  letters: Letter[]; // newest first
  unread: number;
  archived: boolean;
};

/** Group letters into one conversation per person; pinned first, then most recent. */
export function toConversations(letters: Letter[]): Conversation[] {
  const byPerson = new Map<string, Conversation>();
  for (const l of letters) {
    const c = byPerson.get(l.other.id) ?? { person: l.other, letters: [], unread: 0, archived: true };
    c.letters.push(l);
    if (isUnread(l)) c.unread += 1;
    if (!l.archived) c.archived = false;
    byPerson.set(l.other.id, c);
  }
  return [...byPerson.values()]
    .map((c) => ({ ...c, letters: c.letters.sort((a, b) => activityAt(b).localeCompare(activityAt(a))) }))
    .sort(
      (a, b) =>
        Number(b.person.pinned) - Number(a.person.pinned) ||
        activityAt(b.letters[0]!).localeCompare(activityAt(a.letters[0]!)),
    );
}

