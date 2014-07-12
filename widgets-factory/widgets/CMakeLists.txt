set(SOURCES
    main.cpp
    factory.cpp
)

add_executable(widget-factory ${SOURCES})
qt5_use_modules(widget-factory Widgets)

install(TARGETS widget-factory
        DESTINATION ${BIN_INSTALL_DIR})
