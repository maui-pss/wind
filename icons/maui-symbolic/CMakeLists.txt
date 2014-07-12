set(INSTALL_DIR ${ICON_INSTALL_DIR}/maui)

set(TYPES actions apps categories devices emblems mimes emotes mimetypes places status)

foreach(type ${TYPES})
    # Install symbolic icons for the current type
    file(GLOB ${type}_symbolic "${type}/*.svg")
    install(FILES ${${type}_symbolic} DESTINATION ${INSTALL_DIR}/${type}/scalable)
endforeach()
