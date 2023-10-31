

add_library(realfile
			filesys.cpp

		# TODO: ps2 specific code!
			ps2/filedev.cpp
		)


set_target_properties(realfile PROPERTIES
		CXX_STANDARD 98
		CXX_EXTENSIONS ON
		CXX_STANDARD_REQUIRED ON
		)

target_link_libraries(realfile PUBLIC
		REAL::core
)

add_library(REAL::file ALIAS realfile)