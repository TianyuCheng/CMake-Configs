cmake_minimum_required(VERSION 3.26)

# use only in-house cmake modules
list(PREPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/Configs")
list(PREPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/Vendors")

# options
option(ENABLE_SAMPLES "Enable building samples" ON)

if(ENABLE_SAMPLES)
  project(CMake-Configs VERSION 1.0 LANGUAGES C CXX OBJC)
  add_subdirectory(Samples)
endif()
