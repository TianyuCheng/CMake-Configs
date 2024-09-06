cmake_policy(VERSION 3.6)
include(FetchContent)

# define external project
FetchContent_Declare(
  stb
  GIT_REPOSITORY https://github.com/nothings/stb.git
  GIT_TAG        0.9.9.8
)

# get properties
FetchContent_GetProperties(stb)

# populate stb when needed
if(NOT stb_POPULATED)
    FetchContent_Populate(stb)
endif()

# add stb target (if not done so)
if(NOT TARGET stb)
  add_library(stb INTERFACE)
  target_include_directories(stb INTERFACE ${stb_SOURCE_DIR})
endif()

# mark stb as found
set(stb_FOUND TRUE)

# put stb under folder
set_target_properties(stb PROPERTIES FOLDER "Vendors")
