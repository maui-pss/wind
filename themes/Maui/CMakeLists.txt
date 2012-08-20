set(INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/kernel/grub/themes/Maui)

file(GLOB IMAGES "*.png")
file(GLOB FONTS "*.pf2")
file(GLOB ICONS "icons/*.png")

install(FILES theme.txt ${IMAGES} ${FONTS} DESTINATION ${INSTALL_DIR})
install(FILES ${ICONS} DESTINATION ${INSTALL_DIR}/icons)
