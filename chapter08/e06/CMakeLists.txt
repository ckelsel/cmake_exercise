cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e06 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_BINARY_DIR}/subprojects)

set(STAGED_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/stage)
message(STATUS "${PROJECT_NAME} staged install: ${STAGED_INSTALL_PREFIX}")

add_subdirectory(external)

include_directories(${STAGED_INSTALL_PREFIX}/include)
link_directories(${STAGED_INSTALL_PREFIX}/lib)

add_subdirectory(src)
