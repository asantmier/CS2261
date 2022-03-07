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
	mov	r1, #80
	ldr	r2, .L4+36
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
	mov	r3, #0
	ldr	r1, .L4+48
	ldr	r2, .L4+52
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
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
	.word	seed
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
	.set	lose.part.0,win.part.0
	.set	pause.part.0,win.part.0
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
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L27
	ldr	r4, [r6]
	bics	r4, r4, #4
	sub	sp, sp, #12
	beq	.L26
.L24:
	mov	r3, #1
	str	r3, [r6]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L26:
	mov	r10, #210
	ldr	r5, .L27+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r5
	ldr	r3, .L27+12
	ldr	r2, .L27+16
	ldr	r3, [r3]
	ldr	r1, .L27+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	fp, .L27+24
	ldr	r0, .L27+28
	mov	lr, pc
	bx	fp
	ldr	ip, .L27+32
	mov	r1, r4
	mov	r0, r4
	mov	r3, #10
	mov	r2, #240
	str	r10, [sp]
	mov	lr, pc
	bx	ip
	mov	r1, #1
	ldr	r7, .L27+36
	mov	r0, r1
	mov	r3, #209
	ldr	r2, .L27+40
	mov	lr, pc
	bx	r7
	ldr	r8, .L27+44
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #37
	mov	lr, pc
	bx	r8
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #43
	mov	lr, pc
	bx	r8
	mov	r3, #209
	mov	r2, #3
	mov	r1, #1
	mov	r0, #49
	mov	lr, pc
	bx	r8
	mov	r3, #209
	mov	r1, #1
	mov	r0, #96
	ldr	r2, .L27+48
	mov	r5, #209
	mov	lr, pc
	bx	r7
	mov	r3, #1
	ldr	r9, .L27+52
	mov	r1, r3
	mov	r2, #2
	mov	r0, #132
	str	r5, [sp]
	mov	lr, pc
	bx	r9
	mov	r3, r5
	mov	r1, #1
	mov	r0, #167
	ldr	r2, .L27+56
	mov	lr, pc
	bx	r7
	mov	r2, #6
	mov	r1, #1
	mov	r0, #203
	mov	r3, r4
	str	r5, [sp]
	mov	lr, pc
	bx	r9
	ldr	r3, .L27+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+64
	mov	lr, pc
	bx	r3
	ldr	r0, .L27+28
	mov	lr, pc
	bx	fp
	ldr	ip, .L27+32
	mov	r1, r4
	mov	r0, r4
	mov	r3, #10
	mov	r2, #240
	str	r10, [sp]
	mov	lr, pc
	bx	ip
	mov	r1, #1
	mov	r3, r5
	mov	r0, r1
	ldr	r2, .L27+40
	mov	lr, pc
	bx	r7
	mov	r3, r5
	mov	r2, #3
	mov	r1, #1
	mov	r0, #37
	mov	lr, pc
	bx	r8
	mov	r3, r5
	mov	r2, #3
	mov	r1, #1
	mov	r0, #43
	mov	lr, pc
	bx	r8
	mov	r3, r5
	mov	r2, #3
	mov	r1, #1
	mov	r0, #49
	mov	lr, pc
	bx	r8
	mov	r3, r5
	mov	r1, #1
	mov	r0, #96
	ldr	r2, .L27+48
	mov	lr, pc
	bx	r7
	mov	r3, #1
	mov	r2, #2
	mov	r1, r3
	mov	r0, #132
	str	r5, [sp]
	mov	lr, pc
	bx	r9
	mov	r3, r5
	mov	r1, #1
	mov	r0, #167
	ldr	r2, .L27+56
	mov	lr, pc
	bx	r7
	mov	r3, r4
	mov	r2, #6
	mov	r1, #1
	mov	r0, #203
	str	r5, [sp]
	mov	lr, pc
	bx	r9
	b	.L24
.L28:
	.align	2
.L27:
	.word	state
	.word	DMANow
	.word	gamePal
	.word	numColors
	.word	83886496
	.word	colors
	.word	drawFullscreenImage4
	.word	backgroundBitmap
	.word	drawRect4
	.word	drawString4
	.word	.LC4
	.word	drawChar4
	.word	.LC5
	.word	drawInt4
	.word	.LC6
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
	ldr	r3, .L36
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L35
.L29:
	pop	{r4, lr}
	bx	lr
.L35:
	ldr	r2, .L36+12
	ldr	r3, .L36+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r0, #1
	ldr	r3, .L36+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	r4, .L46
	ldr	r3, .L46+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L39
	ldr	r2, .L46+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L45
.L39:
	tst	r3, #8
	popne	{r4, lr}
	bne	pause.part.0
.L38:
	pop	{r4, lr}
	bx	lr
.L45:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L39
.L47:
	.align	2
