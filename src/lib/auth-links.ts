import * as Linking from 'expo-linking';

/** Where Supabase email links send people back into the app. */
export const authRedirect = (path: 'auth-callback' | 'reset-password') => Linking.createURL(path);

/**
 * Tokens Supabase puts in an email link's redirect (after the #), e.g.
 * waylaid://auth-callback#access_token=…&refresh_token=…&type=signup
 */
export function linkTokens(url: string | null) {
  if (!url) return null;
  const fragment = url.includes('#') ? url.slice(url.indexOf('#') + 1) : (url.split('?')[1] ?? '');
  const params = new URLSearchParams(fragment);
  const access_token = params.get('access_token');
  const refresh_token = params.get('refresh_token');
  if (!access_token || !refresh_token) return null;
  return { access_token, refresh_token, type: params.get('type') };
}
