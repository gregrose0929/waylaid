import type { LatLng } from '@/lib/api';

const toRad = (d: number) => (d * Math.PI) / 180;
const toDeg = (r: number) => (r * 180) / Math.PI;

/** Point a fraction `f` (0..1) of the way along the great circle from a to b. */
export function interpolate(a: LatLng, b: LatLng, f: number): LatLng {
  const [lat1, lon1] = [toRad(a[0]), toRad(a[1])];
  const [lat2, lon2] = [toRad(b[0]), toRad(b[1])];
  const d =
    2 *
    Math.asin(
      Math.sqrt(
        Math.sin((lat2 - lat1) / 2) ** 2 +
          Math.cos(lat1) * Math.cos(lat2) * Math.sin((lon2 - lon1) / 2) ** 2,
      ),
    );
  if (Math.sin(d) < 1e-9) return a;
  const ka = Math.sin((1 - f) * d) / Math.sin(d);
  const kb = Math.sin(f * d) / Math.sin(d);
  const x = ka * Math.cos(lat1) * Math.cos(lon1) + kb * Math.cos(lat2) * Math.cos(lon2);
  const y = ka * Math.cos(lat1) * Math.sin(lon1) + kb * Math.cos(lat2) * Math.sin(lon2);
  const z = ka * Math.sin(lat1) + kb * Math.sin(lat2);
  return [toDeg(Math.atan2(z, Math.sqrt(x * x + y * y))), toDeg(Math.atan2(y, x))];
}

/** Great-circle distance in meters. */
export function distanceMeters(a: LatLng, b: LatLng): number {
  const [lat1, lat2] = [toRad(a[0]), toRad(b[0])];
  const dLat = lat2 - lat1;
  const dLon = toRad(b[1] - a[1]);
  const h = Math.sin(dLat / 2) ** 2 + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLon / 2) ** 2;
  return 2 * 6_371_008.8 * Math.asin(Math.sqrt(h));
}

/** A smooth curve of points for drawing a great-circle route. */
export function greatCircle(a: LatLng, b: LatLng, steps = 48): LatLng[] {
  return Array.from({ length: steps + 1 }, (_, i) => interpolate(a, b, i / steps));
}

/** Fraction of a trip completed at time `now`, clamped to 0..1. */
export function progress(departedAt: string, arrivesAt: string, now: number): number {
  const start = Date.parse(departedAt);
  const end = Date.parse(arrivesAt);
  if (end <= start) return 1;
  return Math.min(1, Math.max(0, (now - start) / (end - start)));
}

export const toLatLng = ([latitude, longitude]: LatLng) => ({ latitude, longitude });