.L46:
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
	ldr	r4, .L56
	ldr	r3, .L56+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L49
	ldr	r2, .L56+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L55
.L49:
	tst	r3, #8
	popne	{r4, lr}
	bne	lose.part.0
.L48:
	pop	{r4, lr}
	bx	lr
.L55:
	ldr	r2, .L56+12
	ldr	r3, .L56+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L56+20
	mov	r0, #1
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L49
.L57:
	.align	2
.L56:
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
	ldr	r4, .L60
	mov	r1, #60
	mov	r0, #102
	ldr	r2, .L60+4
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #90
	mov	r0, #51
	ldr	r2, .L60+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L60+12
	mov	r1, #100
	mov	r0, #9
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L60+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L60+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L61:
	.align	2
.L60:
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
	.ascii	"VICTORY\000"
	.text
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
	mov	r3, #212
	ldr	r4, .L64
	mov	r1, #60
	mov	r0, #99
	ldr	r2, .L64+4
	mov	lr, pc
	bx	r4
	ldr	r2, .L64+8
	mov	r1, #100
	mov	r0, #9
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L64+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L65:
	.align	2
.L64:
	.word	drawString4
	.word	.LC10
	.word	.LC9
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"Final Score: \000"
	.align	2
.LC12:
	.ascii	"NEW HIGH SCORE!\000"
	.align	2
.LC13:
	.ascii	"GAME OVER\000"
	.align	2
.LC14:
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
	ldr	r2, .L70
	mov	r1, #18
	mov	r0, #63
	ldr	r4, .L70+4
	sub	sp, sp, #8
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+8
	ldr	ip, .L70+12
	ldr	r3, [r3]
	ldr	r2, [ip]
	cmp	r3, r2
	ble	.L67
	mov	r5, #212
	mov	r2, #6
	mov	r1, #18
	mov	r0, #141
	str	r5, [sp]
	ldr	r6, .L70+16
	str	r3, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #226
	mov	r1, #31
	mov	r0, #76
	ldr	r2, .L70+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #30
	mov	r0, #75
	ldr	r2, .L70+20
	mov	lr, pc
	bx	r4
.L68:
	mov	r3, #227
	mov	r1, #81
	mov	r0, #94
	ldr	r2, .L70+24
	mov	lr, pc
	bx	r4
	mov	r3, #211
	mov	r1, #80
	mov	r0, #93
	ldr	r2, .L70+24
	mov	lr, pc
	bx	r4
	mov	r3, #209
	mov	r1, #100
	mov	r0, #45
	ldr	r2, .L70+28
	mov	lr, pc
	bx	r4
	mov	r1, #110
	mov	r0, #9
	ldr	r2, .L70+32
	mov	r3, #209
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+40
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L70+44
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	mov	r2, #209
	mov	r1, #18
	str	r2, [sp]
	mov	r0, #141
	mov	r2, #6
	ldr	r5, .L70+16
	mov	lr, pc
	bx	r5
	b	.L68
.L71:
	.align	2
.L70:
	.word	.LC11
	.word	drawString4
	.word	score
	.word	hiscore
	.word	drawInt4
	.word	.LC12
	.word	.LC13
	.word	.LC14
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
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L86
.L73:
	ldr	r3, .L89+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L87
.L74:
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L72
	ldr	r3, .L89+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L88
.L72:
	pop	{r4, lr}
	bx	lr
.L87:
	bl	goToLose
	b	.L74
.L86:
	ldr	r1, .L89+32
	ldr	r2, .L89+36
	ldr	r3, [r1]
	ldr	r0, [r2]
	add	r3, r3, #9984
	add	r0, r0, #1
	add	r3, r3, #16
	ldr	r4, .L89+40
	str	r3, [r1]
	str	r0, [r2]
	mov	lr, pc
	bx	r4
	b	.L73
.L88:
	pop	{r4, lr}
	b	goToPause
.L90:
	.align	2
.L89:
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
	ldr	r2, .L103
	ldr	r3, [r2]
	push	{r4, r7, fp, lr}
	add	r3, r3, #1
	ldr	r1, .L103+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r6, .L103+8
	ldr	r7, .L103+12
	ldr	r5, .L103+16
	ldr	fp, .L103+20
	ldr	r10, .L103+24
	ldr	r9, .L103+28
	ldr	r8, .L103+32
	ldr	r4, .L103+36
.L92:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L93:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L93
.L95:
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L96
	.word	.L94
.L94:
	ldr	r3, .L103+40
	mov	lr, pc
	bx	r3
	b	.L92
.L96:
	mov	lr, pc
	bx	r8
	b	.L92
.L97:
	mov	lr, pc
	bx	r9
	b	.L92
.L98:
	mov	lr, pc
	bx	r10
	b	.L92
.L99:
	mov	lr, pc
	bx	fp
	b	.L92
.L104:
	.align	2
.L103:
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
