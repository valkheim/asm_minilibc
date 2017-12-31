	.arm
	.data
	.text

	.global my_strlen

my_strlen:
	eor	r4, r4
	eor	r5, r5

l1:
	ldrb	r5, [r0, r4]
	cmp	r5, #0
	beq	end

	add	r4, r4, #1
	b	l1

end:
	mov	r0, r4
	bx	lr

	.end
	
