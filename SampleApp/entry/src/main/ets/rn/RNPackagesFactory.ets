/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

import { RNPackageContext, RNPackage } from 'rnoh';
import { SampleTurboModulePackage } from '../TurboModule/SampleTurboModulePackage';
import {SafeAreaViewPackage} from 'rnoh-safe-area/ts';
import { GestureHandlerPackage } from 'rnoh-gesture-handler/ts';

export function createRNPackages(ctx: RNPackageContext): RNPackage[] {
  return [
    new SampleTurboModulePackage(ctx),
    new SafeAreaViewPackage(ctx),
    new GestureHandlerPackage(ctx),
  ];
}