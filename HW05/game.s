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
	.global	init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #80
	mov	r2, #100
	ldr	r3, .L3
	stm	r3, {r1, r2}
	bx	lr
.L4:
	.align	2
.L3:
	.word	mario
	.size	init, .-init
	.align	2
	.global	initMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMario, %function
initMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	init
	.size	initMario, .-initMario
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	ip, .L26
	ldr	r2, [ip]
	ldr	r3, .L26+4
	cmp	r2, r1
	push	{r4, lr}
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	ble	.L7
	tst	r2, #3
	beq	.L22
.L8:
	sub	r2, r2, #1
	str	r2, [ip]
.L7:
	ldr	r1, [r3, #28]
	ldr	r2, .L26+8
	smull	lr, r0, r2, r1
	asr	r2, r1, #31
	rsb	r2, r2, r0, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r1, r2
	beq	.L9
	ldr	r1, [r3, #32]
	ldr	r2, .L26+12
	add	r1, r1, #1
	smull	r0, r2, r1, r2
	sub	r2, r2, r1, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r1, r2
	str	r2, [r3, #32]
.L9:
	ldr	r4, .L26+16
	ldrh	r2, [r4, #48]
	ands	r0, r2, #32
	ldm	r3, {r1, lr}
	bne	.L10
	mvn	r2, #0
	add	r1, r1, r2
	str	r2, [r3, #8]
	str	r1, [r3]
	str	r0, [r3, #24]
	ldr	r2, [r3, #32]
.L11:
	ldr	r4, [ip]
	cmp	r4, #0
	ble	.L13
.L25:
	ldr	ip, [ip, #4]
	lsl	r2, r2, #16
	cmp	ip, #0
	lsr	r2, r2, #16
	beq	.L23
	cmp	r0, #1
	subne	r1, r1, #16
	mvneq	r1, r1, lsl #17
	mvnne	r1, r1, lsl #17
	mvneq	r1, r1, lsr #17
	mvnne	r1, r1, lsr #17
	lsl	r2, r2, #22
	ldr	ip, .L26+20
	lsr	r2, r2, #16
	orr	lr, lr, #16384
	addeq	r2, r2, #14
	addne	r2, r2, #6
	strh	lr, [ip]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
.L16:
	ldr	r2, [r3, #28]
	add	r2, r2, #1
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L10:
	ldrh	r2, [r4, #48]
	tst	r2, #16
	bne	.L24
	mov	r2, #1
	ldr	r4, [ip]
	add	r1, r1, r2
	cmp	r4, #0
	mov	r0, r2
	str	r2, [r3, #8]
	str	r2, [r3, #24]
	str	r1, [r3]
	ldr	r2, [r3, #32]
	bgt	.L25
.L13:
	add	r2, r0, r2, lsl #5
	ldr	r0, .L26+20
	lsl	r2, r2, #1
	orr	r1, r1, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	lr, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	b	.L16
.L24:
	mov	r2, #0
	ldr	r0, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	b	.L11
.L23:
	lsl	r2, r2, #23
	cmp	r0, #1
	lsr	r2, r2, #16
	ldr	r0, .L26+20
	sub	ip, ip, #32768
	sub	lr, lr, #16
	orr	lr, lr, ip
	orr	r1, r1, ip
	addeq	r2, r2, #12
	addne	r2, r2, #10
	strh	lr, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	b	.L16
.L22:
	ldr	r1, [ip, #4]
	rsbs	r1, r1, #1
	movcc	r1, #0
	str	r1, [ip, #4]
	b	.L8
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	mario
	.word	1717986919
	.word	1431655766
	.word	67109120
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
