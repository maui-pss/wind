set(MODULE_FILES
    DialogStyle.qml
    NotificationBubbleStyle.qml
    OverlayStyle.qml
    PanelStyle.qml
    PopupStyle.qml
    TextFieldStyle.qml
    TooltipStyle.qml
)
install(FILES ${MODULE_FILES}
    DESTINATION ${DATA_INSTALL_DIR}/hawaii/styles/Maui)

set(PRIVATE_FILES
    private/Utils.js
)
install(FILES ${PRIVATE_FILES}
    DESTINATION ${DATA_INSTALL_DIR}/hawaii/styles/Maui/private)
