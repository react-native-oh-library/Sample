set(rtn_centered_text_generated_dir "${CMAKE_CURRENT_SOURCE_DIR}/generated")

file(GLOB_RECURSE rtn_centered_text_generated_SRC "${rtn_centered_text_generated_dir}/**/*.cpp")

file(GLOB rtn_centered_text_SRC CONFIGURE_DEPENDS *.cpp)

add_library(rtn_centered_text SHARED ${rtn_centered_text_SRC} ${rtn_centered_text_generated_SRC})

target_include_directories(rtn_centered_text PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${rtn_centered_text_generated_dir})

target_link_libraries(rtn_centered_text PUBLIC rnoh)