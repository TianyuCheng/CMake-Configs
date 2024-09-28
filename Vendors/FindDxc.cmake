# find dxc using D3D12 (Windows only)
# ===================================================
find_package(D3D12)
if(D3D12_FOUND)
  set(dxc_FOUND TRUE)
  add_library(dxc SHARED IMPORTED)
  target_include_directories(dxc INTERFACE ${DXGI_INCLUDE_DIR})
  target_include_directories(dxc INTERFACE ${D3D12_INCLUDE_DIR})
  set_target_properties(dxc PROPERTIES
    IMPORTED_IMPLIB dxcompiler.lib
    IMPORTED_LOCATION dxcompiler.dll
    IMPORTED_CONFIGURATIONS "RELEASE;DEBUG"
  )
  message(STATUS "Found dxc from D3D12 SDK!")
endif()

# ===================================================
# fallback solution: find dxc from Vulkan's component
if(NOT dxc_FOUND)
  find_package(Vulkan COMPONENTS dxc)
  if(Vulkan_FOUND)
    set(dxc_FOUND TRUE)
    add_library(dxc ALIAS Vulkan::dxc_lib)
    message(STATUS "Found dxc from Vulkan SDK!")
  endif()
endif()

# # fallback solution: build dxc using FetchContent
# # ===================================================
# if(NOT dxc_FOUND)
#   include(FetchContent)
#
#   # add ms extension for clang to build DXC
#   if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
#     add_compile_options(-fms-extensions)
#   endif()
#
#   # define external project
#   FetchContent_Declare(
#     dxc
#     GIT_REPOSITORY https://github.com/microsoft/DirectXShaderCompiler.git
#     GIT_TAG        v1.8.2407
#   )
#
#   # get properties
#   FetchContent_GetProperties(dxc)
#
#   # populate dxc
#   if(NOT dxc_POPULATED)
#     FetchContent_Populate(dxc)
#   endif()
#
#   # build dxc when needed
#   include(${dxc_SOURCE_DIR}/cmake/caches/PredefinedParams.cmake)
#   FetchContent_MakeAvailable(dxc)
#
#   # dxc alias
#   # add_library(dxc ALIAS dxcompiler)
#   # set_target_properties(dxc PROPERTIES FOLDER "Vendors")
#
#   # mark dxc as found
#   set(dxc_FOUND TRUE)
# endif()
