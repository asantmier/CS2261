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
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+116
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+120
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+124
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+128
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+132
	ldr	r3, .L4+136
	strh	r2, [r5]	@ movhi
	ldr	r1, .L4+140
	ldrh	r0, [r3, #48]
	ldr	r2, .L4+144
	ldr	ip, .L4+148
	strh	r6, [r2]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+152
	str	r6, [ip]
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+156
	ldr	r3, .L4+160
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
	.word	100708352
	.word	tempinstructionsMap
	.word	-26997
	.word	67109664
	.word	world1Tiles
	.word	67112960
	.word	100712448
	.word	world1Map
	.word	bg_aff_default
	.word	-1920
	.word	bg2xOff
	.word	bg2yOff
	.word	hideSprites
	.word	shadowOAM
	.word	setupSounds
	.word	setupInterrupts
	.word	waitForVBlank
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
	push	{r4, r5, r6, lr}
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
	ands	r4, r3, #8
	beq	.L21
.L12:
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
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
	ldr	r3, .L22+40
	mov	lr, pc
	bx	r3
	ldr	r5, .L22+20
	mov	r0, #3
	ldr	r3, .L22+44
	ldr	r2, .L22+48
	ldr	r1, .L22+52
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L22+56
	ldr	r2, .L22+60
	ldr	r1, .L22+64
	mov	lr, pc
	bx	r5
	ldr	ip, .L22+68
	ldr	r3, .L22+72
	str	r4, [ip]
	ldr	r1, [r3]
	mov	r2, #1
	mov	r3, r4
	ldr	r0, .L22+76
	ldr	r4, .L22+80
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L22+84
	mov	lr, pc
	bx	r5
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L22+88
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
	.word	initGame
	.word	initWorld
	.word	67108992
	.word	100696064
	.word	world1parallaxTiles
	.word	67109888
	.word	100708352
	.word	world1parallaxMap
	.word	worldThemeCtr
	.word	worldTheme_length
	.word	worldTheme_data
	.word	playSoundA
	.word	world1Pal
	.word	5633
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
	.word	world1Pal
	.word	DMANow
	.word	5633
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
	ldr	r3, .L43+20
	ldr	r2, .L43+24
	ldr	r1, .L43+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #3
	ldr	r0, .L43+32
	ldr	r3, .L43+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	tempbattlePal
	.word	67110816
	.word	100679680
	.word	tempbattleTiles
	.word	67109376
	.word	100694016
	.word	tempbattleMap
	.word	4353
	.word	state
	.size	goToBattle, .-goToBattle
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
	ldr	r3, .L53
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldr	r2, [r3]
	add	r0, r2, #1
	bics	r0, r0, #2
	beq	.L50
	ldr	r4, .L53+8
.L46:
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L53+20
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L53+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldr	r3, .L53+28
	cmn	r2, #1
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #572]
	ldr	r1, [r3, #1128]
	ldr	r2, [r3, #1684]
	beq	.L52
	mov	r0, #1
	str	lr, [r3, #20]
	ldr	r4, .L53+32
	str	ip, [r3, #576]
	str	r1, [r3, #1132]
	str	r2, [r3, #1688]
	mov	lr, pc
	bx	r4
.L48:
	ldr	r3, .L53+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+8
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L53+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L53+44
	ldr	r3, .L53+48
	ldr	r1, [r2]
	ldr	r3, [r3]
	mov	r2, #1
	ldr	r0, .L53+52
	ldr	r5, .L53+56
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+60
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L53+64
	ldr	r3, .L53+68
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L46
.L52:
	ldr	r5, .L53+72
	ldr	r4, [r5]
	str	lr, [r3, #20]
	sub	r4, r4, #10
	str	ip, [r3, #576]
	ldr	r6, .L53+32
	str	r1, [r3, #1132]
	str	r2, [r3, #1688]
	str	r4, [r5]
	mov	lr, pc
	bx	r6
	b	.L48
.L54:
	.align	2
.L53:
	.word	updateBattle
	.word	battleStatus
	.word	DMANow
	.word	waitForVBlank
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	battleAllies
	.word	returnFromBattle
	.word	hideSprites
	.word	stopSound
	.word	worldTheme_length
	.word	worldThemeCtr
	.word	worldTheme_data
	.word	playSoundA
	.word	world1Pal
	.word	5633
	.word	state
	.word	submarineHp
	.size	battle, .-battle
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
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L57+12
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L57+24
	ldr	r2, .L57+28
	ldr	r1, .L57+32
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #4
	ldr	r0, .L57+36
	ldr	r3, .L57+40
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	pauseSound
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
	ldr	r3, .L71
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L60
	ldr	r2, .L71+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L69
.L60:
	tst	r3, #8
	beq	.L61
	ldr	r3, .L71+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L61:
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+20
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #2
	ldr	r0, .L71+24
	ldr	r3, .L71+28
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L61
.L70:
	bl	initialize
	b	.L61
.L72:
	.align	2
.L71:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	unpauseSound
	.word	DMANow
	.word	world1Pal
	.word	5633
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
	ldr	r4, .L75
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L75+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L75+8
	ldr	r2, .L75+12
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L75+20
	ldr	r2, .L75+24
	ldr	r1, .L75+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #5
	ldr	r0, .L75+32
	ldr	r3, .L75+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L76:
	.align	2
.L75:
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
	ldr	r3, .L84
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L78
	ldr	r3, .L84+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
.L78:
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L83:
	bl	initialize
	b	.L78
.L85:
	.align	2
.L84:
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
	ldr	r4, .L88
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L88+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L88+8
	ldr	r2, .L88+12
	ldr	r1, .L88+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L88+20
	ldr	r2, .L88+24
	ldr	r1, .L88+28
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #6
	ldr	r0, .L88+32
	ldr	r3, .L88+36
	strh	r0, [r1]	@ movhi
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L89:
	.align	2
.L88:
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
	ldr	r3, .L108
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L91
	ldr	r3, .L108+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L104
.L91:
	ldr	r3, .L108+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L105
.L92:
	ldr	r3, .L108+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L108+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L108+24
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L108+28
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L108+32
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	ldr	r3, .L108+36
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L106
.L93:
	ldr	r3, .L108+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L107
	pop	{r4, lr}
	bx	lr
.L107:
	ldr	r3, .L108+44
	ldr	r2, .L108+48
	ldr	r1, [r3, #28]
	ldr	r3, .L108+52
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+56
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L108+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L108+60
	ldr	r3, [r3]
	ldr	r2, .L108+64
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl #1
	add	r3, r2, r3, lsl #2
	ldr	r0, [r3, #40]
	ldr	r3, .L108+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+72
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L108+76
	ldreq	r2, .L108+80
	ldrne	r1, [r2]
	ldreq	r1, [r2]
	ldr	r4, .L108+84
	movne	r3, #0
	movne	r2, #1
	moveq	r2, #1
	ldrne	r0, .L108+88
	ldreq	r0, .L108+92
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToBattle
.L105:
	bl	goToWin
	b	.L92
.L106:
	bl	goToLose
	b	.L93
.L104:
	bl	goToPause
	b	.L91
.L109:
	.align	2
.L108:
	.word	updateWorld
	.word	oldButtons
	.word	buttons
	.word	gameVictory
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	submarineHp
	.word	doBattle
	.word	soundA
	.word	worldThemeCtr
	.word	stopSound
	.word	hideSprites
	.word	opponentIdx
	.word	enemies
	.word	initBattle
	.word	bossBattle
	.word	bossTheme_length
	.word	battleTheme_length
	.word	playSoundA
	.word	bossTheme_data
	.word	battleTheme_data
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L123
	mov	lr, pc
	bx	r3
	ldr	r3, .L123+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L123+8
	ldr	r8, .L123+12
	ldr	r5, .L123+16
	ldr	fp, .L123+20
	ldr	r10, .L123+24
	ldr	r9, .L123+28
	ldr	r7, .L123+32
	ldr	r4, .L123+36
.L111:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L112:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L112
.L114:
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L113
	.word	.L113
.L113:
	mov	lr, pc
	bx	r7
	b	.L111
.L115:
	ldr	r3, .L123+40
	mov	lr, pc
	bx	r3
	b	.L111
.L116:
	ldr	r3, .L123+44
	mov	lr, pc
	bx	r3
	b	.L111
.L117:
	mov	lr, pc
	bx	r9
	b	.L111
.L118:
	mov	lr, pc
	bx	r10
	b	.L111
.L119:
	mov	lr, pc
	bx	fp
	b	.L111
.L124:
	.align	2
.L123:
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
	.comm	worldThemeCtr,4,4
	.comm	randTimer,4,4
	.comm	bg2yOff,4,4
	.comm	bg2xOff,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	levels,5040,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
