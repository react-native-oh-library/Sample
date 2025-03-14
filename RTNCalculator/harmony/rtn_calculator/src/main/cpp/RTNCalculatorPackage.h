#pragma once

#include "RNOH/generated/BaseRtnCalculatorPackage.h"

namespace rnoh {

class RTNCalculatorPackage : public BaseRtnCalculatorPackage {
    using Super = BaseRtnCalculatorPackage;

public:
    RTNCalculatorPackage(Package::Context ctx) : Super(ctx) {}
};

} // namespace rnoh
