project(WidgetFactory)

cmake_minimum_required(VERSION 2.8.7)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Our CMake modules
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")

# Installation directories
include(HawaiiInstallDirs)

# Make CPack available to easy generate binary packages
include(CPack)

# Add custom uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)

add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# Build flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fvisibility=hidden -fvisibility-inlines-hidden -Wall -std=c++0x")

# Assume release build by default
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "" FORCE)
endif()

# Disable debug output for release builds
if(CMAKE_BUILD_TYPE MATCHES "^[Rr]elease$")
    add_definitions(-DQT_NO_DEBUG_OUTPUT)
endif()

# Find Qt5 libraries
find_package(Qt5Widgets REQUIRED)
if(NOT Qt5Widgets_FOUND)
    message(FATAL_ERROR "Qt5Widgets module is required!")
endif()

# Installation directories
set(CMAKE_INSTALL_SYSTEMDIR "/system")
set(CMAKE_INSTALL_DEVELOPDIR "${CMAKE_INSTALL_SYSTEMDIR}/develop")
set(CMAKE_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_DEVELOPDIR}/headers")
set(CMAKE_INSTALL_BINDIR "${CMAKE_INSTALL_SYSTEMDIR}/bin")
set(CMAKE_INSTALL_LIBDIR "${CMAKE_INSTALL_SYSTEMDIR}/lib")
set(CMAKE_INSTALL_PLUGINSDIR "${CMAKE_INSTALL_SYSTEMDIR}/plugins")
set(CMAKE_INSTALL_DATADIR "${CMAKE_INSTALL_SYSTEMDIR}/data")
set(CMAKE_INSTALL_THEMESDIR "${CMAKE_INSTALL_DATADIR}/themes")
set(CMAKE_INSTALL_APPSDIR "${CMAKE_INSTALL_SYSTEMDIR}/apps")
set(CMAKE_INSTALL_IMPORTSDIR "${CMAKE_INSTALL_SYSTEMDIR}/imports")

# Subdirectories
add_subdirectory(src)
