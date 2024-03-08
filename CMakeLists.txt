cmake_minimum_required(VERSION 3.16)

project(cmake_lab VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD			17)
set(CMAKE_CXX_STANDARD_REQUIRED	ON)
set(CMAKE_CXX_EXTENSIONS		OFF)

option(WARNINGS_ENABLED "warnings compiler option" ON)
option(WARNINGS_ENABLED_AS_ERROR "error on warnings compiler option" OFF)
option(SANITIZE_ENABLED "enable sanitizers" OFF)
option(LTO_ENABLED "enable link time optimizations" ON)

set(CMAKE_BUILD_TYPE "Release" CACHE STRING "build type")
set(EXECUTABLE_NAME "test.out" CACHE STRING "the name of the executable")
set(MYLIB_NAME "my_lib" CACHE STRING "the name given to the compiled \'my_lib'\ library")
set(CONFIGURED_FILES_DIR "configured_files" CACHE STRING "where to put configuration file in the build directory")
# for non CMake-project dependencies
set(SUBMODULES_PATH "external/" CACHE STRING
"path of external git submodules of project"
)

# for include() and find_package() directives
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

####	Conan dependencies
include(InstallDependencies)

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
find_package(nlohmann_json REQUIRED)
find_package(spdlog REQUIRED)
find_package(fmt REQUIRED)
#todo FMT, Spdlog, cxxopts, catch2 v2.13.9


include(Warnings)
include(Sanitizers)
include(LTO)
include(Docs)

enable_sanitizers()

add_subdirectory(configured)
add_subdirectory(src)
add_subdirectory(app)








## to delete
include(TestParseArguments)

option(OPT_ONE ON)
option(OPT_TWO OFF)
set(ONEVAL_ONE "ONE")
set(ONEVAL_TWO "TWO")
set(MULTI_VAL_ONE "ONEONE")
set(MULTI_VAL_TWO "TWOTWO")
dummy(
	OPT_VAL ON OFF
	ONE_VAL "ONE" "TWO"
	MULTI_VAL "ONEONE" "TWOTWO"
)
##
