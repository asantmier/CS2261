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
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #28]
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"internal: (%d, %d)\000"
	.text
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L36
	ldr	ip, [r3]
	ldr	r1, [r3, #16]
	ldr	r0, [r3, #4]
	add	r1, ip, r1
	ldr	r2, [r3, #20]
	cmp	r1, #0
	add	r2, r0, r2
	movlt	r0, #0
	stm	r3, {r1, r2}
	movlt	r1, r0
	ldr	r4, [r3, #24]
	strlt	r0, [r3]
	add	r0, r1, r4, lsl #6
	cmp	r0, #65536
	rsbgt	r1, r4, #1024
	lslgt	r1, r1, #6
	strgt	r1, [r3]
	cmp	r2, #0
	movlt	r0, #0
	movlt	r2, r0
	ldr	lr, [r3, #28]
	strlt	r0, [r3, #4]
	ldr	r8, .L36+4
	add	r0, r2, lr, lsl #6
	cmp	r0, #65536
	rsbgt	r2, lr, #1024
	ldr	r6, [r8]
	lslgt	r2, r2, #6
	rsb	ip, r6, r1, asr #6
	strgt	r2, [r3, #4]
	cmp	r6, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	ip, #78
	movgt	r0, #0
	ldr	r7, .L36+8
	ldr	r5, [r7]
	cmp	r0, #0
	rsb	r0, r5, r2, asr #6
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	asr	fp, r1, #6
	asr	r9, r2, #6
	bne	.L32
.L11:
	add	r6, r4, ip
	cmp	r6, #159
	bgt	.L33
.L14:
	cmp	r0, #51
	movle	ip, #1
	movgt	ip, #0
	cmp	r5, #0
	movle	ip, #0
	cmp	ip, #0
	bne	.L34
.L17:
	add	ip, lr, r0
	cmp	ip, #105
	ble	.L20
	ldr	r4, [r7]
	cmp	r4, #864
	blt	.L19
.L20:
	ldr	r3, .L36+12
	ldr	r0, .L36+16
	mov	lr, pc
	bx	r3
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	ldr	r10, [r8]
	cmp	r10, #784
	bge	.L14
.L13:
	sub	r6, r6, #159
	add	fp, r6, r10
	cmp	fp, #784
	subgt	fp, fp, #784
	subgt	r6, r6, fp
	rsble	r4, r4, #159
	addgt	r10, r6, r10
	addgt	fp, fp, ip
	strle	r4, [r3, #8]
	strle	fp, [r8]
	strgt	r10, [r8]
	strgt	fp, [r3, #8]
	b	.L14
.L34:
	rsb	ip, r0, #52
	cmp	r5, ip
	bge	.L35
	mov	r4, #0
	sub	r0, r9, ip
	add	ip, lr, r0
	cmp	ip, #105
	str	r0, [r3, #12]
	str	r4, [r7]
	ble	.L20
.L19:
	sub	ip, ip, #105
	add	r5, ip, r4
	cmp	r5, #864
	subgt	r5, r5, #864
	subgt	ip, ip, r5
	rsble	lr, lr, #105
	addgt	ip, ip, r4
	addgt	r5, r5, r0
	strle	lr, [r3, #12]
	strle	r5, [r7]
	strgt	ip, [r7]
	strgt	r5, [r3, #12]
	b	.L20
.L32:
	rsb	ip, ip, #79
	cmp	r6, ip
	blt	.L12
	mov	r10, #79
	sub	r6, r6, ip
	str	r6, [r8]
	mov	ip, r10
	str	r10, [r3, #8]
	b	.L11
.L12:
	mov	r10, #0
	sub	ip, fp, ip
	add	r6, r4, ip
	cmp	r6, #159
	str	ip, [r3, #8]
	str	r10, [r8]
	bgt	.L13
	b	.L14
.L35:
	mov	r0, #52
	sub	r5, r5, ip
	str	r5, [r7]
	str	r0, [r3, #12]
	b	.L17
.L37:
	.align	2
.L36:
	.word	player
	.word	bg2xOff
	.word	bg2yOff
	.word	mgba_printf
	.word	.LC0
	.size	movePlayer, .-movePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r2, .L39
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L39+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L40:
	.align	2
.L39:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	ldr	r1, .L77
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L77+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L42
	tst	r0, #32
	bne	.L43
	ldrh	r1, [r1, #48]
	sub	r2, r2, #200
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L44
.L72:
	sub	r3, r3, #200
	str	r3, [r4, #20]
.L45:
	cmp	r2, #480
	mov	r1, #480
	ldr	r0, .L77+8
	ble	.L64
.L65:
	str	r1, [r4, #16]
.L57:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L59
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L59:
	bl	movePlayer
	mov	r0, #0
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L77+12
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L42:
	tst	r0, #32
	bne	.L46
	ldrh	r1, [r1, #48]
	sub	r2, r2, #100
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L47
.L70:
	sub	r3, r3, #100
	str	r3, [r4, #20]
.L48:
	cmp	r2, #240
	mov	r1, #240
	mvn	r0, #239
	bgt	.L65
.L64:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L57
.L46:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L74
.L61:
	cmp	r2, #0
	subgt	r2, r2, #10
	strgt	r2, [r4, #16]
	ble	.L75
	ldr	r0, .L77
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L76
.L51:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L53
	cmp	r1, #0
	beq	.L73
.L71:
	add	r3, r3, #100
	str	r3, [r4, #20]
	b	.L48
.L43:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L61
	ldrh	r1, [r1, #48]
	add	r2, r2, #200
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L72
.L44:
	ldr	r1, .L77
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L73
	mov	r1, #0
.L53:
	cmp	r3, #0
	subgt	r3, r3, #10
	strgt	r3, [r4, #20]
	bgt	.L56
	addne	r3, r3, #10
	strne	r3, [r4, #20]
.L56:
	cmp	r1, #0
	bne	.L48
	b	.L45
.L74:
	ldrh	r1, [r1, #48]
	add	r2, r2, #100
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L70
.L47:
	ldr	r1, .L77
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L71
	mov	r1, #1
	b	.L53
.L76:
	cmp	r1, #0
	beq	.L72
	b	.L70
.L75:
	ldr	r0, .L77
	ldrh	ip, [r0, #48]
	addne	r2, r2, #10
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L51
	b	.L76
.L73:
	add	r3, r3, #200
	str	r3, [r4, #20]
	b	.L45
.L78:
	.align	2
.L77:
	.word	67109120
	.word	player
	.word	-480
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
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
