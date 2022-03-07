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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateExplosion.part.0, %function
updateExplosion.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, [r0, #28]
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r0, #28]
	str	r2, [r0, #32]
	movgt	r3, #0
	movgt	r2, #1
	strgt	r3, [r0, #36]
	strgt	r2, [r0, #28]
	bx	lr
	.size	updateExplosion.part.0, .-updateExplosion.part.0
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
	mov	ip, #21
	push	{r4, r5, r6, lr}
	mov	lr, #1
	mov	r2, #0
	mov	r6, #133
	mov	r5, #108
	mov	r4, #2
	mov	r0, #24
	mov	r1, #3
	ldr	r3, .L6
	str	ip, [r3, #16]
	ldr	ip, .L6+4
	str	lr, [r3, #44]
	str	ip, [r3, #24]
	ldr	lr, .L6+8
	ldr	ip, .L6+12
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #12]
	str	lr, [r3, #36]
	str	ip, [r3, #40]
	str	r2, [r3, #8]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r0, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3, #28]
	str	r1, [r3, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	player
	.word	spaceship_body_1Bitmap
	.word	spaceship_jet_1Bitmap
	.word	spaceship_jet_2Bitmap
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
	push	{r4, lr}
	mov	r2, #0
	mvn	r4, #1
	mov	lr, #2
	mov	ip, #1
	mvn	r0, #42
	ldr	r3, .L14
	add	r1, r3, #96
.L9:
	str	r4, [r3, #8]
	str	r2, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	strb	r0, [r3, #24]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L9
	mov	r1, #1
	mov	r2, #0
	mov	ip, #2
	ldr	r3, .L14+4
	add	r0, r3, #320
.L10:
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r0
	bne	.L10
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	playerBullets
	.word	alienBullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAliens, %function
initAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #1
	mov	lr, #24
	ldr	r3, .L56
	ldr	r2, [r3, #220]
	sub	sp, sp, #28
	mov	r7, r3
	str	r2, [sp, #12]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #428]
	str	r0, [sp, #16]
	str	r0, [sp, #4]
	str	r0, [sp]
	str	r2, [sp, #8]
	str	r3, [sp, #20]
.L30:
	cmp	r0, #1
	beq	.L17
	cmp	r0, #2
	beq	.L18
	mov	r2, #1
	mov	r3, #67
	str	r2, [sp]
	ldr	r2, .L56
	str	r3, [r2]
	mvn	r3, #0
	str	r3, [sp, #8]
.L19:
	mov	r5, #52
	mov	r6, #0
	mov	r9, #136
	mov	ip, r5
	stmib	r7, {r5, r6}
	mov	r5, #4
	mov	r1, r6
	mov	r3, r7
	mov	r4, #30
	mov	r10, #250
	mvn	r8, #44
	str	r5, [r7, #16]
	ldr	r2, .L56
	str	lr, [r7, #20]
	str	r9, [r7, #24]
	ldr	r5, [r7]
.L24:
	cmp	r0, #1
	str	fp, [r3, #48]
	str	lr, [r3, #36]
	str	lr, [r3, #40]
	str	ip, [r3, #32]
	str	r5, [r3, #28]
	str	r4, [r3, #52]
	add	r1, r1, #1
	beq	.L20
	cmp	r0, #2
	beq	.L21
	ldr	r6, .L56+4
	mvn	r9, #43
	str	r6, [r2, #44]
	mov	r6, #100
	cmp	r1, #5
	strb	r9, [r2, #60]
	str	r6, [r2, #56]
	beq	.L55
.L29:
	add	r3, r3, #36
	add	ip, ip, #28
	add	r2, r2, #36
	b	.L24
.L20:
	ldr	r6, .L56+8
	str	r6, [r2, #252]
	mvn	r6, #39
	cmp	r1, #5
	strb	r6, [r2, #268]
	str	r10, [r2, #264]
	bne	.L29
.L55:
	add	r0, r0, #1
	cmp	r0, #3
	add	r7, r7, #208
	bne	.L30
.L54:
	ldr	r3, [sp]
	cmp	r3, #0
	ldrne	r2, [sp, #8]
	ldrne	r3, .L56
	strne	r2, [r3, #12]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	ldrne	r2, [sp, #12]
	ldrne	r3, .L56
	strne	r2, [r3, #220]
	ldr	r3, [sp, #16]
	cmp	r3, #0
	ldrne	r3, .L56
	ldrne	r2, [sp, #20]
	strne	r2, [r3, #428]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	mov	r6, #500
	ldr	r9, .L56+12
	cmp	r1, #5
	str	r9, [r2, #460]
	strb	r8, [r2, #476]
	str	r6, [r2, #472]
	bne	.L29
	b	.L54
.L18:
	mov	r2, #1
	str	r2, [sp, #16]
	mvn	r2, #0
	mov	r3, #11
	str	r2, [sp, #20]
	ldr	r2, .L56
	str	r3, [r2, #416]
	b	.L19
.L17:
	mov	r3, #39
	ldr	r2, .L56
	str	r0, [sp, #12]
	str	r3, [r2, #208]
	str	r0, [sp, #4]
	b	.L19
.L57:
	.align	2
.L56:
	.word	alienRows
	.word	alien_1Bitmap
	.word	alien_2Bitmap
	.word	alien_3Bitmap
	.size	initAliens, .-initAliens
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #3
	mov	r5, #0
	mov	r2, #1
	mov	r8, #133
	mov	lr, #108
	mov	ip, #21
	mov	r7, #24
	ldr	r4, .L70
	mov	r6, r0
	str	r1, [r4, #12]
	ldr	r0, .L70+4
	ldr	r1, .L70+8
	ldr	r9, .L70+12
	stm	r4, {r8, lr}
	str	r0, [r4, #36]
	str	r1, [r4, #40]
	str	r2, [r4, #44]
	str	r3, [r4, #28]
	str	r3, [r4, #48]
	str	ip, [r4, #16]
	str	r5, [r4, #8]
	str	r5, [r4, #52]
	str	r5, [r4, #56]
	str	r7, [r4, #20]
	str	r7, [r4, #32]
	str	r9, [r4, #24]
	bl	initAliens
	mov	r0, #15
	mov	r1, #60
	mov	r2, #100
	ldr	r3, .L70+16
	str	r5, [r3]
	ldr	r3, .L70+20
	str	r0, [r3]
	ldr	r3, .L70+24
	ldr	r8, .L70+28
	str	r1, [r3]
	ldr	r3, .L70+32
	cmp	r6, #1
	str	r6, [r8]
	str	r2, [r3]
	beq	.L69
	ldr	r3, .L70+36
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L58
.L63:
	.word	.L66
	.word	.L65
	.word	.L64
	.word	.L62
.L66:
	ldr	r3, .L70+40
	str	r3, [r4, #24]
.L58:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L69:
	bl	initBullets
	mov	lr, #4
	ldr	r3, .L70+44
	ldr	ip, .L70+48
	ldr	r0, .L70+52
	ldr	r1, .L70+56
	add	r2, r3, #200
.L60:
	str	r7, [r3, #8]
	str	r7, [r3, #12]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #24]
	str	r6, [r3, #28]
	str	lr, [r3, #32]
	str	r5, [r3, #36]
	add	r3, r3, #40
	cmp	r3, r2
	bne	.L60
	mov	r3, #3
	mov	ip, #60
	ldr	r2, .L70+36
	ldr	r1, .L70+60
	str	r3, [r2]
	ldr	r2, .L70+64
	str	r3, [r1]
	str	ip, [r2]
	ldr	r0, .L70+68
	ldr	r1, .L70+72
	ldr	r2, .L70+76
	ldr	r3, .L70+80
	str	r6, [r8]
	str	r5, [r0]
	str	r5, [r1]
	str	r6, [r2]
	str	r5, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L62:
	str	r9, [r4, #24]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L65:
	ldr	r3, .L70+84
	str	r3, [r4, #24]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L64:
	ldr	r3, .L70+88
	str	r3, [r4, #24]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	player
	.word	spaceship_jet_1Bitmap
	.word	spaceship_jet_2Bitmap
	.word	spaceship_body_1Bitmap
	.word	victory
	.word	aliensRemaining
	.word	victoryDelay
	.word	stage
	.word	startUpDelay
	.word	lives
	.word	spaceship_body_4Bitmap
	.word	explosions
	.word	explosion_1Bitmap
	.word	explosion_2Bitmap
	.word	explosion_3Bitmap
	.word	lastLives
	.word	gameOverDelay
	.word	score
	.word	lastScore
	.word	lastStage
	.word	gameOver
	.word	spaceship_body_3Bitmap
	.word	spaceship_body_2Bitmap
	.size	initGame, .-initGame
	.align	2
	.global	initExplosions
	.syntax unified
	.arm
	.fpu softvfp
	.type	initExplosions, %function
initExplosions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #24
	mov	r6, #1
	mov	r5, #4
	mov	r4, #0
	ldr	r3, .L76
	ldr	lr, .L76+4
	ldr	ip, .L76+8
	ldr	r0, .L76+12
	add	r1, r3, #200
.L73:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r6, [r3, #28]
	str	r5, [r3, #32]
	str	r4, [r3, #36]
	add	r3, r3, #40
	cmp	r3, r1
	bne	.L73
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	explosions
	.word	explosion_1Bitmap
	.word	explosion_2Bitmap
	.word	explosion_3Bitmap
	.size	initExplosions, .-initExplosions
	.align	2
	.global	updatePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0]
	ldr	r1, [r0, #8]
	add	r1, r3, r1
	cmp	r1, #9
	movle	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	mov	r7, #0
	str	r1, [r0]
	strle	r3, [r0, #28]
	ldr	r8, .L93
	ldr	r9, .L93+4
	ldr	fp, .L93+8
	sub	sp, sp, #20
.L87:
	mov	r6, #0
	add	r4, r7, r7, lsl #1
	add	r4, r7, r4, lsl #2
	add	r4, r9, r4, lsl #4
	lsl	r10, r7, #1
.L88:
	add	r2, r4, #28
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #40]
	ldr	ip, [r4, #36]
	str	r0, [sp, #8]
	str	ip, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #48]
	cmp	r3, #0
	cmpne	r0, #0
	bne	.L91
	add	r6, r6, #1
	cmp	r6, #5
	add	r4, r4, #36
	beq	.L82
	ldr	r1, [r5]
	b	.L88
.L92:
	mov	r1, #1
	add	r2, r10, r7
	add	r2, r7, r2, lsl #2
	add	r0, r0, r6
	lsl	r2, r2, #4
	add	r2, r2, r0, lsl #2
	add	r2, r9, r2
	ldr	lr, .L93+12
	ldr	ip, [r2, #28]
	ldr	r0, [r2, #32]
	add	r3, r3, r3, lsl #2
	add	r2, lr, r3, lsl #3
	str	ip, [lr, r3, lsl #3]
	str	r0, [r2, #4]
	str	r1, [r2, #36]
.L82:
	add	r7, r7, #1
	cmp	r7, #3
	ldrne	r1, [r5]
	bne	.L87
.L78:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L91:
	mov	r1, #0
	mov	r3, r1
	add	r2, r10, r7
	add	r2, r7, r2, lsl #2
	add	r0, r6, r6, lsl #3
	lsl	r2, r2, #4
	ldr	lr, .L93+16
	add	r2, r2, r0, lsl #2
	add	r2, r9, r2
	ldr	ip, [r2, #56]
	ldr	r0, [lr]
	add	ip, ip, r0
	ldr	r0, [fp]
	str	r1, [r2, #48]
	sub	r0, r0, #1
	str	ip, [lr]
	str	r1, [r5, #28]
	ldr	r2, .L93+12
	str	r0, [fp]
	lsl	r0, r6, #3
.L83:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	beq	.L92
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L83
	b	.L82
.L94:
	.align	2
.L93:
	.word	collision
	.word	alienRows
	.word	aliensRemaining
	.word	explosions
	.word	score
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	updateAlienBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAlienBullet, %function
updateAlienBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #8]
	ldr	r1, [r0]
	add	r1, r1, r3
	cmp	r1, #159
	movgt	r3, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L108
	ldr	r6, [r5, #56]
	strgt	r3, [r0, #28]
	cmp	r6, #0
	mov	r4, r0
	str	r1, [r0]
	sub	sp, sp, #20
	beq	.L107
.L95:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L107:
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	ip, [r5, #16]
	str	r0, [sp, #8]
	str	ip, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r7, .L108+4
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L95
	ldr	r2, .L108+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #1
	str	r6, [r4, #28]
	str	r3, [r2]
	beq	.L100
	cmp	r3, #2
	beq	.L101
	cmp	r3, #0
	ldreq	r3, .L108+12
	streq	r3, [r5, #24]
	b	.L95
.L100:
	mov	r2, #88
	ldr	r3, .L108+16
	str	r2, [r5, #56]
	str	r3, [r5, #24]
	b	.L95
.L101:
	mov	r2, #88
	ldr	r3, .L108+20
	str	r2, [r5, #56]
	str	r3, [r5, #24]
	b	.L95
.L109:
	.align	2
.L108:
	.word	player
	.word	collision
	.word	lives
	.word	spaceship_body_4Bitmap
	.word	spaceship_body_3Bitmap
	.word	spaceship_body_2Bitmap
	.size	updateAlienBullet, .-updateAlienBullet
	.align	2
	.global	updateAlienRow
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAlienRow, %function
updateAlienRow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, [r0, #12]
	ldr	r3, [r0, #4]
	adds	ip, r2, r3
	movmi	r3, #0
	movmi	ip, r3
	mov	r6, r0
	mov	r4, r0
	mov	r5, #0
	mov	r7, #10
	strmi	r3, [r0, #4]
	ldr	r3, [r0, #24]
	rsbmi	r2, r2, #0
	strmi	r2, [r0, #12]
	add	r2, r3, ip
	strpl	ip, [r0, #4]
	cmp	r2, #240
	ldrgt	r2, [r0, #12]
	rsbgt	ip, r3, #240
	rsbgt	r3, r2, #0
	ldr	r1, [r0]
	strgt	r3, [r0, #12]
	ldr	r3, [r0, #8]
	ldr	r10, .L126
	add	r1, r1, r3
	strgt	ip, [r0, #4]
	str	r1, [r0]
	ldr	r9, .L126+4
	ldr	fp, .L126+8
	sub	r8, r10, #28
.L121:
	ldr	r0, [r6, #16]
	add	r3, r5, r5, lsl #1
	add	r3, ip, r3, lsl #3
	mla	r3, r0, r5, r3
	ldr	r0, [r4, #48]
	cmp	r0, #0
	str	r3, [r4, #32]
	str	r1, [r4, #28]
	ldr	r3, [r4, #52]
	beq	.L115
	cmp	r3, #0
	ble	.L124
.L115:
	sub	r3, r3, #1
	str	r3, [r4, #52]
.L116:
	add	r5, r5, #1
	cmp	r5, #5
	add	r4, r4, #36
	ldmne	r6, {r1, ip}
	bne	.L121
.L110:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L124:
	mov	lr, pc
	bx	r9
	smull	r3, r1, fp, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	rsb	r1, r3, r3, lsl #5
	add	r3, r3, r1, lsl #2
	subs	r3, r0, r3, lsl #2
	bne	.L116
.L119:
	ldr	r1, [r10, r3, lsl #5]
	cmp	r1, #0
	lsl	r1, r3, #5
	beq	.L125
	add	r3, r3, #1
	cmp	r3, #10
	bne	.L119
.L118:
	str	r7, [r4, #52]
	b	.L116
.L125:
	mov	r2, #1
	ldr	r0, [r4, #40]
	add	ip, r4, #28
	ldm	ip, {ip, lr}
	add	r0, r0, r0, lsr #31
	add	r0, lr, r0, asr #1
	ldr	lr, [r4, #36]
	add	ip, ip, lr
	ldrb	lr, [r4, #60]	@ zero_extendqisi2
	add	r1, r8, r1
	str	r2, [r1, #28]
	str	r0, [r1, #4]
	str	ip, [r8, r3, lsl #5]
	strb	lr, [r1, #24]
	b	.L118
.L127:
	.align	2
.L126:
	.word	alienBullets+28
	.word	rand
	.word	274877907
	.size	updateAlienRow, .-updateAlienRow
	.align	2
	.global	updateExplosion
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateExplosion, %function
updateExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #32]
	cmp	r2, #0
	beq	updateExplosion.part.0
.L129:
	sub	r2, r2, #1
	str	r2, [r0, #32]
	bx	lr
	.size	updateExplosion, .-updateExplosion
	.align	2
	.global	firePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayerBullet, %function
firePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L141
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L131
	ldr	r2, [r3, #60]
	cmp	r2, #0
	beq	.L133
	ldr	r2, [r3, #92]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L131:
	push	{r4, lr}
	mov	r4, #1
	ldr	r0, .L141+4
	ldr	r1, [r0, #20]
	ldm	r0, {ip, lr}
	add	r1, r1, r1, lsr #31
	add	r0, r3, r2, lsl #5
	add	r1, lr, r1, asr r4
	ldr	lr, [r0, #16]
	sub	ip, ip, lr
	str	r4, [r0, #28]
	str	r1, [r0, #4]
	str	ip, [r3, r2, lsl #5]
	pop	{r4, lr}
	bx	lr
.L133:
	mov	r2, #1
	b	.L131
.L142:
	.align	2
.L141:
	.word	playerBullets
	.word	player
	.size	firePlayerBullet, .-firePlayerBullet
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
	push	{r4, lr}
	ldr	r4, .L158
	ldr	r3, [r4, #48]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r4, #48]
	bne	.L145
	ldr	r3, [r4, #44]
	rsbs	r3, r3, #1
	mov	r2, #3
	movcc	r3, #0
	str	r2, [r4, #48]
	str	r3, [r4, #44]
.L145:
	ldr	r2, .L158+4
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	bne	.L146
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #12]
	subs	r2, r2, r1
	movpl	r3, r2
	str	r3, [r4, #4]
.L148:
	ldr	r3, .L158+8
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r3, [r4, #52]
	beq	.L150
	ldr	r2, .L158+12
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L157
.L150:
	sub	r3, r3, #1
	str	r3, [r4, #52]
.L151:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #56]
	pop	{r4, lr}
	bx	lr
.L146:
	ldrh	r3, [r2, #48]
	tst	r3, #16
	bne	.L148
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	add	r3, r3, r1
	add	r1, r3, r2
	cmp	r1, #240
	rsbgt	r2, r2, #240
	str	r3, [r4, #4]
	strgt	r2, [r4, #4]
	b	.L148
.L157:
	cmp	r3, #0
	bgt	.L150
	bl	firePlayerBullet
	mov	r3, #20
	str	r3, [r4, #52]
	b	.L151
.L159:
	.align	2
.L158:
	.word	player
	.word	67109120
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L224
	ldr	r3, [r2]
	cmp	r3, #0
	bne	.L216
	ldr	r3, .L224+4
	ldr	r2, [r3]
	cmp	r2, #0
	push	{r4, r5, r6, lr}
	beq	.L217
	ldr	r3, .L224+8
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L218
	ldr	r0, .L224+12
	ldr	r4, .L224+16
	ldr	r3, .L224+20
	mov	r1, r2
	str	r2, [r4, #56]
	str	r2, [r0, #28]
	str	r2, [r0, #60]
	str	r2, [r0, #92]
	add	r2, r3, #320
.L174:
	str	r1, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L174
	ldr	r0, .L224+24
	add	r1, r0, #200
.L177:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L175
	ldr	r3, [r0, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r0, #32]
	bleq	updateExplosion.part.0
.L175:
	add	r0, r0, #40
	cmp	r0, r1
	bne	.L177
	ldr	r2, .L224+28
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L219
.L160:
	pop	{r4, r5, r6, lr}
	bx	lr
.L217:
	ldr	r1, .L224+12
	ldr	r3, .L224+20
	str	r2, [r1, #28]
	str	r2, [r1, #60]
	str	r2, [r1, #92]
	add	r1, r3, #320
.L164:
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L164
	ldr	r0, .L224+24
	add	r1, r0, #200
.L181:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L179
	ldr	r3, [r0, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r0, #32]
	bleq	updateExplosion.part.0
.L179:
	add	r0, r0, #40
	cmp	r0, r1
	bne	.L181
	ldr	r2, .L224+32
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	bgt	.L160
	ldr	ip, .L224+36
	mov	r0, ip
	add	lr, ip, #624
.L182:
	mov	r3, r0
	mov	r1, #0
.L183:
	ldr	r2, [r3, #28]
	add	r1, r1, #1
	sub	r2, r2, #1
	cmp	r1, #5
	str	r2, [r3, #28]
	add	r3, r3, #36
	bne	.L183
	add	r0, r0, #208
	cmp	r0, lr
	bne	.L182
	ldr	r3, [ip, #28]
	cmn	r3, #24
	movlt	r2, #1
	ldrlt	r3, .L224+40
	pop	{r4, r5, r6, lr}
	strlt	r2, [r3]
	bx	lr
.L216:
	sub	r3, r3, #1
	str	r3, [r2]
	bx	lr
.L219:
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmn	r3, #24
	str	r3, [r4]
	movlt	r2, #1
	ldrlt	r3, .L224+44
	strlt	r2, [r3]
	b	.L160
.L218:
	ldr	r4, .L224+12
	bl	updatePlayer
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L220
.L166:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L221
.L167:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L222
.L168:
	ldr	r4, .L224+20
	add	r5, r4, #320
	b	.L170
.L169:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L223
.L170:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L169
	mov	r0, r4
	add	r4, r4, #32
	bl	updateAlienBullet
	cmp	r4, r5
	bne	.L170
.L223:
	ldr	r0, .L224+36
	bl	updateAlienRow
	ldr	r0, .L224+48
	bl	updateAlienRow
	ldr	r0, .L224+52
	bl	updateAlienRow
	ldr	r0, .L224+24
	add	r1, r0, #200
.L173:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L171
	ldr	r3, [r0, #32]
	cmp	r3, #0
	subne	r3, r3, #1
	strne	r3, [r0, #32]
	bleq	updateExplosion.part.0
.L171:
	add	r0, r0, #40
	cmp	r1, r0
	bne	.L173
	pop	{r4, r5, r6, lr}
	bx	lr
.L222:
	ldr	r0, .L224+56
	bl	updatePlayerBullet
	b	.L168
.L221:
	ldr	r0, .L224+60
	bl	updatePlayerBullet
	b	.L167
.L220:
	mov	r0, r4
	bl	updatePlayerBullet
	b	.L166
.L225:
	.align	2
.L224:
	.word	startUpDelay
	.word	lives
	.word	aliensRemaining
	.word	playerBullets
	.word	player
	.word	alienBullets
	.word	explosions
	.word	victoryDelay
	.word	gameOverDelay
	.word	alienRows
	.word	gameOver
	.word	victory
	.word	alienRows+208
	.word	alienRows+416
	.word	playerBullets+64
	.word	playerBullets+32
	.size	updateGame, .-updateGame
	.align	2
	.global	fireAlienBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireAlienBullet, %function
fireAlienBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L236
	b	.L229
.L227:
	add	r3, r3, #1
	cmp	r3, #10
	bxeq	lr
.L229:
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	bne	.L227
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	r1, [r0, #12]
	ldr	ip, [r0, #4]
	add	r1, r1, r1, lsr #31
	ldr	r5, [r0, #8]
	ldr	lr, .L236+4
	add	r1, ip, r1, asr r4
	ldr	ip, [r0]
	add	r2, lr, r2
	add	ip, ip, r5
	str	r4, [r2, #28]
	str	ip, [lr, r3, lsl #5]
	str	r1, [r2, #4]
	ldrb	r3, [r0, #32]	@ zero_extendqisi2
	strb	r3, [r2, #24]
	pop	{r4, r5, lr}
	bx	lr
.L237:
	.align	2
.L236:
	.word	alienBullets+28
	.word	alienBullets
	.size	fireAlienBullet, .-fireAlienBullet
	.align	2
	.global	drawHUD
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHUD, %function
drawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r6, .L263
	ldr	r5, .L263+4
	ldr	r0, [r6]
	ldr	r3, [r5]
	cmp	r3, r0
	ldr	r4, .L263+8
	sub	sp, sp, #12
	bne	.L239
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L239
.L240:
	ldr	r6, .L263+12
	ldr	r5, .L263+16
	ldr	r2, [r6]
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L243
	ldr	r3, [r4, #4]
	cmp	r3, #0
	bne	.L243
.L244:
	ldr	r6, .L263+20
	ldr	r5, .L263+24
	ldr	r2, [r6]
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L247
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L238
.L247:
	mov	r2, #210
	mov	r3, #8
	mov	r1, #1
	mov	r0, #203
	str	r2, [sp]
	ldr	r7, .L263+28
	mov	r2, #36
	mov	lr, pc
	bx	r7
	mov	r2, #209
	ldr	r3, [r5]
	mov	r1, #1
	str	r2, [sp]
	mov	r0, #203
	mov	r2, #6
	ldr	r7, .L263+32
	mov	lr, pc
	bx	r7
	ldr	r3, [r5]
	ldr	r2, [r6]
	cmp	r2, r3
	beq	.L249
	mov	r2, #1
	str	r3, [r6]
	str	r2, [r4, #8]
.L238:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L243:
	mov	r2, #210
	mov	r3, #8
	mov	r1, #1
	mov	r0, #132
	str	r2, [sp]
	ldr	r7, .L263+28
	mov	r2, #12
	mov	lr, pc
	bx	r7
	mov	r2, #209
	ldr	r3, [r5]
	mov	r1, #1
	str	r2, [sp]
	mov	r0, #132
	mov	r2, #2
	ldr	r7, .L263+32
	mov	lr, pc
	bx	r7
	ldr	r3, [r5]
	ldr	r2, [r6]
	cmp	r2, r3
	beq	.L245
	mov	r2, #1
	str	r3, [r6]
	str	r2, [r4, #4]
	b	.L244
.L239:
	mov	r3, #210
	add	r0, r0, #6
	add	r0, r0, r0, lsl #1
	lsl	r0, r0, #1
	mov	r2, #6
	str	r3, [sp]
	mov	r1, #1
	mov	r3, #8
	ldr	r7, .L263+28
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	ldr	r2, [r5]
	cmp	r2, r3
	movne	r2, #1
	strne	r3, [r5]
	strne	r2, [r4]
	bne	.L240
.L241:
	ldr	r3, [r4]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4]
	b	.L240
.L245:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #4]
	b	.L244
.L249:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #8]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L264:
	.align	2
.L263:
	.word	lives
	.word	lastLives
	.word	.LANCHOR0
	.word	lastStage
	.word	stage
	.word	lastScore
	.word	score
	.word	drawRect4
	.word	drawInt4
	.size	drawHUD, .-drawHUD
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
	push	{r4, r5, lr}
	ldr	r4, .L285
	ldr	r1, [r4]
	cmp	r1, #9
	ldr	r3, [r4, #16]
	sub	sp, sp, #12
	ble	.L266
	ldr	r2, [r4, #56]
	cmp	r2, #0
	beq	.L267
	rsbs	r0, r2, #0
	and	r0, r0, #7
	and	r2, r2, #7
	rsbpl	r2, r0, #0
	cmp	r2, #3
	bgt	.L267
	add	r1, r1, r3
	cmp	r1, #9
	bgt	.L265
	ldr	r5, .L285+4
.L271:
	ldr	r2, [r4, #32]
	rsb	r1, r1, #10
	mul	r0, r1, r2
	ldr	ip, [r4, #44]
	ldr	r3, [r4, #28]
	cmp	ip, #1
	sub	r3, r3, r1
	add	r0, r0, r0, lsr #31
	ldreq	r1, [r4, #36]
	ldrne	r1, [r4, #40]
	bic	ip, r0, #1
	add	ip, r1, ip
	ldr	r0, [r4, #4]
	mov	r1, #10
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L267:
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #4]
	str	r2, [sp]
	ldr	r5, .L285+4
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #1
	ldr	r2, [r4, #16]
	ldreq	r3, [r4, #36]
	ldrne	r3, [r4, #40]
	ldr	r1, [r4]
	str	r3, [sp]
	add	r1, r1, r2
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #32]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
.L270:
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	add	r1, r3, r1
	cmp	r1, #9
	ble	.L271
	ldr	r3, [r4, #56]
	cmp	r3, #0
	bne	.L284
.L272:
	ldr	r3, [r4, #44]
	cmp	r3, #1
	ldreq	ip, [r4, #36]
	ldrne	ip, [r4, #40]
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #32]
	ldr	r3, [r4, #28]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
.L265:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L266:
	ldr	r2, [r4, #20]
	rsb	r1, r1, #10
	mul	r0, r1, r2
	ldr	ip, [r4, #24]
	add	r0, r0, r0, lsr #31
	bic	r0, r0, #1
	add	r0, ip, r0
	str	r0, [sp]
	sub	r3, r3, r1
	ldr	r0, [r4, #4]
	mov	r1, #10
	ldr	r5, .L285+4
	mov	lr, pc
	bx	r5
	b	.L270
.L284:
	rsbs	r2, r3, #0
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	cmp	r3, #3
	bgt	.L272
	b	.L265
.L286:
	.align	2
.L285:
	.word	player
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrb	r2, [r0, #24]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	str	r2, [sp]
	ldr	r4, .L289
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L290:
	.align	2
.L289:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawAlien
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAlien, %function
drawAlien:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	ldr	r1, [r0]
	ldr	r2, [ip, #12]
	cmp	r1, #9
	rsble	r1, r1, #10
	push	{r4, lr}
	ldr	r3, [ip, #8]
	ldr	lr, [ip, #16]
	mulle	ip, r2, r1
	addle	ip, ip, ip, lsr #31
	bicle	ip, ip, #1
	sub	sp, sp, #8
	addle	ip, lr, ip
	ldr	r0, [r0, #4]
	suble	r3, r3, r1
	strgt	lr, [sp]
	movle	r1, #10
	strle	ip, [sp]
	ldr	r4, .L295
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L296:
	.align	2
.L295:
	.word	drawImage4
	.size	drawAlien, .-drawAlien
	.align	2
	.global	drawExplosion
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawExplosion, %function
drawExplosion:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #28]
	cmp	r3, #2
	sub	sp, sp, #8
	beq	.L298
	cmp	r3, #3
	beq	.L299
	cmp	r3, #1
	ldreq	r3, [r0, #16]
	movne	r3, #0
.L300:
	str	r3, [sp]
	ldr	r4, .L303
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L298:
	ldr	r3, [r0, #20]
	b	.L300
.L299:
	ldr	r3, [r0, #24]
	b	.L300
.L304:
	.align	2
.L303:
	.word	drawImage4
	.size	drawExplosion, .-drawExplosion
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"READY\000"
	.align	2
.LC1:
	.ascii	"GO\000"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L341
	sub	sp, sp, #12
	mov	r3, #150
	mov	r1, #10
	mov	r0, #0
	str	r2, [sp]
	ldr	r4, .L341+4
	mov	r2, #240
	mov	lr, pc
	bx	r4
	mov	r5, #20
	bl	drawHUD
	ldr	r6, .L341+8
	bl	drawPlayer
.L306:
	sub	r7, r5, #20
	sub	r4, r6, #180
.L308:
	sub	r3, r4, r7
	ldr	r3, [r3, r5]
	cmp	r3, #0
	bne	.L336
.L307:
	add	r4, r4, #36
	cmp	r4, r6
	bne	.L308
	add	r5, r5, #208
	cmp	r5, #644
	add	r6, r4, #208
	bne	.L306
	ldr	r4, .L341+12
	add	r5, r4, #200
.L311:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L337
.L310:
	add	r4, r4, #40
	cmp	r4, r5
	bne	.L311
	ldr	r4, .L341+16
	ldr	r6, .L341+20
	add	r5, r4, #96
.L313:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L338
.L312:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L313
	ldr	r4, .L341+24
	ldr	r6, .L341+20
	add	r5, r4, #320
	b	.L315
.L314:
	add	r4, r4, #32
	cmp	r4, r5
	beq	.L339
.L315:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L314
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #16]
	str	r2, [sp]
	add	r4, r4, #32
	ldr	r2, [r4, #-12]
	ldr	r1, [r4, #-32]
	ldr	r0, [r4, #-28]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L315
.L339:
	ldr	r4, .L341+28
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L340
.L305:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L336:
	mov	r0, r4
	bl	drawAlien
	b	.L307
.L337:
	mov	r0, r4
	bl	drawExplosion
	b	.L310
.L338:
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	ldr	r3, [r4, #16]
	str	r2, [sp]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	b	.L312
.L340:
	mov	r3, #209
	mov	r1, #94
	mov	r0, #105
	ldr	r2, .L341+32
	ldr	r5, .L341+36
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #30
	bgt	.L305
	mov	r3, #209
	mov	r1, #109
	mov	r0, #114
	ldr	r2, .L341+40
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L342:
	.align	2
.L341:
	.word	backgroundBitmap+2400
	.word	drawImage4
	.word	alienRows+208
	.word	explosions
	.word	playerBullets
	.word	drawRect4
	.word	alienBullets
	.word	startUpDelay
	.word	.LC0
	.word	drawString4
	.word	.LC1
	.size	drawGame, .-drawGame
	.comm	startUpDelay,4,4
	.comm	victoryDelay,4,4
	.comm	victory,4,4
	.comm	gameOverDelay,4,4
	.comm	gameOver,4,4
	.comm	lastStage,4,4
	.comm	lastScore,4,4
	.comm	lastLives,4,4
	.comm	aliensRemaining,4,4
	.global	hiscore
	.comm	stage,4,4
	.comm	score,4,4
	.comm	lives,4,4
	.comm	explosions,200,4
	.comm	alienRows,624,4
	.comm	alienBullets,320,4
	.comm	playerBullets,96,4
	.comm	player,60,4
	.comm	NOTES,2,2
	.comm	COLORINDEX,1,1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	updateLifeNextPage.5096, %object
	.size	updateLifeNextPage.5096, 4
updateLifeNextPage.5096:
	.space	4
	.type	updateStageNextPage.5097, %object
	.size	updateStageNextPage.5097, 4
updateStageNextPage.5097:
	.space	4
	.type	updateScoreNextPage.5098, %object
	.size	updateScoreNextPage.5098, 4
updateScoreNextPage.5098:
	.space	4
	.type	hiscore, %object
	.size	hiscore, 4
hiscore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
