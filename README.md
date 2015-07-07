# libsel4startstop

A Library which provides simple application start and stopping.
The start method is `_seL4_Start` and is called before the application
begins and is maybe given as the startup routine to the linker/loader.
Hence it should never be directly called and thus has not header
definition.

The `seL4_Stop` method maybe called by an application to handler
failures or assertion so `sel4/stop.h` header is provided. This is
currently used by libsel4assert.
