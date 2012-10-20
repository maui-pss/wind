include_directories(${Qt5Widgets_INCLUDE_DIRS})

add_definitions(
    ${Qt5Widgets_DEFINITIONS}
    ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}
)

set(SOURCES
    main.cpp
    factory.cpp
)

add_executable(widget-factory ${SOURCES})
target_link_libraries(widget-factory ${Qt5Widgets_LIBRARIES})

install(TARGETS widget-factory DESTINATION ${CMAKE_INSTALL_BINDIR})
