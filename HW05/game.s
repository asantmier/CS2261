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
	.file	"game.c"
	.text
	.align	2
	.global	initMario
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMario, %function
initMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #16
	ldr	r2, .L7
	str	lr, [sp, #-4]!
	ldr	r1, [r2]
	ldr	lr, .L7+4
	ldr	ip, .L7+8
	ldr	r2, .L7+12
	str	r3, [lr]
	str	r3, [ip]
	ldr	lr, .L7+16
	ldr	ip, .L7+20
	str	r3, [r2]
	ldr	r2, .L7+24
	cmp	r1, #1
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r2, #28]
	str	r3, [r2, #32]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	beq	.L2
	cmp	r1, #2
	moveq	r0, #176
	moveq	r1, #135
	stmeq	r2, {r0, r1}
	streq	r3, [r2, #24]
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L2:
	mov	r0, #184
	mov	r1, #136
	str	r3, [r2, #24]
	stm	r2, {r0, r1}
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	level
	.word	hammerTimer
	.word	hammerState
	.word	jump
	.word	jumpTimer
	.word	ladder
	.word	mario
	.size	initMario, .-initMario
	.align	2
	.global	initDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDK, %function
initDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	ip, #64
	mov	r0, #32
	ldr	r3, .L14
	ldr	r1, [r3]
	str	lr, [sp, #-4]!
	ldr	r3, .L14+4
	ldr	lr, .L14+8
	cmp	r1, #1
	str	r2, [lr]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	beq	.L10
	cmp	r1, #2
	moveq	r1, #85
	stmeq	r3, {r1, r2}
.L9:
	ldr	lr, [sp], #4
	bx	lr
.L10:
	stm	r3, {r0, r2}
	ldr	lr, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	level
	.word	dk
	.word	barrelTimer
	.size	initDK, .-initDK
	.align	2
	.global	initPauline
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPauline, %function
initPauline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #16
	mov	ip, #32
	ldr	r3, .L21
	ldr	r1, [r3]
	ldr	r3, .L21+4
	cmp	r1, r0
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	beq	.L17
	cmp	r1, #2
	moveq	r1, #77
	stmeq	r3, {r1, r2}
.L16:
	ldr	lr, [sp], #4
	bx	lr
.L17:
	mov	r1, #120
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	bx	lr
.L22:
	.align	2
.L21:
	.word	level
	.word	pauline
	.size	initPauline, .-initPauline
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L30
	ldr	r3, [r2]
	ldr	r1, .L30+4
	add	r3, r3, #1
	cmp	r0, #1
	push	{r4, lr}
	str	r0, [r1]
	str	r3, [r2]
	beq	.L24
	cmp	r0, #2
	bne	.L26
	mov	lr, #60
	mov	ip, #91
	mov	r0, #1
	mov	r2, #67108864
	mov	r1, #5120
	ldr	r3, .L30+8
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #36]
	strh	r1, [r2]	@ movhi
.L26:
	bl	initMario
	bl	initDK
	bl	initPauline
	mov	r2, #0
	mov	r0, #16
	mov	lr, #512
	ldr	r3, .L30+12
	ldr	r1, .L30+16
	add	ip, r3, #520
.L27:
	str	r2, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	add	r3, r3, #52
	cmp	r3, ip
	strh	lr, [r1, #32]	@ movhi
	add	r1, r1, #8
	bne	.L27
	pop	{r4, lr}
	bx	lr
.L24:
	mov	ip, #67108864
	mov	lr, #4608
	mov	r1, #51
	mov	r2, #74
	ldr	r3, .L30+8
	strh	lr, [ip]	@ movhi
	stm	r3, {r1, r2}
	str	r0, [r3, #36]
	b	.L26
.L31:
	.align	2
.L30:
	.word	levelsCleared
	.word	level
	.word	hammer
	.word	barrels
	.word	shadowOAM
	.size	init, .-init
	.align	2
	.global	initBarrels
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBarrels, %function
initBarrels:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r0, #16
	mov	lr, #512
	ldr	r3, .L36
	ldr	r1, .L36+4
	add	ip, r3, #520
.L33:
	str	r2, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	add	r3, r3, #52
	cmp	r3, ip
	strh	lr, [r1, #32]	@ movhi
	add	r1, r1, #8
	bne	.L33
	ldr	lr, [sp], #4
	bx	lr
.L37:
	.align	2
.L36:
	.word	barrels
	.word	shadowOAM
	.size	initBarrels, .-initBarrels
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L120
	ldr	r3, [fp]
	ldr	r5, .L120+4
	cmp	r3, r2
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	sub	sp, sp, #36
	ble	.L39
	tst	r3, #3
	beq	.L112
.L40:
	sub	r3, r3, #1
	str	r3, [fp]
.L39:
	ldr	r1, [r5, #28]
	ldr	r2, .L120+8
	smull	r0, r3, r2, r1
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	bne	.L41
	ldr	r3, [r5, #32]
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	str	r2, [r5, #32]
.L41:
	ldr	r7, .L120+12
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp]
	cmp	r3, #0
	ble	.L113
.L44:
	mov	r4, #1
	ldr	r3, .L120+16
	ldr	r6, .L120+20
	str	r3, [sp, #16]
	ldr	r10, .L120+24
	ldr	r3, [r3]
	add	r9, sp, #28
	add	r8, sp, #24
.L43:
	cmp	r3, #0
	beq	.L47
	ldr	r3, .L120+28
	ldrh	r2, [r3, #48]
	ands	r2, r2, #128
	beq	.L114
.L48:
	ldr	r2, .L120+32
	ldr	r3, [r2]
	cmp	r3, #10
	sub	r1, r3, #1
	ble	.L58
.L56:
	mvn	r3, #0
	str	r3, [r5, #12]
.L59:
	str	r1, [r2]
.L57:
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #4]
	str	r9, [sp, #8]
	str	r8, [sp, #4]
	ldr	r0, [r5, #16]
	ldr	ip, [r5]
	add	r1, r1, r2
	ldr	r2, [r6]
	add	r0, r0, r0, lsr #31
	str	r2, [sp]
	sub	r1, r1, #1
	ldr	r2, [r5, #8]
	add	r0, ip, r0, asr #1
	mov	lr, pc
	bx	r10
	ldr	r2, [r5, #16]
	ldr	ip, [sp, #24]
	ldr	r3, [r5, #20]
	ldr	r1, [sp, #28]
	add	r0, r2, r2, lsr #31
	sub	r0, ip, r0, asr #1
	sub	r1, r1, r3
	cmp	r0, #15
	add	r1, r1, #1
	stm	r5, {r0, r1}
	movle	r0, #16
	strle	r0, [r5]
	ble	.L62
	add	ip, r2, r0
	cmp	ip, #224
	rsbgt	r0, r2, #224
	strgt	r0, [r5]
.L62:
	cmp	r4, #0
	movne	lr, #0
	movne	ip, lr
	strne	lr, [r5, #28]
	strne	lr, [r5, #32]
	ldr	lr, [fp]
	ldreq	ip, [r5, #32]
	cmp	lr, #0
	ldr	lr, [r5, #24]
	ble	.L65
	ldr	r4, .L120+36
	ldr	r4, [r4]
	lsl	ip, ip, #16
	cmp	r4, #0
	lsr	ip, ip, #16
	bne	.L66
	ldr	r7, .L120+40
	lsl	ip, ip, #23
	ldr	r4, .L120+44
	cmp	lr, #1
	lsr	ip, ip, #16
	sub	r8, r1, #16
	orr	lr, r8, r7
	addeq	ip, ip, #12
	orr	r7, r0, r7
	addne	ip, ip, #10
	strh	lr, [r4]	@ movhi
	strh	r7, [r4, #2]	@ movhi
	strh	ip, [r4, #4]	@ movhi
.L68:
	ldr	ip, .L120+48
	ldr	r4, [ip, #20]
	ldr	lr, [ip, #16]
	str	r4, [sp, #12]
	ldr	r4, [ip, #4]
	ldr	ip, [ip]
	stmib	sp, {r4, lr}
	str	ip, [sp]
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L70
	ldr	r2, .L120+56
	ldr	r1, [r6]
	ldr	r3, [r2]
	cmp	r1, #1
	add	r3, r3, #1000
	moveq	r0, #2
	movne	r0, #1
	str	r3, [r2]
	bl	init
.L70:
	ldr	r4, .L120+60
	ldr	r3, [r4]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r4]
	beq	.L115
.L73:
	ldr	r4, .L120+64
	add	r8, r4, #520
	b	.L79
.L117:
	ldr	r10, [sp, #20]
	ldr	r9, [sp, #16]
	str	r10, [sp, #4]
	str	r9, [sp]
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L75
	mov	r2, #0
	ldr	r1, .L120+56
	ldr	r3, [r1]
	add	r3, r3, #800
	str	r3, [r1]
	str	r2, [r4, #36]
.L75:
	add	r4, r4, #52
	cmp	r8, r4
	beq	.L116
.L79:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L75
	ldr	r9, [r4]
	ldr	r10, [r4, #4]
	ldr	r3, [fp]
	str	r9, [sp, #16]
	add	r9, r4, #16
	ldr	ip, [r5]
	ldr	lr, [r5, #4]
	ldr	r6, [r5, #16]
	ldr	r7, [r5, #20]
	str	r10, [sp, #20]
	ldm	r9, {r9, r10}
	cmp	r3, #0
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	sub	r0, ip, #16
	sub	r1, lr, #16
	add	r2, r6, #16
	add	r3, r7, #16
	bgt	.L117
	ldr	r3, [sp, #20]
	str	r3, [sp, #4]
	ldr	r3, [sp, #16]
	mov	r0, ip
	str	r3, [sp]
	mov	r2, r6
	mov	r3, r7
	mov	r1, lr
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L78
	mov	r2, #0
	ldr	r1, .L120+68
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	add	r4, r4, #52
	str	r2, [r4, #-16]
	cmp	r8, r4
	bne	.L79
.L116:
	ldr	r4, .L120+72
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L118
.L81:
	ldr	r3, [r5, #28]
	add	r3, r3, #1
	str	r3, [r5, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	ldr	r2, [sp, #20]
	mov	r4, r2
	ldr	r3, [r5, #4]
	ldr	r1, .L120+16
	sub	r3, r3, #2
	str	r2, [r1]
	str	r2, [r5, #12]
	str	r2, [r5, #24]
	str	r3, [r5, #4]
.L47:
	ldr	r2, .L120+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	beq	.L119
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	moveq	r2, #1
	moveq	r4, r3
	streq	r2, [r5, #8]
	streq	r2, [r5, #24]
.L53:
	ldr	r3, .L120+76
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r7]
	beq	.L54
	ldr	r2, .L120+80
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L54
	cmp	r3, #0
	bne	.L48
	mov	r2, #1
	mov	r4, r3
	str	r2, [r7]
	mov	r1, #29
	ldr	r2, .L120+32
	b	.L56
.L58:
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r7]
	strgt	r3, [r5, #12]
	ldrle	r3, [r5, #12]
	b	.L59
.L112:
	ldr	r1, .L120+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L40
.L119:
	mvn	r2, #0
	mov	r4, r3
	str	r3, [r5, #24]
	str	r2, [r5, #8]
	b	.L53
.L113:
	ldr	r3, .L120+28
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	str	r3, [sp, #20]
	bne	.L44
	ldr	r2, [r5, #20]
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #16]
	ldr	r0, [r5]
	ldr	r6, .L120+20
	add	r1, r1, r2
	add	r3, r3, r3, lsr #31
	add	r0, r0, r3, asr #1
	ldr	r2, [r6]
	ldr	r3, .L120+84
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L45
	ldr	r3, .L120+16
	mov	r4, #1
	str	r3, [sp, #16]
	ldr	r10, .L120+24
	ldr	r3, [r3]
	add	r9, sp, #28
	add	r8, sp, #24
	b	.L43
.L54:
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r5, #12]
	beq	.L57
	b	.L48
.L78:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L75
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #16]
	ldr	r1, [r4]
	sub	r3, r3, r2
	str	r2, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp]
	str	r3, [sp, #4]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L75
	mov	r1, #1
	ldr	r2, .L120+56
	ldr	r3, [r2]
	add	r3, r3, #400
	str	r1, [r4, #48]
	str	r3, [r2]
	b	.L75
.L65:
	add	ip, lr, ip, lsl #5
	ldr	lr, .L120+44
	lsl	ip, ip, #1
	orr	r4, r0, #16384
	strh	ip, [lr, #4]	@ movhi
	strh	r1, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	b	.L68
.L115:
	ldr	r3, .L120+88
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L73
	mov	r1, #60
	ldr	r2, .L120+68
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4]
	b	.L73
.L118:
	mov	r3, #16
	ldr	r1, [r4, #4]
	ldr	r2, [r4]
	stmib	sp, {r1, r3}
	str	r2, [sp]
	str	r3, [sp, #12]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	ip, .L120+52
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #180
	movne	r3, #0
	strne	r2, [fp]
	strne	r3, [r4, #36]
	b	.L81
.L66:
	ldr	r4, .L120+44
	cmp	lr, #1
	orr	lr, r1, #16384
	strh	lr, [r4]	@ movhi
	subne	lr, r0, #16
	mvneq	lr, r0, lsl #17
	mvnne	lr, lr, lsl #17
	mvneq	lr, lr, lsr #17
	mvnne	lr, lr, lsr #17
	lsl	ip, ip, #22
	lsr	ip, ip, #16
	addeq	ip, ip, #14
	addne	ip, ip, #6
	strh	ip, [r4, #4]	@ movhi
	strh	lr, [r4, #2]	@ movhi
	b	.L68
.L114:
	mov	r3, #1
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldr	ip, [r5, #4]
	ldr	lr, [r5]
	add	r1, ip, r1
	ldr	ip, [r6]
	add	r0, r0, r0, lsr #31
	add	r0, lr, r0, asr r3
	stmib	sp, {r8, r9}
	str	ip, [sp]
	sub	r1, r1, #1
	str	r2, [sp, #20]
	str	r3, [r5, #12]
	mov	lr, pc
	bx	r10
	subs	r4, r0, #0
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	bne	.L49
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L48
	b	.L47
.L49:
	mov	r4, r2
	str	r2, [r3]
	str	r2, [r5, #12]
	str	r2, [r5, #24]
	b	.L47
.L45:
	mov	lr, #2
	mvn	r3, #0
	mov	ip, #1
	add	r0, r5, #16
	ldm	r0, {r0, r1}
	ldr	r8, [r5, #4]
	add	r1, r8, r1
	ldr	r8, .L120+16
	ldr	r4, [r5]
	ldr	r2, [r6]
	str	lr, [r5, #24]
	ldr	lr, .L120+16
	str	r8, [sp, #16]
	add	r0, r0, r0, lsr #31
	add	r9, sp, #28
	add	r8, sp, #24
	stm	sp, {r2, r8, r9}
	add	r0, r4, r0, asr ip
	ldr	r2, [sp, #20]
	ldr	r10, .L120+24
	str	ip, [lr]
	add	r1, r1, r3
	str	r3, [r5, #12]
	mov	lr, pc
	bx	r10
	subs	r4, r0, #0
	bne	.L46
	ldr	lr, .L120+16
	ldr	r3, [lr]
	b	.L43
.L121:
	.align	2
.L120:
	.word	hammerTimer
	.word	mario
	.word	1431655766
	.word	jump
	.word	ladder
	.word	level
	.word	checkCollisionMap
	.word	67109120
	.word	jumpTimer
	.word	hammerState
	.word	-32768
	.word	shadowOAM
	.word	pauline
	.word	collision
	.word	score
	.word	.LANCHOR0
	.word	barrels
	.word	lives
	.word	hammer
	.word	oldButtons
	.word	buttons
	.word	colorAt
	.word	dk
	.size	updateMario, .-updateMario
	.align	2
	.global	updatePauline
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePauline, %function
updatePauline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L125
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L125+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	ip, .L125+8
	sub	r0, r0, r3
	cmp	ip, r0, ror #2
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #32]
	bcc	.L123
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r2, #32]
.L123:
	ldm	r2, {ip, lr}
	ldr	r0, .L125+12
	add	r3, r3, #10
	orr	lr, lr, r0
	orr	ip, ip, r0
	ldr	r0, .L125+16
	lsl	r3, r3, #1
	add	r1, r1, #1
	str	r1, [r2, #28]
	strh	lr, [r0, #16]	@ movhi
	strh	r3, [r0, #20]	@ movhi
	strh	ip, [r0, #18]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L126:
	.align	2
.L125:
	.word	pauline
	.word	143165576
	.word	71582788
	.word	-32768
	.word	shadowOAM
	.size	updatePauline, .-updatePauline
	.align	2
	.global	updateBarrels
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarrels, %function
updateBarrels:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L183
	ldr	r5, .L183+4
	ldr	r10, .L183+8
	sub	sp, sp, #36
	add	fp, r4, #520
	b	.L165
.L142:
	add	r4, r4, #52
	cmp	r4, fp
	add	r5, r5, #8
	beq	.L177
.L165:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	moveq	r3, #512
	strheq	r3, [r5, #32]	@ movhi
	beq	.L142
	ldr	ip, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #44]
	ldr	r3, [r10]
	ldr	r0, [r4]
	add	r1, r1, ip
	add	r8, sp, #28
	add	r7, sp, #24
	stm	sp, {r3, r7, r8}
	add	r0, r0, r2
	ldr	r3, [r4, #12]
	mov	r2, #0
	ldr	ip, .L183+12
	sub	r1, r1, #1
	mov	lr, pc
	bx	ip
	subs	r2, r0, #0
	beq	.L178
.L129:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldr	r2, [r10]
	ldm	r4, {r6, r9}
	beq	.L179
.L131:
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L180
	cmp	r3, #0
	moveq	r1, #1
	streq	r3, [r4, #44]
	streq	r1, [r4, #24]
	streq	r1, [r4, #8]
.L137:
	mov	r3, #0
	str	r3, [r4, #40]
.L135:
	stm	sp, {r2, r7, r8}
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #44]
	add	r1, r9, r1
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r1, r1, #1
	ldr	ip, .L183+12
	add	r0, r6, r0
	mov	lr, pc
	bx	ip
	ldr	r1, [r4, #44]
	ldr	r2, [sp, #24]
	sub	r2, r2, r1
	mov	r1, #0
	ldr	r3, [sp, #28]
	ldr	r0, [r4, #20]
	sub	r3, r3, r0
	add	r3, r3, #1
	stm	r4, {r2, r3}
.L138:
	cmp	r2, #15
	movle	r2, #16
	strle	r2, [r4]
	ble	.L140
	ldr	r3, [r4, #16]
	add	r0, r2, r3
	cmp	r0, #224
	rsbgt	r2, r3, #224
	strgt	r2, [r4]
.L140:
	cmp	r2, r6
	ldr	r0, [r4, #4]
	beq	.L171
.L141:
	ldr	ip, [r4, #28]
	tst	ip, #3
	ldr	r3, [r4, #32]
	bne	.L144
	add	r3, r3, #1
	rsbs	lr, r3, #0
	and	lr, lr, #3
	and	r3, r3, #3
	rsbpl	r3, lr, #0
	str	r3, [r4, #32]
.L144:
	ldr	lr, [r4, #24]
	add	r0, r0, #3
	cmp	lr, #0
	strh	r0, [r5, #32]	@ movhi
	bne	.L145
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L146
.L148:
	.word	.L151
	.word	.L150
	.word	.L149
	.word	.L147
.L145:
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L146
.L157:
	.word	.L160
	.word	.L159
	.word	.L158
	.word	.L156
.L156:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	beq	.L164
.L175:
	ldr	r3, .L183+16
	orr	r2, r2, #16384
	strh	r2, [r5, #34]	@ movhi
	strh	r3, [r5, #36]	@ movhi
.L146:
	add	r3, ip, #1
	str	r3, [r4, #28]
.L182:
	add	r4, r4, #52
	cmp	r4, fp
	add	r5, r5, #8
	bne	.L165
.L177:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L171:
	cmp	r0, r9
	bne	.L141
	mov	r2, #0
	mov	r3, #512
	str	r2, [r4, #36]
	strh	r3, [r5, #32]	@ movhi
	b	.L142
.L178:
	ldr	ip, [r4]
	ldr	r0, [r4, #44]
	ldr	r3, [r10]
	ldr	lr, [r4, #4]
	ldr	r1, [r4, #20]
	add	r0, ip, r0
	ldr	ip, [sp, #28]
	str	r3, [sp]
	str	ip, [sp, #20]
	stmib	sp, {r7, r8}
	ldr	r3, [r4, #12]
	ldr	ip, .L183+12
	add	r1, lr, r1
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L129
	mov	r3, #1
	ldr	r2, [r4]
	mov	r6, r2
	str	r3, [r4, #40]
	ldr	r9, [r4, #4]
	ldr	r3, [r4, #20]
.L130:
	mov	r1, #1
	ldr	r0, [sp, #20]
	sub	r7, r0, r3
	add	r7, r7, r1
	str	r7, [r4, #4]
	b	.L138
.L179:
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #44]
	add	r1, r9, r1
	ldr	r3, .L183+20
	add	r1, r1, #1
	add	r0, r6, r0
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L181
.L132:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldm	r4, {r6, r9}
	ldr	r2, [r10]
	beq	.L135
	b	.L131
.L158:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	beq	.L163
.L174:
	mov	r3, #320
	orr	r2, r2, #16384
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L159:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	bne	.L175
	mov	r3, #324
	orr	r2, r2, #28672
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L160:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	bne	.L174
	mov	r3, #324
	orr	r2, r2, #20480
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L147:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	bne	.L175
	ldr	r3, .L183+24
	orr	r2, r2, #24576
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L149:
	orr	r2, r2, #16384
	lsl	r2, r2, #16
	cmp	r1, #0
	lsr	r2, r2, #16
	beq	.L176
.L173:
	mov	r3, #320
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L150:
	lsl	r2, r2, #16
	cmp	r1, #0
	asr	r2, r2, #16
	bne	.L175
	mov	r3, #324
	orr	r2, r2, #24576
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L151:
	orr	r2, r2, #16384
	lsl	r2, r2, #16
	cmp	r1, #0
	lsr	r2, r2, #16
	bne	.L173
	mov	r3, #324
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L164:
	orr	r2, r2, #28672
.L176:
	ldr	r3, .L183+24
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L180:
	mvn	r1, #0
	mov	r0, #0
	ldr	r3, [r4, #16]
	add	r3, r3, r1
	str	r3, [r4, #44]
	str	r0, [r4, #24]
	str	r1, [r4, #8]
	b	.L137
.L163:
	ldr	r3, .L183+24
	orr	r2, r2, #20480
	strh	r3, [r5, #36]	@ movhi
	add	r3, ip, #1
	strh	r2, [r5, #34]	@ movhi
	str	r3, [r4, #28]
	b	.L182
.L181:
	ldr	r3, .L183+28
	mov	lr, pc
	bx	r3
	rsb	r3, r0, r0, lsl #3
	add	r3, r3, r3, lsl #6
	add	r3, r0, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r0, r0, r3, lsl #3
	add	r0, r0, #238026752
	add	r0, r0, #581632
	ldr	r3, .L183+32
	add	r0, r0, #908
	add	r0, r0, #2
	cmp	r3, r0, ror #1
	bcc	.L132
	mov	r1, #1
	ldr	r9, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r2, [r4]
	add	r7, r9, r3
	add	r0, r7, r1
	mov	r6, r2
	str	r0, [sp, #20]
	str	r1, [r4, #40]
	b	.L130
.L184:
	.align	2
.L183:
	.word	barrels
	.word	shadowOAM
	.word	level
	.word	checkCollisionMap
	.word	322
	.word	colorAt
	.word	326
	.word	rand
	.word	238609294
	.size	updateBarrels, .-updateBarrels
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.align	2
	.global	updateHUD
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHUD, %function
updateHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #32768
	mov	r10, #704
	mov	fp, #140
	mov	r9, #156
	mov	r2, #0
	mov	r8, #172
	ldr	r1, .L189
	ldr	r1, [r1]
	ldr	r3, .L189+4
	add	r1, r1, #640
	strh	r1, [r3, #252]	@ movhi
	ldr	r1, .L189+8
	strh	r1, [r3, #244]	@ movhi
	add	r1, r3, #256
	strh	r10, [r3, #236]	@ movhi
	strh	lr, [r3, #232]	@ movhi
	strh	fp, [r3, #234]	@ movhi
	strh	lr, [r1]	@ movhi
	ldr	lr, .L189+12
	strh	r9, [r1, #2]	@ movhi
	add	r1, r3, #260
	strh	lr, [r1]	@ movhi
	add	r1, r3, #376
	strh	r2, [r1]	@ movhi
	strh	r8, [r1, #2]	@ movhi
	sub	lr, lr, #29
	add	r1, r3, #380
	strh	r2, [r3, #240]	@ movhi
	strh	lr, [r1]	@ movhi
	mov	lr, #180	@ movhi
	add	r1, r3, #384
	strh	lr, [r1, #2]	@ movhi
	ldr	lr, .L189+16
	strh	r2, [r1]	@ movhi
	add	r1, r3, #388
	strh	lr, [r1]	@ movhi
	mov	lr, #188	@ movhi
	add	r1, r3, #392
	strh	lr, [r1, #2]	@ movhi
	ldr	lr, .L189+20
	strh	r2, [r1]	@ movhi
	add	r1, r3, #396
	strh	lr, [r1]	@ movhi
	mov	lr, #196	@ movhi
	add	r1, r3, #400
	strh	r2, [r1]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	add	r1, r3, #408
	strh	r2, [r1]	@ movhi
	mov	r2, #204	@ movhi
	mov	r0, #8
	strh	r2, [r1, #2]	@ movhi
	mov	r1, #680	@ movhi
	mov	ip, #148
	mov	r6, r3
	mov	r7, r0
	mov	r4, #212
	mov	r5, #1
	add	r2, r3, #404
	strh	r1, [r2]	@ movhi
	ldr	r1, .L189+24
	add	r2, r3, #412
	strh	r1, [r2]	@ movhi
	ldr	r2, .L189+28
	strh	ip, [r3, #242]	@ movhi
	strh	ip, [r3, #250]	@ movhi
	strh	r0, [r3, #248]	@ movhi
	ldr	r10, [r2]
	ldr	r9, .L189+32
	ldr	r8, .L189+36
.L186:
	add	r3, r5, r5, lsl #2
	mov	fp, r5
	lsl	r5, r3, #1
	strh	r4, [r6, #170]	@ movhi
	strh	r7, [r6, #168]	@ movhi
	mov	r1, r5
	mov	r0, r10
	mov	lr, pc
	bx	r9
	mov	r0, r1
	mov	r1, fp
	mov	lr, pc
	bx	r8
	sub	r4, r4, #8
	lsl	r4, r4, #16
	lsr	r4, r4, #16
	add	r0, r0, #640
	cmp	r4, #156
	strh	r0, [r6, #172]	@ movhi
	sub	r6, r6, #8
	bne	.L186
	ldr	r3, .L189+40
	mov	r8, #220
	mov	r1, r3
	mov	ip, #32768
	mov	r6, #0
	mov	lr, #228
	mov	r0, r3
	mov	r2, r3
	mov	r5, #236
	mov	r4, #712
	strh	r8, [r3, #2]	@ movhi
	ldr	r8, .L189+12
	strh	ip, [r3]	@ movhi
	strh	r8, [r3, #4]	@ movhi
	strh	r6, [r1, #8]!	@ movhi
	strh	lr, [r1, #2]	@ movhi
	ldr	r1, .L189+44
	strh	r1, [r3, #12]	@ movhi
	ldr	r1, .L189+48
	ldr	r1, [r1]
	strh	r7, [r0, #16]!	@ movhi
	add	r1, r1, #640
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	strh	ip, [r2, #24]!	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r3, #28]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L190:
	.align	2
.L189:
	.word	lives
	.word	shadowOAM
	.word	705
	.word	706
	.word	678
	.word	679
	.word	681
	.word	score
	.word	__aeabi_idivmod
	.word	__aeabi_idiv
	.word	shadowOAM+304
	.word	711
	.word	levelsCleared
	.size	updateHUD, .-updateHUD
	.align	2
	.global	throwBarrel
	.syntax unified
	.arm
	.fpu softvfp
	.type	throwBarrel, %function
throwBarrel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L201
	mov	r3, #0
	mov	r2, r7
.L197:
	ldr	r5, [r2, #36]
	cmp	r5, #0
	beq	.L200
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #52
	bne	.L197
.L191:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L200:
	mov	r8, #1
	ldr	r2, .L201+4
	add	r1, r3, r3, lsl r8
	ldr	r2, [r2]
	add	r3, r3, r1, lsl #2
	add	r6, r7, r3, lsl #2
	cmp	r2, r8
	str	r5, [r6, #32]
	str	r5, [r6, #28]
	str	r5, [r6, #40]
	str	r5, [r6, #48]
	str	r8, [r6, #36]
	str	r8, [r6, #12]
	lsl	r4, r3, #2
	beq	.L193
	cmp	r2, #2
	bne	.L191
	ldr	r3, .L201+8
	mov	lr, pc
	bx	r3
	ands	r0, r0, #1
	beq	.L196
	mov	r2, #144
	mov	r3, #16
	str	r8, [r6, #8]
	str	r8, [r6, #24]
	str	r5, [r6, #44]
	str	r2, [r7, r4]
	str	r3, [r6, #4]
	b	.L191
.L193:
	mov	r1, #96
	mov	r3, #16
	str	r2, [r6, #8]
	str	r2, [r6, #24]
	str	r5, [r6, #44]
	str	r1, [r7, r4]
	str	r3, [r6, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L196:
	mvn	r2, #0
	mov	ip, #80
	mov	r1, #16
	ldr	r3, [r6, #16]
	add	r3, r3, r2
	stmib	r6, {r1, r2}
	str	r0, [r6, #24]
	str	r3, [r6, #44]
	str	ip, [r7, r4]
	b	.L191
.L202:
	.align	2
.L201:
	.word	barrels
	.word	level
	.word	rand
	.size	throwBarrel, .-throwBarrel
	.align	2
	.global	updateDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDK, %function
updateDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L227
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L227+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bcc	.L223
	ldr	r3, [r4, #24]
	cmp	r3, #3
	beq	.L224
	cmp	r3, #4
	beq	.L225
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	str	r3, [r4, #32]
.L223:
	ldr	r5, .L227+8
.L204:
	ldr	r2, [r4]
	mvn	r2, r2, lsl #18
	ldr	r3, [r5]
	cmp	r3, #180
	mvn	r2, r2, lsr #18
	beq	.L207
	ldr	r1, .L227+12
	ldr	ip, [r4, #4]
	ldr	r0, [r4, #24]
	strh	r2, [r1, #10]	@ movhi
	ldr	r2, [r4, #28]
	orr	ip, ip, #16384
	cmp	r0, #3
	strh	ip, [r1, #8]	@ movhi
	add	r2, r2, #1
	beq	.L208
	cmp	r0, #4
	beq	.L210
	cmp	r0, #0
	beq	.L226
.L211:
	add	r3, r3, #1
	str	r3, [r5]
	str	r2, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L207:
	ldr	r1, .L227+12
	mov	ip, #3
	ldr	r0, [r4, #4]
	strh	r2, [r1, #10]	@ movhi
	mov	r2, #1
	orr	r0, r0, #16384
	strh	r0, [r1, #8]	@ movhi
	str	ip, [r4, #24]
.L208:
	mov	r0, #1408
	strh	r0, [r1, #12]	@ movhi
	b	.L211
.L226:
	ldr	r0, [r4, #32]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L211
.L213:
	.word	.L212
	.word	.L215
	.word	.L214
	.word	.L212
.L210:
	mov	r0, #1536
	strh	r0, [r1, #12]	@ movhi
	b	.L211
.L224:
	mov	r3, #4
	ldr	r5, .L227+8
	str	r3, [r4, #24]
	b	.L204
.L212:
	ldr	r0, .L227+16
	strh	r0, [r1, #12]	@ movhi
	b	.L211
.L215:
	ldr	r0, .L227+20
	strh	r0, [r1, #12]	@ movhi
	b	.L211
.L214:
	mov	r0, #1424
	strh	r0, [r1, #12]	@ movhi
	b	.L211
.L225:
	mov	r3, #0
	ldr	r5, .L227+8
	str	r3, [r4, #24]
	str	r3, [r5]
	bl	throwBarrel
	b	.L204
.L228:
	.align	2
.L227:
	.word	dk
	.word	143165576
	.word	barrelTimer
	.word	shadowOAM
	.word	1432
	.word	1416
	.size	updateDK, .-updateDK
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateMario
	bl	updateDK
	bl	updatePauline
	bl	updateBarrels
	bl	updateHUD
	ldr	r3, .L233
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L230
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, .L233+4
	ldr	r3, .L233+8
	orr	r2, r2, #16384
	strh	r2, [r3, #26]	@ movhi
	strh	r0, [r3, #24]	@ movhi
	strh	r1, [r3, #28]	@ movhi
	pop	{r4, lr}
	bx	lr
.L230:
	mov	r2, #512
	ldr	r3, .L233+8
	pop	{r4, lr}
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L234:
	.align	2
.L233:
	.word	hammer
	.word	1220
	.word	shadowOAM
	.size	update, .-update
	.comm	hammer,52,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	barrels,520,4
	.comm	barrelTimer,4,4
	.comm	levelsCleared,4,4
	.comm	pauline,52,4
	.comm	dk,52,4
	.comm	ladder,4,4
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,52,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cooldown.4735, %object
	.size	cooldown.4735, 4
cooldown.4735:
	.word	60
	.ident	"GCC: (devkitARM release 53) 9.1.0"
