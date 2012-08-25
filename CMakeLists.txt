project(MauiGrubThemes)

cmake_minimum_required(VERSION 2.8.7)

# Set version
set(GRUBTHEMES_VERSION_MAJOR 0)
set(GRUBTHEMES_VERSION_MINOR 1)
set(GRUBTHEMES_VERSION_PATCH 0)
set(GRUBTHEMES_VERSION_STRING "${GRUBTHEMES_VERSION_MAJOR}.${GRUBTHEMES_VERSION_MINOR}.${GRUBTHEMES_VERSION_PATCH}")

# Installation directories
include(MauiInstallDirs)

# Make CPack available to easy generate binary packages
include(CPack)

# Add custom uninstall target
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake_uninstall.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
    IMMEDIATE @ONLY)
add_custom_target(uninstall "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake")

# Subdirectories
add_subdirectory(themes)
