cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
project(e03 LANGUAGES CXX)

# 创建OBJECT
add_library(message-objs
	OBJECT
	message.cpp)

add_executable(e03 e03.cpp)

# 使用message-obj创建静态库
add_library(message-shared
		SHARED
		$<TARGET_OBJECTS:message-objs>)

# 使用message-obj创建动态库
add_library(message-static
		STATIC
		$<TARGET_OBJECTS:message-objs>)

target_link_libraries(e03 message-static)
