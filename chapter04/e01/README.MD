4.1 创建一个简单的单元测试

## Windows平台，需要指定测试release版本还是debug版本
cmake --build . --config release
ctest -C release -VV

## 成功的测试用例需要返回0
```
int main(int argc, char **argv)
{
    return add(1, 1) == 2 ? 0 : 1;
}
```

## 指定测试文件名: COMMAND $<TARGET_FILE:e01>

e01代表一个可执行文件的target
add_executable(e01 test.cpp math.cpp)
add_test(NAME e01_test
    COMMAND $<TARGET_FILE:e01>
    )

## enable_testing()
测试当前目录和所有子文件夹

