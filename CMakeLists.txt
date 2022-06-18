cmake_minimum_required(VERSION 3.19)

# Prohibit in-source tree builds.
if(" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source-tree builds are strictly prohibited. Please don't do them.")
endif()

include(${CMAKE_SOURCE_DIR}/cmake/Policies.cmake)
project(ssxog LANGUAGES C CXX)

add_subdirectory(src/bx)
