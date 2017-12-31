	BITS 64

	section .text

	global	read:function

read:
	push	rbp
	mov	rbp, rsp

	mov	rax, 0
	syscall

	mov	rsp, rbp
	pop	rbp

	ret
