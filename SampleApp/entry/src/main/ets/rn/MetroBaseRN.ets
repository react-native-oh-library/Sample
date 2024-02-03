/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

import { RNAbility, RNSurface } from "rnoh";
import { LoadManager, buildCustomComponent } from  './LoadBundle'

@Component
export struct MetroBaseRN {
  @StorageLink('RNAbility') rnAbility: RNAbility | undefined = undefined;
  moduleName: string = '';
  initProps: Record<string, string> = {};

  build() {
    Column() {
      if (this.rnAbility) {
        RNSurface({
          surfaceConfig: {
            initialProps: this.initProps ?? {},
            appKey: this.moduleName,
          },
          ctx: this.rnAbility.createRNOHContext({ rnInstance: LoadManager.rnInstanceShared }),
          buildCustomComponent: wrapBuilder(buildCustomComponent),
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}

