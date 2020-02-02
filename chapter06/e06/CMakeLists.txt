cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(example LANGUAGES CXX)

set(GIT_HASH "unknown")
find_package(Git)
if (GIT_FOUND)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h
        OUTPUT_VARIABLE GIT_HASH)
endif()

message(STATUS "hash: ${GIT_HASH}")

add_executable(example test.cpp)

configure_file(
    config.h.in
    config.h
    @ONLY)

target_include_directories(example
    PRIVATE
    ${CMAKE_BINARY_DIR})

enable_testing()

add_test(NAME test
    COMMAND $<TARGET_FILE:example>)
