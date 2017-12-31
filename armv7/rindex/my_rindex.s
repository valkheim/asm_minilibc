	.arm
	.data
	.text

	.global my_rindex

my_rindex:
	eor	r4, r4
	eor	r5, r5
	eor	r6, r6
	
l1:
	ldrb	r6, [r0, r4]

	cmp	r6, r1
	beq	found
then:	
	cmp	r6, #0
	beq	end

	add	r4, r4, #1
	b	l1
found:
	mov	r5, r4
	b	then	
end:
	add	r0, r0, r5
	bx	lr
	
	.end
	
