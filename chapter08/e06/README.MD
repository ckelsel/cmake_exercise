## 开发项目依赖1个外部项目
### 项目列表
main项目
googletest项目


## 知识点
1. 先编译googletest项目
    add_dependencies(main googletest)

2. 找到googletest的头文件和库文件，并链接
#### 统一安装在一个指定路径
        头文件:${STAGED_INSTALL_PREFIX}/include
        库文件:${STAGED_INSTALL_PREFIX}/lib

#### 引用该路径
    include_directories(${STAGED_INSTALL_PREFIX}/include)
    link_directories(${STAGED_INSTALL_PREFIX}/lib)

```
# 设置一个统一的路径: build/subprojects
set_property(DIRECTORY PROPERTY EP_BASE ${CMAKE_BINARY_DIR}/subprojects)

# 设置暂存路径${STAGED_INSTALL_PREFIX} ，googletest项目结束后会安装在这里
set(STAGED_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/stage)
message(STATUS "${PROJECT_NAME} staged install: ${STAGED_INSTALL_PREFIX}")

add_subdirectory(external/upstream)

include(ExternalProject)
ExternalProject_Add(${PROJECT_NAME}_core
  DEPENDS
    message_external
  SOURCE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}/src
  CMAKE_ARGS
# 指定安装到这里${STAGED_INSTALL_PREFIX}
    -DCMAKE_INSTALL_PREFIX=${STAGED_INSTALL_PREFIX}
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
    -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
    -DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS}
    -DCMAKE_CXX_STANDARD_REQUIRED=${CMAKE_CXX_STANDARD_REQUIRED}
    -Dmessage_DIR=${message_DIR}
  CMAKE_CACHE_ARGS
    -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH}
  BUILD_ALWAYS
    1
  )
```
