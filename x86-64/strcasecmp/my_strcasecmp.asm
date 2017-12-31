	BITS 64

	section .text

	global	strcasecmp:function

strcasecmp:
	push	rbp
	mov	rbp, rsp

	xor	rcx, rcx
	xor	rax, rax
	xor	r8, r8

strcasecmp_loop:
	mov	al, [rdi + rcx]
	mov 	r8b, [rsi + rcx]

	cmp	al, byte 0
	jz	equal
	cmp	r8b, byte 0
	jz	equal

ifIsUpperS1:
	cmp	al, 'Z'
	jg	ifIsUpperS2
	cmp	al, 'A'
	jl	ifIsUpperS2
	add	al, 32

ifIsUpperS2:
	cmp	r8b, 'Z'
	jg	then
	cmp	r8b, 'A'
	jl	then
	add	r8b, 32

  then:
	  cmp	al, r8b
	  jl	minus
	  jg	plus
	  inc	rcx
	  jmp	strcasecmp_loop

equal:
	cmp	al, r8b
	jl	minus
	sub	al, r8b

	mov	rsp, rbp
	pop	rbp

	ret

minus:
	sub	al, r8b
	neg	al
	movzx	rax, al
	neg	rax

	mov	rsp, rbp
	pop	rbp

	ret

plus:
	sub	al, r8b

	mov	rsp, rbp
	pop	rbp

	ret
