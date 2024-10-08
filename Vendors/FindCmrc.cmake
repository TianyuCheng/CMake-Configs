include(FetchContent)

# define external project
FetchContent_Declare(
  cmrc
  GIT_REPOSITORY https://github.com/vector-of-bool/cmrc.git
  GIT_TAG        2.0.1
)

# get properties
FetchContent_GetProperties(cmrc)

# build cmrc when needed
if(NOT cmrc_POPULATED)
  set(CMAKE_WARN_DEPRECATED FALSE)
  set(BUILD_TESTS OFF CACHE BOOL "" FORCE)
  FetchContent_MakeAvailable(cmrc)
endif()

# mark cmrc as found
set(cmrc_FOUND TRUE)
