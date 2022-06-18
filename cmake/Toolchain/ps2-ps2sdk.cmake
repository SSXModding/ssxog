# Based off the shipped ps2dev.cmake toolchain file
# in the ps2sdk source tree, modified for more idiomatic CMake

# This is unused atm, and not supported yet. Might be later.

set(CMAKE_SYSTEM_NAME Playstation2)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR "mips64r5900el")

# Make it so cmake sees modules here, so it can import
# our PlayStation2 platform. Otherwise, CMake will yell
# and complain (rightfully.)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

# C/C++ compiler

set(CMAKE_C_COMPILER mips64r5900el-ps2-elf-gcc)
set(CMAKE_CXX_COMPILER mips64r5900el-ps2-elf-g++)

# You may wanna edit these.

set(CMAKE_C_FLAGS_INIT "-I$ENV{PS2SDK}/ee/include -I$ENV{PS2SDK}/common/include -D_EE -DPLATFORM_PS2 -G0 -fno-stack-protector -fno-ident")
set(CMAKE_C_FLAGS_RELEASE_INIT "${CMAKE_C_FLAGS_INIT} -fomit-frame-pointer")
set(CMAKE_CXX_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} -fno-threadsafe-statics")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "${CMAKE_C_FLAGS_RELEASE_INIT} ${CMAKE_CXX_FLAGS_INIT}")
set(CMAKE_EXE_LINKER_FLAGS_INIT " -L$ENV{PS2SDK}/ee/lib")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT "-s")


set(CMAKE_FIND_ROOT_PATH $ENV{PS2DEV} $ENV{PS2DEV}/ee $ENV{PS2DEV}/ee/ee $ENV{PS2SDK} $ENV{PS2SDK}/ports)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
