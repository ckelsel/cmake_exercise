# 版本号对应
project(e01
    LANGUAGES CXX
    VERSION 1.0.0
    )

set_target_properties(message-shared
  PROPERTIES
    SOVERSION ${PROJECT_VERSION_MAJOR}
  )

# 安装所有文件
install(
  TARGETS
    message-shared
    hello-world_wDSO
  ARCHIVE
    DESTINATION ${INSTALL_LIBDIR}
    COMPONENT lib
  RUNTIME
    DESTINATION ${INSTALL_BINDIR}
    COMPONENT bin
  LIBRARY
    DESTINATION ${INSTALL_LIBDIR}
    COMPONENT lib
  PUBLIC_HEADER
    DESTINATION ${INSTALL_INCLUDEDIR}/message
    COMPONENT dev
  )

## 安装所有组件
 cmake --build . --target install

## 指定组件安装
 cmake -D COMPONENT=lib -P cmake_install.cmake


##  UNIX系统可以指定DESTDIR来安装
 env DESTDIR=/tmp/stage cmake --build . --target install
