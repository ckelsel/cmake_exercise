cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e01 LANGUAGES CXX)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    message("OS: Linux")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    message("OS: Windows")
endif()
