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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L60
	ldr	r3, [r5]
	ldr	r4, .L60+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #36
	ble	.L13
	tst	r3, #3
	beq	.L57
.L14:
	sub	r3, r3, #1
	str	r3, [r5]
.L13:
	ldr	r1, [r4, #28]
	ldr	r2, .L60+8
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
	ldr	r7, .L60+12
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L18
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L58
.L18:
	mov	r6, #1
	ldr	r3, .L60+16
	ldr	r8, .L60+20
	str	r3, [sp, #16]
	ldr	fp, .L60+24
	ldr	r3, [r3]
	add	r10, sp, #28
	add	r9, sp, #24
.L17:
	cmp	r3, #0
	beq	.L21
	ldr	r3, .L60+28
	ldrh	r2, [r3, #48]
	ands	r2, r2, #128
	beq	.L59
.L22:
	ldr	r2, .L60+32
	ldr	r3, [r2]
	cmp	r3, #10
	sub	r1, r3, #1
	ble	.L32
.L30:
	mvn	r3, #0
	str	r3, [r4, #12]
.L33:
	str	r1, [r2]
.L31:
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
	ble	.L36
	add	r0, r1, r3
	cmp	r0, #224
	rsbgt	r3, r1, #224
	strgt	r3, [r4]
.L36:
	cmp	r6, #0
	movne	r0, #0
	movne	r1, r0
	strne	r0, [r4, #28]
	strne	r0, [r4, #32]
	ldr	r0, [r5]
	ldreq	r1, [r4, #32]
	cmp	r0, #0
	ldr	r0, [r4, #24]
	ble	.L39
	ldr	ip, .L60+36
	ldr	ip, [ip]
	lsl	r1, r1, #16
	cmp	ip, #0
	lsr	r1, r1, #16
	bne	.L40
	lsl	r1, r1, #23
	cmp	r0, #1
	lsr	r1, r1, #16
	ldr	r0, .L60+40
	sub	ip, ip, #32768
	sub	r2, r2, #16
	orr	r2, r2, ip
	orr	r3, r3, ip
	addeq	r1, r1, #12
	addne	r1, r1, #10
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
.L42:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r7]
	strgt	r3, [r4, #12]
	ldrle	r3, [r4, #12]
	b	.L33
.L57:
	ldr	r1, .L60+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L14
.L58:
	ldr	r3, .L60+28
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	str	r3, [sp, #20]
	bne	.L18
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r0, [r4]
	ldr	r8, .L60+20
	add	r1, r1, r2
	add	r3, r3, r3, lsr #31
	add	r0, r0, r3, asr #1
	ldr	r2, [r8]
	ldr	r3, .L60+44
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L19
	ldr	r3, .L60+16
	mov	r6, #1
	str	r3, [sp, #16]
	ldr	fp, .L60+24
	ldr	r3, [r3]
	add	r10, sp, #28
	add	r9, sp, #24
	b	.L17
.L20:
	ldr	r2, [sp, #20]
	mov	r6, r2
	ldr	r3, [r4, #4]
	ldr	r1, .L60+16
	sub	r3, r3, #2
	str	r2, [r1]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r3, [r4, #4]
.L21:
	ldr	r2, .L60+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	bne	.L26
	mvn	r2, #0
	mov	r6, r3
	str	r3, [r4, #24]
	str	r2, [r4, #8]
.L27:
	ldr	r3, .L60+48
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r7]
	beq	.L28
	ldr	r2, .L60+52
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L28
	cmp	r3, #0
	bne	.L22
	mov	r2, #1
	mov	r6, r3
	str	r2, [r7]
	mov	r1, #29
	ldr	r2, .L60+32
	b	.L30
.L28:
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #12]
	beq	.L31
	b	.L22
.L39:
	add	r1, r0, r1, lsl #5
	ldr	r0, .L60+40
	lsl	r1, r1, #1
	orr	r3, r3, #16384
	strh	r1, [r0, #4]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	b	.L42
.L40:
	cmp	r0, #1
	subne	r3, r3, #16
	mvneq	r3, r3, lsl #17
	mvnne	r3, r3, lsl #17
	mvneq	r3, r3, lsr #17
	mvnne	r3, r3, lsr #17
	lsl	r1, r1, #22
	ldr	ip, .L60+40
	lsr	r1, r1, #16
	orr	r2, r2, #16384
	addeq	r1, r1, #14
	addne	r1, r1, #6
	strh	r2, [ip]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	b	.L42
.L26:
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	moveq	r2, #1
	moveq	r6, r3
	streq	r2, [r4, #8]
	streq	r2, [r4, #24]
	b	.L27
.L59:
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
	bne	.L23
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L22
	b	.L21
.L23:
	mov	r6, r2
	str	r2, [r3]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	b	.L21
.L19:
	mov	lr, #2
	mvn	r3, #0
	mov	ip, #1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r9, [r4, #4]
	add	r1, r9, r1
	ldr	r9, .L60+16
	ldr	r6, [r4]
	ldr	r2, [r8]
	str	lr, [r4, #24]
	ldr	lr, .L60+16
	str	r9, [sp, #16]
	add	r0, r0, r0, lsr #31
	add	r10, sp, #28
	add	r9, sp, #24
	stm	sp, {r2, r9, r10}
	add	r0, r6, r0, asr ip
	ldr	r2, [sp, #20]
	ldr	fp, .L60+24
	str	ip, [lr]
	add	r1, r1, r3
	str	r3, [r4, #12]
	mov	lr, pc
	bx	fp
	subs	r6, r0, #0
	bne	.L20
	ldr	lr, .L60+16
	ldr	r3, [lr]
	b	.L17
.L61:
	.align	2
.L60:
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
	.comm	ladder,4,4
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
