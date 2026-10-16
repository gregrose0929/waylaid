export type Units = 'mi' | 'km';

const KM_PER_MI = 1.609344;

export function formatDistance(km: number, units: Units): string {
  const value = units === 'mi' ? km / KM_PER_MI : km;
  if (value < 0.1) return `next door`;
  if (value < 10) return `${value.toFixed(1)} ${units}`;
  return `${Math.round(value).toLocaleString()} ${units}`;
}

export function formatMeters(m: number, units: Units): string {
  if (units === 'mi') {
    const ft = m * 3.28084;
    return ft < 1000 ? `${Math.round(ft)} ft` : formatDistance(m / 1000, units);
  }
  return m < 1000 ? `${Math.round(m)} m` : formatDistance(m / 1000, units);
}

export function formatSpeed(kmh: number, units: Units): string {
  const value = units === 'mi' ? kmh / KM_PER_MI : kmh;
  if (value < 1) return `${value.toFixed(2)} ${units === 'mi' ? 'mph' : 'km/h'}`;
  return `${Math.round(value).toLocaleString()} ${units === 'mi' ? 'mph' : 'km/h'}`;
}

/** "45s", "12m", "3h 20m", "4d 6h", "2y 41d" */
export function formatDuration(ms: number): string {
  const s = Math.max(0, Math.round(ms / 1000));
  if (s < 60) return `${s}s`;
  const m = Math.floor(s / 60);
  if (m < 60) return `${m}m`;
  const h = Math.floor(m / 60);
  if (h < 24) return m % 60 ? `${h}h ${m % 60}m` : `${h}h`;
  const d = Math.floor(h / 24);
  if (d < 365) return h % 24 ? `${d}d ${h % 24}h` : `${d}d`;
  const y = Math.floor(d / 365);
  return d % 365 ? `${y}y ${d % 365}d` : `${y}y`;
}

/** Odds of a trip failing, written for humans: "1 in 50", "30%". */
export function formatRisk(rate: number): string {
  if (rate <= 0) return 'never fails';
  if (rate >= 0.1) return `${Math.round(rate * 100)}% risk`;
  const oneIn = Math.round(1 / rate);
  return `1 in ${oneIn.toLocaleString()}`;
}

export function formatWhen(iso: string): string {
  const date = new Date(iso);
  const now = new Date();
  const sameDay = date.toDateString() === now.toDateString();
  if (sameDay) return date.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' });
  const sameYear = date.getFullYear() === now.getFullYear();
  return date.toLocaleDateString([], {
    month: 'short',
    day: 'numeric',
    year: sameYear ? undefined : 'numeric',
  });
}

export function formatAgo(iso: string, now = Date.now()): string {
  const ms = now - Date.parse(iso);
  if (ms < 60_000) return 'just now';
  return `${formatDuration(ms)} ago`;
}

/** Your nickname for them, else their own display name, else @username. */
export const displayName = (p: { username: string; display_name: string | null; nickname?: string | null }) =>
  p.nickname || p.display_name || `@${p.username}`;
