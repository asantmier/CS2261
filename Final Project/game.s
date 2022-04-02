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
	mov	r2, #0
	mov	r0, #16
	mov	r1, #8
	ldr	r3, .L3
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	init, .-init
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	init
	.size	initPlayer, .-initPlayer
	.align	2
	.global	movePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	movePlayer, %function
movePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldm	r3, {r1, r2, ip}
	ldr	r0, [r3, #12]
	add	r1, r1, ip
	cmp	r1, #0
	add	r2, r2, r0
	movlt	r0, #0
	stm	r3, {r1, r2}
	movlt	r1, r0
	strlt	r0, [r3]
	ldr	r0, [r3, #16]
	asrge	r1, r1, #6
	add	r1, r0, r1
	cmp	r1, #240
	rsbgt	r0, r0, #240
	lslgt	r0, r0, #6
	strgt	r0, [r3]
	cmp	r2, #0
	movlt	r1, #0
	movlt	r2, r1
	strlt	r1, [r3, #4]
	ldr	r1, [r3, #20]
	asrge	r2, r2, #6
	add	r2, r1, r2
	cmp	r2, #160
	rsbgt	r1, r1, #160
	lslgt	r1, r1, #6
	strgt	r1, [r3, #4]
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.size	movePlayer, .-movePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	ldrh	r2, [r3, #48]
	ldrh	ip, [r3, #48]
	ands	r0, r2, #256
	push	{r4, lr}
	ldr	r4, .L36+4
	moveq	r1, #1
	movne	r1, #0
	tst	ip, #32
	ldr	r2, [r4, #8]
	bne	.L16
	sub	r3, r1, #2
	add	r2, r2, r3
	str	r2, [r4, #8]
.L17:
	ldr	ip, .L36
	ldrh	r3, [ip, #48]
	tst	r3, #64
	ldr	r3, [r4, #12]
	bne	.L20
	sub	r1, r1, #2
	add	r3, r3, r1
	str	r3, [r4, #12]
.L21:
	cmp	r0, #0
	bne	.L35
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L31
.L30:
	cmp	r0, r2
	strgt	r0, [r4, #8]
.L26:
	cmp	r3, r1
	strgt	r1, [r4, #12]
	bgt	.L28
	cmp	r3, r0
	strlt	r0, [r4, #12]
.L28:
	bl	movePlayer
	mov	r0, #0
	ldm	r4, {r1, r3}
	ldr	r2, .L36+8
	asr	r3, r3, #6
	orr	r3, r3, #16384
	asr	r1, r1, #6
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L16:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L18
	rsb	r3, r1, #2
	add	r2, r2, r3
	str	r2, [r4, #8]
	b	.L17
.L35:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L30
.L31:
	str	r1, [r4, #8]
	b	.L26
.L18:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #8]
	bgt	.L17
	addne	r2, r2, #1
	strne	r2, [r4, #8]
	b	.L17
.L20:
	ldrh	ip, [ip, #48]
	tst	ip, #128
	rsbeq	r1, r1, #2
	addeq	r3, r3, r1
	streq	r3, [r4, #12]
	beq	.L21
.L22:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #12]
	bgt	.L21
	addne	r3, r3, #1
	strne	r3, [r4, #12]
	b	.L21
.L37:
	.align	2
.L36:
	.word	67109120
	.word	player
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
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
	b	updatePlayer
	.size	update, .-update
	.comm	player,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
