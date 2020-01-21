cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e01 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# if the EP_BASE directory property is set then components of an external project are stored under the specified base:
#
# TMP_DIR      = <base>/tmp/<name>
# STAMP_DIR    = <base>/Stamp/<name>
# DOWNLOAD_DIR = <base>/Download/<name>
# SOURCE_DIR   = <base>/Source/<name>
# BINARY_DIR   = <base>/Build/<name>
# INSTALL_DIR  = <base>/Install/<name>
# LOG_DIR      = <STAMP_DIR>
set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_BINARY_DIR}/subprojects)

# ExternalProject_Add在ExternalProject中定义
include(ExternalProject)

# ${PROJECT_NAME}_core不需要跟项目的实际名称对应
ExternalProject_Add(${PROJECT_NAME}_core
    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/src
    CMAKE_ARGS -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
            -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
            -DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS}
            -DCMAKE_CXX_STANDARD_REQUIRED=${CMAKE_CXX_STANDARD_REQUIRED}
    CMAKE_CACHE_ARGS
        -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    BUILD_ALWAYS 1
    INSTALL_COMMAND ""
)
