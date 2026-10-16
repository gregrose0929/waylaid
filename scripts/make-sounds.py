"""Synthesizes Waylaid's sound effects from scratch (no samples, no licences).

    python scripts/make-sounds.py

Writes short mono 16-bit WAVs into assets/sounds/. Tweak and re-run to change a sound.
"""
import math
import os
import random
import struct
import wave

RATE = 22050
OUT = os.path.join(os.path.dirname(__file__), '..', 'assets', 'sounds')
random.seed(7)


def env(n, attack, release, total):
    """Linear attack / exponential-ish release envelope for sample n."""
    t = n / RATE
    if t < attack:
        return t / attack
    tail = total - t
    return max(0.0, min(1.0, tail / release)) if tail < release else 1.0


def lowpass(samples, alpha):
    out, y = [], 0.0
    for i, x in enumerate(samples):
        a = alpha(i) if callable(alpha) else alpha
        y += a * (x - y)
        out.append(y)
    return out


def noise(seconds):
    return [random.uniform(-1, 1) for _ in range(int(seconds * RATE))]


def tone(freq, seconds, wave_fn=math.sin, phase=0.0):
    """freq may be a number or a function of time (for glides and vibrato)."""
    out, ph = [], phase
    for n in range(int(seconds * RATE)):
        f = freq(n / RATE) if callable(freq) else freq
        ph += 2 * math.pi * f / RATE
        out.append(wave_fn(ph))
    return out


def mix(*tracks):
    length = max(len(t) for t in tracks)
    return [sum(t[i] for t in tracks if i < len(t)) for i in range(length)]


def place(track, at_seconds, total_seconds):
    out = [0.0] * int(total_seconds * RATE)
    start = int(at_seconds * RATE)
    for i, v in enumerate(track):
        if start + i < len(out):
            out[start + i] += v
    return out


def shape(track, attack, release):
    total = len(track) / RATE
    return [v * env(i, attack, release, total) for i, v in enumerate(track)]


def bell(freq, seconds, decay=6.0):
    """Struck-bell timbre: a few inharmonic partials with exponential decay."""
    partials = [(1, 1.0), (2.76, 0.45), (5.4, 0.25), (8.9, 0.12)]
    out = []
    for n in range(int(seconds * RATE)):
        t = n / RATE
        out.append(sum(a * math.sin(2 * math.pi * freq * k * t) * math.exp(-decay * k ** 0.5 * t) for k, a in partials))
    return out


def save(name, samples, volume=0.8):
    peak = max(1e-9, max(abs(s) for s in samples))
    data = b''.join(struct.pack('<h', int(max(-1, min(1, s / peak * volume)) * 32767)) for s in samples)
    os.makedirs(OUT, exist_ok=True)
    with wave.open(os.path.join(OUT, f'{name}.wav'), 'wb') as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(RATE)
        w.writeframes(data)
    print(f'{name}.wav  {len(samples) / RATE:.2f}s')


# --- carriers --------------------------------------------------------------------

# Generic send: a soft paper whoosh.
w = noise(0.6)
w = lowpass(w, lambda i: 0.02 + 0.25 * math.sin(math.pi * i / len(w)))
save('whoosh', shape(w, 0.15, 0.3), 0.6)

# Pigeon: "coo-roo" with a little vibrato.
coo = lambda f0, f1, d: shape(tone(lambda t: f0 + (f1 - f0) * t / d + 6 * math.sin(2 * math.pi * 7 * t), d), 0.05, 0.12)
save('pigeon', mix(place(coo(420, 360, 0.28), 0, 0.9), place(coo(380, 300, 0.4), 0.38, 0.9)), 0.55)

# Steam train whistle: three-note chord with a breathy edge and a little bend.
bend = lambda base: (lambda t: base * (0.97 + 0.03 * min(1, t * 6)))
whistle = mix(*(tone(bend(f), 1.0) for f in (523, 659, 784)), [v * 0.25 for v in lowpass(noise(1.0), 0.3)])
save('train', shape(whistle, 0.08, 0.35), 0.5)

# Car: two short honks.
square = lambda ph: 1.0 if math.sin(ph) >= 0 else -1.0
honk = lambda: shape(lowpass(mix(tone(400, 0.18, square), tone(500, 0.18, square)), 0.25), 0.01, 0.04)
save('car', mix(place(honk(), 0, 0.5), place(honk(), 0.24, 0.5)), 0.45)

# Airmail jet: a rising, fading roar.
j = noise(1.2)
j = lowpass(j, lambda i: 0.03 + 0.12 * (i / len(j)))
save('jet', shape(j, 0.5, 0.5), 0.6)

# SR-71: a sonic boom, sharp crack then rumble.
crack = shape(lowpass(noise(0.08), 0.6), 0.002, 0.07)
rumble = [v * math.exp(-3.5 * i / RATE) for i, v in enumerate(lowpass(noise(1.1), 0.015))]
save('sr71', mix(place(crack, 0, 1.15), place([v * 3 for v in rumble], 0.02, 1.15)), 0.85)

# Snail: a slow, squelchy slide.
save('snail', shape(tone(lambda t: 210 - 70 * t + 12 * math.sin(2 * math.pi * 3 * t), 1.0), 0.2, 0.4), 0.4)

# Moth: soft fluttering wings.
m = lowpass(noise(0.8), 0.2)
save('moth', shape([v * (0.5 + 0.5 * math.sin(2 * math.pi * 22 * i / RATE)) for i, v in enumerate(m)], 0.1, 0.3), 0.45)

# Hot-air balloon: a propane burner "fwoosh".
b = lowpass(noise(0.9), lambda i: 0.05 + 0.1 * min(1, i / (0.3 * RATE)))
save('balloon', shape(b, 0.25, 0.35), 0.6)

# Bicycle: "ding ding".
save('bicycle', mix(place(bell(1800, 0.5, 9), 0, 0.85), place(bell(1800, 0.5, 9), 0.22, 0.85)), 0.5)

# Horse: clip-clop.
clop = lambda pitch: shape(tone(pitch, 0.05), 0.002, 0.04)
hooves = mix(*(place(clop(p), t, 0.9) for t, p in [(0, 900), (0.18, 700), (0.42, 900), (0.6, 700)]))
save('horse', hooves, 0.5)

# Foot courier: three soft footsteps.
step = lambda: shape(lowpass(noise(0.09), 0.08), 0.005, 0.07)
save('walk', mix(*(place(step(), t, 0.9) for t in (0, 0.3, 0.6))), 0.6)

# --- moments ---------------------------------------------------------------------

# Opening a letter that just arrived: a gentle two-note chime.
save('arrive', mix(place(bell(1318, 0.9, 4), 0, 1.0), place(bell(1760, 0.8, 4), 0.14, 1.0)), 0.45)

# Achievement: a quick bright arpeggio.
notes = [(1047, 0.0), (1319, 0.09), (1568, 0.18), (2093, 0.27)]
save('achievement', mix(*(place(bell(f, 0.8, 5), t, 1.15) for f, t in notes)), 0.5)
