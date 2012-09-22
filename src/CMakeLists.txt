include_directories(${Qt5Widgets_INCLUDE_DIRS})

add_definitions(${Qt5Widgets_DEFINITIONS} -fPIC)

set(SOURCES
    main.cpp
    factory.cpp
)

add_executable(WidgetFactory ${SOURCES})
target_link_libraries(WidgetFactory ${Qt5Widgets_LIBRARIES})

install(TARGETS WidgetFactory DESTINATION ${CMAKE_INSTALL_PROGSDIR})
