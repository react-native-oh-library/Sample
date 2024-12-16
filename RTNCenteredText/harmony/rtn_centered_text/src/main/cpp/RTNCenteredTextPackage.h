#pragma once

#include "RNOH/generated/BaseRtnCenteredTextPackage.h"

namespace rnoh {

class RTNCenteredTextPackage : public BaseRtnCenteredTextPackage {
    using Super = BaseRtnCenteredTextPackage;

public:
    RTNCenteredTextPackage(Package::Context ctx) : Super(ctx) {}
};

} // namespace rnoh
