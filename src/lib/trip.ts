import type { Transport, WeatherEffect } from '@/lib/api';

/** Mirrors the server's estimate in _create_leg (the server's numbers are final). */
export function estimateTripMs(distanceKm: number, t: Transport, fx?: WeatherEffect): number {
  const hours = (distanceKm * t.route_factor) / (t.speed_kmh * (fx?.speed_mult ?? 1));
  return Math.max(hours * 3_600_000, 60_000);
}

/** Chance this trip fails, including the weather (capped like the server). */
export function tripRisk(t: Transport, fx?: WeatherEffect): number {
  return Math.min(t.failure_rate * (fx?.risk_mult ?? 1), 0.99);
}
