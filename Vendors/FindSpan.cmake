include(FetchContent)

# define external project
FetchContent_Declare(
  span
  GIT_REPOSITORY https://github.com/tcbrindle/span.git
  GIT_TAG        836dc6a
)

# get properties
FetchContent_GetProperties(span)

# populate span when needed
if(NOT span_POPULATED)
    FetchContent_Populate(span)
endif()

# create the single header library
add_library(span INTERFACE)
target_include_directories(span INTERFACE ${span_SOURCE_DIR}/include)

# mark span as found
set(span_FOUND TRUE)

# put span under folder
set_target_properties(span PROPERTIES FOLDER "Vendors")
