cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e03 LANGUAGES CXX)

add_executable(${PROJECT_NAME} e03.cpp)

if(CMAKE_CXX_COMPILER_ID MATCHES Intel)
    target_compile_definitions(${PROJECT_NAME} PUBLIC "CXX_COMPILER_INTEL")
elseif(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    target_compile_definitions(${PROJECT_NAME} PUBLIC "CXX_COMPILER_GNU")
elseif(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
    target_compile_definitions(${PROJECT_NAME} PUBLIC "CXX_COMPILER_MSVC")
endif()

