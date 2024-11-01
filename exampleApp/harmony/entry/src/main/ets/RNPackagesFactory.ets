import type { RNPackageContext, RNPackage } from '@rnoh/react-native-openharmony/ts';

/**
 * Importing ets files from top level barrel file doesn't work.
 */

export function createRNPackages(ctx: RNPackageContext): RNPackage[] {
  return [];
}
