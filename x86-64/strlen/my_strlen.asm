BITS 64

section .text

global strlen:function

strlen:
        push rbp
        mov rbp, rsp

  xor rax, rax
  xor rcx, rcx

  strlen_loop:
    cmp [rdi + rcx], byte 0
    jz  strlen_end
    inc rcx
    jmp strlen_loop

strlen_end:
  mov rax, rcx
        mov rsp, rbp
        pop rbp
  ret
