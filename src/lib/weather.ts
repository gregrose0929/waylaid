import type { Weather } from '@/lib/api';

export type WeatherNow = { kind: Weather; emoji: string; label: string; tempC: number | null };

const LOOK: Record<Weather, { emoji: string; label: string }> = {
  clear: { emoji: '☀️', label: 'Clear skies' },
  cloudy: { emoji: '☁️', label: 'Cloudy' },
  fog: { emoji: '🌫️', label: 'Foggy' },
  rain: { emoji: '🌧️', label: 'Raining' },
  snow: { emoji: '🌨️', label: 'Snowing' },
  storm: { emoji: '⛈️', label: 'Thunderstorm' },
  wind: { emoji: '💨', label: 'Very windy' },
};

export const weatherLook = (kind: Weather) => LOOK[kind];

/** WMO weather code (+ wind) → one of our weather kinds. */
function classify(code: number, windKmh: number): Weather {
  if (code >= 95) return 'storm';
  if ((code >= 71 && code <= 77) || code === 85 || code === 86) return 'snow';
  if ((code >= 51 && code <= 67) || (code >= 80 && code <= 82)) return 'rain';
  if (windKmh >= 35) return 'wind';
  if (code === 45 || code === 48) return 'fog';
  if (code === 2 || code === 3) return 'cloudy';
  return 'clear';
}

/**
 * Current weather where a letter sets off, from Open-Meteo (free, no account needed).
 * Returns null if it can't be fetched; the letter then goes out with no weather effect.
 */
export async function weatherAt(lat: number, lng: number): Promise<WeatherNow | null> {
  try {
    const url =
      `https://api.open-meteo.com/v1/forecast?latitude=${lat.toFixed(3)}&longitude=${lng.toFixed(3)}` +
      `&current=weather_code,wind_speed_10m,temperature_2m`;
    const res = await fetch(url);
    if (!res.ok) return null;
    const json = await res.json();
    const kind = classify(Number(json.current?.weather_code ?? 0), Number(json.current?.wind_speed_10m ?? 0));
    const temp = json.current?.temperature_2m;
    return { kind, ...LOOK[kind], tempC: typeof temp === 'number' ? temp : null };
  } catch {
    return null;
  }
}
