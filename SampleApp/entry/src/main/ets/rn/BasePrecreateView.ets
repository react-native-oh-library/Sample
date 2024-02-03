import { RNAbility, SurfaceProps, JSBundleProvider, ResourceJSBundleProvider, RNSurface, RNInstance } from "rnoh";
import { createRNPackages, buildCustomComponent } from '../rn'
import ArrayList from '@ohos.util.ArrayList';

@Component
export struct BasePrecreateView {
  public appKey: string = 'app_name'
  public bundlePath: string = 'bundle.harmony.js'
  public initialProps: SurfaceProps = {}

  @StorageLink('rnInstances') rnInstances: ArrayList<RNInstance> = new ArrayList();
  @StorageLink('RNAbility') private rnAbility: RNAbility = {} as RNAbility
  @State private shouldShow: boolean = false
  private rnInstance!: RNInstance
  private shouldDestroyRNInstance: boolean = false
  private cleanUpCallbacks: (() => void)[] = []
  private jsBundleProvider: JSBundleProvider | undefined = undefined

  aboutToAppear() {
    this.init()
  }

  aboutToDisappear() {
    this.precreateInstance()
    this.cleanUp()
  }

  private async init() {
    this.jsBundleProvider = new ResourceJSBundleProvider(getContext().resourceManager, this.bundlePath);
    this.rnInstance = await this.getOrCreateRNInstance()

    const jsBundleExecutionStatus = this.rnInstance.getBundleExecutionStatus(this.jsBundleProvider?.getURL())
    if (this.jsBundleProvider && jsBundleExecutionStatus === undefined) {
      await this.rnInstance.runJSBundle(this.jsBundleProvider)
      this.shouldShow = true
      return;
    }
  }

  private async cleanUp() {
    this.shouldShow = false
    if (this.shouldDestroyRNInstance) {
      this.rnAbility.destroyAndUnregisterRNInstance(this.rnInstance)
    }
    this.cleanUpCallbacks.forEach(cleanUp => cleanUp())
  }

  private precreateInstance() {
    // 预创建 RNInstance
    if (this.rnInstances.length === 0) {
      this.rnAbility.createAndRegisterRNInstance({ createRNPackages }).then((rnInstance) => {
        this.rnInstances.add(rnInstance)
      })
    }
  }

  private getOrCreateRNInstance(): Promise<RNInstance> {
    // 获取上次 disappear 时预创建的 RNInstance
    this.shouldDestroyRNInstance = true
    if (this.rnInstances.length > 0) {
      return Promise.resolve(this.rnInstances.removeByIndex(0));
    } else {
      return this.rnAbility.createAndRegisterRNInstance({ createRNPackages })
    }
  }

  build() {
    Stack() {
      if (this.shouldShow) {
        RNSurface({
          ctx: this.rnAbility.createRNOHContext({ rnInstance: this.rnInstance }),
          surfaceConfig: {
            initialProps: this.initialProps,
            appKey: this.appKey,
          },
          buildCustomComponent: wrapBuilder(buildCustomComponent),
        })
      }
    }.width("100%")
    .height("100%")
  }
}
