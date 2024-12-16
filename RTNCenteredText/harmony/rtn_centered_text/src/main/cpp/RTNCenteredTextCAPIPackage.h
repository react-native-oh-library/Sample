#pragma once

#include "RNOH/generated/BaseRtnCenteredTextPackage.h"
#include "RTNCenteredTextComponentInstance.h"

namespace rnoh {

class RTNCenteredTextCAPIPackage : public BaseRtnCenteredTextPackage {
    using Super = BaseRtnCenteredTextPackage;

public:
    RTNCenteredTextCAPIPackage(Package::Context ctx) : Super(ctx) {}

    ComponentInstance::Shared createComponentInstance(const ComponentInstance::Context &ctx) {
        if (ctx.componentName == "RTNCenteredText") {
            return std::make_shared<RTNCenteredTextComponentInstance>(ctx);
        }
        return nullptr;
    };
};

} // namespace rnoh
