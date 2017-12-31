[BITS 64]

section .text
global strchr:function

strchr:
        push rbp
        mov rbp, rsp

  xor rcx, rcx
  xor rax, rax

  l1:
    mov al, [rdi + rcx]

    cmp al, sil
    jz found

    cmp al, byte 0
    jz end

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
