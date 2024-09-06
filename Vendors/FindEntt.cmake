cmake_policy(VERSION 3.6)
include(FetchContent)

# define external project
FetchContent_Declare(
  entt
  GIT_REPOSITORY https://github.com/skypjack/entt.git
  GIT_TAG        v3.13.2
)

# get properties
FetchContent_GetProperties(entt)

# populate entt when needed
if(NOT entt_POPULATED)
    FetchContent_Populate(entt)
endif()

# add stb target (if not done so)
if(NOT TARGET entt)
  add_library(entt INTERFACE)
  target_include_directories(entt INTERFACE ${entt_SOURCE_DIR}/single_include)
endif()

# mark stb as found
set(entt_FOUND TRUE)

# put stb under folder
set_target_properties(entt PROPERTIES FOLDER "Vendors")
