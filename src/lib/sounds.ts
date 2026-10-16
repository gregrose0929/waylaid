import { createAudioPlayer, setAudioModeAsync, type AudioPlayer } from 'expo-audio';
import { Platform } from 'react-native';

// Synthesized by scripts/make-sounds.py.
const SOURCES = {
  whoosh: require('@/assets/sounds/whoosh.wav'),
  pigeon: require('@/assets/sounds/pigeon.wav'),
  train: require('@/assets/sounds/train.wav'),
  car: require('@/assets/sounds/car.wav'),
  jet: require('@/assets/sounds/jet.wav'),
  sr71: require('@/assets/sounds/sr71.wav'),
  snail: require('@/assets/sounds/snail.wav'),
  moth: require('@/assets/sounds/moth.wav'),
  balloon: require('@/assets/sounds/balloon.wav'),
  bicycle: require('@/assets/sounds/bicycle.wav'),
  horse: require('@/assets/sounds/horse.wav'),
  walk: require('@/assets/sounds/walk.wav'),
  arrive: require('@/assets/sounds/arrive.wav'),
  achievement: require('@/assets/sounds/achievement.wav'),
} as const;

export type SoundName = keyof typeof SOURCES;

let enabled = true;
let configured = false;
const players = new Map<SoundName, AudioPlayer>();

/** Follows the "Sound effects" setting. */
export function setSoundsEnabled(on: boolean) {
  enabled = on;
}

/** Play a short effect. Never throws; sound is a nice-to-have. */
export function playSound(name: SoundName) {
  if (!enabled || Platform.OS === 'web') return;
  try {
    if (!configured) {
      configured = true;
      // Mix with whatever else is playing, and stay quiet when the phone is on silent.
      setAudioModeAsync({ playsInSilentMode: false, interruptionMode: 'mixWithOthers' }).catch(() => {});
    }
    let player = players.get(name);
    if (!player) {
      player = createAudioPlayer(SOURCES[name]);
      players.set(name, player);
    }
    player.seekTo(0);
    player.play();
  } catch {
    // ignore
  }
}

/** The sound a carrier makes as it sets off. */
export function playCarrier(transportId: string) {
  playSound(transportId in SOURCES ? (transportId as SoundName) : 'whoosh');
}
