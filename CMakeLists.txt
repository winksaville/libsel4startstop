add_library(libsel4startstop STATIC
    src/sel4_stop.c
    src/${ARCH}/libsel4_start.S
)

target_compile_definitions(libsel4startstop
    PUBLIC HAVE_SEL4_STARTSTOP
)

target_include_directories(libsel4startstop SYSTEM
    PUBLIC "include"
)

target_link_libraries(libsel4startstop libsel4)
