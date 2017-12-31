.section ".rodata"

hw :
	.asciz "Hello world.\n"
fmt :
	.asciz "%s\n"

.section ".text"

	! .align 4
	.global main

main:

	save	%sp, -96, %sp

	set	fmt, %o0
	set	hw, %o1
	call	printf
	nop

	mov	%g0, %i0
	ret
	restore

