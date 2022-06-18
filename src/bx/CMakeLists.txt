add_executable(ssx
	# TODO: seperate this into another target_sources(ssx) call later
	$ENV{SCE}/ee/lib/crt0.s


	main.cpp
)


# maybe later: ps2sdk support
# for now I don't care

target_link_libraries(ssx

	# System libraries
	#kernel

	# Project libraries (by alias)
)

set_target_properties(ssx PROPERTIES
	# Binary output in the root.
	RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}

	# This is just for the base branch, and to hopefully
	# make sure we can actually compile the code with
	# ee-gcc.
	#
	# Later on a "modernization" branch could
	# be forked off to get the game compiling as
	# clean C++20, before the PC port.

	CXX_STANDARD 98
	CXX_EXTENSIONS ON
	CXX_STANDARD_REQUIRED ON
)
