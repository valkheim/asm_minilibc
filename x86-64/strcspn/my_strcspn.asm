[BITS 64]

section .text
global strcspn:function

strcspn:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
	xor rax, rax
	
  l1:

	mov al, [rdi + rcx]
	cmp al, byte 0
	jz end
	xor rbx, rbx
	
	l2:	
		cmp [rsi + rbx], byte 0
		jz increase

		cmp al, [rsi + rbx]
		jz found


		inc rbx

		jmp l2


increase:
	inc rcx
	jmp l1

found:
  mov rax, rcx
  mov rsp, rbp
  pop rbp
  ret

end:
  xor rax, rcx
  mov rsp, rbp
  pop rbp
  ret
