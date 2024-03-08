file(GLOB APP_SRCS LIST_DIRECTORIES FALSE CONFIGURE_DEPENDS "*.cpp")

message("target executable: ${EXECUTABLE_NAME}")

#todo ADD APP_HEADERS
add_executable(${EXECUTABLE_NAME} ${APP_SRCS})
target_link_libraries(${EXECUTABLE_NAME} PRIVATE
	${MYLIB_NAME}
	nlohmann_json::nlohmann_json
	spdlog::spdlog
)
target_include_directories(
	${EXECUTABLE_NAME}
	PRIVATE
	${nlohmann_json_INCLUDE_DIRS}
)
# add_compile_definitions(SPDLOG_FMT_EXTERNAL)
# message(STATUS "including spdlog include dirs: ${spdlog_INCLUDE_DIRS}")
target_include_directories(
	${EXECUTABLE_NAME}
	PRIVATE
	${spdlog_INCLUDE_DIRS}
)
target_include_directories(
	${EXECUTABLE_NAME}
	PRIVATE
	${fmt_INCLUDE_DIRS}
)
# linea 128
# @: https://github.com/conan-io/conan-center-index/blob/master/recipes/spdlog/all/conanfile.py
target_compile_definitions(${EXECUTABLE_NAME} PRIVATE SPDLOG_FMT_EXTERNAL)
# target_include_directories(
# 	${EXECUTABLE_NAME}
# 	PRIVATE
# 	${fmt_INCLUDE_DIRS}
# )

target_set_warnings(${EXECUTABLE_NAME} ${WARNINGS_ENABLED} ${WARNINGS_ENABLED_AS_ERROR})
target_enable_lto(${EXECUTABLE_NAME} ${LTO_ENABLED})