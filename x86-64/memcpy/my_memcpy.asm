[BITS 64]

section .text
global memcpy:function

memcpy:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
  xor rax, rax
  xor r8, r8

  l1:
    cmp rcx, rdx
    jz end
    cmp byte [rdi + rcx], 0
    jz end
    cmp byte [rsi + rcx], 0
    jz end

    mov r8b, [rsi + rcx]
    mov [rdi + rcx], r8b

    inc rcx
    jmp l1

end:
  lea rax, [rdi]
	mov rsp, rbp
	pop rbp

  ret
