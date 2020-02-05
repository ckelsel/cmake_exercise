# 版本号对应
project(e01
    LANGUAGES CXX
    VERSION 1.0.0
    )

set_target_properties(message-shared
  PROPERTIES
    SOVERSION ${PROJECT_VERSION_MAJOR}
  )
# 安装头文件
set(EXPORT_HEADERS
    ${PROJECT_INCLUDE_DIR}/jsonrpc.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_client.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_common.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_handler.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_httpclient.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_server.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_tcpclient.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_tcpserver.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_udpclient.h
    ${PROJECT_INCLUDE_DIR}/jsonrpc_udpserver.h
    ${PROJECT_INCLUDE_DIR}/netstring.h
    ${PROJECT_INCLUDE_DIR}/networking.h
    ${PROJECT_INCLUDE_DIR}/system.h)

## PUBLIC_HEADER需要用""
set_target_properties(jsonrpc
  PROPERTIES
    POSITION_INDEPENDENT_CODE 1
    PUBLIC_HEADER "${EXPORT_HEADERS}"
    WINDOWS_EXPORT_ALL_SYMBOLS ON
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
    DESTINATION ${INSTALL_INCLUDEDIR}
    COMPONENT dev
  )

## 安装所有组件
 cmake --build . --target install

## 指定组件安装
 cmake -D COMPONENT=lib -P cmake_install.cmake


##  UNIX系统可以指定DESTDIR来安装
 env DESTDIR=/tmp/stage cmake --build . --target install
