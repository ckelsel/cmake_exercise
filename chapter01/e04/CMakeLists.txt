cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e04 LANGUAGES CXX)

# 硬编码
# 无法通过cmake -DUSE_LIBRARY=ON 来修改
set(USE_LIBRARY OFF)

# message只是输出信息，不是option
message(STATUS "Compile sources into a library? ${USE_LIBRARY}")

# cmake内部全局变量，add_library会查询该值
set(BUILD_SHARED_LIBRS OFF)

list(APPEND _sources message.cpp)

if(USE_LIBRARY)
	add_library(message ${_sources})
	add_executable(e04 e04.cpp)
	target_link_libraries(e04 message)
else(USE_LIBRARY)
	add_executable(e04 e04.cpp)
endif(USE_LIBRARY)

