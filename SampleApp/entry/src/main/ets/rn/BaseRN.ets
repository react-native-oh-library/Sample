/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

import { RNAbility, RNSurface, RNInstance } from "rnoh";
import { LoadManager, buildCustomComponent } from './LoadBundle'


@Component
export struct BaseRN {
  @StorageLink('RNAbility') rnAbility: RNAbility | undefined = undefined;
  useBundleCache: boolean = true;
  rnInstance!: RNInstance;
  moduleName: string = '';
  initProps: Record<string, string> = {};
  bundlePath: string = '';
  @State isBundleReady: boolean = false;

  aboutToAppear() {
    LoadManager.loadBundle(this.rnInstance, this.bundlePath, this.useBundleCache).then(() => {
      this.isBundleReady = true;
      console.log('加载完成'+this.bundlePath)
      // console.log('ctx.descriptor=====', JSON.stringify(this.ctx.descriptor))
    }).catch((err: Error) => {
      console.log('加载失败'+this.bundlePath+err)
    });
  }

  build() {
    Column() {
      if (this.rnAbility && this.isBundleReady) {
        RNSurface({
          surfaceConfig: {
            appKey: this.moduleName,
            initialProps: this.initProps,
          },
          ctx: this.rnAbility.createRNOHContext({ rnInstance: this.rnInstance }),
          buildCustomComponent: wrapBuilder(buildCustomComponent),
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}
