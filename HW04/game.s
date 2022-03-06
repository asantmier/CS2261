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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r3, .L4+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	ip, #0
	mov	r1, #60
	ldr	r3, .L4+8
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	lr, .L4+12
	sub	r0, r0, r3, lsl #1
	ldr	r2, .L4+16
	ldr	r3, .L4+20
	add	r0, r0, #50
	str	r0, [lr]
	str	ip, [r2]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	lives
	.word	rand
	.word	1374389535
	.word	spawnDelay
	.word	score
	.word	timer
	.size	initGame, .-initGame
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
	@ link register save eliminated.
	ldr	r1, .L10
	ldr	r3, [r1]
	cmp	r3, #0
	movle	r3, #59
	ldrle	r0, .L10+4
	ldrle	r2, [r0]
	addle	r2, r2, #10
	strle	r2, [r0]
	ldr	r0, .L10+8
	ldr	r2, [r0]
	subgt	r3, r3, #1
	cmp	r2, #0
	subgt	r2, r2, #1
	str	r3, [r1]
	strgt	r2, [r0]
	bx	lr
.L11:
	.align	2
.L10:
	.word	timer
	.word	score
	.word	spawnDelay
	.size	updateGame, .-updateGame
	.align	2
	.global	initShip
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShip, %function
initShip:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
	.size	initEnemies, .-initEnemies
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
	.size	spawnSmallEnemies, .-spawnSmallEnemies
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
	@ link register save eliminated.
	bx	lr
	.size	updateShip, .-updateShip
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
	@ link register save eliminated.
	bx	lr
	.size	fireTorpedo, .-fireTorpedo
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
	bx	lr
	.size	updateEnemy, .-updateEnemy
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Lives:\000"
	.align	2
.LC1:
	.ascii	"Score:\000"
	.text
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
	mov	r1, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, r1
	mov	r3, #209
	ldr	r2, .L26
	ldr	r4, .L26+4
	ldr	r6, .L26+8
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #1
	mov	r0, #167
	ldr	r2, .L26+12
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L21
	mov	r5, #37
	mov	r4, #0
	ldr	r7, .L26+16
.L23:
	mov	r3, #209
	mov	r0, r5
	mov	r2, #3
	mov	r1, #1
	mov	lr, pc
	bx	r7
	ldr	r3, [r6]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #6
	bgt	.L23
.L21:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LC0
	.word	drawString4
	.word	lives
	.word	.LC1
	.word	drawChar4
	.size	drawHUD, .-drawHUD
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
	push	{r4, lr}
	ldr	r2, .L30
	ldr	r4, .L30+4
	mov	r3, #19200
	mov	r0, #3
	ldr	r2, [r2]
	ldr	r1, .L30+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	drawHUD
.L31:
	.align	2
.L30:
	.word	videoBuffer
	.word	DMANow
	.word	backgroundBitmap
	.size	drawGame, .-drawGame
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
	.size	drawEnemy, .-drawEnemy
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
	.comm	NOTES,2,2
	.comm	COLORINDEX,1,1
	.bss
	.align	2
	.type	hiscore, %object
	.size	hiscore, 4
hiscore:
	.space	4
	.type	bgColor, %object
	.size	bgColor, 1
bgColor:
	.space	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
