/**
 * This code was generated by "react-native codegen-lib-harmony"
 */

#pragma once
#include "RNOHCorePackage/ComponentBinders/ViewComponentJSIBinder.h"

namespace rnoh {
class RTNCenteredTextJSIBinder : public ViewComponentJSIBinder {
  protected:
    facebook::jsi::Object createNativeProps(facebook::jsi::Runtime &rt) override {
        auto object = ViewComponentJSIBinder::createNativeProps(rt);
        object.setProperty(rt, "text", true);
        object.setProperty(rt, "color", true);
        return object;
    }

    facebook::jsi::Object createBubblingEventTypes(facebook::jsi::Runtime &rt) override {
        facebook::jsi::Object events(rt);
        return events;
    }

    facebook::jsi::Object createDirectEventTypes(facebook::jsi::Runtime &rt) override {
        facebook::jsi::Object events(rt);
        events.setProperty(rt, "topTextTouch", createDirectEvent(rt, "onTextTouch"));
        return events;
    }
};
} // namespace rnoh