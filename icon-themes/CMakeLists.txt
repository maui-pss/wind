project(HawaiiIconThemes)

cmake_minimum_required(VERSION 2.8.7)

# Version
set(ICON_THEMES_VERSION_MAJOR 0)
set(ICON_THEMES_VERSION_MINOR 2)
set(ICON_THEMES_VERSION_PATCH 0)
set(ICON_THEMES_VERSION_STRING "${ICON_THEMES_VERSION_MAJOR}.${ICON_THEMES_VERSION_MINOR}.${ICON_THEMES_VERSION_PATCH}")

# Installation directories
include(GNUInstallDirs)

# Add custom uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)

add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# Set up packaging
set(CPACK_PACKAGE_NAME "hawaii-icon-themes")
set(CPACK_PACKAGE_VERSION "${ICON_THEMES_VERSION_STRING}")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SET_DESTDIR FALSE)
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}")
set(CPACK_SOURCE_IGNORE_FILES "/build/;/.git;/.tx/;~$;${CPACK_SOURCE_IGNORE_FILES}")
include(CPack)
add_custom_target(dist COMMAND ${CMAKE_MAKE_PROGRAM} package_source)

# Subdirectories
add_subdirectory(cursors)
add_subdirectory(icons)
