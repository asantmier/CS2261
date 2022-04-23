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
	mov	r1, #0
	ldr	r3, .L3
	ldr	r3, [r3]
	ldr	r2, .L3+4
	add	r0, r3, r3, lsl #2
	add	r3, r3, r0, lsl #1
	ldr	r0, .L3+8
	add	r3, r2, r3, lsl #2
	str	r1, [r3, #32]
	str	r1, [r0]
	bx	lr
.L4:
	.align	2
.L3:
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
	ldr	r3, .L7
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
.L8:
	.align	2
.L7:
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
	ldr	r3, .L13
.L10:
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
	bne	.L10
	bx	lr
.L14:
	.align	2
.L13:
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
	ldr	r3, .L19
	ldr	r1, [r3, #4]
	ldr	ip, .L19+4
	ldr	r0, .L19+8
	ldr	r2, .L19+12
	ldr	r3, .L19+16
	add	r1, r1, r1, lsl #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	rsb	r1, r1, r1, lsl #6
	ldr	fp, [ip]
	ldr	r10, [r0]
	add	r2, r2, r1, lsl #4
	add	r9, r3, #2640
.L16:
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
	bne	.L16
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	bg2xOff
	.word	bg2yOff
	.word	levels
	.word	enemies
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
	mov	ip, #8
	ldr	r3, .L25
	ldr	r1, [r3, #4]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r0, .L25+4
	ldr	lr, .L25+8
	ldr	r2, .L25+12
	ldr	r3, .L25+16
	add	r1, r1, r1, lsl #2
	rsb	r1, r1, r1, lsl #6
	ldr	r10, [lr]
	ldr	r9, [r0]
	add	r2, r2, r1, lsl #4
	add	fp, r3, #2400
.L22:
	add	r0, r2, #2640
	ldm	r0, {r0, r1}
	add	r4, r2, #2672
	ldr	r6, [r2, #2656]
	ldr	r5, [r2, #2660]
	ldm	r4, {r4, lr}
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
	bne	.L22
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r3, .L31
	str	lr, [r3, #4]
	str	lr, [r3]
	ldr	r3, .L31+4
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #8]
	str	r7, [r3, #12]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	ldr	r3, .L31+8
.L28:
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
	bne	.L28
	bl	initEnemies
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initMines
.L32:
	.align	2
.L31:
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	ldr	r4, .L64
	ldr	r8, .L64+4
	ldr	r10, .L64+8
	ldr	r9, .L64+12
	sub	sp, sp, #20
	b	.L39
.L34:
	add	r6, r6, #1
	cmp	r6, #60
	add	r4, r4, #44
	beq	.L61
.L39:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L34
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	ldm	r4, {ip, lr}
	add	r2, r8, #24
	ldm	r2, {r2, r3}
	lsl	r0, r0, #6
	stm	sp, {ip, lr}
	lsl	r1, r1, #6
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	lsl	r3, r3, #6
	ldm	r8, {r0, r1}
	lsl	r2, r2, #6
	mov	lr, pc
	bx	r10
	subs	r7, r0, #0
	bne	.L62
	ldr	r5, .L64+12
	ldr	r3, [r5, #32]
	cmp	r3, #0
	bne	.L63
.L37:
	add	r7, r7, #1
	cmp	r7, #5
	add	r5, r5, #40
	beq	.L34
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L37
.L63:
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
	bx	r10
	cmp	r0, #0
	beq	.L37
	mov	r2, #0
	mov	ip, #512
	mov	r1, #1
	add	r7, r7, r7, lsl #2
	add	r7, r9, r7, lsl #3
	ldr	r3, [r7, #36]
	ldr	r0, .L64+16
	lsl	r3, r3, #3
	str	r2, [r7, #32]
	strh	ip, [r0, r3]	@ movhi
	ldr	r2, .L64+20
	ldr	r3, .L64+24
	str	r1, [r2]
	str	r6, [r3]
.L33:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L61:
	ldr	r4, .L64+28
	ldr	r5, .L64+4
	ldr	r7, .L64+8
	ldr	r8, .L64+32
	ldr	fp, .L64+36
	ldr	r10, .L64+40
	ldr	r9, .L64+44
	add	r6, r4, #2400
	b	.L43
.L41:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L33
.L43:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L41
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
	beq	.L41
	mov	r2, #0
	ldr	r3, [r8]
	ldr	r1, [r4, #36]
	mov	r0, r10
	sub	r3, r3, r1
	str	r2, [r4, #32]
	ldr	r1, [fp]
	str	r3, [r8]
	mov	lr, pc
	bx	r9
	b	.L41
.L62:
	mov	r1, #1
	ldr	r2, .L64+20
	ldr	r3, .L64+24
	str	r1, [r2]
	str	r6, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	enemies
	.word	player
	.word	collision
	.word	bullets
	.word	shadowOAM
	.word	.LANCHOR0
	.word	opponentIdx
	.word	mines
	.word	submarineHp
	.word	boomsfx_length
	.word	boomsfx_data
	.word	playSoundB
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
	ldr	r4, .L109
	ldr	r8, [r4, #16]
	ldr	r3, [r4]
	add	r7, r4, #20
	adds	r2, r3, r8
	movmi	r2, #0
	ldm	r7, {r7, ip}
	sub	sp, sp, #8
	rsbmi	r8, r3, #0
	bmi	.L68
	add	r1, r2, ip, lsl #6
	cmp	r1, #65536
	subgt	r1, r1, #65536
	subgt	r8, r8, r1
	addgt	r2, r3, r8
	asr	r2, r2, #6
.L68:
	ldr	r1, [r4, #4]
	adds	r3, r1, r7
	movmi	r3, #0
	ldr	r0, [r4, #28]
	rsbmi	r7, r1, #0
	bmi	.L71
	add	lr, r1, r0, lsl #6
	cmp	lr, #65536
	lsl	lr, r0, #6
	addgt	r3, r3, lr
	subgt	r3, r3, #65536
	subgt	r7, r7, r3
	addgt	r3, r1, r7
	asr	r3, r3, #6
.L71:
	ldr	r10, .L109+4
	str	r0, [sp, #4]
	mov	r1, #1024
	str	ip, [sp]
	ldr	r0, [r10]
	ldr	r9, .L109+8
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bgt	.L103
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
.L77:
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
	ldr	r5, .L109+12
	ldr	r0, [r5]
	strgt	r2, [r4, #20]
	rsb	r1, r0, r8, asr #6
	cmp	r0, #0
	movgt	r2, #1
	movle	r2, #0
	cmp	r1, #78
	movgt	r2, #0
	ldr	lr, .L109+16
	ldr	ip, [lr]
	cmp	r2, #0
	rsb	r2, ip, r3, asr #6
	str	r1, [r4, #8]
	str	r2, [r4, #12]
	ldr	r6, [r4, #24]
	asr	r8, r8, #6
	asr	r3, r3, #6
	bne	.L104
.L80:
	add	r0, r1, r6
	cmp	r0, #159
	bgt	.L105
.L83:
	cmp	r2, #51
	movle	r1, #1
	movgt	r1, #0
	cmp	ip, #0
	movle	r1, #0
	cmp	r1, #0
	ldr	r1, [r4, #28]
	bne	.L106
.L86:
	add	r3, r2, r1
	cmp	r3, #105
	ble	.L66
	ldr	r0, [lr]
	cmp	r0, #864
	blt	.L88
.L66:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L105:
	ldr	r7, [r5]
	cmp	r7, #784
	bge	.L83
.L82:
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
	b	.L83
.L106:
	rsb	r5, r2, #52
	cmp	ip, r5
	bge	.L107
	mov	r0, #0
	sub	r2, r3, r5
	add	r3, r2, r1
	cmp	r3, #105
	str	r2, [r4, #12]
	str	r0, [lr]
	ble	.L66
.L88:
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
.L103:
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
	bgt	.L108
.L74:
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
	b	.L77
.L104:
	rsb	r9, r1, #79
	cmp	r0, r9
	blt	.L81
	mov	r1, #79
	sub	r0, r0, r9
	str	r0, [r5]
	str	r1, [r4, #8]
	b	.L80
.L81:
	mov	r7, #0
	sub	r1, r8, r9
	add	r0, r1, r6
	cmp	r0, #159
	str	r1, [r4, #8]
	str	r7, [r5]
	bgt	.L82
	b	.L83
.L107:
	mov	r2, #52
	sub	r3, ip, r5
	str	r3, [lr]
	str	r2, [r4, #12]
	b	.L86
.L108:
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
	ble	.L74
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
	ble	.L76
	mov	r5, #0
	ldr	r8, [r4]
	mov	r6, r5
	ldr	r3, [r4, #4]
	b	.L77
.L76:
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
	b	.L77
.L110:
	.align	2
.L109:
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
	mov	r0, #2944
	ldr	r2, .L112
	ldr	r3, [r2, #8]
	ldrb	r1, [r2, #12]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L112+4
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	bx	lr
.L113:
	.align	2
.L112:
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
	push	{r4, r5, r6, lr}
	ldr	lr, .L123
	ldr	r3, [lr, #32]
	cmp	r3, #1
	moveq	r4, #96
	mvnne	r4, #95
	mov	r3, #0
	ldrne	ip, .L123+4
	ldr	r2, [lr]
	ldreq	r0, [lr, #24]
	ldrne	r0, [ip, #24]
	ldreq	ip, .L123+4
	ldr	r1, .L123+4
	addeq	r0, r2, r0, lsl #6
	subne	r0, r2, r0, lsl #6
.L119:
	ldr	r2, [r1, #32]
	cmp	r2, #0
	beq	.L122
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #40
	bne	.L119
	pop	{r4, r5, r6, lr}
	bx	lr
.L122:
	mov	r5, #1
	ldr	lr, [lr, #4]
	add	r3, r3, r3, lsl #2
	str	r0, [ip, r3, lsl #3]
	ldr	r1, .L123+8
	add	r3, ip, r3, lsl #3
	str	r4, [r3, #16]
	asr	ip, r0, #6
	asr	r4, lr, #6
	str	lr, [r3, #4]
	str	r4, [r3, #12]
	str	r5, [r3, #32]
	ldr	r4, .L123+12
	ldr	r1, [r1]
	str	r2, [r3, #20]
	ldr	r0, .L123+16
	str	ip, [r3, #8]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	player
	.word	bullets
	.word	shootsfx_length
	.word	playSoundB
	.word	shootsfx_data
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
	ldr	r1, .L168
	push	{r4, lr}
	ldrh	r3, [r1, #48]
	ldr	r4, .L168+4
	tst	r3, #256
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldrh	r0, [r1, #48]
	beq	.L126
	tst	r0, #32
	bne	.L127
	ldrh	r1, [r1, #48]
	sub	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L128
.L162:
	sub	r3, r3, #20
	str	r3, [r4, #20]
.L129:
	cmp	r2, #48
	mov	r1, #48
	mvn	r0, #47
	ble	.L151
.L152:
	str	r1, [r4, #16]
.L141:
	cmp	r1, r3
	strlt	r1, [r4, #20]
	blt	.L143
	cmp	r0, r3
	strgt	r0, [r4, #20]
.L143:
	bl	movePlayer
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movgt	r3, #1
	strgt	r3, [r4, #32]
	bgt	.L145
	movne	r3, #0
	strne	r3, [r4, #32]
.L145:
	ldr	r3, .L168+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L146
	ldr	r3, .L168+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L164
.L146:
	mov	r0, #2944
	ldr	r3, [r4, #8]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldr	r2, .L168+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L126:
	tst	r0, #32
	bne	.L130
	ldrh	r1, [r1, #48]
	sub	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	bne	.L131
.L160:
	sub	r3, r3, #10
	str	r3, [r4, #20]
.L132:
	cmp	r2, #24
	mov	r1, #24
	mvn	r0, #23
	bgt	.L152
.L151:
	cmp	r0, r2
	strgt	r0, [r4, #16]
	b	.L141
.L130:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #1
	beq	.L165
.L148:
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r4, #16]
	ble	.L166
	ldr	r0, .L168
	ldrh	ip, [r0, #48]
	tst	ip, #64
	beq	.L167
.L135:
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L137
	cmp	r1, #0
	beq	.L163
.L161:
	add	r3, r3, #10
	str	r3, [r4, #20]
	b	.L132
.L127:
	ldrh	r0, [r1, #48]
	tst	r0, #16
	movne	r1, #0
	bne	.L148
	ldrh	r1, [r1, #48]
	add	r2, r2, #20
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L162
.L128:
	ldr	r1, .L168
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L163
	mov	r1, #0
.L137:
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #20]
	bgt	.L140
	addne	r3, r3, #1
	strne	r3, [r4, #20]
.L140:
	cmp	r1, #0
	bne	.L132
	b	.L129
.L165:
	ldrh	r1, [r1, #48]
	add	r2, r2, #10
	tst	r1, #64
	str	r2, [r4, #16]
	beq	.L160
.L131:
	ldr	r1, .L168
	ldrh	r1, [r1, #48]
	tst	r1, #128
	beq	.L161
	mov	r1, #1
	b	.L137
.L167:
	cmp	r1, #0
	beq	.L162
	b	.L160
.L166:
	ldr	r0, .L168
	ldrh	ip, [r0, #48]
	addne	r2, r2, #1
	strne	r2, [r4, #16]
	tst	ip, #64
	bne	.L135
	b	.L167
.L163:
	add	r3, r3, #20
	str	r3, [r4, #20]
	b	.L129
.L164:
	bl	firePlayer
	b	.L146
.L169:
	.align	2
.L168:
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
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r2, [r0]
	ldr	r0, [r0, #16]
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #20]
	add	r2, r2, r0
	add	r3, r3, r1
	cmp	r2, #0
	add	r1, r4, #24
	stm	r4, {r2, r3}
	ldm	r1, {r1, ip}
	sub	sp, sp, #12
	blt	.L171
	add	r0, r2, r1, lsl #6
	cmp	r0, #65536
	movle	r0, #0
	movgt	r0, #1
	orrs	r0, r0, r3, lsr #31
	beq	.L184
.L171:
	mov	r0, #0
	str	r0, [r4, #32]
.L172:
	stm	sp, {r1, ip}
	ldr	r0, .L186
	mov	r1, #1024
	ldr	r0, [r0]
	ldr	r5, .L186+4
	asr	r3, r3, #6
	asr	r2, r2, #6
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L173
	ldr	r3, .L186+8
	ldr	r2, .L186+12
	ldr	r0, [r3]
	ldr	r2, [r2]
	ldr	r3, [r4, #32]
	ldr	ip, [r4]
	ldr	r1, [r4, #4]
	rsb	r2, r2, ip, asr #6
	rsb	r0, r0, r1, asr #6
	cmp	r3, #0
	str	r2, [r4, #8]
	str	r0, [r4, #12]
	ldr	r3, [r4, #36]
	beq	.L175
	ldr	r1, [r4, #24]
	add	r1, r2, r1
	cmp	r1, #0
	movgt	r1, #1
	movle	r1, #0
	cmp	r2, #240
	movgt	r1, #0
	cmp	r1, #0
	bne	.L185
.L175:
	mov	r1, #512
	ldr	r2, .L186+16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
.L170:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L173:
	mov	r1, #0
	ldr	r2, .L186+12
	ldr	r3, .L186+8
	ldr	r2, [r2]
	ldr	ip, [r4]
	ldr	r3, [r3]
	ldr	r0, [r4, #4]
	rsb	r2, r2, ip, asr #6
	rsb	r3, r3, r0, asr #6
	str	r3, [r4, #12]
	str	r2, [r4, #8]
	str	r1, [r4, #32]
	ldr	r3, [r4, #36]
	b	.L175
.L184:
	add	r0, r3, ip, lsl #6
	cmp	r0, #65536
	ble	.L172
	b	.L171
.L185:
	ldr	r1, [r4, #28]
	add	r1, r0, r1
	cmp	r1, #0
	movgt	r1, #1
	movle	r1, #0
	cmp	r0, #160
	movgt	r1, #0
	cmp	r1, #0
	beq	.L175
	mov	ip, #3040
	ldr	r1, .L186+16
	lsl	r2, r2, #23
	lsl	lr, r3, #3
	lsr	r2, r2, #23
	add	r3, r1, r3, lsl #3
	and	r0, r0, #255
	strh	r0, [r1, lr]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	b	.L170
.L187:
	.align	2
.L186:
	.word	.LANCHOR1
	.word	collisionCheck
	.word	bg2yOff
	.word	bg2xOff
	.word	shadowOAM
	.size	updateBullet, .-updateBullet
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
	ldr	r3, .L189
	ldr	r1, .L189+4
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
.L190:
	.align	2
.L189:
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
	ldr	r3, .L199
	ldr	r2, [r3, #12]
	cmp	r2, #30
	push	{r4, r5, r6, lr}
	addle	r2, r2, #1
	ble	.L193
	mov	r2, #1
	mov	lr, #0
	ldr	ip, [r3, #16]
	ldr	r1, .L199+4
	add	ip, ip, r2
	smull	r4, r1, ip, r1
	sub	r1, r1, ip, asr #31
	add	r1, r1, r1, lsl r2
	sub	r1, ip, r1
	str	r1, [r3, #16]
	str	lr, [r3, #12]
.L193:
	ldr	r1, [r3, #8]
	cmp	r1, #9
	bgt	.L194
	ldr	ip, [r0, #8]
	ldrb	r4, [r0, #12]	@ zero_extendqisi2
	ldr	lr, [r3, #16]
	ldr	r5, .L199+8
	add	r0, r1, #6
	lsl	ip, ip, #23
	lsl	r6, r0, #3
	lsr	ip, ip, #23
	orr	r4, r4, #16384
	add	r0, r5, r0, lsl #3
	cmp	lr, #1
	strh	r4, [r5, r6]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	beq	.L195
	cmp	lr, #2
	beq	.L196
	cmp	lr, #0
	moveq	ip, #2976
	strheq	ip, [r0, #4]	@ movhi
.L197:
	add	r1, r1, #1
	str	r1, [r3, #8]
.L194:
	str	r2, [r3, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L196:
	ldr	ip, .L199+12
	strh	ip, [r0, #4]	@ movhi
	b	.L197
.L195:
	ldr	ip, .L199+16
	strh	ip, [r0, #4]	@ movhi
	b	.L197
.L200:
	.align	2
.L199:
	.word	.LANCHOR0
	.word	1431655766
	.word	shadowOAM
	.word	2980
	.word	2978
	.size	drawEnemy, .-drawEnemy
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
	ldr	ip, [r0]
	ldr	r1, [r0, #16]
	push	{r4, lr}
	add	ip, ip, r1
	ldr	r4, [r0, #20]
	ldr	r1, [r0, #4]
	ldr	r2, .L214
	ldr	lr, .L214+4
	add	r1, r1, r4
	ldr	r2, [r2]
	ldr	lr, [lr]
	ldr	r4, [r0, #32]
	rsb	r2, r2, ip, asr #6
	rsb	lr, lr, r1, asr #6
	cmp	r4, #0
	stmib	r0, {r1, r2, lr}
	str	ip, [r0]
	beq	.L201
	ldr	r1, [r0, #24]
	add	r1, r2, r1
	cmp	r1, #0
	movgt	r1, #1
	movle	r1, #0
	cmp	r2, #240
	movgt	r1, #0
	cmp	r1, #0
	bne	.L213
.L201:
	pop	{r4, lr}
	bx	lr
.L213:
	ldr	r3, [r0, #28]
	add	r3, lr, r3
	cmp	r3, #0
	movgt	r3, #1
	movle	r3, #0
	cmp	lr, #160
	movgt	r3, #0
	cmp	r3, #0
	beq	.L201
	pop	{r4, lr}
	b	drawEnemy
.L215:
	.align	2
.L214:
	.word	bg2xOff
	.word	bg2yOff
	.size	updateEnemy, .-updateEnemy
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
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L219
	add	r2, r3, #160
.L217:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L217
	mov	r2, #0
	ldr	r3, .L219+4
	str	r2, [r3, #20]
	bx	lr
.L220:
	.align	2
.L219:
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
	ldr	r3, .L231
	ldr	r2, [r3, #24]
	cmp	r2, #30
	push	{r4, r5, lr}
	addle	r2, r2, #1
	ble	.L223
	mov	r2, #1
	mov	lr, #0
	ldr	ip, [r3, #28]
	ldr	r1, .L231+4
	add	ip, ip, r2
	smull	r4, r1, ip, r1
	sub	r1, r1, ip, asr #31
	add	r1, r1, r1, lsl r2
	sub	r1, ip, r1
	str	r1, [r3, #28]
	str	lr, [r3, #24]
.L223:
	ldr	r1, [r3, #20]
	cmp	r1, #19
	bgt	.L224
	ldr	lr, [r3, #28]
	cmp	lr, #1
	add	ip, r1, #24
	beq	.L225
	cmp	lr, #2
	beq	.L226
	cmp	lr, #0
	moveq	r5, #3008
	ldreq	r4, .L231+8
	addeq	lr, r4, ip, lsl #3
	ldrne	r4, .L231+8
	strheq	r5, [lr, #4]	@ movhi
	lslne	ip, ip, #3
	lsleq	ip, ip, #3
.L227:
	ldr	lr, [r0, #8]
	ldrb	r5, [r0, #12]	@ zero_extendqisi2
	add	r1, r1, #1
	lsl	r0, lr, #23
	str	r1, [r3, #20]
	lsr	r0, r0, #23
	add	r1, r4, ip
	strh	r5, [r4, ip]	@ movhi
	strh	r0, [r1, #2]	@ movhi
.L224:
	str	r2, [r3, #24]
	pop	{r4, r5, lr}
	bx	lr
.L226:
	ldr	r4, .L231+8
	ldr	r5, .L231+12
	add	lr, r4, ip, lsl #3
	strh	r5, [lr, #4]	@ movhi
	lsl	ip, ip, #3
	b	.L227
.L225:
	ldr	r4, .L231+8
	ldr	r5, .L231+16
	add	lr, r4, ip, lsl #3
	strh	r5, [lr, #4]	@ movhi
	lsl	ip, ip, #3
	b	.L227
.L232:
	.align	2
.L231:
	.word	.LANCHOR0
	.word	1431655766
	.word	shadowOAM
	.word	3010
	.word	3009
	.size	drawMine, .-drawMine
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
	ldr	ip, [r0]
	ldr	r1, [r0, #16]
	push	{r4, lr}
	add	ip, ip, r1
	ldr	r4, [r0, #20]
	ldr	r1, [r0, #4]
	ldr	r2, .L246
	ldr	lr, .L246+4
	add	r1, r1, r4
	ldr	r2, [r2]
	ldr	lr, [lr]
	ldr	r4, [r0, #32]
	rsb	r2, r2, ip, asr #6
	rsb	lr, lr, r1, asr #6
	cmp	r4, #0
	stmib	r0, {r1, r2, lr}
	str	ip, [r0]
	beq	.L233
	ldr	r1, [r0, #24]
	add	r1, r2, r1
	cmp	r1, #0
	movgt	r1, #1
	movle	r1, #0
	cmp	r2, #240
	movgt	r1, #0
	cmp	r1, #0
	bne	.L245
.L233:
	pop	{r4, lr}
	bx	lr
.L245:
	ldr	r3, [r0, #28]
	add	r3, lr, r3
	cmp	r3, #0
	movgt	r3, #1
	movle	r3, #0
	cmp	lr, #160
	movgt	r3, #0
	cmp	r3, #0
	beq	.L233
	pop	{r4, lr}
	b	drawMine
.L247:
	.align	2
.L246:
	.word	bg2xOff
	.word	bg2yOff
	.size	updateMine, .-updateMine
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L254
	ldr	r1, [r7]
	cmp	r1, #0
	movle	r5, #800
	movgt	r5, #768
	mov	lr, #16
	mov	r6, #2
	ldr	r8, .L254+4
	ldr	r4, .L254+8
	ldr	r10, .L254+12
	ldr	ip, .L254+16
	ldr	r9, .L254+20
	ldr	r2, [r8]
	mov	r3, #26
	mov	r0, #1
	strh	lr, [r4, #130]	@ movhi
	strh	r5, [r4, #132]	@ movhi
	strh	ip, [r4, #138]	@ movhi
	strh	r6, [r4, #128]	@ movhi
	strh	r10, [r4, #136]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r5, .L254+24
	ldr	ip, .L254+28
	sub	r0, r5, r0
	ldr	r2, [r8]
	ldr	r1, [r7]
	strh	r0, [r4, #140]	@ movhi
	mov	r3, #26
	mov	r0, #5
	strh	ip, [r4, #146]	@ movhi
	strh	r10, [r4, #144]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	ip, .L254+32
	sub	r0, r5, r0
	ldr	r2, [r8]
	ldr	r1, [r7]
	strh	r0, [r4, #148]	@ movhi
	mov	r3, #26
	mov	r0, #9
	strh	ip, [r4, #154]	@ movhi
	strh	r10, [r4, #152]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	ip, .L254+36
	sub	r0, r5, r0
	ldr	r2, [r8]
	ldr	r1, [r7]
	strh	r0, [r4, #156]	@ movhi
	mov	r3, #26
	mov	r0, #13
	strh	ip, [r4, #162]	@ movhi
	strh	r10, [r4, #160]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	ip, .L254+40
	sub	r0, r5, r0
	ldr	r2, [r8]
	ldr	r1, [r7]
	strh	r0, [r4, #164]	@ movhi
	mov	r3, #26
	mov	r0, #17
	strh	ip, [r4, #170]	@ movhi
	strh	r10, [r4, #168]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	ip, .L254+44
	sub	r0, r5, r0
	ldr	r1, [r7]
	ldr	r2, [r8]
	strh	r0, [r4, #172]	@ movhi
	mov	r3, #26
	mov	r0, #21
	strh	r10, [r4, #176]	@ movhi
	strh	ip, [r4, #178]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
	ldr	r2, .L254+48
	add	r3, r3, r3, lsl r6
	add	r3, r3, r3, lsl r6
	smull	r1, r2, r3, r2
	ldr	r1, [r7]
	asr	r3, r3, #31
	rsb	r3, r3, r2, asr #3
	cmp	r3, r1
	movlt	r3, #768
	movge	r3, #800
	ldr	r2, .L254+52
	sub	r5, r5, r0
	strh	r5, [r4, #180]	@ movhi
	strh	r6, [r4, #184]	@ movhi
	strh	r3, [r4, #188]	@ movhi
	strh	r2, [r4, #186]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L255:
	.align	2
.L254:
	.word	submarineHp
	.word	submarineMaxHp
	.word	shadowOAM
	.word	16386
	.word	16408
	.word	tilesRed
	.word	773
	.word	16440
	.word	16472
	.word	16504
	.word	16536
	.word	16568
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
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L281
	add	r5, r4, #200
.L258:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L278
.L257:
	add	r4, r4, #40
	cmp	r5, r4
	bne	.L258
	mov	r2, #512
	mov	r1, #0
	ldr	r3, .L281+4
	ldr	r6, .L281+8
	ldr	r4, .L281+12
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
	add	r5, r4, #2640
	str	r1, [r6, #8]
	b	.L260
.L259:
	add	r4, r4, #44
	cmp	r5, r4
	beq	.L279
.L260:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L259
	mov	r0, r4
	add	r4, r4, #44
	bl	updateEnemy
	cmp	r5, r4
	bne	.L260
.L279:
	mov	r1, #512
	ldr	r3, .L281+4
	add	r2, r3, #160
.L261:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r2, r3
	bne	.L261
	mov	r3, #0
	ldr	r4, .L281+16
	str	r3, [r6, #20]
	add	r5, r4, #2400
	b	.L263
.L262:
	add	r4, r4, #40
	cmp	r4, r5
	beq	.L280
.L263:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L262
	mov	r0, r4
	add	r4, r4, #40
	bl	updateMine
	cmp	r4, r5
	bne	.L263
.L280:
	bl	doCollision
	pop	{r4, r5, r6, lr}
	b	updateHealthBar
.L278:
	mov	r0, r4
	bl	updateBullet
	b	.L257
.L282:
	.align	2
.L281:
	.word	bullets
	.word	shadowOAM
	.word	.LANCHOR0
	.word	enemies
	.word	mines
	.size	updateWorld, .-updateWorld
	.global	drawnMines
	.global	drawnEnemies
	.comm	opponentIdx,4,4
	.global	doBattle
	.global	level
	.comm	mines,2400,4
	.comm	enemies,2640,4
	.comm	bullets,200,4
	.comm	player,36,4
	.global	collisionMap
	.comm	soundB,32,4
	.comm	soundA,32,4
	.global	levels
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	collisionMap, %object
	.size	collisionMap, 4
collisionMap:
	.word	world1collisionBitmap
	.type	levels, %object
	.size	levels, 5040
levels:
	.word	2048
	.word	10240
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	11776
	.word	11264
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	4096
	.word	21504
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	16384
	.word	22528
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	21504
	.word	21504
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	26624
	.word	11776
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	21568
	.word	8192
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	28160
	.word	4608
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	38912
	.word	5632
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	39936
	.word	8704
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	47616
	.word	7680
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	53248
	.word	8704
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	45120
	.word	11776
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	54272
	.word	19968
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	41472
	.word	20544
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	49664
	.word	30208
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	41984
	.word	32768
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	48192
	.word	34304
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	41472
	.word	39936
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	52288
	.word	39936
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	45056
	.word	44608
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	59904
	.word	43008
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	62464
	.word	36352
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	53248
	.word	48640
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	49664
	.word	51712
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	3
	.word	56320
	.word	60928
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	34816
	.word	61440
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	27136
	.word	61440
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	35840
	.word	42496
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	3
	.word	33792
	.word	31744
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	34944
	.word	25600
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	25088
	.word	33280
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	30208
	.word	35392
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	28736
	.word	40000
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	21056
	.word	36416
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	23040
	.word	41472
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	23040
	.word	44544
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	17408
	.word	41408
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	15360
	.word	37376
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	11776
	.word	34816
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	6144
	.word	38400
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	0
	.word	2048
	.word	35584
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	3
	.word	10752
	.word	59392
	.space	16
	.word	16
	.word	8
	.word	1
	.word	0
	.word	4
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	9728
	.word	22528
	.space	24
	.word	1
	.word	10
	.word	11264
	.word	22528
	.space	24
	.word	1
	.word	10
	.word	12800
	.word	22528
	.space	24
	.word	1
	.word	10
	.word	16384
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	25088
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	29696
	.word	19968
	.space	24
	.word	1
	.word	10
	.word	33280
	.word	11776
	.space	24
	.word	1
	.word	10
	.word	31232
	.word	13824
	.space	24
	.word	1
	.word	10
	.word	30208
	.word	13824
	.space	24
	.word	1
	.word	10
	.word	47104
	.word	21504
	.space	24
	.word	1
	.word	10
	.word	48128
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	49152
	.word	21376
	.space	24
	.word	1
	.word	10
	.word	50176
	.word	21504
	.space	24
	.word	1
	.word	10
	.word	51200
	.word	21504
	.space	24
	.word	1
	.word	10
	.word	52224
	.word	21504
	.space	24
	.word	1
	.word	10
	.word	53248
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	54272
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	55296
	.word	20992
	.space	24
	.word	1
	.word	10
	.word	50688
	.word	31232
	.space	24
	.word	1
	.word	10
	.word	61440
	.word	26624
	.space	24
	.word	1
	.word	10
	.word	62464
	.word	26624
	.space	24
	.word	1
	.word	10
	.word	61440
	.word	24064
	.space	24
	.word	1
	.word	10
	.word	64000
	.word	24064
	.space	24
	.word	1
	.word	10
	.word	62464
	.word	22016
	.space	24
	.word	1
	.word	10
	.word	63488
	.word	19968
	.space	24
	.word	1
	.word	10
	.word	61952
	.word	17920
	.space	24
	.word	1
	.word	10
	.word	62976
	.word	16384
	.space	24
	.word	1
	.word	10
	.word	64000
	.word	15360
	.space	24
	.word	1
	.word	10
	.word	62464
	.word	13312
	.space	24
	.word	1
	.word	10
	.word	62976
	.word	12800
	.space	24
	.word	1
	.word	10
	.word	61952
	.word	10240
	.space	24
	.word	1
	.word	10
	.word	63488
	.word	8192
	.space	24
	.word	1
	.word	10
	.word	61952
	.word	7168
	.space	24
	.word	1
	.word	10
	.word	62976
	.word	5632
	.space	24
	.word	1
	.word	10
	.word	64000
	.word	5632
	.space	24
	.word	1
	.word	10
	.word	48128
	.word	48640
	.space	24
	.word	1
	.word	10
	.word	45056
	.word	51712
	.space	24
	.word	1
	.word	10
	.word	41472
	.word	47616
	.space	24
	.word	1
	.word	10
	.word	43008
	.word	51712
	.space	24
	.word	1
	.word	10
	.word	39936
	.word	50176
	.space	24
	.word	1
	.word	10
	.word	38400
	.word	48640
	.space	24
	.word	1
	.word	10
	.word	37888
	.word	52736
	.space	24
	.word	1
	.word	10
	.word	35840
	.word	51712
	.space	24
	.word	1
	.word	10
	.word	33280
	.word	50688
	.space	24
	.word	1
	.word	10
	.word	32256
	.word	52736
	.space	24
	.word	1
	.word	10
	.word	30208
	.word	49152
	.space	24
	.word	1
	.word	10
	.word	28672
	.word	52224
	.space	24
	.word	1
	.word	10
	.word	27648
	.word	48640
	.space	24
	.word	1
	.word	10
	.word	23040
	.word	52224
	.space	24
	.word	1
	.word	10
	.word	21504
	.word	51712
	.space	24
	.word	1
	.word	10
	.word	30208
	.word	43008
	.space	24
	.word	1
	.word	10
	.word	17408
	.word	45056
	.space	24
	.word	1
	.word	10
	.word	12800
	.word	39424
	.space	24
	.word	1
	.word	10
	.word	28672
	.word	29184
	.space	24
	.word	1
	.word	10
	.word	28672
	.word	27136
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
	.type	frameCounter.4946, %object
	.size	frameCounter.4946, 4
frameCounter.4946:
	.space	4
	.type	aniFrame.4947, %object
	.size	aniFrame.4947, 4
aniFrame.4947:
	.space	4
	.type	drawnMines, %object
	.size	drawnMines, 4
drawnMines:
	.space	4
	.type	frameCounter.4961, %object
	.size	frameCounter.4961, 4
frameCounter.4961:
	.space	4
	.type	aniFrame.4962, %object
	.size	aniFrame.4962, 4
aniFrame.4962:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
