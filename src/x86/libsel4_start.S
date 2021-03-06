/*
 * Copyright 2014, NICTA
 *
 * This software may be distributed and modified according to the terms of
 * the BSD 2-Clause license. Note that NO WARRANTY is provided.
 * See "LICENSE_BSD2.txt" for details.
 *
 * @TAG(NICTA_BSD)
 */
/*
 * A default _seL4_start. It initalizes seL4_BootInfo and invokes
 * int main(void). The return value is ignored and then this hangs.
 */

#define __ASM__
#include <autoconf.h>

#include <sel4/arch/constants.h>


    .global _seL4_Start
    .extern seL4_InitBootInfo
    .extern seL4_Stop

    .text

#ifdef X86_64

.align 0x1000
_seL4_Start:
    leaq    _stack_top, %esp

    /* Setup segment selector for IPC buffer access. */
    movw    $IPCBUF_GDT_SELECTOR, %ax
    movw    %ax, %gs

    /* Setup the global "bootinfo" structure. */
    movq    %rbx, %rdi
    call    seL4_InitBootInfo

#else

_seL4_Start:
    leal    _stack_top, %esp

    /* Setup segment selector for IPC buffer access. */
    movw    $IPCBUF_GDT_SELECTOR, %ax
    movw    %ax, %gs

    /* Setup the global "bootinfo" structure. */
    pushl   %ebx
    call    seL4_InitBootInfo
    addl    $4, %esp

#endif

    /* Invoke 'int main(void);' */
    call    main

    /* If main returns ignore result and stop */
    call    seL4_Stop

    /* If seL4_Stop returns die */
1:  jmp     1b


    .bss
    .align  8

_stack_bottom:
    .space  16384
_stack_top:

