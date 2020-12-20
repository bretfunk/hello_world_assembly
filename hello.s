.data

/* data section */
msg:
.ascii "Hello, Wolrd!\n"
len = . - msg

.text

.global _start
_start:

  mov   %r0, $1           /* our status is stdout */
  ldr   %r1, =msg         /* message location in memory */
  ldr   %r2, =len         /* message length in bytes */
  mov   %r7, $4           /* write is syscall #4 */
  swi   $0                /* invoke syscall */

/* syscall exit */
  mov   %r0, $0           /* our status is now exit */
  mov   %r7, $1           /* exist is syscall #1 */
  swi   $0                /* invoke syscall */
