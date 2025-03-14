import { RNPackage, UITurboModuleFactory, } from "@rnoh/react-native-openharmony/ts";
import type { UITurboModule, UITurboModuleContext, } from "@rnoh/react-native-openharmony/ts";
import { TM } from "./generated/ts";
import { CalculatorModule } from './CalculatorModule';

class CalculatorModulesFactory extends UITurboModuleFactory {
  createTurboModule(name: string): UITurboModule | null {
    console.info(`clx name: ${name}`)
    if (name === TM.RTNCalculator.NAME) {
      return new CalculatorModule(this.ctx);
    }
    return null;
  }

  hasTurboModule(name: string): boolean {
    return name === TM.RTNCalculator.NAME;
  }
}

export class CalculatorPackage extends RNPackage {
  createTurboModulesFactory(ctx: UITurboModuleContext): UITurboModuleFactory {
    return new CalculatorModulesFactory(ctx);
  }
}