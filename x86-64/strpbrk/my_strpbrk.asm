[BITS 64]

section .text
global strpbrk:function

strpbrk:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	xor rax, rax
	
  l1:

	mov al, [rdi + rcx]
	cmp al, byte 0
	jz end
	xor r8, r8
	
	l2:	
		cmp [rsi + r8], byte 0
		jz increase

		cmp al, [rsi + r8]
		jz found

		inc r8
		jmp l2


increase:
	inc rcx
	jmp l1

found:
  lea rax, [rdi + rcx]
  mov rsp, rbp
  pop rbp
	
  ret

end:
  xor rax, rax
  mov rsp, rbp
  pop rbp
	
  ret
