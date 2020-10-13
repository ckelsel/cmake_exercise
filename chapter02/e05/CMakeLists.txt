cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(e05 LANGUAGES CXX)

foreach(key IN ITEMS
        NUMBER_OF_PHYSICAL_CORES
        TOTAL_VIRTUAL_MEMORY
        AVAILABLE_VIRTUAL_MEMORY
        TOTAL_PHYSICAL_MEMORY
        AVAILABLE_PHYSICAL_MEMORY
        HAS_FPU
        HAS_MMX
        HAS_MMX_PLUS
        HAS_SSE
        HAS_SSE_FP
        HAS_SSE_MMX
        OS_NAME
        OS_RELEASE
        OS_VERSION
        OS_PLATFORM
        NUMBER_OF_LOGICAL_CORES)
    cmake_host_system_information(RESULT _${key} QUERY ${key})
endforeach()

configure_file(config.h.in config.h @ONLY)

add_executable(${PROJECT_NAME} e05.cpp)

# target_include_directories(${PROJECT_NAME} ${PROJECT_BINARY_DIR})
include_directories(${PROJECT_BINARY_DIR})
