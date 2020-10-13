2.5 检测处理器指令集

<!-- 生成的config.h在 ${PROJECT_BINARY_DIR} -->
从config.h.in 生成config.h

config.h.in
<!-- CMakeLists.txt里面必须定义NUMBER_OF_LOGICAL_CORES变量 -->
<!-- 定义NUMBER_OF_LOGICAL_CORES 为"1" -->
<!-- set(NUMBER_OF_LOGICAL_CORES "1") -->

<!-- 如果定义了NUMBER_OF_LOGICAL_CORES -->
<!-- if (defined NUMBER_OF_LOGICAL_CORES) -->
<!-- #define NUMBER_OF_LOGICAL_CORES ${NUMBER_OF_LOGICAL_CORES} -->
<!-- else -->
<!-- // #undef NUMBER_OF_LOGICAL_CORES -->

```
#cmakedefine NUMBER_OF_LOGICAL_CORES "@NUMBER_OF_LOGICAL_CORES@"
```

cmake_host_system_information(RESULT _NUMBER_OF_LOGICAL_CORES QUERY NUMBER_OF_LOGICAL_CORES)

configure_file(config.h.in config.h @ONLY)

<!-- 包含config.h的路径 -->
include_directories(${PROJECT_BINARY_DIR})


    
