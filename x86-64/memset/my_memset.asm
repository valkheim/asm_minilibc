[BITS 64]

section .text
global memset:function

memset:
        push rbp
        mov rbp, rsp

  xor rcx, rcx
  xor rax, rax

  l1:
    cmp rcx, rdx
    jz end

    mov [rdi + rcx], sil

    inc rcx
    jmp l1

end:
  lea rax, [rdi]
        mov rsp, rbp
        pop rbp
  ret
