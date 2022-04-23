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
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r4, .L8
	ldr	r3, .L8+4
	strh	r5, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #2]
	tst	r3, #32
	beq	.L2
	mov	r3, #32
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	str	r5, [r1]
	strh	r5, [r2, #10]	@ movhi
	strh	r3, [r4, #2]	@ movhi
.L2:
	mov	r2, #1
	ldr	r3, .L8
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	67109376
	.word	soundInterruptHandler
	.word	waiting
	.word	67109120
	.size	interruptHandler, .-interruptHandler
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
	ldr	r1, .L12
	ldr	r4, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #0
	ldr	ip, .L12+8
	ldr	r0, .L12+12
	ldr	r2, .L12+16
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L13:
	.align	2
.L12:
	.word	splashscreenPal
	.word	DMANow
	.word	3844
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
	ldr	r3, .L26
	ldr	r2, .L26+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #4
	push	{r4, r5, r6, lr}
	str	r0, [r3]
	beq	.L15
	ldr	r3, .L26+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L24
.L15:
	tst	r2, #8
	beq	.L16
	ldr	r3, .L26+8
	ldrh	r3, [r3]
	ands	r4, r3, #8
	beq	.L25
.L16:
	ldr	r3, .L26+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26+16
	ldr	r4, .L26+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #1
	ldr	ip, .L26+24
	ldr	r0, .L26+28
	ldr	r2, .L26+32
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L16
.L25:
	ldr	r3, .L26+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+44
	mov	lr, pc
	bx	r3
	ldr	r5, .L26+20
	mov	r0, #3
	ldr	r3, .L26+48
	ldr	r2, .L26+52
	ldr	r1, .L26+56
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L26+60
	ldr	r2, .L26+64
	ldr	r1, .L26+68
	mov	lr, pc
	bx	r5
	ldr	ip, .L26+72
	ldr	r3, .L26+76
	str	r4, [ip]
	ldr	r1, [r3]
	mov	r2, #1
	mov	r3, r4
	ldr	r0, .L26+80
	ldr	r4, .L26+84
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26+88
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L26+92
	ldr	r0, .L26+96
	ldr	r2, .L26+32
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L16
.L27:
	.align	2
.L26:
	.word	randTimer
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	instructionsPal
	.word	DMANow
	.word	-27125
	.word	4609
	.word	state
	.word	srand
	.word	initGame
	.word	initWorld
	.word	67109344
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
	.word	-26997
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
	ldr	r1, .L30
	ldr	r4, .L30+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #1
	ldr	ip, .L30+8
	ldr	r0, .L30+12
	ldr	r2, .L30+16
	strh	ip, [r3, #10]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L31:
	.align	2
.L30:
	.word	instructionsPal
	.word	DMANow
	.word	-27125
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
	ldr	r3, .L39
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, r5, r6, lr}
	beq	.L33
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L38
.L33:
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L39+12
	ldr	r5, .L39+16
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	ldr	r0, .L39+20
	ldr	r1, .L39+24
	ldr	r2, .L39+28
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	str	r4, [r2]
	b	.L33
.L40:
	.align	2
.L39:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	splashscreenPal
	.word	DMANow
	.word	3844
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
	ldr	r1, .L43
	ldr	r4, .L43+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L43+8
	ldr	r0, .L43+12
	ldr	r2, .L43+16
	strh	ip, [r3, #10]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L44:
	.align	2
.L43:
	.word	world1Pal
	.word	DMANow
	.word	-26997
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r2, .L47
	ldr	r4, .L47+4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L47+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L47+12
	ldr	r2, .L47+16
	ldr	r1, .L47+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L47+24
	ldr	r2, .L47+28
	ldr	r1, .L47+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r1, .L47+36
	ldr	r3, .L47+40
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	3972
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
	ldr	r3, .L57
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	ldr	r2, [r3]
	add	r0, r2, #1
	bics	r0, r0, #2
	beq	.L54
	ldr	r4, .L57+8
.L50:
	ldr	r3, .L57+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L57+20
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L57+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	ldr	r3, .L57+28
	cmn	r2, #1
	ldr	lr, [r3, #16]
	ldr	ip, [r3, #572]
	ldr	r1, [r3, #1128]
	ldr	r2, [r3, #1684]
	beq	.L56
	mov	r0, #1
	str	lr, [r3, #20]
	ldr	r4, .L57+32
	str	ip, [r3, #576]
	str	r1, [r3, #1132]
	str	r2, [r3, #1688]
	mov	lr, pc
	bx	r4
.L52:
	ldr	r3, .L57+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L57+8
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L57+44
	ldr	r3, .L57+48
	ldr	r1, [r2]
	ldr	r3, [r3]
	mov	r2, #1
	ldr	r0, .L57+52
	ldr	r5, .L57+56
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L57+60
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L57+64
	ldr	r0, .L57+68
	ldr	r2, .L57+72
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L50
.L56:
	ldr	r5, .L57+76
	ldr	r4, [r5]
	str	lr, [r3, #20]
	sub	r4, r4, #10
	str	ip, [r3, #576]
	ldr	r6, .L57+32
	str	r1, [r3, #1132]
	str	r2, [r3, #1688]
	str	r4, [r5]
	mov	lr, pc
	bx	r6
	b	.L52
.L58:
	.align	2
.L57:
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
	.word	-26997
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r2, .L61+4
	ldr	r4, .L61+8
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L61+16
	ldr	r2, .L61+20
	ldr	r1, .L61+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+28
	ldr	r2, .L61+32
	ldr	r1, .L61+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r1, .L61+40
	ldr	r3, .L61+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	pauseSound
	.word	3844
	.word	DMANow
	.word	pausePal
	.word	67109968
	.word	100679680
	.word	pauseTiles
	.word	67109376
	.word	100694016
	.word	pauseMap
	.word	257
	.word	state
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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r3, .L65
	mov	lr, pc
	bx	r3
	ldr	r2, .L65+4
	ldr	r4, .L65+8
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L65+16
	ldr	r2, .L65+20
	ldr	r1, .L65+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L65+28
	ldr	r2, .L65+32
	ldr	r1, .L65+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r1, .L65+40
	ldr	r3, .L65+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	stopSound
	.word	3844
	.word	DMANow
	.word	winPal
	.word	67110152
	.word	100679680
	.word	winTiles
	.word	67109376
	.word	100694016
	.word	winMap
	.word	257
	.word	state
	.size	goToWin, .-goToWin
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
	mov	r5, #67108864
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r2, .L69+4
	ldr	r4, .L69+8
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L69+16
	ldr	r2, .L69+20
	ldr	r1, .L69+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+28
	ldr	r2, .L69+32
	ldr	r1, .L69+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r1, .L69+40
	ldr	r3, .L69+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	stopSound
	.word	3844
	.word	DMANow
	.word	losePal
	.word	67110256
	.word	100679680
	.word	loseTiles
	.word	67109376
	.word	100694016
	.word	loseMap
	.word	257
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	prepareWorldAnim
	.syntax unified
	.arm
	.fpu softvfp
	.type	prepareWorldAnim, %function
prepareWorldAnim:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L73
	ldr	r4, .L73+4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+8
	ldr	r1, .L73+12
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+16
	ldr	r1, .L73+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+24
	ldr	r1, .L73+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+32
	ldr	r1, .L73+36
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+40
	ldr	r1, .L73+44
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+48
	ldr	r1, .L73+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+56
	ldr	r1, .L73+60
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+64
	ldr	r1, .L73+68
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+72
	ldr	r1, .L73+76
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+80
	ldr	r1, .L73+84
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+88
	ldr	r1, .L73+92
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L73+96
	ldr	r1, .L73+100
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	67108880
	.word	DMANow
	.word	100668416
	.word	100663744
	.word	100668480
	.word	100663424
	.word	100668544
	.word	100663488
	.word	100668608
	.word	100663680
	.word	100668672
	.word	100664128
	.word	100668736
	.word	100663552
	.word	100668800
	.word	100664256
	.word	100668864
	.word	100663616
	.word	100668928
	.word	100664832
	.word	100668992
	.word	100663808
	.word	100669056
	.word	100664768
	.word	100669120
	.word	100664064
	.size	prepareWorldAnim, .-prepareWorldAnim
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #67108864
	mov	r9, #1
	mov	r5, #0
	ldr	r6, .L77
	strh	r9, [r4]	@ movhi
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L77+4
	ldr	r1, .L77+8
	mov	lr, pc
	bx	r6
	ldr	r7, .L77+12
	mov	r0, #3
	ldr	r3, .L77+16
	ldr	r2, .L77+20
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r6
	ldr	r8, .L77+28
	mov	r0, #3
	ldr	r3, .L77+32
	ldr	r2, .L77+36
	ldr	r1, .L77+40
	mov	lr, pc
	bx	r6
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L77+44
	ldr	r1, .L77+48
	mov	lr, pc
	bx	r6
	mov	r0, #3
	strh	r8, [r4, #8]	@ movhi
	ldr	r3, .L77+52
	ldr	r2, .L77+56
	ldr	r1, .L77+60
	mov	lr, pc
	bx	r6
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L77+64
	ldr	r1, .L77+68
	mov	lr, pc
	bx	r6
	ldr	r3, .L77+72
	ldr	r1, .L77+76
	ldr	r2, .L77+80
	strh	r3, [r4, #10]	@ movhi
	mov	r0, #3
	str	r5, [r1]
	str	r5, [r2]
	ldr	r3, .L77+84
	strh	r5, [r4, #20]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L77+88
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L77+92
	ldr	r2, .L77+96
	ldr	r1, .L77+100
	mov	lr, pc
	bx	r6
	ldr	r3, .L77+104
	ldm	r3, {r0, r1, r2, r3}
	add	ip, r4, #32
	stm	ip, {r0, r1, r2, r3}
	ldr	r1, .L77+108
	ldr	r2, .L77+112
	ldr	r3, .L77+116
	strh	r1, [r4, #12]	@ movhi
	str	r5, [r2]
	str	r5, [r3]
	str	r5, [r4, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r4, #44]
	ldr	r3, .L77+120
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L77+124
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r6
	ldr	r3, .L77+128
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+132
	mov	lr, pc
	bx	r3
	ldr	r2, .L77+136
	ldr	r3, .L77+140
	strh	r9, [r7, #8]	@ movhi
	str	r2, [r3, #4092]
	bl	prepareWorldAnim
	ldr	r3, .L77+144
	mov	lr, pc
	bx	r3
	ldr	r2, .L77+148
	ldr	r3, .L77+152
	strh	r2, [r4]	@ movhi
	ldr	lr, .L77+156
	ldrh	r7, [r3, #48]
	ldr	r9, .L77+160
	ldr	ip, .L77+164
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L77+168
	strh	r5, [r9]	@ movhi
	strh	r7, [lr]	@ movhi
	str	r5, [ip]
	mov	lr, pc
	bx	r6
	ldr	r2, .L77+172
	ldr	r3, .L77+176
	strh	r8, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	str	r5, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	DMANow
	.word	83886592
	.word	tempspritesheetPal
	.word	67109376
	.word	67117056
	.word	100728832
	.word	tempspritesheetTiles
	.word	3844
	.word	67112496
	.word	100679680
	.word	splashscreenTiles
	.word	100694016
	.word	splashscreenMap
	.word	67111904
	.word	100696064
	.word	instructionsTiles
	.word	100708352
	.word	instructionsMap
	.word	-27125
	.word	bg1xOff
	.word	bg1yOff
	.word	67110032
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
	.word	setupSoundInterrupts
	.word	interruptHandler
	.word	50360320
	.word	waitForVBlank
	.word	5121
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	randTimer
	.word	splashscreenPal
	.word	4353
	.word	state
	.size	initialize, .-initialize
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
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L80
	ldr	r2, .L91+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L89
.L80:
	tst	r3, #8
	beq	.L81
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L81:
	ldr	r3, .L91+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L89:
	ldr	r3, .L91+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L91+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L91+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L91+24
	ldr	r0, .L91+28
	ldr	r2, .L91+32
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L81
.L90:
	bl	initialize
	b	.L81
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	unpauseSound
	.word	DMANow
	.word	world1Pal
	.word	-26997
	.word	5633
	.word	state
	.size	pause, .-pause
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
	ldr	r3, .L100
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L94
	ldr	r3, .L100+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L99
.L94:
	ldr	r3, .L100+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L99:
	bl	initialize
	b	.L94
.L101:
	.align	2
.L100:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	win, .-win
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
	.align	2
	.global	worldAnim
	.syntax unified
	.arm
	.fpu softvfp
	.type	worldAnim, %function
worldAnim:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L110
	ldr	r3, [r4, #4]
	cmp	r3, #30
	ldr	r3, [r4]
	ble	.L104
	mov	r0, #0
	ldr	r1, .L110+4
	add	r2, r3, #1
	smull	ip, r3, r1, r2
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r4]
	str	r0, [r4, #4]
.L104:
	cmp	r3, #1
	beq	.L105
	cmp	r3, #2
	beq	.L106
	cmp	r3, #0
	beq	.L109
.L107:
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	ldr	r5, .L110+8
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+16
	ldr	r1, .L110+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+24
	ldr	r1, .L110+28
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+32
	ldr	r1, .L110+36
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+40
	ldr	r1, .L110+44
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+48
	ldr	r1, .L110+52
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+56
	ldr	r1, .L110+60
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+64
	ldr	r1, .L110+68
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+72
	ldr	r1, .L110+76
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+80
	ldr	r1, .L110+84
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+88
	ldr	r1, .L110+92
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+96
	ldr	r1, .L110+100
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+104
	ldr	r1, .L110+108
	mov	lr, pc
	bx	r5
	b	.L107
.L109:
	ldr	r5, .L110+8
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+16
	ldr	r1, .L110+112
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+24
	ldr	r1, .L110+116
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+32
	ldr	r1, .L110+120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+40
	ldr	r1, .L110+124
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+48
	ldr	r1, .L110+128
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+56
	ldr	r1, .L110+132
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+64
	ldr	r1, .L110+136
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+72
	ldr	r1, .L110+140
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+80
	ldr	r1, .L110+144
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+88
	ldr	r1, .L110+148
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+96
	ldr	r1, .L110+152
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+104
	ldr	r1, .L110+156
	mov	lr, pc
	bx	r5
	b	.L107
.L106:
	ldr	r5, .L110+8
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+16
	ldr	r1, .L110+160
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+24
	ldr	r1, .L110+164
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+32
	ldr	r1, .L110+168
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+40
	ldr	r1, .L110+172
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+48
	ldr	r1, .L110+176
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+56
	ldr	r1, .L110+180
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+64
	ldr	r1, .L110+184
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+72
	ldr	r1, .L110+188
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+80
	ldr	r1, .L110+192
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+88
	ldr	r1, .L110+196
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+96
	ldr	r1, .L110+200
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L110+12
	ldr	r2, .L110+104
	ldr	r1, .L110+204
	mov	lr, pc
	bx	r5
	b	.L107
.L111:
	.align	2
.L110:
	.word	.LANCHOR0
	.word	1431655766
	.word	DMANow
	.word	67108880
	.word	100663744
	.word	100667840
	.word	100663424
	.word	100667584
	.word	100663488
	.word	100667328
	.word	100663680
	.word	100667456
	.word	100664128
	.word	100667712
	.word	100663552
	.word	100667136
	.word	100664256
	.word	100667008
	.word	100663616
	.word	100666880
	.word	100664832
	.word	100666752
	.word	100663808
	.word	100666624
	.word	100664768
	.word	100666496
	.word	100664064
	.word	100666368
	.word	100668416
	.word	100668480
	.word	100668544
	.word	100668608
	.word	100668672
	.word	100668736
	.word	100668800
	.word	100668864
	.word	100668928
	.word	100668992
	.word	100669056
	.word	100669120
	.word	100667904
	.word	100667648
	.word	100667392
	.word	100667520
	.word	100667776
	.word	100667200
	.word	100667072
	.word	100666944
	.word	100666816
	.word	100666688
	.word	100666560
	.word	100666432
	.size	worldAnim, .-worldAnim
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
	ldr	r3, .L130
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	bl	worldAnim
	ldr	r3, .L130+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L113
	ldr	r3, .L130+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L126
.L113:
	ldr	r3, .L130+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L127
.L114:
	ldr	r3, .L130+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L130+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+24
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	r0, .L130+28
	ldr	r3, [r0]
	lsl	r3, r3, #8
	str	r3, [r1, #40]
	ldr	r2, .L130+32
	ldr	r3, [r2]
	lsl	r3, r3, #8
	str	r3, [r1, #44]
	ldr	r3, [r0]
	add	r0, r3, #3
	cmp	r3, #0
	movlt	r3, r0
	ldr	r2, [r2]
	ldr	ip, .L130+36
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r2, [ip]
	ldr	ip, .L130+40
	asr	r3, r3, #2
	str	r3, [ip]
	lsl	r0, r2, #16
	lsl	r2, r3, #16
	ldr	r3, .L130+44
	ldr	r3, [r3]
	lsr	r0, r0, #16
	lsr	r2, r2, #16
	cmp	r3, #0
	strh	r2, [r1, #20]	@ movhi
	strh	r0, [r1, #22]	@ movhi
	ble	.L128
.L115:
	ldr	r3, .L130+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L129
	pop	{r4, lr}
	bx	lr
.L129:
	ldr	r3, .L130+52
	ldr	r2, .L130+56
	ldr	r1, [r3, #28]
	ldr	r3, .L130+60
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+64
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L130+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L130+68
	ldr	r3, [r3]
	ldr	r2, .L130+72
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl #1
	add	r3, r2, r3, lsl #2
	ldr	r0, [r3, #40]
	ldr	r3, .L130+76
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+80
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L130+84
	ldreq	r2, .L130+88
	ldrne	r1, [r2]
	ldreq	r1, [r2]
	ldr	r4, .L130+92
	movne	r3, #0
	movne	r2, #1
	moveq	r2, #1
	ldrne	r0, .L130+96
	ldreq	r0, .L130+100
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToBattle
.L127:
	bl	goToWin
	b	.L114
.L128:
	bl	goToLose
	b	.L115
.L126:
	bl	goToPause
	b	.L113
.L131:
	.align	2
.L130:
	.word	updateWorld
	.word	oldButtons
	.word	buttons
	.word	gameVictory
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	bg1yOff
	.word	bg1xOff
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
	ldr	r3, .L145
	mov	lr, pc
	bx	r3
	ldr	r3, .L145+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L145+8
	ldr	r8, .L145+12
	ldr	r5, .L145+16
	ldr	fp, .L145+20
	ldr	r10, .L145+24
	ldr	r9, .L145+28
	ldr	r7, .L145+32
	ldr	r4, .L145+36
.L133:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L134:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L134
.L136:
	.word	.L141
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L135
	.word	.L135
.L135:
	mov	lr, pc
	bx	r7
	b	.L133
.L137:
	ldr	r3, .L145+40
	mov	lr, pc
	bx	r3
	b	.L133
.L138:
	ldr	r3, .L145+44
	mov	lr, pc
	bx	r3
	b	.L133
.L139:
	mov	lr, pc
	bx	r9
	b	.L133
.L140:
	mov	lr, pc
	bx	r10
	b	.L133
.L141:
	mov	lr, pc
	bx	fp
	b	.L133
.L146:
	.align	2
.L145:
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
	.comm	worldThemeCtr,4,4
	.comm	randTimer,4,4
	.comm	bg1yOff,4,4
	.comm	bg1xOff,4,4
	.comm	bg2yOff,4,4
	.comm	bg2xOff,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	levels,5040,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	aniFrame.5640, %object
	.size	aniFrame.5640, 4
aniFrame.5640:
	.space	4
	.type	frameCounter.5639, %object
	.size	frameCounter.5639, 4
frameCounter.5639:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
