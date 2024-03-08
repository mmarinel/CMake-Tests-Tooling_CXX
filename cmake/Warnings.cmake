function(target_set_warnings TARGET ENABLED ENABLED_AS_ERRORS)
	if (${ENABLED})
		set_warnings_variables()
		if (${ENABLED_AS_ERRORS})
			set_warnings_as_error()
		endif()
		set_compiler_warnings()
		message(STATUS "Warnings SET for target: ${TARGET}")
	else()
		message(STATUS "Warnings disabled for target: ${TARGET}")
		endif()
endfunction(target_set_warnings TARGET ENABLED ENABLED_AS_ERRORS)

function(set_warnings_variables)
	set(
		MSVC_WARNINGS
		/w4
		/permissive-
		PARENT_SCOPE
	)
	set(
		CLANG_WARNINGS
		-Wall
		-Wextra
		-Wpedantic
		PARENT_SCOPE
	)
	set(
		GCC_WARNINGS
		-Wall
		-Wextra
		-Wpedantic
		PARENT_SCOPE
	)
endfunction(set_warnings_variables)

function(set_warnings_as_error)
	set(MSVC_WARNINGS ${MSVC_WARNINGS} /WX PARENT_SCOPE)
	set(CLANG_WARNINGS ${CLANG_WARNINGS} -Werror  PARENT_SCOPE)
	set(GCC_WARNINGS ${GCC_WARNINGS} -Werror  PARENT_SCOPE)
endfunction(set_warnings_as_error)

function(set_compiler_warnings)
	if (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
		target_compile_options(${TARGET} PRIVATE ${MSVC_WARNINGS})
	elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
		target_compile_options(${TARGET} PRIVATE ${GCC_WARNINGS})
	elseif(CMAKE_CXX_COMPILER_ID MATCHES "CLANG")
		target_compile_options(${TARGET} PRIVATE ${CLANG_WARNINGS})
	endif()
endfunction(set_compiler_warnings)
