import { ResourceJSBundleProvider, RNInstance, RNAbility, MetroJSBundleProvider, ComponentBuilderContext } from 'rnoh';
import { createRNPackages } from './RNPackagesFactory'

import { RNCViewPager, PAGER_VIEW_TYPE } from 'rnoh-pager-view'
import { MarqueeView } from '../customView/MarqueeView'
import { SVG_VIEW_TYPE_NAME, SVGView } from "rnoh-svg"
import { SAFE_AREA_VIEW_TYPE, SafeAreaView, SAFE_AREA_PROVIDER_TYPE, SafeAreaProvider } from "rnoh-safe-area"
import { RNGestureHandlerRootView, RNGestureHandlerButton } from "rnoh-gesture-handler"

@Builder export function buildCustomComponent(ctx: ComponentBuilderContext) {
  if (ctx.componentName === PAGER_VIEW_TYPE) {
    RNCViewPager({
      ctx: ctx.rnComponentContext,
      tag: ctx.tag,
      buildCustomComponent: buildCustomComponent
    })
  }
  else if (ctx.componentName === MarqueeView.NAME) {
    MarqueeView({
      ctx: ctx.rnComponentContext,
      tag: ctx.tag
    })
  } else if (ctx.componentName === SVG_VIEW_TYPE_NAME) {
   SVGView({
     ctx: ctx.rnComponentContext,
     tag: ctx.tag,
     buildCustomComponent: buildCustomComponent
   })
 }
   else if (ctx.componentName === SAFE_AREA_VIEW_TYPE) {
   SafeAreaView({
     ctx: ctx.rnComponentContext,
     tag: ctx.tag,
     buildCustomComponent: buildCustomComponent
   })
 }
 else if (ctx.componentName === SAFE_AREA_PROVIDER_TYPE) {
   SafeAreaProvider({
     ctx: ctx.rnComponentContext,
     tag: ctx.tag,
     buildCustomComponent: buildCustomComponent
   })
 }
     else if (ctx.componentName == RNGestureHandlerRootView.NAME){
     RNGestureHandlerRootView({
       ctx: ctx.rnComponentContext,
       tag: ctx.tag,
       buildCustomComponent: buildCustomComponent
     })
   } else if (ctx.componentName == RNGestureHandlerButton.DESCRIPTOR_TYPE){
     RNGestureHandlerButton({
       ctx: ctx.rnComponentContext,
       tag: ctx.tag,
       buildCustomComponent: buildCustomComponent
     })
   }
}

export class LoadManager {

  // 记录已加载的bundle
  private static loadedBundle: Set<string> = new Set();
  public static rnInstanceShared: RNInstance
  public static cpInstance: RNInstance
  public static bpInstance: RNInstance

  private static shouldResetMetroInstance: Boolean = true

  public static loadBundle(instance: RNInstance, bundlePath: string, useBundleCache: boolean = true): Promise<void> {
    if (LoadManager.loadedBundle.has(bundlePath) && useBundleCache) return Promise.resolve();
    if (useBundleCache) LoadManager.loadedBundle.add(bundlePath);

    return instance.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, bundlePath));
  }

  public static async loadMetroBundle(): Promise<boolean> {
    const rnAbility: RNAbility | undefined = AppStorage.get('RNAbility')
    if (LoadManager.shouldResetMetroInstance && rnAbility) {
      LoadManager.rnInstanceShared = await rnAbility.createAndRegisterRNInstance({ createRNPackages })

      const provider = new MetroJSBundleProvider()
      await LoadManager.rnInstanceShared.runJSBundle(provider)

      const jsBundleExecutionStatus: string = LoadManager.rnInstanceShared.getBundleExecutionStatus(provider.getURL()) as string
      console.log("SampleApp --- getBundleExecutionStatus", jsBundleExecutionStatus);
      LoadManager.shouldResetMetroInstance = false
      if (jsBundleExecutionStatus === "DONE") {
        return true
      } else {
        return false
      }
    }
    return true
  }

  public static resetLoadedData() {
    LoadManager.loadedBundle.clear()
    LoadManager.shouldResetMetroInstance = true
  }
}
