/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

import { RNInstance, RNAbility, ResourceJSBundleProvider, RNSurface, ComponentBuilderContext } from 'rnoh';
import { createRNPackages, buildCustomComponent } from '../rn/';

@Entry
@Component
export struct MultiSurface {
  @StorageLink('RNAbility') rnAbility: RNAbility | undefined = undefined
  private instance1: RNInstance | undefined;
  private instance2: RNInstance | undefined;
  private instance3: RNInstance | undefined;
  private bundlePath1 = 'bundle/cp/homepage.harmony.bundle'
  private moduleName1 = 'HomePage'
  private bundlePath2 = 'bundle/cp/goods.harmony.bundle'
  private moduleName2 = 'Goods'
  private bundlePath3 = 'bundle/bp/details.harmony.bundle'
  private moduleName3 = 'Details'
  @State isBundleReady1: boolean = false;
  @State isBundleReady2: boolean = false;
  @State isBundleReady3: boolean = false;
  container: Record<string, string | number> = {
    "backgroundColor": '#E6E6E6',
    "flex": 1,
    "padding": 20,
  }
  apiFontSize: Record<string, string | number> = {
    'fontSize': 30,
    'color': 'white'
  }
  styles: Record<string, object> = {
    'container': this.container,
    'apiFontSize': this.apiFontSize
  }
  initProps: Record<string, string | object> = {
    'stringParam': 'ArkTs传递给RN的参数',
    'styles': this.styles
  };

  async aboutToAppear() {
    console.log("MultiSurface=====")
    if (!this.rnAbility) { return; }

    this.instance1 = await this.rnAbility.createAndRegisterRNInstance({ createRNPackages });
    await this.instance1.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, 'bundle/basic/basic.harmony.bundle'));
    await this.instance1.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, this.bundlePath1)).then(() => {
      this.isBundleReady1 = true
      console.log('instance1 加载完成' + this.bundlePath1)
    })

    this.instance2 = await this.rnAbility.createAndRegisterRNInstance({ createRNPackages });
    await this.instance2.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, 'bundle/basic/basic.harmony.bundle'));
    await this.instance2.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, this.bundlePath2)).then(() => {
      this.isBundleReady2 = true
      console.log('instance2 加载完成' + this.bundlePath2)
    })

    this.instance3 = await this.rnAbility.createAndRegisterRNInstance({ createRNPackages });
    await this.instance3.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, this.bundlePath3)).then(() => {
      this.isBundleReady3 = true
      console.log('instance3 加载完成' + this.bundlePath3)
    })

  }

  @Builder MultiSurfaceItem(moduleName: string, instance: RNInstance) {
    Column() {
      RNSurface({
        surfaceConfig: {
          appKey: moduleName,
          initialProps: this.initProps,
        },
        ctx: this.rnAbility!.createRNOHContext({ rnInstance: instance }),
        buildCustomComponent: wrapBuilder(buildCustomComponent),
      })
    }
    .align(Alignment.Top)
    // .margin({ top: 10 })
    .width('100%')
    .height('30%')
  }

  build() {
    NavDestination() {
      Column() {
        // It's OK
        // if (this.isBundleReady1 && this.isBundleReady2 && this.isBundleReady3) {
        //   this.MultiSurfaceItem(this.moduleName1, this.instance1!)
        //   this.MultiSurfaceItem(this.moduleName2, this.instance2!)
        //   this.MultiSurfaceItem(this.moduleName3, this.instance3!)
        // }
        // It's OK
        if (this.isBundleReady1) {
          this.MultiSurfaceItem(this.moduleName1, this.instance1!)
        }
        if (this.isBundleReady2) {
          this.MultiSurfaceItem(this.moduleName2, this.instance2!)
        }
        if (this.isBundleReady3) {
          this.MultiSurfaceItem(this.moduleName3, this.instance3!)
        }
      }
      .width('100%')
      .height('100%')
    }

  }
}
   