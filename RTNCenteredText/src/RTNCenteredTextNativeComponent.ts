import type * as React from 'react';
import type {ViewProps} from 'ViewPropTypes';
import type {ColorValue, HostComponent} from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {
  DirectEventHandler,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';

export type OnTouchEventData = Readonly<{
  type: Int32;
}>;

export interface NativeProps extends ViewProps {
  text?: string;
  color?: ColorValue,
  onTextTouch?: DirectEventHandler<OnTouchEventData>;
  // 添加其它 props
}

export default codegenNativeComponent<NativeProps>(
  'RTNCenteredText',
) as HostComponent<NativeProps>;