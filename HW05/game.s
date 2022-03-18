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
	moveq	r0, #80
	moveq	r1, #100
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
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #64
	mov	r0, #32
	ldr	r3, .L14
	ldr	r1, [r3]
	ldr	r3, .L14+4
	cmp	r1, #1
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	beq	.L10
	cmp	r1, #2
	moveq	r1, #100
	stmeq	r3, {r1, r2}
	bx	lr
.L10:
	stm	r3, {r0, r2}
	bx	lr
.L15:
	.align	2
.L14:
	.word	level
	.word	dk
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
	moveq	r1, #40
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
	push	{r4, lr}
	ldr	r3, .L25
	str	r0, [r3]
	bl	initMario
	bl	initDK
	pop	{r4, lr}
	b	initPauline
.L26:
	.align	2
.L25:
	.word	level
	.size	init, .-init
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
	ldr	r5, .L75
	ldr	r3, [r5]
	ldr	r4, .L75+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #36
	ble	.L28
	tst	r3, #3
	beq	.L72
.L29:
	sub	r3, r3, #1
	str	r3, [r5]
.L28:
	ldr	r1, [r4, #28]
	ldr	r2, .L75+8
	smull	r0, r3, r2, r1
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	bne	.L30
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	str	r2, [r4, #32]
.L30:
	ldr	r7, .L75+12
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L73
.L33:
	mov	r6, #1
	ldr	r3, .L75+16
	ldr	r8, .L75+20
	str	r3, [sp, #16]
	ldr	fp, .L75+24
	ldr	r3, [r3]
	add	r10, sp, #28
	add	r9, sp, #24
.L32:
	cmp	r3, #0
	beq	.L36
	ldr	r3, .L75+28
	ldrh	r2, [r3, #48]
	ands	r2, r2, #128
	beq	.L74
.L37:
	ldr	r2, .L75+32
	ldr	r3, [r2]
	cmp	r3, #10
	sub	r1, r3, #1
	ble	.L47
.L45:
	mvn	r3, #0
	str	r3, [r4, #12]
.L48:
	str	r1, [r2]
.L46:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r2, [r8]
	add	r1, r1, r0
	ldr	r0, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4]
	add	r0, r0, r0, lsr #31
	sub	r1, r1, #1
	add	r0, r2, r0, asr #1
	str	r10, [sp, #8]
	ldr	r2, [r4, #8]
	str	r9, [sp, #4]
	mov	lr, pc
	bx	fp
	ldr	r1, [r4, #16]
	ldr	ip, [sp, #24]
	add	r3, r1, r1, lsr #31
	sub	r3, ip, r3, asr #1
	cmp	r3, #15
	str	r3, [r4]
	movle	r3, #16
	ldr	r2, [sp, #28]
	ldr	r0, [r4, #20]
	sub	r2, r2, r0
	add	r2, r2, #1
	str	r2, [r4, #4]
	strle	r3, [r4]
	ble	.L51
	add	r0, r1, r3
	cmp	r0, #224
	rsbgt	r3, r1, #224
	strgt	r3, [r4]
.L51:
	cmp	r6, #0
	movne	r0, #0
	movne	r1, r0
	strne	r0, [r4, #28]
	strne	r0, [r4, #32]
	ldr	r0, [r5]
	ldreq	r1, [r4, #32]
	cmp	r0, #0
	ldr	r0, [r4, #24]
	ble	.L54
	ldr	ip, .L75+36
	ldr	ip, [ip]
	lsl	r1, r1, #16
	cmp	ip, #0
	lsr	r1, r1, #16
	bne	.L55
	lsl	r1, r1, #23
	cmp	r0, #1
	lsr	r1, r1, #16
	ldr	r0, .L75+40
	sub	ip, ip, #32768
	sub	r2, r2, #16
	orr	r2, r2, ip
	orr	r3, r3, ip
	addeq	r1, r1, #12
	addne	r1, r1, #10
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
.L57:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L47:
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r7]
	strgt	r3, [r4, #12]
	ldrle	r3, [r4, #12]
	b	.L48
.L72:
	ldr	r1, .L75+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L29
.L73:
	ldr	r3, .L75+28
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	str	r3, [sp, #20]
	bne	.L33
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r0, [r4]
	ldr	r8, .L75+20
	add	r1, r1, r2
	add	r3, r3, r3, lsr #31
	add	r0, r0, r3, asr #1
	ldr	r2, [r8]
	ldr	r3, .L75+44
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L34
	ldr	r3, .L75+16
	mov	r6, #1
	str	r3, [sp, #16]
	ldr	fp, .L75+24
	ldr	r3, [r3]
	add	r10, sp, #28
	add	r9, sp, #24
	b	.L32
.L35:
	ldr	r2, [sp, #20]
	mov	r6, r2
	ldr	r3, [r4, #4]
	ldr	r1, .L75+16
	sub	r3, r3, #2
	str	r2, [r1]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r3, [r4, #4]
.L36:
	ldr	r2, .L75+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	bne	.L41
	mvn	r2, #0
	mov	r6, r3
	str	r3, [r4, #24]
	str	r2, [r4, #8]
.L42:
	ldr	r3, .L75+48
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r7]
	beq	.L43
	ldr	r2, .L75+52
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L43
	cmp	r3, #0
	bne	.L37
	mov	r2, #1
	mov	r6, r3
	str	r2, [r7]
	mov	r1, #29
	ldr	r2, .L75+32
	b	.L45
.L43:
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #12]
	beq	.L46
	b	.L37
.L54:
	add	r1, r0, r1, lsl #5
	ldr	r0, .L75+40
	lsl	r1, r1, #1
	orr	r3, r3, #16384
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	b	.L57
.L55:
	cmp	r0, #1
	subne	r3, r3, #16
	mvneq	r3, r3, lsl #17
	mvnne	r3, r3, lsl #17
	mvneq	r3, r3, lsr #17
	mvnne	r3, r3, lsr #17
	lsl	r1, r1, #22
	ldr	ip, .L75+40
	lsr	r1, r1, #16
	orr	r2, r2, #16384
	addeq	r1, r1, #14
	addne	r1, r1, #6
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	b	.L57
.L41:
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	moveq	r2, #1
	moveq	r6, r3
	streq	r2, [r4, #8]
	streq	r2, [r4, #24]
	b	.L42
.L74:
	mov	r3, #1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	add	r1, ip, r1
	ldr	ip, [r8]
	add	r0, r0, r0, lsr #31
	add	r0, lr, r0, asr r3
	stmib	sp, {r9, r10}
	str	ip, [sp]
	sub	r1, r1, #1
	str	r2, [sp, #20]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	subs	r6, r0, #0
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	bne	.L38
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L37
	b	.L36
.L38:
	mov	r6, r2
	str	r2, [r3]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	b	.L36
.L34:
	mov	lr, #2
	mvn	r3, #0
	mov	ip, #1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r9, [r4, #4]
	add	r1, r9, r1
	ldr	r9, .L75+16
	ldr	r6, [r4]
	ldr	r2, [r8]
	str	lr, [r4, #24]
	ldr	lr, .L75+16
	str	r9, [sp, #16]
	add	r0, r0, r0, lsr #31
	add	r10, sp, #28
	add	r9, sp, #24
	stm	sp, {r2, r9, r10}
	add	r0, r6, r0, asr ip
	ldr	r2, [sp, #20]
	ldr	fp, .L75+24
	str	ip, [lr]
	add	r1, r1, r3
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	subs	r6, r0, #0
	bne	.L35
	ldr	lr, .L75+16
	ldr	r3, [lr]
	b	.L32
.L76:
	.align	2
.L75:
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
	.word	shadowOAM
	.word	colorAt
	.word	oldButtons
	.word	buttons
	.size	updateMario, .-updateMario
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
	ldr	r2, .L85
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L85+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r0, r3
	cmp	r0, r3, ror #1
	str	lr, [sp, #-4]!
	bcc	.L78
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	rsbpl	r3, r0, #0
	str	r3, [r2, #32]
.L78:
	ldr	r3, [r2]
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r2, #4]
	ldr	lr, [r2, #24]
	ldr	ip, .L85+8
	orr	r0, r0, #16384
	cmp	lr, #0
	strh	r3, [ip, #10]	@ movhi
	strh	r0, [ip, #8]	@ movhi
	bne	.L79
	ldr	r3, [r2, #32]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L79
.L81:
	.word	.L80
	.word	.L83
	.word	.L82
	.word	.L80
.L80:
	mov	r3, #408
	strh	r3, [ip, #12]	@ movhi
.L79:
	add	r1, r1, #1
	str	r1, [r2, #28]
	ldr	lr, [sp], #4
	bx	lr
.L83:
	mov	r3, #392
	add	r1, r1, #1
	strh	r3, [ip, #12]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #28]
	bx	lr
.L82:
	mov	r3, #400
	add	r1, r1, #1
	strh	r3, [ip, #12]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #28]
	bx	lr
.L86:
	.align	2
.L85:
	.word	dk
	.word	143165576
	.word	shadowOAM
	.size	updateDK, .-updateDK
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
	ldr	r2, .L90
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L90+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	ip, .L90+8
	sub	r0, r0, r3
	cmp	ip, r0, ror #2
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #32]
	bcc	.L88
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r2, #32]
.L88:
	ldm	r2, {ip, lr}
	ldr	r0, .L90+12
	add	r3, r3, #10
	orr	lr, lr, r0
	orr	ip, ip, r0
	ldr	r0, .L90+16
	lsl	r3, r3, #1
	add	r1, r1, #1
	str	r1, [r2, #28]
	strh	lr, [r0, #16]	@ movhi
	strh	r3, [r0, #20]	@ movhi
	strh	ip, [r0, #18]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L91:
	.align	2
.L90:
	.word	pauline
	.word	143165576
	.word	71582788
	.word	-32768
	.word	shadowOAM
	.size	updatePauline, .-updatePauline
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
	pop	{r4, lr}
	b	updatePauline
	.size	update, .-update
	.comm	pauline,36,4
	.comm	dk,36,4
	.comm	ladder,4,4
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
