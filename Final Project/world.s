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
	@ link register save eliminated.
	cmp	r0, #0
	bxeq	lr
	mov	r1, #0
	ldr	r3, .L7
	ldr	r3, [r3]
	ldr	r2, .L7+4
	add	r0, r3, r3, lsl #2
	add	r3, r3, r0, lsl #1
	ldr	r0, .L7+8
	add	r3, r2, r3, lsl #2
	str	r1, [r3, #32]
	str	r1, [r0]
	bx	lr
.L8:
	.align	2
.L7:
	.word	opponentIdx
	.word	enemies
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
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r6, #8192
	mov	r5, #2048
	mov	r4, #128
	mov	lr, #32
	mov	ip, #16
	mov	r0, #8
	mov	r1, #1
	ldr	r3, .L11
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r3, .L17
.L14:
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
	bne	.L14
	bx	lr
.L18:
	.align	2
.L17:
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
	ldr	r3, .L23
	ldr	r1, [r3, #4]
	ldr	ip, .L23+4
	ldr	r3, .L23+8
	ldr	r0, .L23+12
	add	r1, r1, r1, lsl #2
	ldr	r2, .L23+16
	rsb	r1, r1, r1, lsl #3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	r1, r1, r1, lsl #4
	add	r9, r3, #2192
	ldr	fp, [ip]
	ldr	r10, [r0]
	add	r2, r2, r1, lsl #3
	add	r9, r9, #8
.L20:
	ldr	r1, [r2]
	ldr	r0, [r2, #4]
	add	r4, r2, #32
	str	r1, [r3]
	ldr	r8, [r2, #16]
	ldr	r7, [r2, #20]
	ldr	r6, [r2, #24]
	ldr	r5, [r2, #28]
	ldm	r4, {r4, lr}
	ldr	ip, [r2, #40]
	rsb	r1, fp, r1, asr #6
	str	r1, [r3, #8]
	rsb	r1, r10, r0, asr #6
	str	r0, [r3, #4]
	str	r1, [r3, #12]
	str	r8, [r3, #16]
	str	r7, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	str	lr, [r3, #36]
	str	ip, [r3, #40]
	add	r3, r3, #44
	cmp	r3, r9
	add	r2, r2, #44
	bne	.L20
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.word	bg2xOff
	.word	enemies
	.word	bg2yOff
	.word	levels
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initMines
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMines, %function
initMines:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #16
	ldr	r3, .L29
	ldr	r1, [r3, #4]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r0, .L29+4
	ldr	lr, .L29+8
	add	r1, r1, r1, lsl #2
	ldr	r2, .L29+12
	ldr	r3, .L29+16
	rsb	r1, r1, r1, lsl #3
	rsb	r1, r1, r1, lsl #4
	ldr	r10, [lr]
	ldr	r9, [r0]
	add	r2, r2, r1, lsl #3
	add	fp, r3, #2000
.L26:
	ldr	r0, [r2, #2200]
	ldr	r1, [r2, #2204]
	ldr	r6, [r2, #2216]
	ldr	r5, [r2, #2220]
	ldr	r4, [r2, #2232]
	ldr	lr, [r2, #2236]
	rsb	r8, r10, r0, asr #6
	rsb	r7, r9, r1, asr #6
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r7, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #32]
	str	lr, [r3, #36]
	stm	r3, {r0, r1, r8}
	add	r3, r3, #40
	cmp	r3, fp
	add	r2, r2, #40
	bne	.L26
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.word	bg2yOff
	.word	bg2xOff
	.word	levels
	.word	mines
	.size	initMines, .-initMines
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #0
	mov	r4, #1
	mov	r10, #8192
	mov	r9, #2048
	mov	r8, #128
	mov	r7, #32
	mov	r6, #16
	mov	r5, #8
	mov	r1, lr
	mov	r2, lr
	mov	ip, r4
	mov	r0, #2
	ldr	r3, .L35
	str	lr, [r3, #4]
	str	lr, [r3]
	ldr	r3, .L35+4
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #8]
	str	r7, [r3, #12]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	ldr	r3, .L35+8
.L32:
	add	r1, r1, #1
	cmp	r1, #5
	str	r1, [r3, #36]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #24]
	str	ip, [r3, #28]
	str	r2, [r3, #32]
	add	r3, r3, #40
	bne	.L32
	bl	initEnemies
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initMines
.L36:
	.align	2
.L35:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L58
	ldr	r6, .L58+4
	ldr	r7, .L58+8
	sub	sp, sp, #16
	b	.L40
.L38:
	add	r5, r5, #1
	cmp	r5, #50
	add	r4, r4, #44
	beq	.L57
.L40:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L38
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldm	r4, {ip, lr}
	add	r2, r6, #24
	ldm	r2, {r2, r3}
	lsl	r0, r0, #6
	stm	sp, {ip, lr}
	lsl	r1, r1, #6
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	lsl	r3, r3, #6
	ldm	r6, {r0, r1}
	lsl	r2, r2, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L38
	mov	r1, #1
	ldr	r2, .L58+12
	ldr	r3, .L58+16
	str	r1, [r2]
	str	r5, [r3]
.L37:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	ldr	r4, .L58+20
	ldr	r5, .L58+4
	ldr	r7, .L58+8
	ldr	r8, .L58+24
	add	r6, r4, #2000
	b	.L44
.L42:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L37
.L44:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L42
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldm	r4, {ip, lr}
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	lsl	r0, r0, #6
	stm	sp, {ip, lr}
	lsl	r1, r1, #6
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	lsl	r3, r3, #6
	ldm	r5, {r0, r1}
	lsl	r2, r2, #6
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L42
	mov	r2, #0
	ldr	r3, [r8]
	ldr	r1, [r4, #36]
	sub	r3, r3, r1
	str	r3, [r8]
	str	r2, [r4, #32]
	b	.L42
.L59:
	.align	2
.L58:
	.word	enemies
	.word	player
	.word	collision
	.word	.LANCHOR0
	.word	opponentIdx
	.word	mines
	.word	submarineHp
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
	ldr	r4, .L103
	ldr	r8, [r4, #16]
	ldr	r3, [r4]
	add	r7, r4, #20
	adds	r2, r3, r8
	movmi	r2, #0
	ldm	r7, {r7, ip}
	sub	sp, sp, #8
	rsbmi	r8, r3, #0
	bmi	.L62
	add	r1, r2, ip, lsl #6
	cmp	r1, #65536
	subgt	r1, r1, #65536
	subgt	r8, r8, r1
	addgt	r2, r3, r8
	asr	r2, r2, #6
.L62:
	ldr	r1, [r4, #4]
	adds	r3, r1, r7
	movmi	r3, #0
	ldr	r0, [r4, #28]
	rsbmi	r7, r1, #0
	bmi	.L65
	add	lr, r1, r0, lsl #6
	cmp	lr, #65536
	lsl	lr, r0, #6
	addgt	r3, r3, lr
	subgt	r3, r3, #65536
	subgt	r7, r7, r3
	addgt	r3, r1, r7
	asr	r3, r3, #6
.L65:
	ldr	r10, .L103+4
	str	r0, [sp, #4]
	mov	r1, #1024
	str	ip, [sp]
	ldr	r0, [r10]
	ldr	r9, .L103+8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bgt	.L97
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
.L71:
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
	ldr	r5, .L103+12
	ldr	r0, [r5]
	strgt	r2, [r4, #20]
	rsb	r1, r0, r8, asr #6
	cmp	r0, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, #78
	movgt	r2, #0
	ldr	lr, .L103+16
	ldr	ip, [lr]
	cmp	r2, #0
	rsb	r2, ip, r3, asr #6
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	ldr	r6, [r4, #24]
	asr	r8, r8, #6
	asr	r3, r3, #6
	bne	.L98
.L74:
	add	r0, r1, r6
	cmp	r0, #159
	bgt	.L99
.L77:
	cmp	r2, #51
	movle	r1, #1
	movgt	r1, #0
	cmp	ip, #0
	movle	r1, #0
	cmp	r1, #0
	ldr	r1, [r4, #28]
	bne	.L100
.L80:
	add	r3, r2, r1
	cmp	r3, #105
	ble	.L60
	ldr	r0, [lr]
	cmp	r0, #864
	blt	.L82
.L60:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L99:
	ldr	r7, [r5]
	cmp	r7, #784
	bge	.L77
.L76:
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
	b	.L77
.L100:
	rsb	r5, r2, #52
	cmp	ip, r5
	bge	.L101
	mov	r0, #0
	sub	r2, r3, r5
	add	r3, r2, r1
	cmp	r3, #105
	str	r2, [r4, #12]
	str	r0, [lr]
	ble	.L60
.L82:
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
.L97:
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
	ldr	r0, [r10]
	mov	r1, #1024
	asr	r2, r2, #6
	asr	r3, r3, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r6, r6, #2
	asr	r5, r5, #2
	bgt	.L102
.L68:
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
	b	.L71
.L98:
	rsb	r9, r1, #79
	cmp	r0, r9
	blt	.L75
	mov	r1, #79
	sub	r0, r0, r9
	str	r0, [r5]
	str	r1, [r4, #8]
	b	.L74
.L75:
	mov	r7, #0
	sub	r1, r8, r9
	add	r0, r1, r6
	cmp	r0, #159
	str	r1, [r4, #8]
	str	r7, [r5]
	bgt	.L76
	b	.L77
.L101:
	mov	r2, #52
	sub	r3, ip, r5
	str	r3, [lr]
	str	r2, [r4, #12]
	b	.L80
.L102:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	add	r5, r7, r7, lsr #31
	add	r6, r8, r8, lsr #31
	add	r3, r3, r5, asr #1
	add	r2, r2, r6, asr #1
	str	r0, [sp, #4]
	str	r1, [sp]
	ldr	r0, [r10]
	mov	r1, #1024
	asr	r3, r3, #6
	asr	r2, r2, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r5, r5, #1
	asr	r6, r6, #1
	ble	.L68
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
	ldr	r0, [r10]
	mov	r1, #1024
	asr	r2, r2, #6
	asr	r3, r3, #6
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	asr	r6, r8, #2
	asr	r7, r7, #2
	ble	.L70
	mov	r5, #0
	ldr	r8, [r4]
	mov	r6, r5
	ldr	r3, [r4, #4]
	b	.L71
.L70:
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
	b	.L71
.L104:
	.align	2
.L103:
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
	mov	r0, #2048
	ldr	r2, .L106
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L106+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L107:
	.align	2
.L106:
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
	ldr	lr, .L117
	ldr	r3, [lr, #32]
	cmp	r3, #1
	moveq	r4, #96
	mvnne	r4, #95
	mov	r3, #0
	ldrne	ip, .L117+4
	ldr	r2, [lr]
	ldreq	r0, [lr, #24]
	ldrne	r0, [ip, #24]
	addeq	r0, r2, r0, lsl #6
	subne	r0, r2, r0, lsl #6
	ldreq	ip, .L117+4
	ldr	r2, .L117+4
.L113:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	beq	.L116
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #40
	bne	.L113
	pop	{r4, r5, lr}
	bx	lr
.L116:
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
.L118:
	.align	2
.L117:
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
	ldr	r1, .L162
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L162+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L120
	tst	r0, #32
	bne	.L121
	ldrh	r1, [r1, #48]
	sub	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L122
.L156:
	sub	r3, r3, #20
	str	r3, [r4, #20]
.L123:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L145
.L146:
	str	r1, [r4, #16]
.L135:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L137
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L137:
	bl	movePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movgt	r3, #1
	strgt	r3, [r4, #32]
	bgt	.L139
	movne	r3, #0
	strne	r3, [r4, #32]
.L139:
	ldr	r3, .L162+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L140
	ldr	r3, .L162+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L158
.L140:
	mov	r0, #2048
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L162+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L120:
	tst	r0, #32
	bne	.L124
	ldrh	r1, [r1, #48]
	sub	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L125
.L154:
	sub	r3, r3, #10
	str	r3, [r4, #20]
.L126:
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L146
.L145:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L135
.L124:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L159
.L142:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #16]
	ble	.L160
	ldr	r0, .L162
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L161
.L129:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L131
	cmp	r1, #0
	beq	.L157
.L155:
	add	r3, r3, #10
	str	r3, [r4, #20]
	b	.L126
.L121:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L142
	ldrh	r1, [r1, #48]
	add	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L156
.L122:
	ldr	r1, .L162
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L157
	mov	r1, #0
.L131:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	bgt	.L134
	addne	r3, r3, #1
	strne	r3, [r4, #20]
.L134:
	cmp	r1, #0
	bne	.L126
	b	.L123
.L159:
	ldrh	r1, [r1, #48]
	add	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L154
.L125:
	ldr	r1, .L162
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L155
	mov	r1, #1
	b	.L131
.L161:
	cmp	r1, #0
	beq	.L156
	b	.L154
.L160:
	ldr	r0, .L162
	ldrh	ip, [r0, #48]
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L129
	b	.L161
.L157:
	add	r3, r3, #20
	str	r3, [r4, #20]
	b	.L123
.L158:
	bl	firePlayer
	b	.L140
.L163:
	.align	2
.L162:
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
	blt	.L165
	ldr	ip, [r0, #24]
	add	r1, r3, ip, lsl #6
	cmp	r1, #65536
	movle	r1, #0
	movgt	r1, #1
	orrs	r1, r1, r2, lsr #31
	beq	.L176
.L165:
	mov	lr, #0
	ldr	ip, .L177
	ldr	r1, .L177+4
	ldr	ip, [ip]
	ldr	r1, [r1]
	rsb	r3, ip, r3, asr #6
	rsb	r2, r1, r2, asr #6
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	str	lr, [r0, #32]
	ldr	r1, [r0, #36]
.L167:
	mov	r2, #512
	ldr	r3, .L177+8
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
.L164:
	pop	{r4, lr}
	bx	lr
.L176:
	ldr	r4, [r0, #28]
	add	r1, r2, r4, lsl #6
	cmp	r1, #65536
	bgt	.L165
	ldr	r1, .L177
	ldr	lr, .L177+4
	ldr	r1, [r1]
	ldr	lr, [lr]
	rsb	r3, r1, r3, asr #6
	ldr	r1, [r0, #32]
	rsb	r2, lr, r2, asr #6
	cmp	r1, #0
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	ldr	r1, [r0, #36]
	beq	.L167
	add	ip, r3, ip
	cmp	ip, #0
	movgt	ip, #1
	movle	ip, #0
	cmp	r3, #240
	movgt	ip, #0
	cmp	ip, #0
	beq	.L167
	add	r4, r2, r4
	cmp	r4, #0
	movgt	r4, #1
	movle	r4, #0
	cmp	r2, #160
	movgt	r4, #0
	cmp	r4, #0
	beq	.L167
	ldr	r0, .L177+8
	ldr	ip, .L177+12
	lsl	r3, r3, #23
	lsl	lr, r1, #3
	lsr	r3, r3, #23
	add	r1, r0, r1, lsl #3
	and	r2, r2, #255
	strh	r2, [r0, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L164
.L178:
	.align	2
.L177:
	.word	bg2xOff
	.word	bg2yOff
	.word	shadowOAM
	.word	2568
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
	ldr	r3, .L192
	ldr	lr, [r0, #20]
	ldr	ip, .L192+4
	add	r2, r2, lr
	ldr	r3, [r3]
	ldr	ip, [ip]
	ldr	lr, [r0, #32]
	rsb	r3, r3, r1, asr #6
	rsb	ip, ip, r2, asr #6
	cmp	lr, #0
	stm	r0, {r1, r2, r3, ip}
	beq	.L179
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r3, #240
	movgt	r2, #0
	cmp	r2, #0
	bne	.L191
.L179:
	pop	{r4, lr}
	bx	lr
.L191:
	ldr	r2, [r0, #28]
	add	r2, ip, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	ip, #160
	movgt	r2, #0
	cmp	r2, #0
	beq	.L179
	ldr	r0, .L192+8
	ldr	r2, [r0, #8]
	cmp	r2, #9
	bgt	.L179
	mov	r4, #2064
	ldr	lr, .L192+12
	add	r1, r2, #6
	and	ip, ip, #255
	add	r2, r2, #1
	lsl	r3, r3, #23
	str	r2, [r0, #8]
	orr	ip, ip, #16384
	add	r2, lr, r1, lsl #3
	lsr	r3, r3, #23
	lsl	r0, r1, #3
	strh	ip, [lr, r0]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	b	.L179
.L193:
	.align	2
.L192:
	.word	bg2xOff
	.word	bg2yOff
	.word	.LANCHOR0
	.word	shadowOAM
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMine, %function
updateMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0]
	ldr	ip, [r0, #16]
	push	{r4, lr}
	add	r1, r1, ip
	ldr	r2, [r0, #4]
	ldr	ip, [r0, #20]
	ldr	r3, .L207
	ldr	lr, .L207+4
	add	r2, r2, ip
	ldr	r3, [r3]
	ldr	lr, [lr]
	ldr	ip, [r0, #32]
	rsb	r3, r3, r1, asr #6
	rsb	lr, lr, r2, asr #6
	cmp	ip, #0
	stm	r0, {r1, r2, r3, lr}
	beq	.L194
	ldr	r2, [r0, #24]
	add	r2, r3, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r3, #240
	movgt	r2, #0
	cmp	r2, #0
	bne	.L206
.L194:
	pop	{r4, lr}
	bx	lr
.L206:
	ldr	r2, [r0, #28]
	add	r2, lr, r2
	cmp	r2, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	lr, #160
	movgt	r2, #0
	cmp	r2, #0
	beq	.L194
	ldr	ip, .L207+8
	ldr	r1, [ip, #12]
	cmp	r1, #9
	bgt	.L194
	add	r0, r1, #24
	ldr	r4, .L207+12
	add	r1, r1, #1
	lsl	r3, r3, #23
	str	r1, [ip, #12]
	lsr	r3, r3, #23
	ldr	ip, .L207+16
	and	r2, lr, #255
	add	r1, r4, r0, lsl #3
	orr	r3, r3, #16384
	lsl	lr, r0, #3
	strh	r2, [r4, lr]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L194
.L208:
	.align	2
.L207:
	.word	bg2xOff
	.word	bg2yOff
	.word	.LANCHOR0
	.word	shadowOAM
	.word	2328
	.size	updateMine, .-updateMine
	.align	2
	.global	freeEnemySprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	freeEnemySprites, %function
freeEnemySprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #512
	mov	r0, #0
	ldr	r3, .L210
	ldr	r1, .L210+4
	strh	r2, [r3, #48]	@ movhi
	strh	r2, [r3, #56]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	strh	r2, [r3, #72]	@ movhi
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #112]	@ movhi
	strh	r2, [r3, #120]	@ movhi
	str	r0, [r1, #8]
	bx	lr
.L211:
	.align	2
.L210:
	.word	shadowOAM
	.word	.LANCHOR0
	.size	freeEnemySprites, .-freeEnemySprites
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
	ldr	ip, .L218
	ldr	r3, [ip, #8]
	cmp	r3, #9
	bxgt	lr
	push	{r4, lr}
	mov	r4, #2064
	ldr	r1, [r0, #8]
	ldr	lr, .L218+4
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	add	r2, r3, #6
	lsl	r1, r1, #23
	add	r3, r3, #1
	str	r3, [ip, #8]
	lsr	r1, r1, #23
	add	r3, lr, r2, lsl #3
	orr	r0, r0, #16384
	lsl	ip, r2, #3
	strh	r0, [lr, ip]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L219:
	.align	2
.L218:
	.word	.LANCHOR0
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	freeMineSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	freeMineSprites, %function
freeMineSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #512
	mov	r0, #0
	ldr	r2, .L222
	ldr	r1, .L222+4
	str	lr, [sp, #-4]!
	add	ip, r2, #264
	add	lr, r2, #256
	strh	r3, [lr]	@ movhi
	strh	r3, [r2, #192]	@ movhi
	strh	r3, [r2, #200]	@ movhi
	strh	r3, [r2, #208]	@ movhi
	strh	r3, [r2, #216]	@ movhi
	strh	r3, [r2, #224]	@ movhi
	strh	r3, [r2, #232]	@ movhi
	strh	r3, [r2, #240]	@ movhi
	strh	r3, [r2, #248]	@ movhi
	ldr	lr, [sp], #4
	strh	r3, [ip]	@ movhi
	str	r0, [r1, #12]
	bx	lr
.L223:
	.align	2
.L222:
	.word	shadowOAM
	.word	.LANCHOR0
	.size	freeMineSprites, .-freeMineSprites
	.align	2
	.global	drawMine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMine, %function
drawMine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L230
	ldr	r2, [ip, #12]
	cmp	r2, #9
	bxgt	lr
	push	{r4, lr}
	ldr	r3, [r0, #8]
	ldr	lr, .L230+4
	lsl	r3, r3, #23
	ldrb	r4, [r0, #12]	@ zero_extendqisi2
	add	r1, r2, #24
	ldr	r0, .L230+8
	add	r2, r2, #1
	lsr	r3, r3, #23
	str	r2, [ip, #12]
	orr	r3, r3, #16384
	add	r2, lr, r1, lsl #3
	lsl	ip, r1, #3
	strh	r4, [lr, ip]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L231:
	.align	2
.L230:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	2328
	.size	drawMine, .-drawMine
	.align	2
	.global	tilesRed
	.syntax unified
	.arm
	.fpu softvfp
	.type	tilesRed, %function
tilesRed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L239
	ldr	r3, [r3]
	mul	r0, r3, r0
	ldr	r1, .L239+4
	str	lr, [sp, #-4]!
	smull	r2, lr, r1, r0
	ldr	r2, .L239+8
	asr	ip, r0, #31
	ldr	r2, [r2]
	rsb	ip, ip, lr, asr #3
	cmp	ip, r2
	movge	r0, #0
	bge	.L232
	add	r0, r3, r0
	smull	ip, lr, r1, r0
	asr	ip, r0, #31
	rsb	ip, ip, lr, asr #3
	cmp	r2, ip
	movle	r0, #1
	ble	.L232
	add	r0, r3, r0
	smull	ip, lr, r1, r0
	asr	ip, r0, #31
	rsb	ip, ip, lr, asr #3
	cmp	r2, ip
	movle	r0, #2
	ble	.L232
	add	r0, r3, r0
	smull	r3, r1, r0, r1
	asr	r0, r0, #31
	rsb	r0, r0, r1, asr #3
	cmp	r2, r0
	movgt	r0, #4
	movle	r0, #3
.L232:
	ldr	lr, [sp], #4
	bx	lr
.L240:
	.align	2
.L239:
	.word	submarineMaxHp
	.word	1321528399
	.word	submarineHp
	.size	tilesRed, .-tilesRed
	.align	2
	.global	updateHealthBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHealthBar, %function
updateHealthBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L247
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, [r3]
	cmp	r7, #0
	movle	r1, #800
	movgt	r1, #768
	mov	r2, #16
	mov	r8, #2
	ldr	r4, .L247+4
	ldr	r6, .L247+8
	ldr	r3, .L247+12
	mov	r0, #1
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #130]	@ movhi
	strh	r3, [r4, #138]	@ movhi
	strh	r8, [r4, #128]	@ movhi
	strh	r6, [r4, #136]	@ movhi
	bl	tilesRed
	ldr	r5, .L247+16
	ldr	r3, .L247+20
	sub	r0, r5, r0
	strh	r0, [r4, #140]	@ movhi
	mov	r0, #5
	strh	r3, [r4, #146]	@ movhi
	strh	r6, [r4, #144]	@ movhi
	bl	tilesRed
	ldr	r3, .L247+24
	sub	r0, r5, r0
	strh	r0, [r4, #148]	@ movhi
	mov	r0, #9
	strh	r3, [r4, #154]	@ movhi
	strh	r6, [r4, #152]	@ movhi
	bl	tilesRed
	ldr	r3, .L247+28
	sub	r0, r5, r0
	strh	r0, [r4, #156]	@ movhi
	mov	r0, #13
	strh	r3, [r4, #162]	@ movhi
	strh	r6, [r4, #160]	@ movhi
	bl	tilesRed
	ldr	r3, .L247+32
	sub	r0, r5, r0
	strh	r0, [r4, #164]	@ movhi
	mov	r0, #17
	strh	r3, [r4, #170]	@ movhi
	strh	r6, [r4, #168]	@ movhi
	bl	tilesRed
	ldr	r3, .L247+36
	sub	r0, r5, r0
	strh	r0, [r4, #172]	@ movhi
	mov	r0, #21
	strh	r3, [r4, #178]	@ movhi
	strh	r6, [r4, #176]	@ movhi
	bl	tilesRed
	ldr	r3, .L247+40
	ldr	r3, [r3]
	ldr	r2, .L247+44
	add	r3, r3, r3, lsl r8
	add	r3, r3, r3, lsl r8
	smull	r1, r2, r3, r2
	asr	r3, r3, #31
	rsb	r3, r3, r2, asr #3
	cmp	r7, r3
	movgt	r3, #768
	movle	r3, #800
	ldr	r2, .L247+48
	sub	r5, r5, r0
	strh	r5, [r4, #180]	@ movhi
	strh	r8, [r4, #184]	@ movhi
	strh	r3, [r4, #188]	@ movhi
	strh	r2, [r4, #186]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L248:
	.align	2
.L247:
	.word	submarineHp
	.word	shadowOAM
	.word	16386
	.word	16408
	.word	773
	.word	16440
	.word	16472
	.word	16504
	.word	16536
	.word	16568
	.word	submarineMaxHp
	.word	1321528399
	.word	4312
	.size	updateHealthBar, .-updateHealthBar
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
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	ldr	r4, .L272
	add	r5, r4, #200
.L251:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L269
.L250:
	add	r4, r4, #40
	cmp	r5, r4
	bne	.L251
	mov	r3, #512
	mov	r2, #0
	ldr	r4, .L272+4
	ldr	r6, .L272+8
	ldr	r7, .L272+12
	add	r5, r4, #2192
	strh	r3, [r6, #48]	@ movhi
	strh	r3, [r6, #56]	@ movhi
	strh	r3, [r6, #64]	@ movhi
	strh	r3, [r6, #72]	@ movhi
	strh	r3, [r6, #80]	@ movhi
	strh	r3, [r6, #88]	@ movhi
	strh	r3, [r6, #96]	@ movhi
	strh	r3, [r6, #104]	@ movhi
	strh	r3, [r6, #112]	@ movhi
	strh	r3, [r6, #120]	@ movhi
	str	r2, [r7, #8]
	add	r5, r5, #8
	b	.L253
.L252:
	add	r4, r4, #44
	cmp	r5, r4
	beq	.L270
.L253:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L252
	mov	r0, r4
	add	r4, r4, #44
	bl	updateEnemy
	cmp	r5, r4
	bne	.L253
.L270:
	mov	r3, #512
	mov	r1, #0
	ldr	r2, .L272+16
	strh	r3, [r6, #192]	@ movhi
	strh	r3, [r6, #200]	@ movhi
	strh	r3, [r6, #208]	@ movhi
	strh	r3, [r6, #216]	@ movhi
	strh	r3, [r6, #224]	@ movhi
	strh	r3, [r6, #232]	@ movhi
	strh	r3, [r6, #240]	@ movhi
	strh	r3, [r6, #248]	@ movhi
	ldr	r4, .L272+20
	strh	r3, [r2], #8	@ movhi
	add	r5, r4, #2000
	strh	r3, [r2]	@ movhi
	str	r1, [r7, #12]
	b	.L255
.L254:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L271
.L255:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L254
	mov	r0, r4
	add	r4, r4, #40
	bl	updateMine
	cmp	r4, r5
	bne	.L255
.L271:
	bl	doCollision
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateHealthBar
.L269:
	mov	r0, r4
	bl	updateBullet
	b	.L250
.L273:
	.align	2
.L272:
	.word	bullets
	.word	enemies
	.word	shadowOAM
	.word	.LANCHOR0
	.word	shadowOAM+256
	.word	mines
	.size	updateWorld, .-updateWorld
	.global	drawnMines
	.global	drawnEnemies
	.comm	opponentIdx,4,4
	.global	doBattle
	.global	level
	.comm	mines,2000,4
	.comm	enemies,2200,4
	.comm	bullets,200,4
	.comm	player,36,4
	.global	collisionMap
	.global	levels
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	world1collisionBitmap
	.type	levels, %object
	.size	levels, 4200
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
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	6400
	.word	5120
	.space	24
	.word	1
	.word	90
	.word	6400
	.word	6400
	.space	24
	.word	1
	.word	10
	.word	7680
	.word	5120
	.space	24
	.word	1
	.word	10
	.word	7680
	.word	6400
	.space	24
	.word	1
	.word	10
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.space	120
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
	.type	drawnEnemies, %object
	.size	drawnEnemies, 4
drawnEnemies:
	.space	4
	.type	drawnMines, %object
	.size	drawnMines, 4
drawnMines:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
