include(System)
include(Compiler)

# boxer
find_package(boxer REQUIRED)
add_executable(boxer-sample boxer_sample.cpp)
target_link_libraries(boxer-sample PRIVATE boxer)
set_target_properties(boxer-sample PROPERTIES FOLDER "Samples")

# cxxopts
find_package(cxxopts REQUIRED)
add_executable(cxxopts-sample cxxopts_sample.cpp)
target_link_libraries(cxxopts-sample PRIVATE cxxopts)
set_target_properties(cxxopts-sample PROPERTIES FOLDER "Samples")

# doctest
find_package(doctest REQUIRED)
add_executable(doctest-sample doctest_sample.cpp)
target_link_libraries(doctest-sample PRIVATE doctest)
set_target_properties(doctest-sample PROPERTIES FOLDER "Samples")

# eigen
find_package(eigen REQUIRED)
add_executable(eigen-sample eigen_sample.cpp)
target_link_libraries(eigen-sample PRIVATE eigen)
set_target_properties(eigen-sample PROPERTIES FOLDER "Samples")

# entt
find_package(entt REQUIRED)
add_executable(entt-sample entt_sample.cpp)
target_link_libraries(entt-sample PRIVATE entt)
set_target_properties(entt-sample PROPERTIES FOLDER "Samples")

# glfw
find_package(glfw REQUIRED)
add_executable(glfw-sample glfw_sample.cpp)
target_link_libraries(glfw-sample PRIVATE glfw)
set_target_properties(glfw-sample PROPERTIES FOLDER "Samples")

# glm
find_package(glm REQUIRED)
add_executable(glm-sample glm_sample.cpp)
target_link_libraries(glm-sample PRIVATE glm)
set_target_properties(glm-sample PROPERTIES FOLDER "Samples")

# dxc
find_package(dxc REQUIRED)
add_executable(dxc-sample dxc_sample.cpp)
target_link_libraries(dxc-sample PRIVATE dxc)
set_target_properties(dxc-sample PROPERTIES FOLDER "Samples")
if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  target_compile_options(dxc-sample PRIVATE -fms-extensions)
endif()
