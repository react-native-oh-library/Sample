import {
  RNAbility,
} from 'rnoh/ts';
// import common from '@ohos.app.ability.common'


import dataPreferences from '@ohos.data.preferences'
import window from '@ohos.window';

export let preferences: dataPreferences.Preferences | null = null
// export let ctx: common.UIAbilityContext | null = null

export default class EntryAbility extends RNAbility {
  getPagePath() {
    return 'pages/Index';
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    super.onWindowStageCreate(windowStage)
    try {
      let options: dataPreferences.Options = { name: 'test'};
      preferences = dataPreferences.getPreferencesSync(this.context, options)
    } catch(err) {
      console.error('Failed to get preferences')
    }
  }
}
