cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e03 LANGUAGES CXX)


if (CMAKE_SIZEOF_VOID_P EQUAL 8)
    message("Target is 64 bits")
else()
    message("Target is 32 bits")
endif()
