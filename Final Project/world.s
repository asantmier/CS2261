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
	.file	"world.c"
	.text
	.align	2
	.global	returnFromBattle
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	returnFromBattle, %function
returnFromBattle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxeq	lr
	str	lr, [sp, #-4]!
	mov	r1, #0
	mov	lr, #512
	ldr	r3, .L11
	ldr	r2, [r3]
	ldr	r3, .L11+4
	add	r2, r2, r2, lsl #1
	add	r3, r3, r2, lsl #4
	ldr	r2, [r3, #36]
	ldr	ip, .L11+8
	ldr	r0, .L11+12
	lsl	r2, r2, #3
	strh	lr, [ip, r2]	@ movhi
	str	r1, [r3, #32]
	str	r1, [r0]
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	opponentIdx
	.word	enemies
	.word	shadowOAM
	.word	.LANCHOR0
	.size	returnFromBattle, .-returnFromBattle
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
	ldr	r3, .L14
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
.L15:
	.align	2
.L14:
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
	ldr	r3, .L20
.L17:
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
	bne	.L17
	bx	lr
.L21:
	.align	2
.L20:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #6
	ldr	r3, .L26
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r3, #4]
	ldr	lr, .L26+4
	ldr	r0, .L26+8
	ldr	r1, .L26+12
	rsb	r2, r3, r3, lsl #4
	ldr	r10, [lr]
	ldr	r9, [r0]
	ldr	r3, .L26+16
	add	r2, r1, r2, lsl #4
.L23:
	ldm	r2, {r0, r1}
	str	r0, [r3]
	rsb	r0, r10, r0, asr #6
	str	ip, [r3, #36]
	ldr	r8, [r2, #16]
	ldr	r7, [r2, #20]
	ldr	r6, [r2, #24]
	ldr	r5, [r2, #28]
	ldr	r4, [r2, #32]
	ldr	lr, [r2, #40]
	str	r0, [r3, #8]
	add	ip, ip, #1
	ldr	r0, [r2, #44]
	str	r1, [r3, #4]
	cmp	ip, #11
	rsb	r1, r9, r1, asr #6
	str	r1, [r3, #12]
	str	r8, [r3, #16]
	str	r7, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	str	lr, [r3, #40]
	str	r0, [r3, #44]
	add	r2, r2, #48
	add	r3, r3, #48
	bne	.L23
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	bg2xOff
	.word	bg2yOff
	.word	.LANCHOR1
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initWorld
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWorld, %function
initWorld:
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
	ldr	r3, .L32
	str	r0, [r3, #4]
	str	r0, [r3]
	ldr	r3, .L32+4
	str	r0, [r3]
	str	r0, [r3, #4]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	ldr	r3, .L32+8
.L29:
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
	bne	.L29
	pop	{r4, r5, r6, lr}
	b	initEnemies
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	player
	.word	bullets
	.size	initWorld, .-initWorld
	.align	2
	.global	doCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	doCollision, %function
doCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #0
	ldr	r4, .L47
	ldr	r6, .L47+4
	ldr	r7, .L47+8
	sub	sp, sp, #20
.L37:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L46
.L35:
	add	r5, r5, #1
	cmp	r5, #5
	add	r4, r4, #48
	bne	.L37
.L34:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L46:
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	lsl	r0, r0, #6
	add	r2, r6, #24
	ldm	r2, {r2, r3}
	ldr	ip, [r4, #4]
	str	r0, [sp, #12]
	ldr	r0, [r4]
	lsl	r1, r1, #6
	stm	sp, {r0, ip}
	str	r1, [sp, #8]
	lsl	r3, r3, #6
	ldm	r6, {r0, r1}
	lsl	r2, r2, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L35
	mov	r1, #1
	ldr	r2, .L47+12
	ldr	r3, .L47+16
	str	r1, [r2]
	str	r5, [r3]
	b	.L34
.L48:
	.align	2
.L47:
	.word	enemies
	.word	player
	.word	collision
	.word	.LANCHOR0
	.word	opponentIdx
	.size	doCollision, .-doCollision
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
	ldr	r3, .L79
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
	ldr	r8, .L79+4
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
	ldr	r6, .L79+8
	ldr	r5, [r6]
	cmp	r0, #0
	rsb	r0, r5, r1, asr #6
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	asr	r2, r2, #6
	asr	r1, r1, #6
	bne	.L75
.L54:
	add	r2, r4, ip
	cmp	r2, #159
	bgt	.L76
.L57:
	cmp	r0, #51
	movle	r2, #1
	movgt	r2, #0
	cmp	r5, #0
	movle	r2, #0
	cmp	r2, #0
	bne	.L77
.L60:
	add	r2, lr, r0
	cmp	r2, #105
	ble	.L49
	ldr	r1, [r6]
	cmp	r1, #864
	blt	.L62
.L49:
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L76:
	ldr	r7, [r8]
	cmp	r7, #784
	bge	.L57
.L56:
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
	b	.L57
.L77:
	rsb	r2, r0, #52
	cmp	r5, r2
	bge	.L78
	mov	ip, #0
	sub	r0, r1, r2
	add	r2, lr, r0
	cmp	r2, #105
	str	r0, [r3, #12]
	str	ip, [r6]
	ble	.L49
	mov	r1, ip
.L62:
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
.L75:
	rsb	r9, ip, #79
	cmp	r7, r9
	blt	.L55
	mov	ip, #79
	sub	r7, r7, r9
	str	r7, [r8]
	str	ip, [r3, #8]
	b	.L54
.L55:
	mov	r7, #0
	sub	ip, r2, r9
	add	r2, r4, ip
	cmp	r2, #159
	str	ip, [r3, #8]
	str	r7, [r8]
	bgt	.L56
	b	.L57
.L78:
	mov	r0, #52
	sub	r5, r5, r2
	str	r5, [r6]
	str	r0, [r3, #12]
	b	.L60
.L80:
	.align	2
.L79:
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
	ldr	r2, .L82
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L82+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L83:
	.align	2
.L82:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
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
	push	{r4, r5, lr}
	ldr	lr, .L93
	ldr	r3, [lr, #32]
	cmp	r3, #1
	moveq	r4, #96
	mvnne	r4, #95
	mov	r3, #0
	ldrne	ip, .L93+4
	ldr	r2, [lr]
	ldreq	r0, [lr, #24]
	ldrne	r0, [ip, #24]
	addeq	r0, r2, r0, lsl #6
	subne	r0, r2, r0, lsl #6
	ldreq	ip, .L93+4
	ldr	r2, .L93+4
.L89:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L92
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L89
	pop	{r4, r5, lr}
	bx	lr
.L92:
	mov	r5, #1
	ldr	lr, [lr, #4]
	add	r3, r3, r3, lsl #2
	str	r0, [ip, r3, lsl #3]
	asr	r2, r0, #6
	add	r3, ip, r3, lsl #3
	asr	r0, lr, #6
	str	r4, [r3, #16]
	str	lr, [r3, #4]
	str	r5, [r3, #32]
	str	r1, [r3, #20]
	str	r0, [r3, #12]
	str	r2, [r3, #8]
	pop	{r4, r5, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	player
	.word	bullets
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
	ldr	r1, .L138
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L138+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L96
	tst	r0, #32
	bne	.L97
	ldrh	r1, [r1, #48]
	sub	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L98
.L132:
	sub	r3, r3, #20
	str	r3, [r4, #20]
.L99:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L121
.L122:
	str	r1, [r4, #16]
.L111:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L113
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L113:
	bl	movePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movgt	r3, #1
	strgt	r3, [r4, #32]
	bgt	.L115
	movne	r3, #0
	strne	r3, [r4, #32]
.L115:
	ldr	r3, .L138+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L116
	ldr	r3, .L138+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L134
.L116:
	mov	r0, #0
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L138+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L96:
	tst	r0, #32
	bne	.L100
	ldrh	r1, [r1, #48]
	sub	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L101
.L130:
	sub	r3, r3, #10
	str	r3, [r4, #20]
.L102:
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L122
.L121:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L111
.L100:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L135
.L118:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #16]
	ble	.L136
	ldr	r0, .L138
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L137
.L105:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L107
	cmp	r1, #0
	beq	.L133
.L131:
	add	r3, r3, #10
	str	r3, [r4, #20]
	b	.L102
.L97:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L118
	ldrh	r1, [r1, #48]
	add	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L132
.L98:
	ldr	r1, .L138
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L133
	mov	r1, #0
.L107:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	bgt	.L110
	addne	r3, r3, #1
	strne	r3, [r4, #20]
.L110:
	cmp	r1, #0
	bne	.L102
	b	.L99
.L135:
	ldrh	r1, [r1, #48]
	add	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L130
.L101:
	ldr	r1, .L138
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L131
	mov	r1, #1
	b	.L107
.L137:
	cmp	r1, #0
	beq	.L132
	b	.L130
.L136:
	ldr	r0, .L138
	ldrh	ip, [r0, #48]
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L105
	b	.L137
.L133:
	add	r3, r3, #20
	str	r3, [r4, #20]
	b	.L99
.L134:
	bl	firePlayer
	b	.L116
.L139:
	.align	2
.L138:
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
	blt	.L141
	ldr	ip, [r0, #24]
	add	r1, r3, ip, lsl #6
	cmp	r1, #65536
	movle	r1, #0
	movgt	r1, #1
	orrs	r1, r1, r2, lsr #31
	beq	.L152
.L141:
	mov	lr, #0
	ldr	ip, .L153
	ldr	r1, .L153+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	rsb	r3, ip, r3, asr #6
	rsb	r2, r1, r2, asr #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	str	lr, [r0, #32]
	ldr	r1, [r0, #36]
.L143:
	mov	r2, #512
	ldr	r3, .L153+8
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
.L140:
	pop	{r4, lr}
	bx	lr
.L152:
	ldr	r4, [r0, #28]
	add	r1, r2, r4, lsl #6
	cmp	r1, #65536
	bgt	.L141
	ldr	lr, .L153
	ldr	r1, .L153+4
	ldr	lr, [lr]
	ldr	r1, [r1]
	rsb	r3, lr, r3, asr #6
	ldr	lr, [r0, #32]
	rsb	r2, r1, r2, asr #6
	cmp	lr, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	ldr	r1, [r0, #36]
	beq	.L143
	add	ip, r3, ip
	cmp	ip, #0
	movgt	ip, #1
	movle	ip, #0
	cmp	r3, #240
	movgt	ip, #0
	cmp	ip, #0
	beq	.L143
	add	r0, r2, r4
	cmp	r0, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	r2, #160
	movgt	r0, #0
	cmp	r0, #0
	beq	.L143
	mov	ip, #520
	ldr	r0, .L153+8
	lsl	r3, r3, #23
	lsl	lr, r1, #3
	lsr	r3, r3, #23
	add	r1, r0, r1, lsl #3
	and	r2, r2, #255
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L140
.L154:
	.align	2
.L153:
	.word	bg2xOff
	.word	bg2yOff
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, [r0]
	ldr	lr, [r0, #16]
	ldr	r2, [r0, #4]
	add	r1, r1, lr
	ldr	r3, .L169
	ldr	lr, [r0, #20]
	ldr	ip, .L169+4
	add	r2, r2, lr
	ldr	r3, [r3]
	ldr	ip, [ip]
	ldr	lr, [r0, #32]
	rsb	r3, r3, r1, asr #6
	rsb	ip, ip, r2, asr #6
	cmp	lr, #0
	stm	r0, {r1, r2, r3, ip}
	ldr	r1, [r0, #36]
	beq	.L156
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r3, #240
	movgt	r2, #0
	cmp	r2, #0
	bne	.L168
.L156:
	mov	r0, #512
	ldr	r2, .L169+8
	lsl	r3, r1, #3
	strh	r0, [r2, r3]	@ movhi
.L155:
	pop	{r4, lr}
	bx	lr
.L168:
	ldr	r2, [r0, #28]
	add	r2, ip, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, #160
	movgt	r2, #0
	cmp	r2, #0
	beq	.L156
	mov	lr, #16
	ldr	r0, .L169+8
	lsl	r2, r3, #23
	and	ip, ip, #255
	add	r3, r0, r1, lsl #3
	orr	ip, ip, #16384
	lsr	r2, r2, #23
	lsl	r4, r1, #3
	strh	ip, [r0, r4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	b	.L155
.L170:
	.align	2
.L169:
	.word	bg2xOff
	.word	bg2yOff
	.word	shadowOAM
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateWorld
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWorld, %function
updateWorld:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L187
	add	r5, r4, #200
.L173:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L185
.L172:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L173
	ldr	r4, .L187+4
	add	r5, r4, #240
.L175:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L186
.L174:
	add	r4, r4, #48
	cmp	r4, r5
	bne	.L175
	pop	{r4, r5, r6, lr}
	b	doCollision
.L186:
	mov	r0, r4
	bl	updateEnemy
	b	.L174
.L185:
	mov	r0, r4
	bl	updateBullet
	b	.L172
.L188:
	.align	2
.L187:
	.word	bullets
	.word	enemies
	.size	updateWorld, .-updateWorld
	.comm	opponentIdx,4,4
	.global	doBattle
	.global	level
	.global	_disable_enemy_
	.comm	enemies,240,4
	.comm	bullets,200,4
	.comm	player,36,4
	.global	levels
	.section	.rodata
	.align	2
	.type	_disable_enemy_, %object
	.size	_disable_enemy_, 48
_disable_enemy_:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	levels, %object
	.size	levels, 240
levels:
	.word	3200
	.word	3200
	.word	50
	.word	50
	.word	0
	.word	0
	.word	16
	.word	8
	.word	1
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	16
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	doBattle, %object
	.size	doBattle, 4
doBattle:
	.space	4
	.type	level, %object
	.size	level, 4
level:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
