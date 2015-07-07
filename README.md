# libsel4startstop

Library which handle simple application start and stopping.
The start method is `_seL4_Start` and is called before the application
begins and is usually given as the startup routine to the linker.
Hence it should never be directly called and thus has not header
definition.

The `seL4_Stop` method maybe called by an application, such as in
handling failures or asserts so `sel4/stop.h` header is provided.
