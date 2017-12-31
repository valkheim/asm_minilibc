.section ".data"
	.global tmp
	tmp: .byte 0

.section ".text"
	.align 4
	.global main

main:
	!save %sp, -96, %sp
	sub %sp, 96, %sp 
	! xor %g1, %g1, %g1

l1:
	set 0, %o0
	set tmp, %o1
	! mov %g1, %o1
	set 1, %o2
	call read
	nop
	
	cmp %o0, %g0
	bz end
	nop

	set 1, %o0
	set tmp, %o1
	! mov %g1, %o1
	set 1, %o2
	call write
	nop

	ba l1
	nop

end:
	ret
	restore


