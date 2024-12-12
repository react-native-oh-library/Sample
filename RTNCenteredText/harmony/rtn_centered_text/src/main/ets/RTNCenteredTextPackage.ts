import { RNPackage } from "@rnoh/react-native-openharmony/ts";
import type {
  DescriptorWrapperFactoryByDescriptorTypeCtx,
  DescriptorWrapperFactoryByDescriptorType,
} from "@rnoh/react-native-openharmony/ts";
// import codegen 生成的内容
import { RNC } from "./generated/ts";

export class RTNCenteredTextPackage extends RNPackage {
  createDescriptorWrapperFactoryByDescriptorType(
    ctx: DescriptorWrapperFactoryByDescriptorTypeCtx
  ): DescriptorWrapperFactoryByDescriptorType {
    return {
      [RNC.RTNCenteredText.NAME]: (ctx) =>
      new RNC.RTNCenteredText.DescriptorWrapper(ctx.descriptor),
    };
  }
}