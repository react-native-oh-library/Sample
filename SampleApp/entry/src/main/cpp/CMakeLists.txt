project(rnapp)
cmake_minimum_required(VERSION 3.4.1)
set(RNOH_APP_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(OH_MODULE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../../../oh_modules")

set(RNOH_CPP_DIR "${OH_MODULE_DIR}/rnoh/src/main/cpp")

add_subdirectory("${RNOH_CPP_DIR}" ./rn)

# RNOH_BEGIN: add_package_subdirectories
add_subdirectory("${OH_MODULE_DIR}/rnoh-pager-view/src/main/cpp" ./pager_view)
add_subdirectory("${OH_MODULE_DIR}/rnoh-svg/src/main/cpp" ./svg)
add_subdirectory("${OH_MODULE_DIR}/rnoh-safe-area/src/main/cpp" ./safe-area)
add_subdirectory("${OH_MODULE_DIR}/rnoh-gesture-handler/src/main/cpp" ./gesture-handler)
add_subdirectory("${OH_MODULE_DIR}/rnoh-masked-view/src/main/cpp" ./masked-view)
add_subdirectory("${OH_MODULE_DIR}/rnoh-pdf-view/src/main/cpp" ./pdfview)
# RNOH_END: add_package_subdirectories

add_library(rnoh_app SHARED
    "./PackageProvider.cpp"
    "./Fabric/MarqueeViewEventEmitter.cpp"
    "./Fabric/Props.cpp"
    "./TurboModules/SampleTurboModuleSpec.cpp"
    "./TurboModules/SampleTurboModule2Spec.cpp"
    "./SampleTurboModulePackage.cpp"
    "${RNOH_CPP_DIR}/RNOHAppNapiBridge.cpp"
)

# RNOH_BEGIN: link_packages
target_link_libraries(rnoh_app PUBLIC rnoh)
target_link_libraries(rnoh_app PUBLIC rnoh_pager_view)
target_link_libraries(rnoh_app PUBLIC rnoh_svg)
target_link_libraries(rnoh_app PUBLIC rnoh_safe_area)
target_link_libraries(rnoh_app PUBLIC rnoh_gesture_handler)
target_link_libraries(rnoh_app PUBLIC rnoh_masked_view)
target_link_libraries(rnoh_app PUBLIC rnoh_pdf_view)
# RNOH_END: link_packages
