include(FetchContent)

# define external project
FetchContent_Declare(
  doctest
  GIT_REPOSITORY https://github.com/doctest/doctest.git
  GIT_TAG        v2.4.11
)

# get properties
FetchContent_GetProperties(doctest)

# build doctest when needed
set(DOCTEST_USE_STD_HEADERS         OFF CACHE BOOL "" FORCE)
set(DOCTEST_WITH_TESTS              OFF CACHE BOOL "" FORCE)
set(DOCTEST_WITH_MAIN_IN_STATIC_LIB ON  CACHE BOOL "" FORCE)
set(DOCTEST_NO_INSTALL              ON  CACHE BOOL "" FORCE)
if(NOT doctest_POPULATED)
  FetchContent_Populate(doctest)
endif()

# add glm target (if not done so)
if(NOT TARGET doctest)
  add_library(doctest INTERFACE)
  target_include_directories(doctest INTERFACE ${doctest_SOURCE_DIR})
endif()

# mark doctest as found
set(doctest_FOUND TRUE)

# put doctest under folder
set_target_properties(doctest PROPERTIES FOLDER "Vendors")
