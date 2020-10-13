2.4 判断处理器体系结构

需要指定Win64来生成64位的，否则默认32位
cmake .. -G "Visual Studio 14 2015 Win64"

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  message(STATUS "Target is 64 bits")
else()
  message(STATUS "Target is 32 bits")
endif()
