# Based off the shipped ps2dev.cmake toolchain file
# in the ps2sdk source tree, modified for more idiomatic CMake

set(CMAKE_SYSTEM_NAME Playstation2)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR "ee")


# Make it so cmake sees modules here, so it can import
# our PlayStation2 platform. Otherwise, CMake will yell
# and complain (rightfully.)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

# C/C++ compiler

set(CMAKE_C_COMPILER $ENV{SCE}/ee/gcc/bin/ee-gcc)
set(CMAKE_CXX_COMPILER $ENV{SCE}/ee/gcc/bin/ee-g++)

# We can't use the compiler generated dependency files,
# since it adds flags GCC 2.9 doesn't understand.
# While it understands -MD, it does not understand -MT or -MF,
# which causes the actual build to end up failing.
#
# This option is only obeyed with the Makefile generator,
# which is why Ninja cannot be used.
set(CMAKE_DEPENDS_USE_COMPILER OFF)

set(CMAKE_C_FLAGS_INIT "-I$ENV{SCE}/ee/include -I$ENV{SCE}/common/include -DBX_PLATFORM_PS2 -DBX_PS2_SONYSDK -fno-exceptions -fno-common")
set(CMAKE_C_FLAGS_RELEASE_INIT "${CMAKE_C_FLAGS_INIT}")
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_C_FLAGS_INIT}")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "${CMAKE_C_FLAGS_RELEASE_INIT} ${CMAKE_CXX_FLAGS_INIT}")
set(CMAKE_EXE_LINKER_FLAGS_INIT " -L$ENV{SCE}/ee/lib -mno-crt0 -T $ENV{SCE}/ee/lib/app.cmd")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT "")


set(CMAKE_FIND_ROOT_PATH $ENV{SCE} $ENV{SCE}/ee)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
