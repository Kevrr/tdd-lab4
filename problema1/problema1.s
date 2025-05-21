.global _start
.equ arrend, 0xaaaaaaaa

_start:
	ldr r0, =array
	ldr r1, =arrend
	mov r2, #5 @ y = 5
	
loop:
	ldr r3, [r0], #4
	cmp r3, r1
	beq loop_end
	
	cmp r3, r2
	blt addition
	
	mul r3, r3, r2
	b store
	
addition:
	add r3, r3, r2
	
store:
	str r3, [r0, #-4]
	b loop
	
loop_end:
	mov r7, #1
	swi 0
	
.data
array:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	.word arrend

	