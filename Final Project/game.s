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
	push	{r4, r5, r6, lr}
	mov	r0, #0
	mov	r4, #1
	mov	r6, #16
	mov	r5, #8
	mov	r1, r0
	mov	r2, r0
	mov	lr, r4
	mov	ip, #2
	ldr	r3, .L6
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	ldr	r3, .L6+4
.L2:
	add	r1, r1, #1
	cmp	r1, #5
	str	r1, [r3, #36]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #24]
	str	lr, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #40
	bne	.L2
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	player
	.word	bullets
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
	mov	r2, #0
	mov	ip, #16
	mov	r0, #8
	mov	r1, #1
	ldr	r3, .L9
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
	bx	lr
.L10:
	.align	2
.L9:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	mov	ip, #2
	mov	r2, r1
	mov	r0, #1
	ldr	r3, .L15
.L12:
	add	r1, r1, #1
	cmp	r1, #5
	str	r1, [r3, #36]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #40
	bne	.L12
	bx	lr
.L16:
	.align	2
.L15:
	.word	bullets
	.size	initBullets, .-initBullets
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
	ldr	r3, .L47
	ldr	ip, [r3]
	ldr	r2, [r3, #16]
	ldr	r0, [r3, #4]
	add	r2, ip, r2
	ldr	r1, [r3, #20]
	cmp	r2, #0
	add	r1, r0, r1
	movlt	r0, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	str	r2, [r3]
	movlt	r2, r0
	ldr	r4, [r3, #24]
	strlt	r0, [r3]
	add	r0, r2, r4, lsl #6
	cmp	r0, #65536
	rsbgt	r2, r4, #1024
	lslgt	r2, r2, #6
	strgt	r2, [r3]
	cmp	r1, #0
	movlt	r0, #0
	str	r1, [r3, #4]
	movlt	r1, r0
	ldr	lr, [r3, #28]
	strlt	r0, [r3, #4]
	ldr	r8, .L47+4
	add	r0, r1, lr, lsl #6
	cmp	r0, #65536
	rsbgt	r1, lr, #1024
	ldr	r7, [r8]
	lslgt	r1, r1, #6
	rsb	ip, r7, r2, asr #6
	strgt	r1, [r3, #4]
	cmp	r7, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	ip, #78
	movgt	r0, #0
	ldr	r6, .L47+8
	ldr	r5, [r6]
	cmp	r0, #0
	rsb	r0, r5, r1, asr #6
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	asr	r2, r2, #6
	asr	r1, r1, #6
	bne	.L43
.L22:
	add	r2, r4, ip
	cmp	r2, #159
	bgt	.L44
.L25:
	cmp	r0, #51
	movle	r2, #1
	movgt	r2, #0
	cmp	r5, #0
	movle	r2, #0
	cmp	r2, #0
	bne	.L45
.L28:
	add	r2, lr, r0
	cmp	r2, #105
	ble	.L17
	ldr	r1, [r6]
	cmp	r1, #864
	blt	.L30
.L17:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L44:
	ldr	r7, [r8]
	cmp	r7, #784
	bge	.L25
.L24:
	sub	r2, r2, #159
	add	r9, r2, r7
	cmp	r9, #784
	subgt	r9, r9, #784
	subgt	r2, r2, r9
	rsble	r4, r4, #159
	addgt	r2, r2, r7
	addgt	r9, r9, ip
	strle	r4, [r3, #8]
	strle	r9, [r8]
	strgt	r2, [r8]
	strgt	r9, [r3, #8]
	b	.L25
.L45:
	rsb	r2, r0, #52
	cmp	r5, r2
	bge	.L46
	mov	ip, #0
	sub	r0, r1, r2
	add	r2, lr, r0
	cmp	r2, #105
	str	r0, [r3, #12]
	str	ip, [r6]
	ble	.L17
	mov	r1, ip
.L30:
	sub	r2, r2, #105
	add	ip, r2, r1
	cmp	ip, #864
	subgt	ip, ip, #864
	subgt	r2, r2, ip
	rsble	lr, lr, #105
	addgt	r2, r2, r1
	addgt	ip, ip, r0
	strle	lr, [r3, #12]
	strle	ip, [r6]
	strgt	r2, [r6]
	strgt	ip, [r3, #12]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L43:
	rsb	r9, ip, #79
	cmp	r7, r9
	blt	.L23
	mov	ip, #79
	sub	r7, r7, r9
	str	r7, [r8]
	str	ip, [r3, #8]
	b	.L22
.L23:
	mov	r7, #0
	sub	ip, r2, r9
	add	r2, r4, ip
	cmp	r2, #159
	str	ip, [r3, #8]
	str	r7, [r8]
	bgt	.L24
	b	.L25
.L46:
	mov	r0, #52
	sub	r5, r5, r2
	str	r5, [r6]
	str	r0, [r3, #12]
	b	.L28
.L48:
	.align	2
.L47:
	.word	player
	.word	bg2xOff
	.word	bg2yOff
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
	ldr	r2, .L50
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L50+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"dx: %d, startx: %d, starty: %d\000"
	.text
	.align	2
	.global	firePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayer, %function
firePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L61
	ldr	r3, [r4, #32]
	cmp	r3, #1
	moveq	r1, #96
	mvnne	r1, #95
	mov	r0, #0
	ldrne	lr, .L61+4
	ldr	r2, [r4]
	ldreq	r3, [r4, #24]
	ldrne	r3, [lr, #24]
	addeq	r2, r2, r3, lsl #6
	subne	r2, r2, r3, lsl #6
	ldreq	lr, .L61+4
	ldr	r3, .L61+4
.L57:
	ldr	ip, [r3, #32]
	cmp	ip, #0
	beq	.L60
	add	r0, r0, #1
	cmp	r0, #5
	add	r3, r3, #40
	bne	.L57
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	mov	r5, #1
	ldr	r3, [r4, #4]
	add	r0, r0, r0, lsl #2
	str	r2, [lr, r0, lsl #3]
	add	lr, lr, r0, lsl #3
	str	ip, [lr, #20]
	asr	r4, r2, #6
	asr	ip, r3, #6
	str	r4, [lr, #8]
	str	r1, [lr, #16]
	str	r3, [lr, #4]
	str	r5, [lr, #32]
	ldr	r4, .L61+8
	str	ip, [lr, #12]
	ldr	r0, .L61+12
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	player
	.word	bullets
	.word	mgba_printf
	.word	.LC0
	.size	firePlayer, .-firePlayer
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
	ldr	r1, .L106
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L106+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L64
	tst	r0, #32
	bne	.L65
	ldrh	r1, [r1, #48]
	sub	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L66
.L100:
	sub	r3, r3, #20
	str	r3, [r4, #20]
.L67:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L89
.L90:
	str	r1, [r4, #16]
.L79:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L81
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L81:
	bl	movePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movgt	r3, #1
	strgt	r3, [r4, #32]
	bgt	.L83
	movne	r3, #0
	strne	r3, [r4, #32]
.L83:
	ldr	r3, .L106+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L84
	ldr	r3, .L106+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L102
.L84:
	mov	r0, #0
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L106+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L64:
	tst	r0, #32
	bne	.L68
	ldrh	r1, [r1, #48]
	sub	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L69
.L98:
	sub	r3, r3, #10
	str	r3, [r4, #20]
.L70:
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L90
.L89:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L79
.L68:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L103
.L86:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #16]
	ble	.L104
	ldr	r0, .L106
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L105
.L73:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L75
	cmp	r1, #0
	beq	.L101
.L99:
	add	r3, r3, #10
	str	r3, [r4, #20]
	b	.L70
.L65:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L86
	ldrh	r1, [r1, #48]
	add	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L100
.L66:
	ldr	r1, .L106
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L101
	mov	r1, #0
.L75:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	bgt	.L78
	addne	r3, r3, #1
	strne	r3, [r4, #20]
.L78:
	cmp	r1, #0
	bne	.L70
	b	.L67
.L103:
	ldrh	r1, [r1, #48]
	add	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L98
.L69:
	ldr	r1, .L106
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L99
	mov	r1, #1
	b	.L75
.L105:
	cmp	r1, #0
	beq	.L100
	b	.L98
.L104:
	ldr	r0, .L106
	ldrh	ip, [r0, #48]
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L73
	b	.L105
.L101:
	add	r3, r3, #20
	str	r3, [r4, #20]
	b	.L67
.L102:
	bl	firePlayer
	b	.L84
.L107:
	.align	2
.L106:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0]
	ldr	r3, [r0, #16]
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #20]
	add	r3, ip, r3
	add	r2, r1, r2
	cmp	r3, #0
	push	{r4, lr}
	str	r3, [r0]
	str	r2, [r0, #4]
	blt	.L109
	ldr	ip, [r0, #24]
	add	r1, r3, ip, lsl #6
	cmp	r1, #65536
	movle	r1, #0
	movgt	r1, #1
	orrs	r1, r1, r2, lsr #31
	beq	.L120
.L109:
	mov	lr, #0
	ldr	ip, .L121
	ldr	r1, .L121+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	rsb	r3, ip, r3, asr #6
	rsb	r2, r1, r2, asr #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	str	lr, [r0, #32]
	ldr	r1, [r0, #36]
.L111:
	mov	r2, #512
	ldr	r3, .L121+8
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
.L108:
	pop	{r4, lr}
	bx	lr
.L120:
	ldr	r4, [r0, #28]
	add	r1, r2, r4, lsl #6
	cmp	r1, #65536
	bgt	.L109
	ldr	lr, .L121
	ldr	r1, .L121+4
	ldr	lr, [lr]
	ldr	r1, [r1]
	rsb	r3, lr, r3, asr #6
	ldr	lr, [r0, #32]
	rsb	r2, r1, r2, asr #6
	cmp	lr, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	ldr	r1, [r0, #36]
	beq	.L111
	add	ip, r3, ip
	cmp	ip, #0
	movgt	ip, #1
	movle	ip, #0
	cmp	r3, #240
	movgt	ip, #0
	cmp	ip, #0
	beq	.L111
	add	r0, r2, r4
	cmp	r0, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	r2, #160
	movgt	r0, #0
	cmp	r0, #0
	beq	.L111
	mov	ip, #520
	ldr	r0, .L121+8
	lsl	r3, r3, #23
	lsl	lr, r1, #3
	lsr	r3, r3, #23
	add	r1, r0, r1, lsl #3
	and	r2, r2, #255
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L108
.L122:
	.align	2
.L121:
	.word	bg2xOff
	.word	bg2yOff
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L132
	add	r5, r4, #200
.L125:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L131
.L124:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L125
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	mov	r0, r4
	bl	updateBullet
	b	.L124
.L133:
	.align	2
.L132:
	.word	bullets
	.size	update, .-update
	.comm	bullets,200,4
	.comm	player,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
