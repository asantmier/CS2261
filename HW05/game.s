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
	@ link register save eliminated.
	mov	r1, #16
	ldr	r3, .L7
	ldr	r2, [r3]
	ldr	r3, .L7+4
	cmp	r2, #1
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	beq	.L2
	cmp	r2, #2
	moveq	r1, #80
	moveq	r2, #100
	stmeq	r3, {r1, r2}
	bx	lr
.L2:
	mov	r1, #184
	mov	r2, #136
	stm	r3, {r1, r2}
	bx	lr
.L8:
	.align	2
.L7:
	.word	level
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
	ldr	r5, .L32
	ldr	r3, [r5]
	ldr	r4, .L32+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #28
	ble	.L13
	tst	r3, #3
	beq	.L30
.L14:
	sub	r3, r3, #1
	str	r3, [r5]
.L13:
	ldr	r2, [r4, #28]
	ldr	r3, .L32+8
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	beq	.L15
	ldr	r2, [r4, #32]
	ldr	r3, .L32+12
	add	r2, r2, #1
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r4, #32]
.L15:
	ldr	r2, .L32+16
	ldrh	r3, [r2, #48]
	ands	r6, r3, #32
	bne	.L16
	mvn	r2, #0
	str	r6, [r4, #24]
	str	r2, [r4, #8]
.L17:
	ldr	r0, .L32+20
	add	r3, r4, #16
	ldm	r3, {r3, lr}
	ldr	ip, [r0]
	ldr	r1, [r4, #4]
	ldr	r0, [r4]
	str	ip, [sp]
	add	r1, r1, lr
	add	r3, r3, r3, lsr #31
	add	lr, sp, #20
	add	ip, sp, #16
	sub	r1, r1, #1
	add	r0, r0, r3, asr #1
	stmib	sp, {ip, lr}
	mov	r3, #0
	ldr	r7, .L32+24
	mov	lr, pc
	bx	r7
	ldr	r0, [r4, #20]
	ldr	r3, [sp, #20]
	cmp	r6, #0
	sub	r3, r3, r0
	movne	r0, #0
	ldr	r2, [r4, #16]
	ldr	r1, [sp, #16]
	add	r2, r2, r2, lsr #31
	sub	r1, r1, r2, asr #1
	strne	r0, [r4, #28]
	movne	r2, r0
	strne	r0, [r4, #32]
	ldr	r0, [r5]
	ldreq	r2, [r4, #32]
	add	r3, r3, #1
	cmp	r0, #0
	stm	r4, {r1, r3}
	ldr	r0, [r4, #24]
	ble	.L20
	ldr	ip, [r5, #4]
	lsl	r2, r2, #16
	cmp	ip, #0
	lsr	r2, r2, #16
	beq	.L31
	cmp	r0, #1
	subne	r1, r1, #16
	mvneq	r1, r1, lsl #17
	mvnne	r1, r1, lsl #17
	mvneq	r1, r1, lsr #17
	mvnne	r1, r1, lsr #17
	lsl	r2, r2, #22
	ldr	ip, .L32+28
	lsr	r2, r2, #16
	orr	r3, r3, #16384
	addeq	r2, r2, #14
	addne	r2, r2, #6
	strh	r3, [ip]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
.L23:
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
.L31:
	lsl	r2, r2, #23
	cmp	r0, #1
	lsr	r2, r2, #16
	ldr	r0, .L32+28
	sub	ip, ip, #32768
	sub	r3, r3, #16
	orr	r3, r3, ip
	orr	r1, r1, ip
	addeq	r2, r2, #12
	addne	r2, r2, #10
	strh	r3, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	b	.L23
.L30:
	ldr	r2, [r5, #4]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r5, #4]
	b	.L14
.L20:
	ldr	ip, .L32+28
	add	r2, r0, r2, lsl #5
	lsl	r0, r2, #1
	orr	r2, r1, #16384
	strh	r0, [ip, #4]	@ movhi
	strh	r3, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	b	.L23
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	mario
	.word	1717986919
	.word	1431655766
	.word	67109120
	.word	level
	.word	checkCollisionMap
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
	.comm	level,4,4
	.global	hammerState
	.global	hammerTimer
	.comm	mario,36,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hammerTimer, %object
	.size	hammerTimer, 4
hammerTimer:
	.space	4
	.type	hammerState, %object
	.size	hammerState, 4
hammerState:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
