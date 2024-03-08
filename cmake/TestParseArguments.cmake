function(dummy)
	set(options OPT_VAL)
	set(oneValueArgs ONE_VAL)
	set(multiValueArgs MULTI_VAL)
	cmake_parse_arguments(
		DUMMY
		"${options}"
		"${oneValueArgs}"
		"${multiValueArgs}"
		${ARGN}
	)
	message(STATUS "OPT_VAL: ${DUMMY_OPT_VAL}")
	message(STATUS "ONE_VAL: ${DUMMY_ONE_VAL}")
	message(STATUS "MULTI_VAL: ${DUMMY_MULTI_VAL}")
	foreach(arg IN LISTS options)
		message(STATUS "option: ${arg}")
	endforeach()
	foreach(arg IN LISTS oneValueArgs)
		message(STATUS "oneValueArgs: ${arg}")
	endforeach()
	foreach(arg IN LISTS multiValueArgs)
		message(STATUS "multiValueArgs: ${arg}")
	endforeach()
	
endfunction(dummy)
