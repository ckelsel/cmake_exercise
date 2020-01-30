cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e07 LANGUAGES CXX)

add_executable(e07 test.cpp)

enable_testing()

add_test(NAME e07_test
    COMMAND $<TARGET_FILE:e07>
    )

set_tests_properties(e07_test PROPERTIES TIMEOUT 1)
