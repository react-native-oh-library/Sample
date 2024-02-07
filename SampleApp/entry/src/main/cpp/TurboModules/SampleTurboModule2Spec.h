// NOTE: This entire file should be codegen'ed.
#pragma once

#include <ReactCommon/TurboModule.h>
#include "RNOH/ArkTSTurboModule.h"

namespace rnoh {

    class JSI_EXPORT NativeSampleTurboModule2SpecJSI : public ArkTSTurboModule {
    public:
        NativeSampleTurboModule2SpecJSI(const ArkTSTurboModule::Context ctx, const std::string name);
    };

} // namespace rnoh