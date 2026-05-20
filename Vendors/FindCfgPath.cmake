include(FetchContent)

# define external project
FetchContent_Declare(
  cfgpath
  GIT_REPOSITORY https://github.com/Malvineous/cfgpath.git
  GIT_TAG        master
)

# get properties
FetchContent_GetProperties(cfgpath)

# populate cfgpath when needed
if(NOT cfgpath_POPULATED)
  FetchContent_Populate(cfgpath)
endif()

# create the single header library
add_library(cfgpath INTERFACE)
target_include_directories(cfgpath INTERFACE ${cfgpath_SOURCE_DIR})

# mark cfgpath as found
set(cfgpath_FOUND TRUE)

# put cfgpath under folder
set_target_properties(cfgpath PROPERTIES FOLDER "Vendors")
