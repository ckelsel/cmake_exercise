# Search for pkg-config and UUID
find_package(PkgConfig QUIET)
if(PKG_CONFIG_FOUND)
  pkg_search_module(UUID uuid IMPORTED_TARGET)
  if(TARGET PkgConfig::UUID)
    message(STATUS "Found libuuid")
    set(UUID_FOUND TRUE)
  endif()
endif()

add_library(message-shared SHARED )
target_sources(message-shared
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/message.cpp)

target_compile_definitions(message-shared
  PUBLIC
      $<$<BOOL:${UUID_FOUND}>:HAVE_UUID>
  )
target_link_libraries(message-shared
  PUBLIC
      $<$<BOOL:${UUID_FOUND}>:PkgConfig::UUID>
  )

set_target_properties(message-shared
  PROPERTIES
    POSITION_INDEPENDENT_CODE 1
    SOVERSION ${PROJECT_VERSION_MAJOR}
    OUTPUT_NAME "message"
    DEBUG_POSTFIX "_d"
    PUBLIC_HEADER "message.h"
    MACOSX_RPATH ON
    WINDOWS_EXPORT_ALL_SYMBOLS ON
  )

add_executable(hello_wDSO hello.cpp)

target_link_libraries(hello_wDSO message-shared)
install(
    TARGETS
        message-shared
        hello_wDSO
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
