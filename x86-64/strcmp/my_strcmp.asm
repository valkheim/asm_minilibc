	BITS 64

	section .text

	global	strcmp:function

strcmp:
        push rbp
        mov rbp, rsp

	xor	rcx, rcx
	xor	rax, rax
	
strcmp_loop:
	mov	al, [rdi + rcx]

	cmp	al, byte 0
	jz	equal
	cmp	[rsi + rcx] , byte 0
	jz	equal

	cmp	al, [rsi + rcx]
	jl	minus
	jg	plus
	inc	rcx
	jmp	strcmp_loop

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
