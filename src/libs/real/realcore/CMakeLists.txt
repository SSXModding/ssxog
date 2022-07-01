

add_library(realcore
			inittmr.cpp
		)

set_target_properties(realcore PROPERTIES
		CXX_STANDARD 98
		CXX_EXTENSIONS ON
		CXX_STANDARD_REQUIRED ON
		)

# alias target.
add_library(REAL::core ALIAS realcore)