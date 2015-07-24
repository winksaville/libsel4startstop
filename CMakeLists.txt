add_library(sel4startstop STATIC
    src/sel4_stop.c
    src/${ARCH}/libsel4_start.S
)

target_compile_definitions(sel4startstop
    PUBLIC HAVE_SEL4_STARTSTOP
)

target_include_directories(sel4startstop SYSTEM
    PUBLIC "include"
)

add_dependencies(sel4startstop libsel4)

