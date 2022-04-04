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
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #1
	mov	r5, #67108864
	mov	r6, #0
	ldr	r4, .L4
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	mov	r3, #256
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	ldr	r7, .L4+12
	mov	r0, #3
	ldr	r3, .L4+16
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L4+28
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+48
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L4+52
	ldr	r2, .L4+56
	ldr	r1, .L4+60
	mov	lr, pc
	bx	r4
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L4+64
	ldr	r1, .L4+68
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+72
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r3, .L4+76
	mov	r2, #100663296
	ldr	r1, .L4+80
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L4+84
	ldr	r2, .L4+88
	ldr	r1, .L4+92
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+96
	ldm	r3, {r0, r1, r2, r3}
	add	ip, r5, #32
	stm	ip, {r0, r1, r2, r3}
	ldr	r1, .L4+100
	ldr	r2, .L4+104
	ldr	r3, .L4+108
	strh	r1, [r5, #12]	@ movhi
	str	r6, [r3]
	str	r6, [r2]
	str	r6, [r5, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r5, #44]
	ldr	r3, .L4+112
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+116
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+120
	ldr	r3, .L4+124
	strh	r2, [r5]	@ movhi
	ldr	r1, .L4+128
	ldrh	r0, [r3, #48]
	ldr	r2, .L4+132
	ldr	ip, .L4+136
	strh	r6, [r2]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+140
	str	r6, [ip]
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+144
	ldr	r3, .L4+148
	strh	r2, [r5]	@ movhi
	str	r6, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	tempspritesheetPal
	.word	67109376
	.word	67117056
	.word	100728832
	.word	tempspritesheetTiles
	.word	67109696
	.word	100679680
	.word	tempsplashTiles
	.word	100694016
	.word	tempsplashMap
	.word	3972
	.word	67109216
	.word	100696064
	.word	tempinstructionsTiles
	.word	100710400
	.word	tempinstructionsMap
	.word	6024
	.word	67110448
	.word	tempbackgroundTiles
	.word	67112960
	.word	100712448
	.word	tempbackgroundMap
	.word	bg_aff_default
	.word	-1920
	.word	bg2xOff
	.word	bg2yOff
	.word	hideSprites
	.word	shadowOAM
	.word	5121
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	randTimer
	.word	tempsplashPal
	.word	4353
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8
	ldr	r4, .L8+4
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L8+8
	ldr	r3, .L8+12
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	tempsplashPal
	.word	DMANow
	.word	4353
	.word	state
	.size	goToStart, .-goToStart
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
	ldr	r3, .L22
	ldr	r2, .L22+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #4
	push	{r4, lr}
	str	r0, [r3]
	beq	.L11
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L20
.L11:
	tst	r2, #8
	beq	.L12
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L21
.L12:
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+16
	ldr	r4, .L22+20
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #1
	ldr	r0, .L22+24
	ldr	r3, .L22+28
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L12
.L21:
	ldr	r3, .L22+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L22+20
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+40
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L22+44
	ldr	r3, .L22+28
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L12
.L23:
	.align	2
.L22:
	.word	randTimer
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	tempinstructionsPal
	.word	DMANow
	.word	4609
	.word	state
	.word	srand
	.word	initWorld
	.word	tempbackgroundPal
	.word	5121
	.size	start, .-start
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26
	ldr	r4, .L26+4
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #1
	ldr	r0, .L26+8
	ldr	r3, .L26+12
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	tempinstructionsPal
	.word	DMANow
	.word	4609
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, r5, r6, lr}
	beq	.L29
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L34
.L29:
	ldr	r3, .L35+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L35+12
	mov	r0, #3
	ldr	r5, .L35+16
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldr	r1, .L35+20
	ldr	r3, .L35+24
	strh	r1, [r2]	@ movhi
	str	r4, [r3]
	b	.L29
.L36:
	.align	2
.L35:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	tempsplashPal
	.word	DMANow
	.word	4353
	.word	state
	.size	instructions, .-instructions
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
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L39
	ldr	r4, .L39+4
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L39+8
	ldr	r3, .L39+12
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	tempbackgroundPal
	.word	DMANow
	.word	5121
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToBattle
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBattle, %function
goToBattle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L43
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L43+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L43+8
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L43+20
	ldr	r1, .L43+24
	ldr	r3, .L43+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L43+36
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #3
	ldr	r0, .L43+40
	ldr	r3, .L43+44
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	tempbattlePal
	.word	67109744
	.word	100679680
	.word	tempbattleTiles
	.word	100694016
	.word	tempbattleMap
	.word	67109376
	.word	hideSprites
	.word	shadowOAM
	.word	4353
	.word	state
	.size	goToBattle, .-goToBattle
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
	mov	r3, #256
	ldr	r4, .L47
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L47+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L47+8
	ldr	r2, .L47+12
	ldr	r1, .L47+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L47+20
	ldr	r2, .L47+24
	ldr	r1, .L47+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #4
	ldr	r0, .L47+32
	ldr	r3, .L47+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	DMANow
	.word	temppausePal
	.word	67109616
	.word	100679680
	.word	temppauseTiles
	.word	67109376
	.word	100694016
	.word	temppauseMap
	.word	257
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L61
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L50
	ldr	r2, .L61+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L59
.L50:
	tst	r3, #8
	beq	.L51
	ldr	r3, .L61+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
.L51:
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L59:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+12
	ldr	r4, .L61+16
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L61+20
	ldr	r3, .L61+24
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L51
.L60:
	bl	initialize
	b	.L51
.L62:
	.align	2
.L61:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	tempbackgroundPal
	.word	DMANow
	.word	5121
	.word	state
	.size	pause, .-pause
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
	mov	r3, #256
	ldr	r4, .L65
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L65+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L65+8
	ldr	r2, .L65+12
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L65+20
	ldr	r2, .L65+24
	ldr	r1, .L65+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #5
	ldr	r0, .L65+32
	ldr	r3, .L65+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	DMANow
	.word	tempwinPal
	.word	67109104
	.word	100679680
	.word	tempwinTiles
	.word	67109376
	.word	100694016
	.word	tempwinMap
	.word	257
	.word	state
	.size	goToWin, .-goToWin
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
	ldr	r3, .L74
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L68
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L73
.L68:
	ldr	r3, .L74+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L73:
	bl	initialize
	b	.L68
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	win, .-win
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
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L78
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L78+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L78+8
	ldr	r2, .L78+12
	ldr	r1, .L78+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L78+20
	ldr	r2, .L78+24
	ldr	r1, .L78+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #6
	ldr	r0, .L78+32
	ldr	r3, .L78+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L79:
	.align	2
.L78:
	.word	DMANow
	.word	templosePal
	.word	67109216
	.word	100679680
	.word	temploseTiles
	.word	67109376
	.word	100694016
	.word	temploseMap
	.word	257
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
	ldr	r3, .L99
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L81
	ldr	r2, .L99+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L95
.L81:
	tst	r3, #512
	beq	.L83
	ldr	r2, .L99+8
	ldrh	r2, [r2]
	tst	r2, #512
	beq	.L96
.L83:
	tst	r3, #2
	bne	.L97
.L82:
	ldr	r3, .L99+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L99+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L99+20
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L99+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L99+28
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	ldr	r3, .L99+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L98
	pop	{r4, lr}
	bx	lr
.L97:
	ldr	r3, .L99+8
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L82
	bl	goToLose
	b	.L82
.L98:
	pop	{r4, lr}
	b	goToBattle
.L95:
	bl	goToPause
	b	.L82
.L96:
	bl	goToWin
	b	.L82
.L100:
	.align	2
.L99:
	.word	updateWorld
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	doBattle
	.size	game, .-game
	.align	2
	.global	battle
	.syntax unified
	.arm
	.fpu softvfp
	.type	battle, %function
battle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L115
	ldrh	r3, [r3]
	tst	r3, #512
	push	{r4, lr}
	beq	.L102
	ldr	r2, .L115+4
	ldrh	r2, [r2]
	tst	r2, #512
	beq	.L114
.L102:
	tst	r3, #256
	bne	.L110
.L113:
	ldr	r4, .L115+8
.L103:
	ldr	r3, .L115+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L115+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L115+20
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L115+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	pop	{r4, lr}
	bx	lr
.L110:
	ldr	r3, .L115+4
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L113
	mov	r0, #1
	ldr	r3, .L115+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L115+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L115+32
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L115+36
	ldr	r3, .L115+40
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L103
.L114:
	bl	goToLose
	ldr	r4, .L115+8
	b	.L103
.L116:
	.align	2
.L115:
	.word	oldButtons
	.word	buttons
	.word	DMANow
	.word	waitForVBlank
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	returnFromBattle
	.word	tempbackgroundPal
	.word	5121
	.word	state
	.size	battle, .-battle
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L130
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L130+8
	ldr	r8, .L130+12
	ldr	r5, .L130+16
	ldr	fp, .L130+20
	ldr	r10, .L130+24
	ldr	r9, .L130+28
	ldr	r7, .L130+32
	ldr	r4, .L130+36
.L118:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L119:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L119
.L121:
	.word	.L126
	.word	.L125
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L120
	.word	.L120
.L120:
	mov	lr, pc
	bx	r7
	b	.L118
.L122:
	ldr	r3, .L130+40
	mov	lr, pc
	bx	r3
	b	.L118
.L123:
	ldr	r3, .L130+44
	mov	lr, pc
	bx	r3
	b	.L118
.L124:
	mov	lr, pc
	bx	r9
	b	.L118
.L125:
	mov	lr, pc
	bx	r10
	b	.L118
.L126:
	mov	lr, pc
	bx	fp
	b	.L118
.L131:
	.align	2
.L130:
	.word	mgba_open
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.word	battle
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	randTimer,4,4
	.comm	bg2yOff,4,4
	.comm	bg2xOff,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	levels,240,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
