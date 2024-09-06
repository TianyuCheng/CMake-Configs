include(FetchContent)

# define external project
FetchContent_Declare(
  spirvcross
  GIT_REPOSITORY https://github.com/KhronosGroup/SPIRV-Cross.git
  GIT_TAG        vulkan-sdk-1.3.283.0
)

# get properties
FetchContent_GetProperties(spirvcross)

# temporarily append compile options
get_property(compile_options DIRECTORY PROPERTY COMPILE_OPTIONS)
if(NOT CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  set_property(DIRECTORY APPEND PROPERTY COMPILE_OPTIONS -Wno-unqualified-std-cast-call)
endif()

# configure SPIRVCross
set(SPIRV_CROSS_CLI               OFF CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_CPP        OFF CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_HLSL       OFF CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_GLSL       ON  CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_MSL        ON  CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_REFLECT    OFF CACHE BOOL "" FORCE)
set(SPIRV_CROSS_ENABLE_TESTS      OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(spirvcross)

# remove temporarily added compile options
set_property(DIRECTORY PROPERTY COMPILE_OPTIONS ${compile_options})
unset(compile_options)

# mark spirvcross as found
set(spirvcross_FOUND TRUE)

# put spirvcross under folder
set_target_properties(spirv-cross-util PROPERTIES FOLDER "Vendors")
set_target_properties(spirv-cross-core PROPERTIES FOLDER "Vendors")
set_target_properties(spirv-cross-glsl PROPERTIES FOLDER "Vendors")
set_target_properties(spirv-cross-msl  PROPERTIES FOLDER "Vendors")
set_target_properties(spirv-cross-c    PROPERTIES FOLDER "Vendors")
