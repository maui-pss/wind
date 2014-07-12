set(INSTALL_DIR ${CMAKE_INSTALL_DATADIR}/icons/hawaii/cursors)
file(GLOB FILES "data/*")
install(FILES ${FILES} DESTINATION ${INSTALL_DIR})
