project(MauiTheme NONE)

cmake_minimum_required(VERSION 2.8.9)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed
set(CMAKE_AUTOMOC ON)

# Set version
set(THEME_VERSION_MAJOR 0)
set(THEME_VERSION_MINOR 1)
set(THEME_VERSION_PATCH 0)
set(THEME_VERSION_STRING "${THEME_VERSION_MAJOR}.${THEME_VERSION_MINOR}.${THEME_VERSION_PATCH}")

# GNUInstallDirs cannot detect current architecture because we don't have
# a default language defined here, hence it cannot set CMAKE_INSTALL_LIBDIR.
# To stop it from complain we set a default value here.
set(CMAKE_INSTALL_LIBDIR "lib")

# Installation directories
include(GNUInstallDirs)

# Paths
set(PLYMOUTH_THEMESDIR "${CMAKE_INSTALL_FULL_DATADIR}/plymouth/themes")

# Macro to print feature summary
include(FeatureSummary)

# Add custom uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)
add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# Set up packaging
set(CPACK_PACKAGE_NAME "maui-theme")
set(CPACK_PACKAGE_VERSION "${THEME_VERSION_STRING}")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_SOURCE_IGNORE_FILES "/build/;/.git;/*.user;/.tx/;~$;${CPACK_SOURCE_IGNORE_FILES}")
include(CPack)
add_custom_target(dist COMMAND ${CMAKE_MAKE_PROGRAM} package_source)

# Subdirectories
add_subdirectory(plymouth)

# Display featute summary
feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
