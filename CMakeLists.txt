project(MauiTheme)

cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)

# Macro to print feature summary
include(FeatureSummary)

# Options
option(ENABLE_WIDGETS_FACTORY "Build Widgets Factory" OFF)
add_feature_info("Widgets Factory" ENABLE_WIDGETS_FACTORY "Build Widgets Factory")

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

if(ENABLE_WIDGETS_FACTORY)
    # Instruct CMake to run moc automatically when needed
    set(CMAKE_AUTOMOC ON)
endif()

# Find ECM
find_package(ECM 0.0.11 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

# Set version
set(THEME_VERSION_MAJOR 0)
set(THEME_VERSION_MINOR 4)
set(THEME_VERSION_PATCH 0)
set(THEME_VERSION_STRING "${THEME_VERSION_MAJOR}.${THEME_VERSION_MINOR}.${THEME_VERSION_PATCH}")

# Installation directories
include(KDEInstallDirs)

# Paths
set(PLYMOUTH_THEMESDIR "${CMAKE_INSTALL_FULL_DATADIR}/plymouth/themes")

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

# Minimum version requirements
set(QT_MIN_VERSION "5.3.0")
set(KF5_MIN_VERSION "5.0.0")

if(ENABLE_WIDGETS_FACTORY)
    # Find Qt 5
    find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS
        Core
        Gui
        Widgets
        Qml
        Quick
    )
endif()

# Find KF5
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS Plasma)

# Subdirectories
add_subdirectory(cursor)
add_subdirectory(grub)
add_subdirectory(pss)
add_subdirectory(icons)
add_subdirectory(plasma)
add_subdirectory(plymouth)
add_subdirectory(qtquickcontrols)
add_subdirectory(wallpapers)
if(ENABLE_WIDGETS_FACTORY)
    add_subdirectory(widgets-factory)
endif()
add_subdirectory(syslinux)

# Display featute summary
feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
