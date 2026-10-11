import type { Transport } from '@/lib/api';

/** Mirrors the server's estimate in _create_leg (the server's numbers are final). */
export function estimateTripMs(distanceKm: number, t: Transport): number {
  const hours = (distanceKm * t.route_factor) / t.speed_kmh;
  return Math.max(hours * 3_600_000, 60_000);
}
