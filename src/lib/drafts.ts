import AsyncStorage from '@react-native-async-storage/async-storage';
import { useCallback, useEffect, useRef, useState } from 'react';

const PREFIX = 'waylaid.draft.';

/**
 * A value that survives leaving the screen (and closing the app), saved on this device.
 * `loaded` is false until any saved draft has been read back.
 */
export function useDraft<T>(key: string, initial: T) {
  const [value, setValue] = useState<T>(initial);
  const [loaded, setLoaded] = useState(false);
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    let cancelled = false;
    AsyncStorage.getItem(PREFIX + key)
      .then((raw) => {
        if (!cancelled && raw) setValue({ ...initial, ...JSON.parse(raw) });
      })
      .catch(() => {})
      .finally(() => !cancelled && setLoaded(true));
    return () => {
      cancelled = true;
    };
    // `initial` is only a fallback for the first read
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [key]);

  const update = useCallback(
    (next: T) => {
      setValue(next);
      if (timer.current) clearTimeout(timer.current);
      // Save shortly after typing stops, not on every keystroke.
      timer.current = setTimeout(() => {
        AsyncStorage.setItem(PREFIX + key, JSON.stringify(next)).catch(() => {});
      }, 400);
    },
    [key],
  );

  const clear = useCallback(() => {
    if (timer.current) clearTimeout(timer.current);
    AsyncStorage.removeItem(PREFIX + key).catch(() => {});
  }, [key]);

  return { value, update, clear, loaded };
}
