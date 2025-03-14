set(rtn_calculator_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")

file(GLOB_RECURSE rtn_calculator_generated_SRC "${rtn_calculator_generated_dir}/**/*.cpp")

file(GLOB rtn_calculator_SRC CONFIGURE_DEPENDS *.cpp)

add_library(rtn_calculator SHARED ${rtn_calculator_SRC} ${rtn_calculator_generated_SRC})

target_include_directories(rtn_calculator PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${rtn_calculator_generated_dir})

target_link_libraries(rtn_calculator PUBLIC rnoh)