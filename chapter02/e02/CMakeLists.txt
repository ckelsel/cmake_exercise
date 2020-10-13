cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e02 LANGUAGES CXX)

add_executable(${PROJECT_NAME} e02.cpp)
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_definitions(${PROJECT_NAME} PUBLIC "OS_LINUX")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_definitions(${PROJECT_NAME} PUBLIC "OS_WINDOWS")
endif()

