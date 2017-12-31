	BITS 64

	section .text

	global	strncmp:function

strncmp:
        push rbp
        mov rbp, rsp

	xor	rcx, rcx
	xor	rax, rax
	
strncmp_loop:
	cmp	rdx, 0
	jz	return

	mov	al, [rdi + rcx]

	cmp	al, byte 0
	jz	equal
	cmp	[rsi + rcx] , byte 0
	jz	equal

	cmp	al, [rsi + rcx]
	jl	minus
	jg	plus
	inc	rcx
	dec	rdx

	jmp	strncmp_loop

equal:
	cmp	al, [rsi + rcx]
	jl	minus
	sub	al, [rsi + rcx]
        mov rsp, rbp
        pop rbp
	ret

minus:
	sub	al, [rsi + rcx]
	neg	al
	movzx	rax, al
	neg	rax
        mov rsp, rbp
        pop rbp

	ret

plus:
	sub	al, [rsi + rcx]
        mov rsp, rbp
        pop rbp
	ret

return:
	xor rax, rax
        mov rsp, rbp
        pop rbp
	ret
