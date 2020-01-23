1.8 设置编译器选项

```
list(APPEND flags "-Zi")

add_library(math math.cpp)
target_compile_options(math
    PRIVATE
    ${flags})
```
