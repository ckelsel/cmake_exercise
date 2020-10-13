cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e02 LANGUAGES CXX)

add_executable(e02 test.cpp)

enable_testing()

add_test(NAME e02_test
    COMMAND $<TARGET_FILE:e02>
    )

set_tests_properties(e02_test PROPERTIES WILL_FAIL TRUE)
