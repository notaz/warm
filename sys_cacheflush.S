@ vim:filetype=armasm
#include <sys/syscall.h>


.global sys_cacheflush @ void *start_addr, void *end_addr

sys_cacheflush:
    mov     r2, #0
#ifdef __ARM_EABI__
    /* EABI version */
    str     r7, [sp, #-4]!
    mov     r7, #(__ARM_NR_cacheflush & 0xff)
    orr     r7, r7, #(__ARM_NR_cacheflush & 0x00ff00)
    orr     r7, r7, #(__ARM_NR_cacheflush & 0xff0000)
    swi     0
    ldr     r7, [sp], #4
#else
    /* OABI */
    swi     __ARM_NR_cacheflush
#endif
    bx      lr

