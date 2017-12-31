[BITS 64]

section .text
global memmove:function

memmove:
        push 	rbp
        mov 	rbp, rsp

	xor 	rcx, rcx

l1:
	cmp 	rcx, rdx
	jz 	l2

	movzx	r8, byte [rsi + rcx]
	push	r8
	
	inc	rcx
	jmp	l1

l2:
	cmp	rcx, 0
	jz	end

	dec	rcx

	pop	r8
	mov	[rdi + rcx], byte r8b
	
	jmp	l2
	
end:
	mov	rax, rdi

	mov 	rsp, rbp
        pop 	rbp
	ret
