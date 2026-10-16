/**
 * Built-in crash reporting: JavaScript errors are sent to the `crash_reports` table in
 * Supabase (readable only from the Supabase dashboard). Native crashes aren't caught here;
 * those are diagnosed on the emulator.
 *
 * A fatal error may kill the app before the network request finishes, so each report is
 * first saved on the device and re-sent on the next launch.
 */
import AsyncStorage from '@react-native-async-storage/async-storage';
import Constants from 'expo-constants';
import * as Updates from 'expo-updates';
import { Platform } from 'react-native';

import { supabase } from '@/lib/supabase';

const PENDING_KEY = 'waylaid.pendingCrashes';

type Report = { message: string; stack?: string; context: Record<string, unknown> };

function describe(error: unknown, extra: Record<string, unknown>): Report {
  const e = error instanceof Error ? error : new Error(String(error));
  return {
    message: e.message || String(error),
    stack: e.stack,
    context: {
      ...extra,
      at: new Date().toISOString(),
      platform: Platform.OS,
      osVersion: String(Platform.Version),
      appVersion: Constants.expoConfig?.version,
      updateId: Updates.updateId,
      runtimeVersion: Updates.runtimeVersion,
    },
  };
}

async function send(report: Report) {
  const { error } = await supabase.rpc('report_crash', {
    p_message: report.message,
    p_stack: report.stack ?? null,
    p_context: report.context,
  });
  if (error) throw error;
}

async function savePending(report: Report) {
  const pending: Report[] = JSON.parse((await AsyncStorage.getItem(PENDING_KEY)) ?? '[]');
  await AsyncStorage.setItem(PENDING_KEY, JSON.stringify([...pending, report].slice(-10)));
}

/** Record an error. Safe to call from anywhere; never throws. */
export function reportError(error: unknown, extra: Record<string, unknown> = {}) {
  const report = describe(error, extra);
  savePending(report)
    .then(() => send(report))
    .then(async () => {
      const pending: Report[] = JSON.parse((await AsyncStorage.getItem(PENDING_KEY)) ?? '[]');
      await AsyncStorage.setItem(
        PENDING_KEY,
        JSON.stringify(pending.filter((p) => p.context.at !== report.context.at)),
      );
    })
    .catch(() => {});
}

/** Catch uncaught JavaScript errors app-wide, and send anything left from a previous crash. */
export function installCrashReporting() {
  const g = globalThis as { ErrorUtils?: { getGlobalHandler(): (e: unknown, fatal?: boolean) => void; setGlobalHandler(h: (e: unknown, fatal?: boolean) => void): void } };
  const utils = g.ErrorUtils;
  if (utils) {
    const previous = utils.getGlobalHandler();
    utils.setGlobalHandler((error, isFatal) => {
      reportError(error, { fatal: !!isFatal, source: 'global' });
      previous(error, isFatal);
    });
  }
  AsyncStorage.getItem(PENDING_KEY)
    .then(async (raw) => {
      const pending: Report[] = JSON.parse(raw ?? '[]');
      const left: Report[] = [];
      for (const r of pending) await send(r).catch(() => left.push(r));
      await AsyncStorage.setItem(PENDING_KEY, JSON.stringify(left));
    })
    .catch(() => {});
}
