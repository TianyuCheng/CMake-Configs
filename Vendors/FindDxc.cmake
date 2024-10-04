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

# fallback solution: find dxc from external package manager
# DirectXShadercompiler is a relatively big piece of software,
# therefore we would want to avoid building it ourselves.
# ===================================================
if(NOT dxc_FOUND)
  find_package(directx-dxc CONFIG REQUIRED)
  add_library(dxc ALIAS Microsoft::DirectXShaderCompiler)
  set(dxc_FOUND TRUE)
  message(STATUS "Found dxc from external package manager!")
endif()
