cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e05 LANGUAGES CXX)

# 可以通过cmake -DUSE_LIBRARY=ON 来修改
set(USE_LIBRARY OFF)

# option选项，可修改值
# 变量名   提示信息   默认值
option(USE_LIBRARY "Compile sources into a library?" OFF)

# 输出是否创建库
message(STATUS "Compile sources into a library ${USE_LIBRARY}")

# cmake内部全局变量，add_library会查询该值
set(BUILD_SHARED_LIBRS OFF)

list(APPEND _sources message.cpp)

if(USE_LIBRARY)
	add_library(message ${_sources})
	add_executable(e05 e05.cpp)
	target_link_libraries(e05 message)
else(USE_LIBRARY)
	add_executable(e05 e05.cpp)
endif(USE_LIBRARY)

