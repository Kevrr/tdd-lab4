.global _start
_start:
    mov r0, #5 @ x = 5
    mov r1, #1 @ 0! = 1
	
factorial:
    mul r1, r1, r0 
    sub r0, r0, #1
	cmp r0, #0
	beq end
    b factorial

end:
	ldr r2, =result
	str r1, [r2]
    mov r7, #1
    swi 0

.data
result:
	.word 0