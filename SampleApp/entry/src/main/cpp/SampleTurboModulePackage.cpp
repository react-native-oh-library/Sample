#include "SampleTurboModulePackage.h"
#include "./Fabric/MarqueeViewEventEmitRequestHandler.h"
#include "./Fabric/MarqueeViewNapiBinder.h"
#include "./Fabric/MarqueeViewJSIBinder.h"
#include "./Fabric/MarqueeViewComponentDescriptor.h"
#include "./TurboModules/SampleTurboModuleSpec.h"
#include "./TurboModules/SampleTurboModule2Spec.h"

using namespace rnoh;
using namespace facebook;

class SampleViewJSIBinder : public ViewComponentJSIBinder {
protected:
    facebook::jsi::Object createNativeProps(facebook::jsi::Runtime &rt) override {
        auto nativeProps = ViewComponentJSIBinder::createNativeProps(rt);
        nativeProps.setProperty(rt, "size", "true");
        return nativeProps;
    }
};

class SampleTurboModuleFactoryDelegate : public TurboModuleFactoryDelegate {
    public:
    SharedTurboModule createTurboModule(Context ctx, const std::string &name) const override {
        if (name == "SampleTurboModule") {
            return std::make_shared<NativeSampleTurboModuleSpecJSI>(ctx, name);
        } else if (name == "SampleTurboModule2") {
            return std::make_shared<NativeSampleTurboModule2SpecJSI>(ctx, name);    
        }
        return nullptr;
    };
};


EventEmitRequestHandlers SampleTurboModulePackage::createEventEmitRequestHandlers() {
    return {std::make_shared<MarqueeViewEventEmitRequestHandler>()};
}

ComponentNapiBinderByString SampleTurboModulePackage::createComponentNapiBinderByName() {
    return {
        {"PropsDisplayer", std::make_shared<ViewComponentNapiBinder>()},
    };
};

ComponentJSIBinderByString SampleTurboModulePackage::createComponentJSIBinderByName() {
    return {
        {"MarqueeView", std::make_shared<MarqueeViewJSIBinder>()},
        {"SampleView", std::make_shared<SampleViewJSIBinder>()}
    };
};

std::unique_ptr<TurboModuleFactoryDelegate> SampleTurboModulePackage::createTurboModuleFactoryDelegate() {
    return std::make_unique<SampleTurboModuleFactoryDelegate>();
}

std::vector<react::ComponentDescriptorProvider> SampleTurboModulePackage::createComponentDescriptorProviders() {
    return {
        react::concreteComponentDescriptorProvider<react::MarqueeViewComponentDescriptor>(),
    };
}
