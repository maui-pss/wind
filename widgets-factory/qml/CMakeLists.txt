set(SOURCES
    main.cpp
)

qt5_add_resources(RC_FILES resources.qrc)

add_executable(qml-widget-factory ${SOURCES} ${RC_FILES})
qt5_use_modules(qml-widget-factory Widgets Qml Quick)

install(TARGETS qml-widget-factory
    DESTINATION ${CMAKE_INSTALL_BINDIR})
