cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(googletest LANGUAGES CXX)

include(ExternalProject)

set(CompilerFlags
    CMAKE_CXX_FLAGS
    CMAKE_CXX_FLAGS_DEBUG
    CMAKE_CXX_FLAGS_RELEASE
)
foreach(CompilerFlag ${CompilerFlags})
string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
endforeach()

ExternalProject_Add(
    ${PROJECT_NAME}
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${STAGED_INSTALL_PREFIX}
        -DCMAKE_CXX_FLAGS=${DCMAKE_CXX_FLAGS}
        -DCMAKE_CXX_FLAGS_DEBUG=${DCMAKE_CXX_FLAGS_DEBUG}
        -DCMAKE_CXX_FLAGS_RELEASE=${DCMAKE_CXX_FLAGS_RELEASE}

    SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/googletest
    )
