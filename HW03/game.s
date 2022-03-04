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
	.global	initShip
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShip, %function
initShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #85
	mov	r5, #14
	mov	r4, #2
	mov	ip, #118
	mov	r0, #1
	mov	r1, #20
	mov	r2, #0
	ldr	r3, .L4
	str	lr, [r3]
	str	lr, [r3, #8]
	ldr	lr, .L4+4
	str	r5, [r3, #24]
	str	r4, [r3, #40]
	str	lr, [r3, #32]
	str	ip, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #28]
	str	r1, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	ship
	.word	submarine_right
	.size	initShip, .-initShip
	.align	2
	.global	initTorpedoes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTorpedoes, %function
initTorpedoes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #1
	mov	r4, #2
	mvn	lr, #0
	mvn	ip, #32768
	ldr	r1, .L10
	ldr	r3, .L10+4
	ldr	r0, [r1]
	add	r1, r3, #264
.L7:
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	strh	ip, [r3, #32]	@ movhi
	str	r2, [r3, #36]
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L7
	pop	{r4, r5, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	ship
	.word	torpedoes
	.size	initTorpedoes, .-initTorpedoes
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
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L18
	str	lr, [sp, #-4]!
	ldr	lr, .L18+4
	add	ip, r3, #260
.L13:
	str	lr, [r3, #48]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L13
	mov	r0, #8
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L18+8
	ldr	lr, .L18+12
	add	ip, r3, #520
.L14:
	str	lr, [r3, #48]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #40]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L14
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	enemies
	.word	pufferfish
	.word	smallEnemies
	.word	minipuffer
	.size	initEnemies, .-initEnemies
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	mov	r8, #2
	mov	r7, #85
	mov	r3, #1
	mov	r10, #118
	mov	r9, #20
	mov	fp, #14
	mov	ip, r8
	mov	r4, r6
	mvn	r0, #0
	mvn	r1, #32768
	ldr	r2, .L24
	mov	r5, r7
	str	r7, [r2]
	str	r7, [r2, #8]
	str	r3, [r2, #16]
	str	r3, [r2, #20]
	mov	lr, r3
	ldr	r7, .L24+4
	ldr	r3, .L24+8
	str	fp, [r2, #24]
	str	r10, [r2, #4]
	str	r7, [r2, #32]
	str	r10, [r2, #12]
	str	r9, [r2, #28]
	str	r9, [r2, #36]
	str	r8, [r2, #40]
	str	r6, [r2, #44]
	str	r6, [r2, #48]
	add	r2, r3, #264
.L21:
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r4, [r3, #20]
	str	r4, [r3, #16]
	str	r5, [r3, #8]
	str	r4, [r3, #12]
	strh	r1, [r3, #32]	@ movhi
	str	r4, [r3, #36]
	stm	r3, {r0, r4}
	add	r3, r3, #44
	cmp	r3, r2
	bne	.L21
	bl	initEnemies
	mov	r1, #3
	ldr	r2, .L24+12
	ldr	r3, .L24+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #60
	ldr	r3, .L24+20
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	ldr	ip, .L24+24
	ldr	r3, .L24+28
	ldr	r2, .L24+32
	add	r0, r0, #50
	str	r4, [r3]
	str	r0, [ip]
	str	r1, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	ship
	.word	submarine_right
	.word	torpedoes
	.word	lives
	.word	rand
	.word	1374389535
	.word	spawnDelay
	.word	score
	.word	timer
	.size	initGame, .-initGame
	.global	__aeabi_idivmod
	.align	2
	.global	spawnEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemy, %function
spawnEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L38
	mov	r4, #0
	mov	r3, r5
.L31:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L27
	ldr	r1, [r3, #36]
	cmp	r1, #0
	bne	.L37
.L27:
	add	r4, r4, #1
	cmp	r4, #5
	add	r3, r3, #52
	bne	.L31
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L37:
	mov	r9, #1
	add	r3, r4, r4, lsl r9
	add	r3, r4, r3, lsl #2
	add	r6, r5, r3, lsl #2
	str	r2, [r6, #36]
	str	r2, [r6, #16]
	str	r2, [r6, #40]
	ldr	r8, .L38+4
	str	r9, [r6, #32]
	lsl	r7, r3, #2
	mov	lr, pc
	bx	r8
	ldr	r1, [r6, #24]
	ldr	r3, .L38+8
	rsb	r1, r1, #150
	mov	lr, pc
	bx	r3
	add	r1, r1, #10
	str	r1, [r5, r7]
	mov	lr, pc
	bx	r8
	ands	r2, r0, r9
	streq	r2, [r6, #4]
	streq	r9, [r6, #20]
	lsl	r3, r4, r9
	beq	.L29
	cmp	r0, #0
	rsblt	r2, r2, #0
	cmp	r2, #1
	mvneq	r1, #0
	ldreq	r2, [r6, #28]
	rsbeq	r2, r2, #240
	streq	r2, [r6, #4]
	streq	r1, [r6, #20]
.L29:
	add	r3, r3, r4
	add	r4, r4, r3, lsl #2
	add	r3, r5, r4, lsl #2
	ldr	r1, [r5, r4, lsl #2]
	ldr	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	mov	lr, pc
	bx	r8
	ldr	r3, .L38+12
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	ldr	r3, .L38+16
	add	r0, r0, #50
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	enemies
	.word	rand
	.word	__aeabi_idivmod
	.word	1374389535
	.word	spawnDelay
	.size	spawnEnemy, .-spawnEnemy
	.align	2
	.global	spawnSmallEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnSmallEnemies, %function
spawnSmallEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L58
	push	{r4, r5, r6, lr}
	mov	r2, r3
	mov	r4, r3
	mov	r1, #0
.L43:
	ldr	ip, [r2, #32]
	cmp	ip, #0
	bne	.L41
	ldr	lr, [r2, #36]
	cmp	lr, #0
	bne	.L56
.L41:
	add	r1, r1, #1
	cmp	r1, #10
	add	r2, r2, #52
	bne	.L43
.L42:
	mov	r2, #0
.L46:
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L44
	ldr	ip, [r3, #36]
	cmp	ip, #0
	bne	.L57
.L44:
	add	r2, r2, #1
	cmp	r2, #10
	add	r3, r3, #52
	bne	.L46
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	mov	lr, #1
	mov	r5, #3
	add	r2, r1, r1, lsl lr
	add	r1, r1, r2, lsl #2
	add	r2, r4, r1, lsl #2
	ldr	r6, [r0, #20]
	str	ip, [r2, #36]
	str	ip, [r2, #40]
	ldr	ip, [r0]
	str	ip, [r4, r1, lsl #2]
	ldr	r1, [r0, #4]
	str	r6, [r2, #20]
	str	lr, [r2, #32]
	str	lr, [r2, #16]
	str	r5, [r2, #44]
	str	r1, [r2, #4]
	str	r1, [r2, #12]
	str	ip, [r2, #8]
	b	.L42
.L57:
	mov	r5, #1
	mvn	lr, #0
	mov	ip, #4
	add	r3, r2, r2, lsl r5
	add	r2, r2, r3, lsl #2
	add	r3, r4, r2, lsl #2
	str	r1, [r3, #36]
	str	lr, [r3, #16]
	ldr	lr, [r0, #20]
	str	r1, [r3, #40]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	r5, [r3, #32]
	str	lr, [r3, #20]
	str	r1, [r4, r2, lsl #2]
	str	ip, [r3, #44]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	smallEnemies
	.size	spawnSmallEnemies, .-spawnSmallEnemies
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.0, %function
updateEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, [r0, #40]
	cmp	r4, #0
	mov	r5, r0
	mov	r7, r1
	sub	sp, sp, #16
	beq	.L61
	ldr	r2, [r0]
	ldr	r1, [r0, #4]
.L62:
	rsbs	r4, r4, #1
	movcc	r4, #0
	add	r0, r5, #24
	cmp	r2, #9
	str	r4, [r5, #40]
	ldm	r0, {r0, ip}
	bgt	.L98
.L71:
	mov	r3, #0
	str	r3, [r5, #32]
	str	r3, [r5, #36]
.L72:
	ldr	r4, .L102
	mov	r9, #0
	ldr	r8, .L102+4
	ldr	r10, .L102+8
	add	r6, r4, #264
	b	.L76
.L73:
	add	r4, r4, #44
	cmp	r6, r4
	beq	.L99
.L76:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L73
	stm	sp, {r1, r2, ip}
	str	r0, [sp, #12]
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L97
	ldr	r3, [r10]
	cmp	r7, #0
	addne	r3, r3, #1000
	str	r9, [r4, #36]
	strne	r3, [r10]
	str	r9, [r5, #32]
	beq	.L100
.L97:
	add	r4, r4, #44
	add	r0, r5, #24
	cmp	r6, r4
	ldr	r1, [r5, #4]
	ldr	r2, [r5]
	ldm	r0, {r0, ip}
	bne	.L76
.L99:
	stm	sp, {r1, r2, ip}
	str	r0, [sp, #12]
	ldr	r4, .L102+12
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L60
	mov	r3, #0
	ldr	r2, [r4, #44]
	cmp	r2, r3
	str	r3, [r5, #32]
	bgt	.L60
	mov	r1, #90
	ldr	r2, .L102+16
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #44]
.L60:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L98:
	cmp	r1, #0
	blt	.L71
	rsb	r3, r0, #160
	cmp	r3, r2
	blt	.L71
	rsb	r3, ip, #240
	cmp	r3, r1
	bge	.L72
	b	.L71
.L61:
	cmp	r1, #0
	ldr	r3, .L102+20
	bne	.L63
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+24
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3, lsl #1
	beq	.L64
	cmp	r3, #1
	beq	.L65
.L66:
	mov	r3, #0
	str	r3, [r5, #16]
	b	.L67
.L100:
	mov	r0, r5
	add	r3, r3, #500
	str	r3, [r10]
	bl	spawnSmallEnemies
	add	r0, r5, #24
	ldr	r1, [r5, #4]
	ldr	r2, [r5]
	ldm	r0, {r0, ip}
	b	.L73
.L63:
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+24
	smull	r2, r3, r0, r3
	ldr	r2, [r5, #44]
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, #3
	sub	r3, r0, r3, lsl #1
	beq	.L101
	cmp	r3, #0
	beq	.L70
	cmp	r3, #1
	beq	.L66
.L65:
	mvn	r4, #0
	str	r4, [r5, #16]
.L67:
	ldr	r2, [r5]
	ldr	r1, [r5, #4]
	ldr	r3, [r5, #20]
	add	r2, r4, r2
	add	r1, r1, r3
	str	r2, [r5]
	str	r1, [r5, #4]
	ldr	r4, [r5, #40]
	b	.L62
.L101:
	cmp	r3, #0
	beq	.L69
	cmp	r3, #1
	beq	.L66
.L64:
	mov	r4, #1
	str	r4, [r5, #16]
	b	.L67
.L70:
	mvn	r3, #1
	mov	r4, r3
	str	r3, [r5, #16]
	b	.L67
.L69:
	mov	r4, #2
	str	r4, [r5, #16]
	b	.L67
.L103:
	.align	2
.L102:
	.word	torpedoes
	.word	collision
	.word	score
	.word	ship
	.word	lives
	.word	rand
	.word	715827883
	.size	updateEnemy.part.0, .-updateEnemy.part.0
	.align	2
	.global	fireTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireTorpedo, %function
fireTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L119
	mov	r2, r0
	ldr	r1, [r2, #36]
	cmp	r1, #0
	mov	r3, #0
	beq	.L117
.L105:
	add	r3, r3, #1
	cmp	r3, #6
	add	r2, r2, #44
	bxeq	lr
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L105
.L117:
	push	{r4, r5, lr}
	mov	lr, #1
	ldr	r4, .L119+4
	ldr	ip, [r4]
	ldr	r5, [r4, #40]
	add	r2, r3, r3, lsl #2
	add	r2, r3, r2, lsl lr
	add	ip, ip, #11
	str	ip, [r0, r2, lsl #2]
	cmp	r5, lr
	add	r2, r0, r2, lsl #2
	str	lr, [r2, #36]
	str	r1, [r2, #40]
	lsl	lr, r3, #2
	beq	.L118
	cmp	r5, #2
	moveq	r5, #3
	ldreq	r1, [r4, #4]
	ldreq	r4, [r4, #28]
	addeq	r1, r1, r4
	subeq	r1, r1, #1
	ldrne	r1, [r2, #4]
	streq	r1, [r2, #4]
	streq	r5, [r2, #20]
.L107:
	add	r2, lr, r3
	add	r3, r3, r2, lsl #1
	add	r3, r0, r3, lsl #2
	str	r1, [r3, #12]
	str	ip, [r3, #8]
	pop	{r4, r5, lr}
	bx	lr
.L118:
	mvn	r5, #2
	ldr	r1, [r4, #4]
	ldr	r4, [r2, #28]
	sub	r1, r1, r4
	str	r1, [r2, #4]
	str	r5, [r2, #20]
	b	.L107
.L120:
	.align	2
.L119:
	.word	torpedoes
	.word	ship
	.size	fireTorpedo, .-fireTorpedo
	.align	2
	.global	updateShip
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShip, %function
updateShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L176
	ldrh	r2, [r3, #48]
	push	{r4, lr}
	ldr	r4, .L176+4
	tst	r2, #32
	ldr	ip, [r4, #40]
	ldrh	r2, [r3, #48]
	bne	.L122
	tst	r2, #64
	moveq	r1, #3
	bne	.L171
.L123:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #20]
	subs	r3, r3, r2
	movpl	r0, #1
	strpl	r3, [r4, #4]
	movmi	r3, #0
	movmi	r0, #1
	strmi	r3, [r4, #4]
.L131:
	cmp	r1, #3
	str	r0, [r4, #40]
	beq	.L142
.L143:
	cmp	r1, #4
	beq	.L134
.L145:
	ldr	r3, [r4, #40]
.L133:
	cmp	ip, r3
	beq	.L135
	cmp	r3, #1
	ldreq	r3, .L176+8
	ldrne	r3, .L176+12
	str	r3, [r4, #32]
.L135:
	ldr	r3, .L176+16
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r3, [r4, #36]
	beq	.L137
	ldr	r2, .L176+20
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L137
	cmp	r3, #0
	ble	.L172
.L137:
	sub	r3, r3, #1
	str	r3, [r4, #36]
.L138:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r4, #48]
	ble	.L121
	tst	r3, #3
	bne	.L140
	ldr	r2, [r4, #48]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r4, #48]
.L140:
	sub	r3, r3, #1
	str	r3, [r4, #44]
.L121:
	pop	{r4, lr}
	bx	lr
.L171:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r1, #4
	movne	r1, #0
	b	.L123
.L122:
	tst	r2, #16
	bne	.L125
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L173
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #28]
	add	r2, r2, r1
	add	r1, r3, r2
	cmp	r1, #240
	str	r2, [r4, #4]
	ble	.L174
	mov	r1, #3
.L146:
	mov	r0, #2
	rsb	r3, r3, #240
	cmp	r1, #3
	str	r3, [r4, #4]
	str	r0, [r4, #40]
	bne	.L143
.L142:
	ldr	r3, [r4, #40]
.L128:
	ldr	r2, [r4]
	ldr	r1, [r4, #16]
	sub	r2, r2, r1
	cmp	r2, #9
	movle	r2, #10
	mov	r1, #3
	str	r2, [r4]
	b	.L133
.L125:
	ldrh	r0, [r3, #48]
	ands	r0, r0, #64
	moveq	r3, ip
	beq	.L128
.L175:
	ldrh	r0, [r3, #48]
	ands	r0, r0, #128
	movne	r0, #0
	movne	r1, r0
	bne	.L145
.L134:
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #24]
	add	r3, r3, r1
	add	r1, r3, r2
	cmp	r1, #160
	rsbgt	r2, r2, #160
	str	r3, [r4]
	mov	r1, #4
	ldr	r3, [r4, #40]
	strgt	r2, [r4]
	b	.L133
.L173:
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	ldrh	r1, [r3, #48]
	ldr	r3, [r4, #28]
	add	r2, r2, r0
	tst	r1, #128
	add	r0, r2, r3
	moveq	r1, #4
	movne	r1, #0
	cmp	r0, #240
	str	r2, [r4, #4]
	bgt	.L146
	mov	r0, #2
	str	r0, [r4, #40]
	b	.L143
.L172:
	bl	fireTorpedo
	mov	r3, #16
	str	r3, [r4, #36]
	b	.L138
.L174:
	mov	r0, #2
	str	r0, [r4, #40]
	b	.L142
.L177:
	.align	2
.L176:
	.word	67109120
	.word	ship
	.word	submarine_left
	.word	submarine_right
	.word	oldButtons
	.word	buttons
	.size	updateShip, .-updateShip
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
	ldr	r1, .L202
	ldr	r3, [r1]
	cmp	r3, #0
	movle	r3, #59
	ldrle	r0, .L202+4
	ldrle	r2, [r0]
	addle	r2, r2, #10
	push	{r4, r5, r6, lr}
	strle	r2, [r0]
	ldr	r0, .L202+8
	ldr	r2, [r0]
	subgt	r3, r3, #1
	cmp	r2, #0
	subgt	r2, r2, #1
	str	r3, [r1]
	strgt	r2, [r0]
	ble	.L201
.L182:
	bl	updateShip
	mov	ip, #0
	ldr	r3, .L202+12
	add	r1, r3, #264
.L186:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L184
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #20]
	add	r2, r2, r0
	cmp	r2, #239
	str	r2, [r3, #4]
	strhi	ip, [r3, #36]
.L184:
	add	r3, r3, #44
	cmp	r3, r1
	bne	.L186
	ldr	r4, .L202+16
	add	r5, r4, #260
.L188:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r1, #0
	movne	r0, r4
	blne	updateEnemy.part.0
.L187:
	add	r4, r4, #52
	cmp	r4, r5
	bne	.L188
	ldr	r4, .L202+20
	add	r5, r4, #520
.L190:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r1, #1
	movne	r0, r4
	blne	updateEnemy.part.0
.L189:
	add	r4, r4, #52
	cmp	r5, r4
	bne	.L190
	pop	{r4, r5, r6, lr}
	bx	lr
.L201:
	bl	spawnEnemy
	b	.L182
.L203:
	.align	2
.L202:
	.word	timer
	.word	score
	.word	spawnDelay
	.word	torpedoes
	.word	enemies
	.word	smallEnemies
	.size	updateGame, .-updateGame
	.align	2
	.global	updateTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTorpedo, %function
updateTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #20]
	add	r3, r3, r2
	cmp	r3, #239
	str	r3, [r0, #4]
	movhi	r3, #0
	strhi	r3, [r0, #36]
	bx	lr
	.size	updateTorpedo, .-updateTorpedo
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
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.0
	.size	updateEnemy, .-updateEnemy
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
	mov	r6, #0
	sub	sp, sp, #12
	ldr	r5, .L212
	mov	r3, #8
	mov	r2, #6
	mov	r1, #1
	mov	r0, #37
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	ldr	r3, .L212+4
	ldr	r2, [r3]
	ldr	r4, .L212+8
	add	r2, r2, #48
	mov	r3, r4
	mov	r1, #1
	mov	r0, #37
	ldr	r7, .L212+12
	and	r2, r2, #255
	mov	lr, pc
	bx	r7
	mov	r3, #8
	mov	r2, #36
	mov	r1, #1
	mov	r0, #107
	str	r6, [sp]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	str	r4, [sp]
	ldr	r3, .L212+16
	mov	r0, r1
	mov	r2, #22
	ldr	r3, [r3]
	ldr	r4, .L212+20
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L213:
	.align	2
.L212:
	.word	drawRect
	.word	lives
	.word	32767
	.word	drawChar
	.word	score
	.word	drawScore
	.size	drawHUD, .-drawHUD
	.align	2
	.global	drawShip
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShip, %function
drawShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L218
	ldr	r2, [r4, #48]
	ldr	r3, .L218+4
	cmp	r2, #0
	mov	r0, r4
	ldrh	r1, [r3]
	bne	.L215
	ldr	r3, .L218+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L218+12
	mov	lr, pc
	bx	r3
.L216:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	pop	{r4, lr}
	bx	lr
.L215:
	ldr	r3, .L218+16
	mov	lr, pc
	bx	r3
	b	.L216
.L219:
	.align	2
.L218:
	.word	ship
	.word	.LANCHOR0
	.word	eraseMovingSprite
	.word	drawSprite
	.word	eraseFullSprite
	.size	drawShip, .-drawShip
	.align	2
	.global	drawTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTorpedo, %function
drawTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L224
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L225
.L222:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L225:
	ldr	r3, .L226
	ldrh	r2, [r3]
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L226+4
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L222
.L224:
	ldr	r3, .L226
	ldrh	r2, [r3]
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L226+4
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L222
.L227:
	.align	2
.L226:
	.word	.LANCHOR0
	.word	drawRect
	.size	drawTorpedo, .-drawTorpedo
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #20
	beq	.L229
	ldr	r3, [r0, #40]
	cmp	r3, #0
	ldr	r0, [r0, #4]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	bne	.L236
.L230:
	ldr	ip, [r4, #48]
	ldr	r5, .L237
	str	ip, [sp]
	mov	lr, pc
	bx	r5
.L231:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L229:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bne	.L231
	ldr	r3, .L237+4
	ldrh	r2, [r3]
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r5, .L237+8
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L231
.L236:
	ldr	ip, .L237+4
	ldrh	ip, [ip]
	stm	sp, {r2, r3, ip}
	ldr	r5, .L237+12
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	b	.L230
.L238:
	.align	2
.L237:
	.word	drawImage
	.word	.LANCHOR0
	.word	drawRect
	.word	eraseMovingImage
	.size	drawEnemy, .-drawEnemy
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
	push	{r4, r5, r6, lr}
	bl	drawHUD
	bl	drawShip
	ldr	r0, .L243
	bl	drawTorpedo
	ldr	r0, .L243+4
	bl	drawTorpedo
	ldr	r0, .L243+8
	bl	drawTorpedo
	ldr	r0, .L243+12
	bl	drawTorpedo
	ldr	r0, .L243+16
	bl	drawTorpedo
	ldr	r0, .L243+20
	bl	drawTorpedo
	ldr	r0, .L243+24
	bl	drawEnemy
	ldr	r0, .L243+28
	bl	drawEnemy
	ldr	r0, .L243+32
	bl	drawEnemy
	ldr	r0, .L243+36
	bl	drawEnemy
	ldr	r0, .L243+40
	bl	drawEnemy
	ldr	r4, .L243+44
	add	r5, r4, #520
.L240:
	mov	r0, r4
	add	r4, r4, #52
	bl	drawEnemy
	cmp	r4, r5
	bne	.L240
	pop	{r4, r5, r6, lr}
	bx	lr
.L244:
	.align	2
.L243:
	.word	torpedoes
	.word	torpedoes+44
	.word	torpedoes+88
	.word	torpedoes+132
	.word	torpedoes+176
	.word	torpedoes+220
	.word	enemies
	.word	enemies+52
	.word	enemies+104
	.word	enemies+156
	.word	enemies+208
	.word	smallEnemies
	.size	drawGame, .-drawGame
	.comm	timer,4,4
	.global	hiscore
	.comm	score,4,4
	.comm	spawnDelay,4,4
	.comm	lives,4,4
	.global	bgColor
	.comm	smallEnemies,520,4
	.comm	enemies,260,4
	.comm	torpedoes,264,4
	.comm	ship,52,4
	.data
	.align	1
	.set	.LANCHOR0,. + 0
	.type	bgColor, %object
	.size	bgColor, 2
bgColor:
	.short	31744
	.bss
	.align	2
	.type	hiscore, %object
	.size	hiscore, 4
hiscore:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
