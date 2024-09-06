include(FetchContent)

# define SetDPI project
FetchContent_Declare(
  setdpi
  GIT_REPOSITORY https://github.com/imniko/SetDPI.git
  GIT_TAG        v1.0
)

# get properties
FetchContent_GetProperties(setdpi)

# populate setdpi
if(NOT setdpi_POPULATED)
  FetchContent_Populate(setdpi)
endif()

# add setdpi target (if not done so)
if(NOT TARGET setdpi)
  add_library(setdpi
    ${setdpi_SOURCE_DIR}/DpiHelper.h
    ${setdpi_SOURCE_DIR}/DpiHelper.cpp
  )

  # setdpi headers
  target_include_directories(setdpi PUBLIC ${setdpi_SOURCE_DIR})
endif()

# mark setdpi as found
set(setdpi_FOUND TRUE)

# put setdpi under folder
set_target_properties(setdpi PROPERTIES PREFIX "")
set_target_properties(setdpi PROPERTIES FOLDER "Vendors")
