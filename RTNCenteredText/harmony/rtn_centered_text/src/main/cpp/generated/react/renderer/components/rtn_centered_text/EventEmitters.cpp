
/**
 * This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
 *
 * Do not edit this file as changes may cause incorrect behavior and will be lost
 * once the code is regenerated.
 *
 * @generated by codegen project: GenerateEventEmitterCpp.js
 */

#include <react/renderer/components/rtn_centered_text/EventEmitters.h>


namespace facebook {
namespace react {

void RTNCenteredTextEventEmitter::onTextTouch(OnTextTouch $event) const {
  dispatchEvent("textTouch", [$event=std::move($event)](jsi::Runtime &runtime) {
    auto $payload = jsi::Object(runtime);
    $payload.setProperty(runtime, "type", $event.type);
    return $payload;
  });
}

} // namespace react
} // namespace facebook