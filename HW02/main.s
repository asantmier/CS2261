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
	.file	"main.c"
	.text
	.align	2
	.global	updateStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStage, %function
updateStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	ldr	r3, .L8
	ldr	r2, .L8+4
	str	lr, [sp, #-4]!
	ldr	r1, [r2]
	ldr	lr, [r3, #24]
	ldr	r2, .L8+8
	ldr	r0, [r3, #28]
	str	lr, [r2, #24]
	str	r0, [r2, #28]
	ldr	lr, [r3, #8]
	ldr	r0, [r3, #12]
	str	lr, [r2, #8]
	str	r0, [r2, #12]
	ldr	lr, [r3]
	ldr	r0, [r3, #4]
	str	lr, [r2]
	str	r0, [r2, #4]
	ldr	lr, [r3, #32]
	ldr	r0, .L8+12
	cmp	r1, #2
	str	lr, [r2, #32]
	str	ip, [r0]
	beq	.L2
	cmp	r1, #3
	beq	.L3
	cmp	r1, ip
	beq	.L7
	ldr	lr, [sp], #4
	bx	lr
.L2:
	mov	ip, #18
	mov	r0, #26
	mov	r1, #142
	ldr	r2, .L8+16
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L7:
	mov	ip, #15
	mov	r0, #19
	mov	r1, #145
	ldr	r2, .L8+20
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L3:
	mov	ip, #24
	mov	r0, #30
	mov	r1, #136
	ldr	r2, .L8+24
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3]
	str	r2, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	stage
	.word	oldPlayer
	.word	eraseOldPlayer
	.word	tama2Sprite
	.word	tama1Sprite
	.word	tama3Sprite
	.size	updateStage, .-updateStage
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, lr}
	mov	r4, #0
	ldr	r2, .L19
	ldr	r0, .L19+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	mvn	r1, #32768
	ldr	r3, .L19+12
	str	r4, [r3]
	ldr	r3, .L19+16
	ldr	r2, .L19+20
	ldrh	ip, [r3, #48]
	ldr	r0, .L19+24
	ldr	r3, .L19+28
	str	r4, [r2]
	ldr	r2, .L19+32
	strh	ip, [r3]	@ movhi
	strh	r4, [r0]	@ movhi
	ldr	r3, .L19+36
	ldr	r0, .L19+40
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r1, .L19+44
	ldr	r2, .L19+48
	str	r3, [r1]
	str	r3, [r2]
	bl	updateStage
	mov	ip, #2
	ldr	r2, .L19+52
	ldr	r1, .L19+56
	ldr	r3, [r2, #28]
	ldr	lr, .L19+60
	ldr	r0, [r1]
	add	r3, r3, r3, lsr #31
	str	r4, [lr]
	asr	r3, r3, #1
	ldr	lr, [r2]
	rsb	r3, r3, #120
	cmp	r0, r4
	stmib	r2, {r3, lr}
	str	r3, [r2, #12]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	ble	.L11
	ldr	r3, .L19+64
	cmp	r0, #1
	str	r3, [r1, #4]
	beq	.L11
	cmp	r0, ip
	str	r3, [r1, #40]
	strne	r3, [r1, #76]
.L11:
	mov	r3, #0
	ldr	r1, .L19+68
	ldr	r2, .L19+72
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	1027
	.word	368566
	.word	srand
	.word	spikeTimer
	.word	67109120
	.word	foodTimer
	.word	oldButtons
	.word	buttons
	.word	bgColor
	.word	fillScreen
	.word	32767
	.word	stage
	.word	alive
	.word	player
	.word	.LANCHOR0
	.word	eraseOldPlayer
	.word	1159
	.word	foodActive
	.word	eraseOldFood
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L57
	ldr	r5, .L57+4
	ldr	r3, [r6]
	ldr	r1, [r5]
	add	r3, r3, #1
	cmp	r3, #480
	movle	r2, #0
	movgt	r2, #1
	cmp	r1, #0
	movne	r2, #0
	cmp	r2, #0
	ldr	r7, .L57+8
	str	r3, [r6]
	sub	sp, sp, #20
	bne	.L54
.L22:
	ldr	r8, .L57+12
	ldr	r3, [r8]
	add	r3, r3, #1
	cmp	r3, #60
	str	r3, [r8]
	ldr	r0, [r7]
	ble	.L24
	cmp	r0, #0
	movgt	r3, #0
	ldrgt	r2, .L57+16
	bgt	.L31
.L30:
	ldr	r3, .L57+20
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L27
	ldr	r2, .L57+24
	ldr	r3, [r2, #4]
	ldr	r1, [r2, #20]
	sub	r3, r3, r1
	bic	r3, r3, r3, asr #31
	str	r3, [r2, #4]
.L27:
	ldr	r3, .L57+20
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L33
	ldr	r2, .L57+24
	ldr	r3, [r2, #4]
	ldr	r0, [r2, #20]
	ldr	r1, [r2, #28]
	add	r3, r3, r0
	add	r0, r1, r3
	cmp	r0, #240
	rsbgt	r3, r1, #240
	str	r3, [r2, #4]
.L33:
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L56
.L36:
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L21
	mov	r5, #0
	ldr	r4, .L57+16
	ldr	r6, .L57+24
	ldr	r8, .L57+28
	b	.L41
.L40:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #36
	ble	.L21
.L41:
	ldr	r3, [r4]
	cmp	r3, #159
	add	r5, r5, #1
	bgt	.L40
	add	r0, r4, #24
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #4]
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r3, [r6, #24]
	ldr	r2, [r6, #28]
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L40
	mov	r2, #0
	ldr	r3, .L57+32
	str	r2, [r3]
.L21:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L28:
	add	r3, r3, #1
	cmp	r0, r3
	add	r2, r2, #36
	beq	.L29
.L31:
	ldr	r1, [r2]
	cmp	r1, #160
	ble	.L28
	mov	r9, #0
	add	r3, r3, r3, lsl #3
	add	r4, r7, r3, lsl #2
	str	r9, [r4, #4]
	ldr	r3, .L57+36
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #32]
	ldr	r3, .L57+40
	rsb	r1, r1, #240
	mov	lr, pc
	bx	r3
	str	r9, [r8]
	str	r1, [r4, #8]
	ldr	r0, [r7]
.L24:
	cmp	r0, #0
	ble	.L30
.L29:
	mov	r1, #0
	ldr	r3, .L57+44
.L32:
	ldr	r2, [r3, #-16]
	ldr	ip, [r3]
	add	r1, r1, #1
	add	r2, r2, ip
	cmp	r0, r1
	str	r2, [r3, #-16]
	add	r3, r3, #36
	bgt	.L32
	b	.L30
.L56:
	add	r4, r7, #136
	ldm	r4, {r4, ip}
	ldr	r0, .L57+24
	ldr	lr, [r7, #112]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	ip, [sp, #8]
	ldr	ip, [r7, #116]
	str	r4, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r4, .L57+28
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	beq	.L36
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L57+48
	ldr	r3, [r1]
	add	r3, r3, r0
	str	r3, [r1]
	ldr	r3, .L57+52
	str	r2, [r5]
	str	r2, [r6]
	str	r0, [r3]
	bl	updateStage
	b	.L36
.L54:
	ldr	r3, [r7, #136]
	ldr	r2, .L57+36
	rsb	r3, r3, #160
	ldr	r4, .L57+24
	str	r3, [r7, #112]
	mov	lr, pc
	bx	r2
	ldr	r1, [r7, #140]
	ldr	r8, [r4, #28]
	rsb	r1, r1, #240
	ldr	r3, .L57+40
	sub	r1, r1, r8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	cmp	r3, r1
	mov	r3, #1
	addlt	r1, r1, r8
	str	r1, [r7, #116]
	str	r3, [r5]
	b	.L22
.L58:
	.align	2
.L57:
	.word	foodTimer
	.word	foodActive
	.word	.LANCHOR0
	.word	spikeTimer
	.word	.LANCHOR0+4
	.word	67109120
	.word	player
	.word	collision
	.word	alive
	.word	rand
	.word	__aeabi_idivmod
	.word	.LANCHOR0+20
	.word	stage
	.word	eraseOldFood
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L84
	ldr	r3, [r4]
	ldr	r7, .L84+4
	cmp	r3, #0
	ldrh	r1, [r7]
	beq	.L60
	ldr	r0, .L84+8
	ldr	r9, .L84+12
	mov	lr, pc
	bx	r9
	mov	r3, #0
	str	r3, [r4]
	ldr	r4, .L84+16
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L79
.L62:
	ldr	r5, .L84+20
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L80
.L63:
	mov	r6, #0
	ldr	r8, .L84+24
	add	r4, r5, #4
.L68:
	ldr	r3, [r4, #8]
	cmp	r3, #159
	add	r6, r6, #1
	ble	.L81
.L66:
	ldr	r3, [r4]
	cmp	r3, #159
	ble	.L82
.L67:
	ldr	r3, [r5]
	cmp	r3, r6
	add	r4, r4, #36
	bgt	.L68
	ldr	r3, .L84+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L83
.L65:
	ldr	r4, .L84+32
	mov	r0, r4
	mov	lr, pc
	bx	r8
	ldr	r3, [r4]
	ldr	ip, [r5]
	ldr	r1, [r4, #4]
	ldr	r2, [r5, #112]
	str	r3, [r4, #8]
	ldr	r3, [r5, #116]
	cmp	ip, #0
	str	r1, [r4, #12]
	str	r2, [r5, #120]
	str	r3, [r5, #124]
	ble	.L59
	mov	r2, #0
	ldr	r3, .L84+36
.L71:
	ldm	r3, {r0, r1}
	add	r2, r2, #1
	cmp	r2, ip
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	add	r3, r3, #36
	bne	.L71
.L59:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L82:
	mov	r0, r4
	mov	lr, pc
	bx	r8
	b	.L67
.L81:
	mov	r0, r4
	ldrh	r1, [r7]
	mov	lr, pc
	bx	r9
	b	.L66
.L60:
	ldr	r4, .L84+16
	ldr	r0, .L84+32
	ldr	r9, .L84+12
	mov	lr, pc
	bx	r9
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L62
.L79:
	ldr	r3, .L84+40
	ldrh	r1, [r7]
	ldr	r0, .L84+44
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r5, .L84+20
	str	r3, [r4]
	ldr	r3, [r5]
	cmp	r3, #0
	bgt	.L63
.L80:
	ldr	r3, .L84+28
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r8, .L84+24
	beq	.L65
.L83:
	ldr	r0, .L84+44
	mov	lr, pc
	bx	r8
	b	.L65
.L85:
	.align	2
.L84:
	.word	eraseOldPlayer
	.word	bgColor
	.word	oldPlayer
	.word	eraseMovingSprite
	.word	eraseOldFood
	.word	.LANCHOR0
	.word	drawSprite
	.word	foodActive
	.word	player
	.word	.LANCHOR0+4
	.word	eraseFullSprite
	.word	.LANCHOR0+112
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L105
	ldr	r6, .L105+4
	ldr	r7, .L105+8
	ldr	r5, .L105+12
	ldr	r10, .L105+16
	ldr	r9, .L105+20
	ldr	r8, .L105+24
.L94:
	mov	lr, pc
	bx	fp
	ldr	r3, [r6]
	cmp	r3, #0
	beq	.L94
	mov	r4, #0
.L93:
	ldrh	r3, [r5]
	strh	r3, [r7]	@ movhi
	ldr	r2, [r10]
	ldrh	r3, [r8, #48]
	cmp	r2, #3
	strh	r3, [r5]	@ movhi
	bgt	.L88
	ldr	r3, .L105+28
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r9
	ldr	r3, .L105+32
	mov	lr, pc
	bx	r3
.L89:
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L93
	b	.L94
.L88:
	mov	lr, pc
	bx	r9
	add	r4, r4, #1
	ldr	r0, .L105+36
	ldr	r3, .L105+40
	mov	lr, pc
	bx	r3
	cmp	r4, #30
	beq	.L103
	cmp	r4, #60
	beq	.L104
.L91:
	ldrh	r3, [r7]
	tst	r3, #8
	beq	.L89
	ldrh	r3, [r5]
	ands	r3, r3, #8
	bne	.L89
	str	r3, [r6]
	b	.L94
.L103:
	ldr	r0, .L105+44
	ldr	r3, .L105+40
	mov	lr, pc
	bx	r3
	b	.L91
.L104:
	ldr	r3, .L105+48
	ldr	r0, .L105+44
	ldrh	r1, [r3]
	ldr	r3, .L105+52
	mov	lr, pc
	bx	r3
	mov	r4, #0
	b	.L91
.L106:
	.align	2
.L105:
	.word	initialize
	.word	alive
	.word	oldButtons
	.word	buttons
	.word	stage
	.word	waitForVBlank
	.word	67109120
	.word	update
	.word	draw
	.word	.LANCHOR0+148
	.word	drawSprite
	.word	.LANCHOR0+184
	.word	bgColor
	.word	eraseFullSprite
	.size	main, .-main
	.global	restart
	.global	victory
	.global	SPIKE_TIME
	.comm	spikeTimer,4,4
	.global	numSpikes
	.global	spikes
	.comm	eraseOldFood,4,4
	.comm	foodActive,4,4
	.comm	foodTimer,4,4
	.global	DROP_TIME
	.global	food
	.comm	alive,4,4
	.comm	eraseOldPlayer,4,4
	.comm	oldPlayer,36,4
	.comm	stage,4,4
	.comm	player,36,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.section	.rodata
	.align	2
	.type	SPIKE_TIME, %object
	.size	SPIKE_TIME, 4
SPIKE_TIME:
	.word	60
	.type	DROP_TIME, %object
	.size	DROP_TIME, 4
DROP_TIME:
	.word	480
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	numSpikes, %object
	.size	numSpikes, 4
numSpikes:
	.word	3
	.type	spikes, %object
	.size	spikes, 108
spikes:
	.word	1159
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	23
	.word	23
	.word	spikeSprite
	.word	1159
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	23
	.word	23
	.word	spikeSprite
	.word	1159
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	23
	.word	23
	.word	spikeSprite
	.type	food, %object
	.size	food, 36
food:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	13
	.word	foodSprite
	.type	victory, %object
	.size	victory, 36
victory:
	.word	73
	.word	25
	.word	0
	.word	0
	.word	0
	.word	0
	.word	14
	.word	191
	.word	congratSprite
	.type	restart, %object
	.size	restart, 36
restart:
	.word	10
	.word	34
	.word	0
	.word	0
	.word	0
	.word	0
	.word	9
	.word	172
	.word	restartSprite
	.ident	"GCC: (devkitARM release 53) 9.1.0"
