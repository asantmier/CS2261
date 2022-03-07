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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"GALAXY DEFENDER\000"
	.align	2
.LC2:
	.ascii	"press SELECT to play\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+8
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	ldr	r5, .L4+20
	mov	r0, #3
	ldr	r3, [r3]
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+24
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+32
	mov	r2, r5
	mov	r3, #17
	mov	r1, #60
	mov	r0, #76
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r3, #32
	mov	r1, #60
	mov	r0, #75
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+36
	mov	r1, #80
	mov	r0, #60
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	img_titlePal
	.word	numColors
	.word	83886496
	.word	colors
	.word	.LC1
	.word	img_titleBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #128
	mov	r4, #67108864
	mov	r5, #2
	ldr	r3, .L12
	ldr	r2, .L12+4
	ldr	lr, .L12+8
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #128]	@ movhi
	sub	sp, sp, #60
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	strh	r5, [r4, #130]	@ movhi
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	mov	lr, sp
	str	r3, [ip]
	mov	ip, #0
	ldr	r4, .L12+12
.L7:
	ldr	r2, [lr, #4]!
	sub	r3, ip, #2
	add	r0, ip, #30
	add	r3, r2, r3
	add	r0, r2, r0
	add	r2, r4, ip
.L8:
	ldrh	r1, [r3, #2]!
	cmp	r3, r0
	strh	r1, [r2, #2]!	@ movhi
	bne	.L8
	add	ip, ip, #32
	cmp	ip, #416
	bne	.L7
	mov	r2, #0
	ldr	r3, .L12+16
	str	r2, [r3]
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	13107
	.word	1044
	.word	.LANCHOR0
	.word	gamePal-2
	.word	seed
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Lives:\000"
	.align	2
.LC5:
	.ascii	"STAGE \000"
	.align	2
.LC6:
	.ascii	"Score:\000"
	.text
	.align	2
	.global	drawInitialGameScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInitialGameScreen, %function
drawInitialGameScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r0, .L16
	sub	sp, sp, #8
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	mov	r1, #0
	mov	r3, #210
	mov	r0, r1
	str	r3, [sp]
	mov	r2, #240
	mov	r3, #10
	ldr	r4, .L16+8
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r5, .L16+12
	mov	r0, r1
	mov	r3, #209
	ldr	r2, .L16+16
	mov	lr, pc
	bx	r5
	ldr	r4, .L16+20
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #37
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #43
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #49
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #1
	mov	r0, #96
	ldr	r2, .L16+24
	mov	lr, pc
	bx	r5
	mov	r4, #209
	mov	r3, #1
	ldr	r6, .L16+28
	mov	r1, r3
	mov	r2, #2
	mov	r0, #132
	str	r4, [sp]
	mov	lr, pc
	bx	r6
	mov	r3, r4
	mov	r1, #1
	mov	r0, #167
	ldr	r2, .L16+32
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r2, #6
	mov	r1, #1
	mov	r0, #203
	str	r4, [sp]
	mov	lr, pc
	bx	r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	backgroundBitmap
	.word	drawFullscreenImage4
	.word	drawRect4
	.word	drawString4
	.word	.LC4
	.word	drawChar4
	.word	.LC5
	.word	drawInt4
	.word	.LC6
	.size	drawInitialGameScreen, .-drawInitialGameScreen
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L22
	ldr	r3, [r4]
	bics	r3, r3, #4
	beq	.L21
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	bl	drawInitialGameScreen
	ldr	r3, .L22+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L22+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L22+20
	mov	r0, #3
	ldr	r3, [r3]
	ldr	r2, .L22+24
	ldr	r1, .L22+28
	mov	lr, pc
	bx	r5
	bl	drawInitialGameScreen
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.word	DMANow
	.word	gamePal
	.word	numColors
	.word	83886496
	.word	colors
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L31
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L24
	ldr	r3, .L31+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L30
.L24:
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r2, .L31+12
	ldr	r3, .L31+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r0, #1
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L45
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L34
	ldr	r2, .L45+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L43
.L34:
	tst	r3, #8
	beq	.L33
	ldr	r3, .L45+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
.L33:
	pop	{r4, lr}
	bx	lr
.L44:
	pop	{r4, lr}
	b	goToStart
.L43:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L34
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L59
	ldr	r3, .L59+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L48
	ldr	r2, .L59+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L57
.L48:
	tst	r3, #8
	beq	.L47
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
.L47:
	pop	{r4, lr}
	bx	lr
.L58:
	pop	{r4, lr}
	b	goToStart
.L57:
	ldr	r2, .L59+12
	ldr	r3, .L59+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L59+20
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L48
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.size	lose, .-lose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"PAUSED\000"
	.align	2
.LC8:
	.ascii	"press SELECT to unpause\000"
	.align	2
.LC9:
	.ascii	"press START to go to the start screen\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #209
	ldr	r4, .L63
	mov	r1, #60
	mov	r0, #102
	ldr	r2, .L63+4
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #90
	mov	r0, #51
	ldr	r2, .L63+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L63+12
	mov	r1, #100
	mov	r0, #9
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L63+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L64:
	.align	2
.L63:
	.word	drawString4
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"Final Score: \000"
	.align	2
.LC11:
	.ascii	"NEW HIGH SCORE!\000"
	.align	2
.LC12:
	.ascii	"GAME OVER\000"
	.align	2
.LC13:
	.ascii	"press SELECT to try again\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #209
	ldr	r2, .L69
	mov	r1, #18
	mov	r0, #63
	ldr	r4, .L69+4
	sub	sp, sp, #8
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+8
	ldr	ip, .L69+12
	ldr	r3, [r3]
	ldr	r2, [ip]
	cmp	r3, r2
	ble	.L66
	mov	r5, #212
	mov	r2, #6
	mov	r1, #18
	mov	r0, #141
	str	r5, [sp]
	ldr	r6, .L69+16
	str	r3, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #226
	mov	r1, #31
	mov	r0, #76
	ldr	r2, .L69+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #30
	mov	r0, #75
	ldr	r2, .L69+20
	mov	lr, pc
	bx	r4
.L67:
	mov	r3, #227
	mov	r1, #81
	mov	r0, #94
	ldr	r2, .L69+24
	mov	lr, pc
	bx	r4
	mov	r3, #211
	mov	r1, #80
	mov	r0, #93
	ldr	r2, .L69+24
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #100
	mov	r0, #45
	ldr	r2, .L69+28
	mov	lr, pc
	bx	r4
	mov	r1, #110
	mov	r0, #9
	ldr	r2, .L69+32
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+40
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L69+44
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	mov	r2, #209
	mov	r1, #18
	str	r2, [sp]
	mov	r0, #141
	mov	r2, #6
	ldr	r5, .L69+16
	mov	lr, pc
	bx	r5
	b	.L67
.L70:
	.align	2
.L69:
	.word	.LC10
	.word	drawString4
	.word	score
	.word	hiscore
	.word	drawInt4
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L85
.L72:
	ldr	r3, .L88+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L86
.L73:
	ldr	r3, .L88+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L71
	ldr	r3, .L88+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L87
.L71:
	pop	{r4, lr}
	bx	lr
.L86:
	bl	goToLose
	b	.L73
.L85:
	ldr	r1, .L88+32
	ldr	r2, .L88+36
	ldr	r3, [r1]
	ldr	r0, [r2]
	add	r3, r3, #9984
	add	r0, r0, #1
	add	r3, r3, #16
	ldr	r4, .L88+40
	str	r3, [r1]
	str	r0, [r2]
	mov	lr, pc
	bx	r4
	b	.L72
.L87:
	pop	{r4, lr}
	b	goToPause
.L89:
	.align	2
.L88:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	flipPage
	.word	victory
	.word	gameOver
	.word	oldButtons
	.word	buttons
	.word	score
	.word	stage
	.word	initGame
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L101
	ldr	r3, [r2]
	push	{r4, r7, fp, lr}
	add	r3, r3, #1
	ldr	r1, .L101+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r6, .L101+8
	ldr	fp, .L101+12
	ldr	r5, .L101+16
	ldr	r10, .L101+20
	ldr	r9, .L101+24
	ldr	r8, .L101+28
	ldr	r7, .L101+32
	ldr	r4, .L101+36
.L91:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L92:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L92
.L94:
	.word	.L97
	.word	.L96
	.word	.L95
	.word	.L92
	.word	.L93
.L93:
	mov	lr, pc
	bx	r7
	b	.L91
.L95:
	mov	lr, pc
	bx	r8
	b	.L91
.L96:
	mov	lr, pc
	bx	r9
	b	.L91
.L97:
	mov	lr, pc
	bx	r10
	b	.L91
.L102:
	.align	2
.L101:
	.word	seed
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.size	main, .-main
	.comm	gamePal,512,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	NOTES,2,2
	.comm	COLORINDEX,1,1
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC3:
	.word	alien_1Pal
	.word	alien_2Pal
	.word	alien_3Pal
	.word	backgroundPal
	.word	explosion_1Pal
	.word	explosion_2Pal
	.word	explosion_3Pal
	.word	spaceship_body_1Pal
	.word	spaceship_body_2Pal
	.word	spaceship_body_3Pal
	.word	spaceship_body_4Pal
	.word	spaceship_jet_1Pal
	.word	spaceship_jet_2Pal
	.ident	"GCC: (devkitARM release 53) 9.1.0"
