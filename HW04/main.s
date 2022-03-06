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
	mov	r5, #0
	ldr	ip, .L4
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r3, [r3]
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	ldr	r6, .L4+28
	ldr	r2, [r3]
	mov	r0, #3
	mov	r3, #19200
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+36
	mov	r2, r6
	mov	r3, #17
	mov	r1, #60
	mov	r0, #76
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, #32
	mov	r1, #60
	mov	r0, #75
	mov	lr, pc
	bx	r4
	mov	r1, #80
	mov	r0, #60
	ldr	r2, .L4+40
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+52
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	DMANow
	.word	img_titlePal
	.word	numColors
	.word	83886496
	.word	colors
	.word	videoBuffer
	.word	.LC1
	.word	img_titleBitmap
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	seed
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
	mov	ip, #67108864
	push	{r4, lr}
	ldr	lr, .L12
	ldr	r4, .L12+4
	ldmia	lr!, {r0, r1, r2, r3}
	sub	sp, sp, #56
	strh	r4, [ip]	@ movhi
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	mov	lr, sp
	str	r3, [ip]
	mov	ip, #0
	ldr	r4, .L12+8
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
	add	sp, sp, #56
	@ sp needed
	pop	{r4, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	1044
	.word	gamePal-2
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L17:
	.align	2
.L16:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	pause.part.0,win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	popne	{r4, lr}
	bne	win.part.0
.L18:
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.size	win, .-win
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
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L25
	ldr	r4, .L25+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+12
	mov	r0, #3
	ldr	r2, .L25+16
	ldr	r3, [r3]
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L25+24
	mov	r0, #3
	ldr	r2, [r2]
	ldr	r1, .L25+28
	mov	r3, #19200
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	state
	.word	DMANow
	.word	gamePal
	.word	numColors
	.word	83886496
	.word	colors
	.word	videoBuffer
	.word	backgroundBitmap
	.word	waitForVBlank
	.word	flipPage
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
	ldr	r3, .L34
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L27
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	ldr	r2, .L34+12
	ldr	r3, .L34+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.size	start, .-start
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
	ldr	r4, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L37
	ldr	r2, .L44+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L43
.L37:
	tst	r3, #8
	popne	{r4, lr}
	bne	lose.part.0
.L36:
	pop	{r4, lr}
	bx	lr
.L43:
	bl	goToGame
	ldr	r2, .L44+12
	ldr	r3, .L44+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L37
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	seed
	.word	srand
	.word	initGame
	.size	lose, .-lose
	.align	2
	.global	goToGameFromPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameFromPause, %function
goToGameFromPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #1
	ldr	r5, .L48
	ldrb	r3, [r5]	@ zero_extendqisi2
	sub	sp, sp, #12
	ldr	ip, .L48+4
	ldr	r4, .L48+8
	str	r3, [sp]
	mov	r2, #36
	mov	r3, #8
	mov	r1, #60
	mov	r0, #102
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldrb	r2, [r5]	@ zero_extendqisi2
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #90
	mov	r2, #138
	mov	r0, #51
	mov	lr, pc
	bx	r4
	ldrb	r2, [r5]	@ zero_extendqisi2
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #100
	mov	r2, #204
	mov	r0, #18
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	bgColor
	.word	state
	.word	drawRect4
	.size	goToGameFromPause, .-goToGameFromPause
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
	ldr	r4, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L51
	ldr	r2, .L58+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L57
.L51:
	tst	r3, #8
	popne	{r4, lr}
	bne	pause.part.0
.L50:
	pop	{r4, lr}
	bx	lr
.L57:
	bl	goToGameFromPause
	ldrh	r3, [r4]
	b	.L51
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"PAUSED\000"
	.align	2
.LC5:
	.ascii	"press SELECT to unpause\000"
	.align	2
.LC6:
	.ascii	"press START to go to start screen\000"
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
	mov	lr, #2
	ldr	ip, .L62
	ldr	r4, .L62+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #102
	ldr	r2, .L62+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #90
	mov	r0, #51
	ldr	r2, .L62+12
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #100
	mov	r0, #18
	ldr	r2, .L62+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	state
	.word	drawString4
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L66+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"NEW HIGH SCORE!\000"
	.align	2
.LC8:
	.ascii	"YOU LOST\000"
	.align	2
.LC9:
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
	mov	r5, #4
	ldr	r3, .L73
	ldr	ip, .L73+4
	ldr	lr, [r3]
	ldr	r2, [ip]
	ldr	r3, .L73+8
	cmp	lr, r2
	str	r5, [r3]
	bgt	.L71
	ldr	r4, .L73+12
.L69:
	mov	r3, #0
	mov	r1, #81
	mov	r0, #97
	ldr	r2, .L73+16
	mov	lr, pc
	bx	r4
	mov	r3, #5
	mov	r1, #80
	mov	r0, #96
	ldr	r2, .L73+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #100
	mov	r0, #45
	ldr	r2, .L73+20
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	mov	r3, #0
	mov	r1, #21
	mov	r0, #76
	ldr	r2, .L73+24
	ldr	r4, .L73+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #20
	mov	r0, #75
	ldr	r2, .L73+24
	mov	lr, pc
	bx	r4
	b	.L69
.L74:
	.align	2
.L73:
	.word	score
	.word	hiscore
	.word	state
	.word	drawString4
	.word	.LC8
	.word	.LC9
	.word	.LC7
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
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L82
.L76:
	ldr	r3, .L84+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L75
	ldr	r3, .L84+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L83
.L75:
	pop	{r4, lr}
	bx	lr
.L82:
	bl	goToLose
	b	.L76
.L83:
	pop	{r4, lr}
	b	goToPause
.L85:
	.align	2
.L84:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	flipPage
	.word	lives
	.word	oldButtons
	.word	buttons
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
	ldr	r2, .L98
	ldr	r3, [r2]
	push	{r4, r7, fp, lr}
	add	r3, r3, #1
	ldr	r1, .L98+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r6, .L98+8
	ldr	r7, .L98+12
	ldr	r5, .L98+16
	ldr	fp, .L98+20
	ldr	r10, .L98+24
	ldr	r9, .L98+28
	ldr	r8, .L98+32
	ldr	r4, .L98+36
.L87:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L88:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L88
.L90:
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L89
.L89:
	ldr	r3, .L98+40
	mov	lr, pc
	bx	r3
	b	.L87
.L91:
	mov	lr, pc
	bx	r8
	b	.L87
.L92:
	mov	lr, pc
	bx	r9
	b	.L87
.L93:
	mov	lr, pc
	bx	r10
	b	.L87
.L94:
	mov	lr, pc
	bx	fp
	b	.L87
.L99:
	.align	2
.L98:
	.word	seed
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.word	lose
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
