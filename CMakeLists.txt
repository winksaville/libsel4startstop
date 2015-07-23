# Figure out how to share this copy code with the other libraries
add_custom_command(
    OUTPUT  ${CMAKE_BINARY_DIR}/includes/x86/pc99/include/sel4/stop.h
    COMMAND mkdir -p ${CMAKE_BINARY_DIR}/includes/x86/pc99/include/sel4
    COMMAND cp include/sel4/stop.h ${CMAKE_BINARY_DIR}/includes/x86/pc99/include/sel4/stop.h
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(
    copy_stop.h_file
    DEPENDS  ${CMAKE_BINARY_DIR}/includes/x86/pc99/include/sel4/stop.h
)

add_library(sel4startstop STATIC
    src/sel4_stop.c
    src/${ARCH}/libsel4_start.S
)

add_dependencies(sel4startstop libsel4 copy_stop.h_file)

