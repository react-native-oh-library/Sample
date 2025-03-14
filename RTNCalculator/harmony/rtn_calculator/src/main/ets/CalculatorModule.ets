import { UITurboModule } from '@rnoh/react-native-openharmony/ts';
import { TM } from "./generated/ts"

export class CalculatorModule extends UITurboModule implements TM.RTNCalculator.Spec {
  add(a: number, b: number): Promise<number> {
    return new Promise((resolve) => resolve(a + b));
  }
}