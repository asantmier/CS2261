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
	ldr	ip, .L7+4
	ldr	r1, [r2]
	ldr	r2, .L7+8
	str	lr, [sp, #-4]!
	str	r3, [ip]
	ldr	lr, .L7+12
	ldr	ip, .L7+16
	str	r3, [r2]
	ldr	r2, .L7+20
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
	.word	mario
	.size	initMario, .-initMario
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
	@ link register save eliminated.
	ldr	r3, .L10
	str	r0, [r3]
	b	initMario
.L11:
	.align	2
.L10:
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L45
	ldr	r3, [r5]
	ldr	r4, .L45+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #28
	ble	.L13
	tst	r3, #3
	beq	.L42
.L14:
	sub	r3, r3, #1
	str	r3, [r5]
.L13:
	ldr	r1, [r4, #28]
	ldr	r2, .L45+8
	smull	r0, r3, r2, r1
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	bne	.L15
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	str	r2, [r4, #32]
.L15:
	ldr	r2, .L45+12
	ldrh	r3, [r2, #48]
	ands	r6, r3, #32
	bne	.L16
	mvn	r2, #0
	str	r6, [r4, #24]
	str	r2, [r4, #8]
.L17:
	ldr	r3, .L45+16
	ldrh	r3, [r3]
	ldr	r1, .L45+20
	tst	r3, #1
	ldr	r3, [r1]
	beq	.L18
	ldr	r0, .L45+24
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L18
	cmp	r3, #0
	beq	.L43
.L21:
	ldr	r0, .L45+28
	ldr	r3, [r0]
	cmp	r3, #10
	sub	ip, r3, #1
	bgt	.L20
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r1]
.L24:
	str	ip, [r0]
	b	.L22
.L18:
	cmp	r3, #0
	bne	.L21
	mov	r3, #1
	str	r3, [r4, #12]
.L22:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	lr, .L45+32
	ldr	ip, [r4, #16]
	ldr	lr, [lr]
	add	r1, r1, r0
	ldr	r0, [r4]
	add	ip, ip, ip, lsr #31
	str	lr, [sp]
	add	r0, r0, ip, asr #1
	add	lr, sp, #20
	add	ip, sp, #16
	stmib	sp, {ip, lr}
	sub	r1, r1, #1
	ldr	r7, .L45+36
	mov	lr, pc
	bx	r7
	ldr	r1, [r4, #16]
	ldr	ip, [sp, #16]
	add	r3, r1, r1, lsr #31
	sub	r3, ip, r3, asr #1
	cmp	r3, #15
	str	r3, [r4]
	movle	r3, #16
	ldr	r2, [sp, #20]
	ldr	r0, [r4, #20]
	sub	r2, r2, r0
	add	r2, r2, #1
	str	r2, [r4, #4]
	strle	r3, [r4]
	ble	.L26
	add	r0, r1, r3
	cmp	r0, #224
	rsbgt	r3, r1, #224
	strgt	r3, [r4]
.L26:
	cmp	r6, #0
	movne	r0, #0
	movne	r1, r0
	strne	r0, [r4, #28]
	strne	r0, [r4, #32]
	ldr	r0, [r5]
	ldreq	r1, [r4, #32]
	cmp	r0, #0
	ldr	r0, [r4, #24]
	ble	.L29
	ldr	ip, .L45+40
	ldr	ip, [ip]
	lsl	r1, r1, #16
	cmp	ip, #0
	lsr	r1, r1, #16
	beq	.L44
	cmp	r0, #1
	subne	r3, r3, #16
	mvneq	r3, r3, lsl #17
	mvnne	r3, r3, lsl #17
	mvneq	r3, r3, lsr #17
	mvnne	r3, r3, lsr #17
	lsl	r1, r1, #22
	ldr	ip, .L45+44
	lsr	r1, r1, #16
	orr	r2, r2, #16384
	addeq	r1, r1, #14
	addne	r1, r1, #6
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
.L32:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L16:
	ldrh	r6, [r2, #48]
	ands	r6, r6, #16
	moveq	r2, #1
	movne	r2, #0
	movne	r6, #1
	streq	r2, [r4, #8]
	streq	r2, [r4, #24]
	b	.L17
.L44:
	lsl	r1, r1, #23
	cmp	r0, #1
	lsr	r1, r1, #16
	ldr	r0, .L45+44
	sub	ip, ip, #32768
	sub	r2, r2, #16
	orr	r2, r2, ip
	orr	r3, r3, ip
	addeq	r1, r1, #12
	addne	r1, r1, #10
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	b	.L32
.L42:
	ldr	r1, .L45+40
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L14
.L29:
	add	r1, r0, r1, lsl #5
	ldr	r0, .L45+44
	lsl	r1, r1, #1
	orr	r3, r3, #16384
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	b	.L32
.L43:
	mov	r0, #1
	mov	r6, r3
	mov	ip, #29
	str	r0, [r1]
	ldr	r0, .L45+28
.L20:
	mvn	r3, #0
	str	r3, [r4, #12]
	b	.L24
.L46:
	.align	2
.L45:
	.word	hammerTimer
	.word	mario
	.word	1431655766
	.word	67109120
	.word	oldButtons
	.word	jump
	.word	buttons
	.word	jumpTimer
	.word	level
	.word	checkCollisionMap
	.word	hammerState
	.word	shadowOAM
	.size	updateMario, .-updateMario
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
	@ link register save eliminated.
	b	updateMario
	.size	update, .-update
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
