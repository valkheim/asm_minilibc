[BITS 64]

section .text
global rindex:function

rindex:
  push rbp
  mov rbp, rsp

  xor rcx, rcx
  xor rax, rax
  xor r10, r10

  l1:
    mov al, [rdi + rcx]

    cmp al, sil
    jz found

    next:
    cmp al, byte 0
    jz end

    inc rcx
    jmp l1


found:
  lea r10, [rdi + rcx]
  jmp next

end:
  xor rax, r10
  mov rsp, rbp
  pop rbp
  ret
