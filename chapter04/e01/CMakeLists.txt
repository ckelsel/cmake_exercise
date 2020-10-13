cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e01 LANGUAGES CXX)

add_executable(e01 test.cpp math.cpp)

enable_testing()

add_test(NAME e01_test
    COMMAND $<TARGET_FILE:e01>
    )

