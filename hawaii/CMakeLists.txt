set(MODULE_FILES
    DialogStyle.qml
    NotificationBubbleStyle.qml
    OverlayStyle.qml
    PanelStyle.qml
    PopupStyle.qml
    TooltipStyle.qml
)
install(FILES ${MODULE_FILES}
    DESTINATION ${DATA_INSTALL_DIR}/hawaii/styles/Maui)

set(CONTROLS_FILES
    TextFieldStyle.qml
    ToolButtonStyle.qml
    ScrollViewStyle.qml
    SidePanelStyle.qml
)
install(FILES ${CONTROLS_FILES}
    DESTINATION ${QML_INSTALL_DIR}/Hawaii/Shell/Controls/Styles/Maui)

set(PRIVATE_FILES
    private/Utils.js
)
install(FILES ${PRIVATE_FILES}
    DESTINATION ${QML_INSTALL_DIR}/Hawaii/Shell/Controls/Styles/Maui/private)
