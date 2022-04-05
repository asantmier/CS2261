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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L92
	ldr	r8, [r4, #16]
	ldr	r3, [r4]
	add	r7, r4, #20
	adds	r2, r3, r8
	movmi	r2, #0
	ldm	r7, {r7, ip}
	sub	sp, sp, #8
	rsbmi	r8, r3, #0
	bmi	.L51
	add	r1, r2, ip, lsl #6
	cmp	r1, #65536
	subgt	r1, r1, #65536
	subgt	r8, r8, r1
	addgt	r2, r3, r8
	asr	r2, r2, #6
.L51:
	ldr	r1, [r4, #4]
	adds	r3, r1, r7
	movmi	r3, #0
	ldr	r0, [r4, #28]
	rsbmi	r7, r1, #0
	bmi	.L54
	add	lr, r1, r0, lsl #6
	cmp	lr, #65536
	lsl	lr, r0, #6
	addgt	r3, r3, lr
	subgt	r3, r3, #65536
	subgt	r7, r7, r3
	addgt	r3, r1, r7
	asr	r3, r3, #6
.L54:
	ldr	r10, .L92+4
	str	r0, [sp, #4]
	mov	r1, #1024
	str	ip, [sp]
	ldr	r0, [r10, #240]
	ldr	r9, .L92+8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bgt	.L86
	ldr	r3, [r4]
	eor	r6, r8, r8, asr #31
	sub	r6, r6, r8, asr #31
	add	r8, r8, r3
	ldr	r3, [r4, #4]
	add	r3, r7, r3
	eor	r5, r7, r7, asr #31
	str	r8, [r4]
	str	r3, [r4, #4]
	sub	r5, r5, r7, asr #31
.L60:
	ldr	r2, [r4, #16]
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r2, r6
	movgt	r2, #0
	strgt	r2, [r4, #16]
	ldr	r2, [r4, #20]
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r2, r5
	movgt	r2, #0
	ldr	r5, .L92+12
	ldr	r0, [r5]
	strgt	r2, [r4, #20]
	rsb	r1, r0, r8, asr #6
	cmp	r0, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, #78
	movgt	r2, #0
	ldr	lr, .L92+16
	ldr	ip, [lr]
	cmp	r2, #0
	rsb	r2, ip, r3, asr #6
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	ldr	r6, [r4, #24]
	asr	r8, r8, #6
	asr	r3, r3, #6
	bne	.L87
.L63:
	add	r0, r1, r6
	cmp	r0, #159
	bgt	.L88
.L66:
	cmp	r2, #51
	movle	r1, #1
	movgt	r1, #0
	cmp	ip, #0
	movle	r1, #0
	cmp	r1, #0
	ldr	r1, [r4, #28]
	bne	.L89
.L69:
	add	r3, r2, r1
	cmp	r3, #105
	ble	.L49
	ldr	r0, [lr]
	cmp	r0, #864
	blt	.L71
.L49:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L88:
	ldr	r7, [r5]
	cmp	r7, #784
	bge	.L66
.L65:
	sub	r0, r0, #159
	add	r8, r0, r7
	cmp	r8, #784
	subgt	r8, r8, #784
	subgt	r0, r0, r8
	rsble	r6, r6, #159
	addgt	r0, r0, r7
	addgt	r8, r8, r1
	strle	r6, [r4, #8]
	strle	r8, [r5]
	strgt	r0, [r5]
	strgt	r8, [r4, #8]
	b	.L66
.L89:
	rsb	r5, r2, #52
	cmp	ip, r5
	bge	.L90
	mov	r0, #0
	sub	r2, r3, r5
	add	r3, r2, r1
	cmp	r3, #105
	str	r2, [r4, #12]
	str	r0, [lr]
	ble	.L49
.L71:
	sub	r3, r3, #105
	add	ip, r3, r0
	cmp	ip, #864
	subgt	ip, ip, #864
	subgt	r3, r3, ip
	rsble	r1, r1, #105
	addgt	r3, r3, r0
	addgt	ip, ip, r2
	strle	r1, [r4, #12]
	strle	ip, [lr]
	strgt	r3, [lr]
	strgt	ip, [r4, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L86:
	add	r6, r8, r8, lsl #1
	add	r5, r7, r7, lsl #1
	add	r2, r6, #3
	cmp	r6, #0
	movlt	r6, r2
	add	r3, r5, #3
	cmp	r5, #0
	movlt	r5, r3
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	add	r2, r2, r6, asr #2
	add	r3, r3, r5, asr #2
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [r10, #240]
	mov	r1, #1024
	asr	r2, r2, #6
	asr	r3, r3, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r6, r6, #2
	asr	r5, r5, #2
	bgt	.L91
.L57:
	ldr	r8, [r4]
	ldr	r3, [r4, #4]
	add	r8, r6, r8
	add	r3, r5, r3
	cmp	r6, #0
	bic	r8, r8, #63
	bic	r3, r3, #63
	rsblt	r6, r6, #0
	cmp	r5, #0
	str	r8, [r4]
	str	r3, [r4, #4]
	rsblt	r5, r5, #0
	b	.L60
.L87:
	rsb	r9, r1, #79
	cmp	r0, r9
	blt	.L64
	mov	r1, #79
	sub	r0, r0, r9
	str	r0, [r5]
	str	r1, [r4, #8]
	b	.L63
.L64:
	mov	r7, #0
	sub	r1, r8, r9
	add	r0, r1, r6
	cmp	r0, #159
	str	r1, [r4, #8]
	str	r7, [r5]
	bgt	.L65
	b	.L66
.L90:
	mov	r2, #52
	sub	r3, ip, r5
	str	r3, [lr]
	str	r2, [r4, #12]
	b	.L69
.L91:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	add	r5, r7, r7, lsr #31
	add	r6, r8, r8, lsr #31
	add	r3, r3, r5, asr #1
	add	r2, r2, r6, asr #1
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [r10, #240]
	mov	r1, #1024
	asr	r3, r3, #6
	asr	r2, r2, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r5, r5, #1
	asr	r6, r6, #1
	ble	.L57
	add	r6, r8, #3
	cmp	r8, #0
	movlt	r8, r6
	add	r3, r7, #3
	cmp	r7, #0
	movlt	r7, r3
	add	r1, r4, #24
	ldm	r4, {r2, r3}
	ldm	r1, {r1, ip}
	add	r3, r3, r7, asr #2
	add	r2, r2, r8, asr #2
	stm	sp, {r1, ip}
	ldr	r0, [r10, #240]
	mov	r1, #1024
	asr	r2, r2, #6
	asr	r3, r3, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r6, r8, #2
	asr	r7, r7, #2
	ble	.L59
	mov	r5, #0
	ldr	r8, [r4]
	mov	r6, r5
	ldr	r3, [r4, #4]
	b	.L60
.L59:
	ldr	r8, [r4]
	ldr	r3, [r4, #4]
	add	r8, r6, r8
	add	r3, r7, r3
	bic	r8, r8, #63
	bic	r3, r3, #63
	cmp	r6, #0
	eor	r5, r7, r7, asr #31
	str	r8, [r4]
	str	r3, [r4, #4]
	rsblt	r6, r6, #0
	sub	r5, r5, r7, asr #31
	b	.L60
.L93:
	.align	2
.L92:
	.word	player
	.word	.LANCHOR1
	.word	collisionCheck
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
	ldr	r2, .L95
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L95+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L96:
	.align	2
.L95:
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
	ldr	lr, .L106
	ldr	r3, [lr, #32]
	cmp	r3, #1
	moveq	r4, #96
	mvnne	r4, #95
	mov	r3, #0
	ldrne	ip, .L106+4
	ldr	r2, [lr]
	ldreq	r0, [lr, #24]
	ldrne	r0, [ip, #24]
	addeq	r0, r2, r0, lsl #6
	subne	r0, r2, r0, lsl #6
	ldreq	ip, .L106+4
	ldr	r2, .L106+4
.L102:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L105
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L102
	pop	{r4, r5, lr}
	bx	lr
.L105:
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
.L107:
	.align	2
.L106:
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
	ldr	r1, .L151
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L151+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L109
	tst	r0, #32
	bne	.L110
	ldrh	r1, [r1, #48]
	sub	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L111
.L145:
	sub	r3, r3, #20
	str	r3, [r4, #20]
.L112:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L134
.L135:
	str	r1, [r4, #16]
.L124:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L126
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L126:
	bl	movePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movgt	r3, #1
	strgt	r3, [r4, #32]
	bgt	.L128
	movne	r3, #0
	strne	r3, [r4, #32]
.L128:
	ldr	r3, .L151+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L129
	ldr	r3, .L151+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L147
.L129:
	mov	r0, #0
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L151+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L109:
	tst	r0, #32
	bne	.L113
	ldrh	r1, [r1, #48]
	sub	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L114
.L143:
	sub	r3, r3, #10
	str	r3, [r4, #20]
.L115:
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L135
.L134:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L124
.L113:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L148
.L131:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #16]
	ble	.L149
	ldr	r0, .L151
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L150
.L118:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L120
	cmp	r1, #0
	beq	.L146
.L144:
	add	r3, r3, #10
	str	r3, [r4, #20]
	b	.L115
.L110:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L131
	ldrh	r1, [r1, #48]
	add	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L145
.L111:
	ldr	r1, .L151
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L146
	mov	r1, #0
.L120:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	bgt	.L123
	addne	r3, r3, #1
	strne	r3, [r4, #20]
.L123:
	cmp	r1, #0
	bne	.L115
	b	.L112
.L148:
	ldrh	r1, [r1, #48]
	add	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L143
.L114:
	ldr	r1, .L151
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L144
	mov	r1, #1
	b	.L120
.L150:
	cmp	r1, #0
	beq	.L145
	b	.L143
.L149:
	ldr	r0, .L151
	ldrh	ip, [r0, #48]
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L118
	b	.L150
.L146:
	add	r3, r3, #20
	str	r3, [r4, #20]
	b	.L112
.L147:
	bl	firePlayer
	b	.L129
.L152:
	.align	2
.L151:
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
	blt	.L154
	ldr	ip, [r0, #24]
	add	r1, r3, ip, lsl #6
	cmp	r1, #65536
	movle	r1, #0
	movgt	r1, #1
	orrs	r1, r1, r2, lsr #31
	beq	.L165
.L154:
	mov	lr, #0
	ldr	ip, .L166
	ldr	r1, .L166+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	rsb	r3, ip, r3, asr #6
	rsb	r2, r1, r2, asr #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	str	lr, [r0, #32]
	ldr	r1, [r0, #36]
.L156:
	mov	r2, #512
	ldr	r3, .L166+8
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
.L153:
	pop	{r4, lr}
	bx	lr
.L165:
	ldr	r4, [r0, #28]
	add	r1, r2, r4, lsl #6
	cmp	r1, #65536
	bgt	.L154
	ldr	lr, .L166
	ldr	r1, .L166+4
	ldr	lr, [lr]
	ldr	r1, [r1]
	rsb	r3, lr, r3, asr #6
	ldr	lr, [r0, #32]
	rsb	r2, r1, r2, asr #6
	cmp	lr, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	ldr	r1, [r0, #36]
	beq	.L156
	add	ip, r3, ip
	cmp	ip, #0
	movgt	ip, #1
	movle	ip, #0
	cmp	r3, #240
	movgt	ip, #0
	cmp	ip, #0
	beq	.L156
	add	r0, r2, r4
	cmp	r0, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	r2, #160
	movgt	r0, #0
	cmp	r0, #0
	beq	.L156
	mov	ip, #520
	ldr	r0, .L166+8
	lsl	r3, r3, #23
	lsl	lr, r1, #3
	lsr	r3, r3, #23
	add	r1, r0, r1, lsl #3
	and	r2, r2, #255
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L153
.L167:
	.align	2
.L166:
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
	ldr	r3, .L182
	ldr	lr, [r0, #20]
	ldr	ip, .L182+4
	add	r2, r2, lr
	ldr	r3, [r3]
	ldr	ip, [ip]
	ldr	lr, [r0, #32]
	rsb	r3, r3, r1, asr #6
	rsb	ip, ip, r2, asr #6
	cmp	lr, #0
	stm	r0, {r1, r2, r3, ip}
	ldr	r1, [r0, #36]
	beq	.L169
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r3, #240
	movgt	r2, #0
	cmp	r2, #0
	bne	.L181
.L169:
	mov	r0, #512
	ldr	r2, .L182+8
	lsl	r3, r1, #3
	strh	r0, [r2, r3]	@ movhi
.L168:
	pop	{r4, lr}
	bx	lr
.L181:
	ldr	r2, [r0, #28]
	add	r2, ip, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, #160
	movgt	r2, #0
	cmp	r2, #0
	beq	.L169
	mov	lr, #16
	ldr	r0, .L182+8
	lsl	r2, r3, #23
	and	ip, ip, #255
	add	r3, r0, r1, lsl #3
	orr	ip, ip, #16384
	lsr	r2, r2, #23
	lsl	r4, r1, #3
	strh	ip, [r0, r4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	b	.L168
.L183:
	.align	2
.L182:
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
	ldr	r4, .L200
	add	r5, r4, #200
.L186:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L198
.L185:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L186
	ldr	r4, .L200+4
	add	r5, r4, #240
.L188:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L199
.L187:
	add	r4, r4, #48
	cmp	r4, r5
	bne	.L188
	pop	{r4, r5, r6, lr}
	b	doCollision
.L199:
	mov	r0, r4
	bl	updateEnemy
	b	.L187
.L198:
	mov	r0, r4
	bl	updateBullet
	b	.L185
.L201:
	.align	2
.L200:
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
	.global	collisionMap
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
	.word	3840
	.word	12160
	.word	60
	.word	190
	.word	0
	.word	0
	.word	16
	.word	8
	.word	1
	.word	7
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
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	tempbackground_collisionBitmap
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
