import { ImageManipulator, SaveFormat } from 'expo-image-manipulator';
import * as ImagePicker from 'expo-image-picker';
import { useEffect, useState } from 'react';

import { supabase } from '@/lib/supabase';

const BUCKET = 'postcards';

/** Let the person pick a photo; returns a local URI, or null if they cancelled. */
export async function pickPhoto(): Promise<string | null> {
  const result = await ImagePicker.launchImageLibraryAsync({ mediaTypes: ['images'], allowsEditing: true, quality: 1 });
  if (result.canceled || !result.assets?.[0]) return null;
  return result.assets[0].uri;
}

/** Shrink to a postcard-sized JPEG and upload it under the sender's folder. Returns its storage path. */
export async function uploadPostcard(localUri: string, userId: string): Promise<string> {
  const context = ImageManipulator.manipulate(localUri);
  context.resize({ width: 1280, height: null });
  const rendered = await context.renderAsync();
  const saved = await rendered.saveAsync({ format: SaveFormat.JPEG, compress: 0.7, base64: true });
  if (!saved.base64) throw new Error('Couldn’t prepare that photo');

  const bytes = Uint8Array.from(atob(saved.base64), (c) => c.charCodeAt(0));
  const path = `${userId}/${Date.now()}-${Math.random().toString(36).slice(2, 8)}.jpg`;
  const { error } = await supabase.storage.from(BUCKET).upload(path, bytes, { contentType: 'image/jpeg' });
  if (error) throw new Error(error.message);
  return path;
}

/** A short-lived link to a postcard photo you're allowed to see (the server checks). */
export function usePostcardUrl(path: string | null | undefined): string | null {
  const [url, setUrl] = useState<{ path: string; url: string } | null>(null);
  useEffect(() => {
    if (!path) return;
    let cancelled = false;
    supabase.storage
      .from(BUCKET)
      .createSignedUrl(path, 60 * 60)
      .then(({ data }) => {
        if (!cancelled && data?.signedUrl) setUrl({ path, url: data.signedUrl });
      });
    return () => {
      cancelled = true;
    };
  }, [path]);
  return path && url?.path === path ? url.url : null;
}
