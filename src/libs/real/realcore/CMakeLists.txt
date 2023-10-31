

add_library(realcore
			inittmr.cpp
		)

set_target_properties(realcore PROPERTIES
		CXX_STANDARD 98
		CXX_EXTENSIONS ON
		CXX_STANDARD_REQUIRED ON
		)

target_include_directories(realcore PUBLIC
		${PROJECT_SOURCE_DIR}/src/libs/real/include/cmn)

#todo ps2

# alias target.
add_library(REAL::core ALIAS realcore)