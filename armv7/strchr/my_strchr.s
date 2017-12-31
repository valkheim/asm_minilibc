	.arm
	.data
	.text

	.global my_strchr

my_strchr:
	eor	r4, r4
	eor	r5, r5
	eor	r6, r6
	
l1:
	ldrb	r6, [r0, r4]

	cmp	r6, r1
	beq	found

	cmp	r6, #0
	beq	end

	add	r4, r4, #1
	b	l1
found:
	add	r0, r0, r4
	bx	lr
end:
	eor	r0, r0
	bx	lr
	
	.end
	
