BITS 64

section .text

global strstr:function

my_strcmp:
  push rbp
  mov rbp, rsp

	xor	rcx, rcx
	xor	rax, rax
	
my_strcmp_loop:
	mov	al, [rdi + rcx]

	cmp	al, byte 0
	jz	equal
	cmp	[rsi + rcx] , byte 0
	jz	equal

	cmp	al, [rsi + rcx]
	jl	minus
	jg	plus
	inc	rcx
	jmp	my_strcmp_loop

equal:
  mov rax, 0
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

strstr:
        push rbp
        mov rbp, rsp

  xor rcx, rcx
  xor rax, rax

check:
	cmp	[rdi], byte 0
	jne	l1
	cmp	[rsi], byte 0
	jz	my_strstr_found
	
  l1:
    cmp [rdi + rcx], byte 0
    jz my_strstr_end

    push rdi
    push rcx
    lea rdi, [rdi + rcx]
    call my_strcmp
    pop rcx
    pop rdi

    cmp rax, 0
    jz my_strstr_found

    inc rcx
    jmp l1

my_strstr_found:
  lea rax, [rdi + rcx]
        mov rsp, rbp
        pop rbp
  ret

my_strstr_end:
  xor rax, rax
        mov rsp, rbp
        pop rbp
  ret

