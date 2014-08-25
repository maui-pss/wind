set(MODULE_FILES
    ButtonStyle.qml
    CalendarStyle.qml
    DialogStyle.qml
    NotificationStyle.qml
    OverlayStyle.qml
    PanelStyle.qml
    PopupStyle.qml
    ScrollViewStyle.qml
    SidePanelStyle.qml
    TextFieldStyle.qml
    ToolButtonStyle.qml
    TooltipStyle.qml
)
install(FILES ${MODULE_FILES}
    DESTINATION ${QML_INSTALL_DIR}/Hawaii/Shell/Controls/Styles/Maui)

set(PRIVATE_FILES
    private/Utils.js
)
install(FILES ${PRIVATE_FILES}
    DESTINATION ${QML_INSTALL_DIR}/Hawaii/Shell/Controls/Styles/Maui/private)
