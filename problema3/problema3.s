.global _start
_start:
    ldr r1, =0x1000 @ tecla
    ldr r2, =0x2000 @ counter
    mov r3, #0
    str r3, [r2]
	ldr r5, =0xE048 @ up
	ldr r6, =0xE050 @ down

loop:
    ldr r4, [r1]
    ldr r3, [r2]
    cmp r4, r5
    beq increase
    cmp r4, r6
    beq decrease
    b store

increase:
    add r3, r3, #1
    b store

decrease:
    sub r3, r3, #1

store:
    str r3, [r2]
    b loop