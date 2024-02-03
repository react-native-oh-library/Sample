
import { ResourceJSBundleProvider, RNAbility, RNInstance, MetroJSBundleProvider } from 'rnoh';
import MultiHome from './MultiHome';
import { createRNPackages, LoadManager } from '../rn/';

import router from '@ohos.router';

@Entry()
@Component
struct Index {
  @StorageLink('RNAbility') rnAbility: RNAbility | undefined = undefined
  @State isBundleReady: boolean = false
  private isMetroAvailable: boolean = false

  aboutToAppear() {
    LoadManager.loadMetroBundle().then((flag: boolean) => {
      console.log('SampleApp --- metro 服务是否可用 = ', JSON.stringify(flag))
      AppStorage.setOrCreate('isMetroAvailable', flag)
      this.isMetroAvailable = flag

      this.register().then((instanceMap: Map<string, RNInstance>) => {
        this.isBundleReady = true;
        console.log("registered instance", JSON.stringify(instanceMap))
      });
    })
  }

  aboutToDisappear() {
    LoadManager.resetLoadedData()
  }

  async register(): Promise<Map<string, RNInstance>> {
    if (!this.rnAbility)
      return new Map()

    if (this.isMetroAvailable) {
      this.isBundleReady = true
      return new Map()
    }

    let instanceMap: Map<string, RNInstance> =  new Map();
    const cpInstance: RNInstance = await this.rnAbility.createAndRegisterRNInstance({ createRNPackages });
    const bpInstance: RNInstance = await this.rnAbility.createAndRegisterRNInstance({ createRNPackages });
    LoadManager.cpInstance = cpInstance;
    LoadManager.bpInstance = bpInstance;
    await cpInstance.runJSBundle(new ResourceJSBundleProvider(getContext().resourceManager, 'bundle/basic/basic.harmony.bundle'));
    instanceMap.set('CPReactInstance', cpInstance);
    instanceMap.set('BPReactInstance', bpInstance);
    return instanceMap
  }

  build() {
    Stack() {
      if (this.isBundleReady) {
        MultiHome()
      }
    }
  }
}
