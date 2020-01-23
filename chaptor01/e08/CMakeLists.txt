cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e08 LANGUAGES CXX)

message("C++ Compiler Flags: " ${CMAKE_CXX_FLAGS})

list(APPEND flags "-Zi")

add_library(math math.cpp)
target_compile_options(math
    PRIVATE
    ${flags})

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} math)
