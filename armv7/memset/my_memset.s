	.arm
	.data
	.text

	.global my_memset

my_memset:
	eor	r4, r4 /* compteur */
	eor	r5, r5
	
l1:
	cmp	r4, r2
	beq	end
	ldrb	r5, [r0, r4] /* charge r5 avec le contenu de la zone mémoire pointé par r0 + r4 */
	cmp	r5, #0
	beq 	end

	strb	r1, [r0, r4] /* stock le contenu de r1 à l'endroit pointé par r0 + r4 */
	
	
	add	r4, r4, #1
	b	l1
end:
	bx	lr
	.end
	
