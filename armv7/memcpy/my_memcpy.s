	.arm
	.data
	.text

	.global my_memcpy

	/* memcpy reçoit respectivement chaine dest, chaine src, lenght dans r0, r1 et r2 */

	/* le but est de copier lenght bytes de src dans dest */
	
my_memcpy:
	eor	r3, r3 /* compteur */
	eor	r4, r4 /* tampon pour copie */
	eor	r5, r5 /* tampon pour cmp fin de chaine */

	
l1:
	cmp	r3, r2 /* on regarde si la valeur lenght du troisieme param est atteinte */
	beq	end

	ldrb	r5, [r0, r3] /* est-on au bout de la chaine dest ? */
	cmp	r5, #0
	beq	end

	ldrb	r5, [r1, r3] /* est-on au bout de la chaine src ? */
	cmp	r5, #0
	beq	end
	
	strb	r5, [r0, r3] /* stock le contenu de src + compteur (cad r5) dans dest + compteur */ 

	add	r3, r3, #1 /* incrémentation du compteur */
	b	l1		/* on boucle */
	



end:
	bx	lr
	.end
	
