	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	mov	r8, r1
	mov	fp, r3
	mov	r7, #0
	ldr	r10, .L13
	add	r2, r2, r2, lsl #1
	ldr	r9, .L13+4
	add	r10, r10, r2, lsl #4
.L2:
	mov	r4, #0
	add	r5, r10, r7
	b	.L4
.L3:
	add	r4, r4, #1
	cmp	r4, #8
	add	r5, r5, #6
	beq	.L12
.L4:
	ldrb	ip, [r5]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L3
	add	r1, r8, r4
	mov	r2, fp
	mov	r0, r6
	add	r4, r4, #1
	mov	lr, pc
	bx	r9
	cmp	r4, #8
	add	r5, r5, #6
	bne	.L4
.L12:
	add	r7, r7, #1
	cmp	r7, #6
	add	r6, r6, #1
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	ldr	r4, .L17
	smull	r3, r4, r5, r4
	sub	sp, sp, #4
	asr	r7, r5, #31
	ldrh	r10, [sp, #40]
	rsb	r4, r7, r4, asr #13
	rsb	r8, r0, #240
	sub	r6, r2, r2, lsl #2
	add	r2, r4, #48
	add	r0, r8, r6, lsl #1
	mov	r3, r10
	and	r2, r2, #255
	mov	r9, r1
	bl	drawChar
	ldr	r3, .L17+4
	mul	r3, r4, r3
	ldr	r4, .L17+8
	sub	r3, r5, r3
	smull	r2, r1, r4, r3
	asr	r2, r3, #31
	lsl	r6, r6, #1
	rsb	r2, r2, r1, asr #12
	add	r0, r6, #6
	add	r2, r2, #48
	mov	r1, r9
	mov	r3, r10
	add	r0, r0, r8
	and	r2, r2, #255
	bl	drawChar
	smull	r3, r2, r4, r5
	rsb	r2, r7, r2, asr #12
	rsb	r3, r2, r2, lsl #5
	add	r2, r2, r3, lsl #2
	ldr	r4, .L17+12
	add	r2, r2, r2, lsl #2
	sub	r2, r5, r2, lsl #4
	smull	r1, r3, r4, r2
	asr	r2, r2, #31
	rsb	r2, r2, r3, asr #6
	add	r0, r6, #12
	add	r2, r2, #48
	mov	r3, r10
	mov	r1, r9
	and	r2, r2, #255
	add	r0, r0, r8
	bl	drawChar
	smull	r3, r4, r5, r4
	rsb	r4, r7, r4, asr #6
	rsb	r3, r4, r4, lsl #5
	ldr	fp, .L17+16
	add	r4, r4, r3, lsl #2
	sub	r4, r5, r4, lsl #3
	smull	r2, r3, fp, r4
	asr	r2, r4, #31
	rsb	r2, r2, r3, asr #5
	add	r0, r6, #18
	add	r2, r2, #48
	and	r2, r2, #255
	mov	r1, r9
	mov	r3, r10
	add	r0, r0, r8
	bl	drawChar
	smull	r2, r3, fp, r5
	rsb	r3, r7, r3, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r4, .L17+20
	add	r3, r3, r3, lsl #2
	sub	r3, r5, r3, lsl #2
	smull	r2, r1, r4, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r0, r6, #24
	add	r2, r2, #48
	mov	r3, r10
	mov	r1, r9
	add	r0, r0, r8
	and	r2, r2, #255
	bl	drawChar
	smull	r3, r2, r4, r5
	mov	r1, r9
	mov	r3, r10
	rsb	r2, r7, r2, asr #2
	add	r2, r2, r2, lsl #2
	sub	r2, r5, r2, lsl #1
	add	r0, r6, #30
	add	r2, r2, #48
	and	r2, r2, #255
	add	r0, r0, r8
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawChar
.L18:
	.align	2
.L17:
	.word	351843721
	.word	100000
	.word	1759218605
	.word	274877907
	.word	1374389535
	.word	1717986919
	.size	drawScore, .-drawScore
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L19
	mov	r4, r0
	mov	r6, r1
	mov	r7, r3
.L21:
	mov	r0, r4
	mov	r3, r7
	mov	r1, r6
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L21
.L19:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.ident	"GCC: (devkitARM release 53) 9.1.0"
