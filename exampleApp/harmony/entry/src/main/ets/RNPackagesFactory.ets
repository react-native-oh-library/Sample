import type { RNPackageContext, RNPackage } from '@rnoh/react-native-openharmony';
import { RTNCenteredTextPackage } from 'rtn-centered-text';
import { CalculatorPackage } from "rtn-calculator";

export function createRNPackages(ctx: RNPackageContext): RNPackage[] {
  return [
    new RTNCenteredTextPackage(ctx),
    new CalculatorPackage(ctx),
  ];
}
