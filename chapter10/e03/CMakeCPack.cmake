# 声明包的名称
set(CPACK_PACKAGE_NAME "${PROJECT_NAME}")

# 公司名称
set(CPACK_PACKAGE_VENDOR "ckelsel inc.")

# 源码包含一个如何编译安装的说明文件
set(CPACK_PACKAGE_DESCRIPTION_FILE "${PROJECT_SOURCE_DIR}/INSTALL.MD")

# 包的功能，是干嘛用的
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "message: test package")

# License
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")

# 安装目录
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/${PROJECT_NAME}")

# 版本号: 1.2.0
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "2")
set(CPACK_PACKAGE_VERSION_PATCH "0")

# 打包时，忽略文件、文件夹
set(CPACK_SOURCE_IGNORE_FILES "${PROJECT_BINARY_DIR};.git;.gitignore")

# 打包源码
set(CPACK_SOURCE_GENERATOR "ZIP;TGZ")

# 打包二进制
set(CPACK_GENERATOR "ZIP")
if(UNIX)
	if(CMAKE_SYSTEM_NAME MATCHES Linux)
		list(APPEND CPACK_GENERATOR "DEB")
		# 维护者
		set(CPACK_DEBIAN_PACKAGE_MAINTAINER "xkm@xkm.com")
		# 当前版本
		set(CPACK_DEBIAN_PACKAGE_SECTION "stable")
		# 依赖的第三方软件
		set(CPACK_DEBIAN_PACKAGE_DEPENDS "uuid-dev")
	endif()
endif()

message(STATUS "CPack generators: ${CPACK_GENERATOR}")

# 生成目标target
# cmake --build . --target xxx
# package/package_source
include(CPack)

# 在CMakeLists.txt添加
# include(CMakeCPack.cmake)
