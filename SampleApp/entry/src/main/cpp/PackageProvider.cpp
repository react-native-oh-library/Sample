#include "RNOH/PackageProvider.h"
#include "SampleTurboModulePackage.h"
#include "ViewPagerPackage.h"
#include "SVGPackage.h"
#include "SafeAreaViewPackage.h"
#include "GestureHandlerPackage.h"
#include "MaskedPackage.h"

using namespace rnoh;

std::vector<std::shared_ptr<Package>> PackageProvider::getPackages(Package::Context ctx) {
    return {std::make_shared<SampleTurboModulePackage>(ctx),
            std::make_shared<ViewPagerPackage>(ctx),
            std::make_shared<SVGPackage>(ctx),
            std::make_shared<SafeAreaViewPackage>(ctx),
            std::make_shared<GestureHandlerPackage>(ctx),
            std::make_shared<MaskedPackage>(ctx)};
}