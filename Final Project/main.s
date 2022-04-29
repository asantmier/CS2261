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
	ldr	r0, [r1]
	ldr	r1, .L8+16
	str	r0, [r2]
	ldr	r2, .L8+20
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
	.word	nextTurnPoints
	.word	turnPoints
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
	mov	r0, #3
	ldr	r4, .L12
	ldr	r3, .L12+4
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L12+16
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r4, #424
	mov	lr, #716
	mov	ip, #108544
	mov	r2, #0
	mov	r0, #352
	ldr	r1, .L12+32
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L12+36
	strh	r1, [r3, #10]	@ movhi
	ldr	r1, .L12+40
	strh	r1, [r3]	@ movhi
	ldr	r1, .L12+44
	str	r4, [r1]
	ldr	r1, .L12+48
	str	lr, [r1]
	str	ip, [r3, #40]
	ldr	r1, [r1]
	lsl	r1, r1, #8
	str	r1, [r3, #44]
	ldr	lr, .L12+52
	ldr	ip, .L12+56
	ldr	r1, .L12+60
	str	r2, [lr]
	str	r0, [ip]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	strh	r0, [r3, #22]	@ movhi
	str	r2, [r1]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	67111824
	.word	100679680
	.word	splashscreenTiles
	.word	67109376
	.word	100694016
	.word	splashscreenMap
	.word	world1Pal
	.word	3972
	.word	-26997
	.word	5889
	.word	bg2xOff
	.word	bg2yOff
	.word	bg1xOff
	.word	bg1yOff
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r0, #3
	ldr	r4, .L16
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+16
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #1
	ldr	ip, .L16+32
	ldr	r0, .L16+36
	ldr	r2, .L16+40
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	67111904
	.word	100679680
	.word	instructionsTiles
	.word	67109376
	.word	100694016
	.word	instructionsMap
	.word	instructionsPal
	.word	3844
	.word	4353
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
	ldr	r3, .L25
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L19
	ldr	r3, .L25+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L24
.L19:
	ldr	r3, .L25+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	bl	goToStart
	b	.L19
.L26:
	.align	2
.L25:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
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
	ldr	r1, .L29
	ldr	r4, .L29+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L29+8
	ldr	r0, .L29+12
	ldr	r2, .L29+16
	strh	ip, [r3, #10]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L30:
	.align	2
.L29:
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
	ldr	r2, .L33
	ldr	r4, .L33+4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L33+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L33+12
	ldr	r2, .L33+16
	ldr	r1, .L33+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L33+24
	ldr	r2, .L33+28
	ldr	r1, .L33+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r1, .L33+36
	ldr	r3, .L33+40
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L34:
	.align	2
.L33:
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
	mov	r4, #67108864
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	ldr	r2, .L37+4
	ldr	r5, .L37+8
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r3, .L37+12
	ldr	r2, .L37+16
	ldr	r1, .L37+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L37+24
	ldr	r2, .L37+28
	ldr	r1, .L37+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r1, .L37+36
	ldr	r3, .L37+40
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	pauseSound
	.word	3972
	.word	DMANow
	.word	67111456
	.word	100679680
	.word	pauseTiles
	.word	67109376
	.word	100694016
	.word	pauseMap
	.word	5889
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
	mov	r4, #67108864
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r2, .L41+4
	ldr	r5, .L41+8
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r3, .L41+12
	ldr	r2, .L41+16
	ldr	r1, .L41+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L41+24
	ldr	r2, .L41+28
	ldr	r1, .L41+32
	mov	lr, pc
	bx	r5
	mov	r2, #5
	mov	ip, #1280
	mov	r0, #0
	mov	r1, #352
	ldr	lr, .L41+36
	ldr	r3, .L41+40
	str	r2, [lr]
	ldr	lr, .L41+44
	str	lr, [r3]
	str	ip, [r4, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r4, #44]
	ldr	r5, .L41+48
	ldr	lr, .L41+52
	ldr	ip, .L41+56
	ldr	r3, .L41+60
	str	r0, [r5]
	str	r1, [lr]
	strh	r0, [r4, #20]	@ movhi
	strh	r1, [r4, #22]	@ movhi
	strh	ip, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	stopSound
	.word	3972
	.word	DMANow
	.word	67112288
	.word	100679680
	.word	winTiles
	.word	67109376
	.word	100694016
	.word	winMap
	.word	bg2xOff
	.word	bg2yOff
	.word	858
	.word	bg1xOff
	.word	bg1yOff
	.word	1793
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
	ldr	r3, .L45
	mov	lr, pc
	bx	r3
	ldr	r2, .L45+4
	ldr	r4, .L45+8
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L45+16
	ldr	r2, .L45+20
	ldr	r1, .L45+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L45+28
	ldr	r2, .L45+32
	ldr	r1, .L45+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r1, .L45+40
	ldr	r3, .L45+44
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	stopSound
	.word	3844
	.word	DMANow
	.word	losePal
	.word	67111104
	.word	100679680
	.word	loseTiles
	.word	67109376
	.word	100694016
	.word	loseMap
	.word	257
	.word	state
	.size	goToLose, .-goToLose
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
	ldr	r3, .L61
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	ldr	r3, [r3]
	add	r2, r3, #1
	bics	r2, r2, #2
	beq	.L56
	ldr	r4, .L61+8
.L48:
	ldr	r3, .L61+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L61+20
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L61+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L56:
	cmn	r3, #1
	beq	.L59
	mov	r0, #1
	ldr	r3, .L61+28
	ldr	r2, [r3, #16]
	ldr	lr, [r3, #72]
	ldr	ip, [r3, #128]
	ldr	r1, [r3, #184]
	str	r2, [r3, #20]
.L58:
	str	ip, [r3, #132]
	str	lr, [r3, #76]
	str	r1, [r3, #188]
	ldr	r2, .L61+32
	mov	lr, pc
	bx	r2
	ldr	r3, .L61+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L61+8
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L61+44
	ldr	r3, .L61+48
	ldr	r1, [r2]
	ldr	r3, [r3]
	mov	r2, #1
	ldr	r0, .L61+52
	ldr	r5, .L61+56
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L61+60
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L61+64
	ldr	r0, .L61+68
	ldr	r2, .L61+72
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L48
.L59:
	ldr	r3, .L61+76
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L60
.L50:
	ldr	r1, .L61+80
	ldr	r3, .L61+28
	ldr	r2, [r1]
	ldr	r4, [r3, #16]
	sub	r2, r2, #10
	str	r2, [r1]
	mov	r0, #0
	ldr	lr, [r3, #72]
	ldr	ip, [r3, #128]
	ldr	r1, [r3, #184]
	str	r4, [r3, #20]
	b	.L58
.L60:
	bl	goToLose
	b	.L50
.L62:
	.align	2
.L61:
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
	.word	bossBattle
	.word	submarineHp
	.size	battle, .-battle
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
	ldr	r5, .L65
	ldr	r4, .L65+4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+8
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+16
	ldr	r1, .L65+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+24
	ldr	r1, .L65+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+32
	ldr	r1, .L65+36
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+40
	ldr	r1, .L65+44
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+48
	ldr	r1, .L65+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+56
	ldr	r1, .L65+60
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+64
	ldr	r1, .L65+68
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+72
	ldr	r1, .L65+76
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+80
	ldr	r1, .L65+84
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+88
	ldr	r1, .L65+92
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L65+96
	ldr	r1, .L65+100
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
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
	.word	100664192
	.word	100668864
	.word	100663616
	.word	100668928
	.word	100664704
	.word	100668992
	.word	100663808
	.word	100669056
	.word	100664640
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #67108864
	mov	r8, #1
	mov	r5, #0
	ldr	r6, .L69
	mov	r3, #256
	mov	r0, #3
	strh	r8, [r4]	@ movhi
	ldr	r2, .L69+4
	ldr	r1, .L69+8
	mov	lr, pc
	bx	r6
	ldr	r7, .L69+12
	mov	r0, #3
	ldr	r3, .L69+16
	ldr	r2, .L69+20
	ldr	r1, .L69+24
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L69+28
	ldr	r2, .L69+32
	ldr	r1, .L69+36
	mov	lr, pc
	bx	r6
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L69+40
	ldr	r1, .L69+44
	mov	lr, pc
	bx	r6
	ldr	r2, .L69+48
	mov	r0, #3
	strh	r2, [r4, #8]	@ movhi
	ldr	r3, .L69+52
	ldr	r2, .L69+56
	ldr	r1, .L69+60
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L69+64
	ldr	r2, .L69+68
	ldr	r1, .L69+72
	mov	lr, pc
	bx	r6
	ldr	r3, .L69+76
	ldr	r1, .L69+80
	ldr	r2, .L69+84
	strh	r3, [r4, #10]	@ movhi
	mov	r0, #3
	str	r5, [r1]
	str	r5, [r2]
	ldr	r3, .L69+88
	strh	r5, [r4, #20]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L69+92
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L69+96
	ldr	r2, .L69+100
	ldr	r1, .L69+104
	mov	lr, pc
	bx	r6
	ldr	r3, .L69+108
	ldm	r3, {r0, r1, r2, r3}
	add	ip, r4, #32
	stm	ip, {r0, r1, r2, r3}
	ldr	r1, .L69+112
	ldr	r2, .L69+116
	ldr	r3, .L69+120
	strh	r1, [r4, #12]	@ movhi
	str	r5, [r2]
	str	r5, [r3]
	str	r5, [r4, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r4, #44]
	ldr	r3, .L69+124
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L69+128
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r6
	ldr	r3, .L69+132
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+136
	mov	lr, pc
	bx	r3
	ldr	r2, .L69+140
	ldr	r3, .L69+144
	strh	r8, [r7, #8]	@ movhi
	str	r2, [r3, #4092]
	bl	prepareWorldAnim
	ldr	r3, .L69+148
	mov	lr, pc
	bx	r3
	ldr	r2, .L69+152
	ldr	r3, .L69+156
	strh	r2, [r4]	@ movhi
	ldr	r0, .L69+160
	ldrh	r1, [r3, #48]
	ldr	r3, .L69+164
	ldr	r2, .L69+168
	strh	r5, [r0]	@ movhi
	str	r5, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r1, [r2]	@ movhi
	b	goToStart
.L70:
	.align	2
.L69:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	67109376
	.word	67117056
	.word	100728832
	.word	spritesheetTiles
	.word	67111824
	.word	100679680
	.word	splashscreenTiles
	.word	100694016
	.word	splashscreenMap
	.word	3972
	.word	67109344
	.word	100696064
	.word	world1parallaxTiles
	.word	67109888
	.word	100708352
	.word	world1parallaxMap
	.word	-26997
	.word	bg1xOff
	.word	bg1yOff
	.word	67109952
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
	.word	oldButtons
	.word	randTimer
	.word	buttons
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
	ldr	r3, .L83
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L72
	ldr	r2, .L83+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L81
.L72:
	tst	r3, #8
	beq	.L73
	ldr	r3, .L83+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L82
.L73:
	ldr	r3, .L83+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L81:
	ldr	r3, .L83+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L83+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L83+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L83+24
	ldr	r0, .L83+28
	ldr	r2, .L83+32
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L73
.L82:
	bl	initialize
	b	.L73
.L84:
	.align	2
.L83:
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
	ldr	r3, .L92
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L86
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L86:
	ldr	r3, .L92+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L91:
	bl	initialize
	b	.L86
.L93:
	.align	2
.L92:
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
	ldr	r4, .L102
	ldr	r3, [r4, #4]
	cmp	r3, #30
	ldr	r3, [r4]
	ble	.L96
	mov	r0, #0
	ldr	r1, .L102+4
	add	r2, r3, #1
	smull	ip, r3, r1, r2
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r4]
	str	r0, [r4, #4]
.L96:
	cmp	r3, #1
	beq	.L97
	cmp	r3, #2
	beq	.L98
	cmp	r3, #0
	beq	.L101
.L99:
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r3, [r4, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L97:
	ldr	r5, .L102+8
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+16
	ldr	r1, .L102+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+24
	ldr	r1, .L102+28
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+32
	ldr	r1, .L102+36
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+40
	ldr	r1, .L102+44
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+48
	ldr	r1, .L102+52
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+56
	ldr	r1, .L102+60
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+64
	ldr	r1, .L102+68
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+72
	ldr	r1, .L102+76
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+80
	ldr	r1, .L102+84
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+88
	ldr	r1, .L102+92
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+96
	ldr	r1, .L102+100
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+104
	ldr	r1, .L102+108
	mov	lr, pc
	bx	r5
	b	.L99
.L101:
	ldr	r5, .L102+8
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+16
	ldr	r1, .L102+112
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+24
	ldr	r1, .L102+116
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+32
	ldr	r1, .L102+120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+40
	ldr	r1, .L102+124
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+48
	ldr	r1, .L102+128
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+56
	ldr	r1, .L102+132
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+64
	ldr	r1, .L102+136
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+72
	ldr	r1, .L102+140
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+80
	ldr	r1, .L102+144
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+88
	ldr	r1, .L102+148
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+96
	ldr	r1, .L102+152
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+104
	ldr	r1, .L102+156
	mov	lr, pc
	bx	r5
	b	.L99
.L98:
	ldr	r5, .L102+8
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+16
	ldr	r1, .L102+160
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+24
	ldr	r1, .L102+164
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+32
	ldr	r1, .L102+168
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+40
	ldr	r1, .L102+172
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+48
	ldr	r1, .L102+176
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+56
	ldr	r1, .L102+180
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+64
	ldr	r1, .L102+184
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+72
	ldr	r1, .L102+188
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+80
	ldr	r1, .L102+192
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+88
	ldr	r1, .L102+196
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+96
	ldr	r1, .L102+200
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L102+12
	ldr	r2, .L102+104
	ldr	r1, .L102+204
	mov	lr, pc
	bx	r5
	b	.L99
.L103:
	.align	2
.L102:
	.word	.LANCHOR0
	.word	1431655766
	.word	DMANow
	.word	67108880
	.word	100663744
	.word	100667520
	.word	100663424
	.word	100667264
	.word	100663488
	.word	100667008
	.word	100663680
	.word	100667136
	.word	100664128
	.word	100667392
	.word	100663552
	.word	100666880
	.word	100664192
	.word	100666688
	.word	100663616
	.word	100666560
	.word	100664704
	.word	100666432
	.word	100663808
	.word	100666304
	.word	100664640
	.word	100666176
	.word	100664064
	.word	100666048
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
	.word	100667584
	.word	100667328
	.word	100667072
	.word	100667200
	.word	100667456
	.word	100666944
	.word	100666752
	.word	100666624
	.word	100666496
	.word	100666368
	.word	100666240
	.word	100666112
	.size	worldAnim, .-worldAnim
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L116
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	bl	worldAnim
	ldr	r3, .L116+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L105
	ldr	r2, .L116+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L114
.L105:
	tst	r3, #8
	beq	.L106
	ldr	r3, .L116+8
	ldrh	r5, [r3]
	ands	r5, r5, #8
	beq	.L115
.L106:
	ldr	r3, .L116+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L114:
	mov	r3, #67108864
	ldr	r2, .L116+16
	strh	r2, [r3]	@ movhi
	bl	goToInstructions
	b	.L106
.L115:
	mov	r6, #67108864
	ldr	r0, [r4]
	ldr	r3, .L116+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+32
	ldr	ip, .L116+36
	ldr	r1, [r3]
	mov	r2, #1
	mov	r3, r5
	ldr	r0, .L116+40
	ldr	r4, .L116+44
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	ldr	r2, .L116+48
	ldr	r3, .L116+52
	str	r5, [r2]
	str	r5, [r3]
	str	r5, [r6, #40]
	ldr	r3, [r3]
	ldr	r1, .L116+56
	ldr	r2, .L116+60
	lsl	r3, r3, #8
	str	r3, [r6, #44]
	mov	r0, #3
	str	r5, [r1]
	str	r5, [r2]
	mov	r3, #256
	mov	r2, #83886080
	strh	r5, [r6, #20]	@ movhi
	ldr	r1, .L116+64
	strh	r5, [r6, #22]	@ movhi
	ldr	r4, .L116+68
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r0, .L116+72
	ldr	r1, .L116+16
	ldr	r3, .L116+76
	strh	r0, [r6, #10]	@ movhi
	strh	r1, [r6]	@ movhi
	str	r2, [r3]
	b	.L106
.L117:
	.align	2
.L116:
	.word	randTimer
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	5633
	.word	srand
	.word	initGame
	.word	initWorld
	.word	worldTheme_length
	.word	worldThemeCtr
	.word	worldTheme_data
	.word	playSoundA
	.word	bg2xOff
	.word	bg2yOff
	.word	bg1xOff
	.word	bg1yOff
	.word	world1Pal
	.word	DMANow
	.word	-26997
	.word	state
	.size	start, .-start
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
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
	ldr	r3, .L136
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, pc
	bx	r3
	bl	worldAnim
	ldr	r3, .L136+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L119
	ldr	r3, .L136+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L132
.L119:
	ldr	r3, .L136+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L133
.L120:
	mov	r5, #67108864
	ldr	r3, .L136+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L136+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L136+24
	mov	lr, pc
	bx	r6
	ldr	r1, .L136+28
	ldr	r3, [r1]
	lsl	r3, r3, #8
	str	r3, [r5, #40]
	ldr	r2, .L136+32
	ldr	r3, [r2]
	lsl	r3, r3, #8
	str	r3, [r5, #44]
	ldr	r3, [r1]
	cmp	r3, #0
	add	r4, r3, #3
	movlt	r3, r4
	ldr	r1, .L136+36
	asr	r4, r3, #2
	ldr	r0, [r2]
	ldr	r3, .L136+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	ldr	r7, .L136+44
	mov	r2, #0
	ldr	r3, .L136+48
	mov	lr, pc
	bx	r7
	ldr	r3, .L136+52
	mov	lr, pc
	bx	r3
	ldr	r1, .L136+56
	lsl	r3, r4, #16
	str	r0, [r1]
	ldr	r1, .L136+60
	lsr	r3, r3, #16
	strh	r3, [r5, #20]	@ movhi
	ldr	r3, [r1]
	lsl	r2, r0, #16
	lsr	r2, r2, #16
	cmp	r3, #0
	strh	r2, [r5, #22]	@ movhi
	ble	.L134
.L121:
	ldr	r3, .L136+64
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L135
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L135:
	ldr	r3, .L136+68
	ldr	r2, .L136+72
	ldr	r1, [r3, #28]
	ldr	r3, .L136+76
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+80
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L136+24
	mov	lr, pc
	bx	r6
	ldr	r3, .L136+84
	ldr	r3, [r3]
	ldr	r2, .L136+88
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl #1
	add	r3, r2, r3, lsl #2
	ldr	r0, [r3, #40]
	ldr	r3, .L136+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+96
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L136+100
	ldreq	r2, .L136+104
	ldrne	r1, [r2]
	ldreq	r1, [r2]
	ldr	r4, .L136+108
	movne	r3, #0
	movne	r2, #1
	moveq	r2, #1
	ldrne	r0, .L136+112
	ldreq	r0, .L136+116
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToBattle
.L133:
	bl	goToWin
	b	.L120
.L134:
	bl	goToLose
	b	.L121
.L132:
	bl	goToPause
	b	.L119
.L137:
	.align	2
.L136:
	.word	updateWorld
	.word	oldButtons
	.word	buttons
	.word	gameVictory
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	bg2xOff
	.word	bg2yOff
	.word	bg1xOff
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	1074003968
	.word	__aeabi_d2iz
	.word	bg1yOff
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
	ldr	r3, .L151
	mov	lr, pc
	bx	r3
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L151+8
	ldr	r8, .L151+12
	ldr	r5, .L151+16
	ldr	fp, .L151+20
	ldr	r10, .L151+24
	ldr	r9, .L151+28
	ldr	r7, .L151+32
	ldr	r4, .L151+36
.L139:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L140:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L140
.L142:
	.word	.L147
	.word	.L146
	.word	.L145
	.word	.L144
	.word	.L143
	.word	.L141
	.word	.L141
.L141:
	mov	lr, pc
	bx	r7
	b	.L139
.L143:
	ldr	r3, .L151+40
	mov	lr, pc
	bx	r3
	b	.L139
.L144:
	ldr	r3, .L151+44
	mov	lr, pc
	bx	r3
	b	.L139
.L145:
	mov	lr, pc
	bx	r9
	b	.L139
.L146:
	mov	lr, pc
	bx	r10
	b	.L139
.L147:
	mov	lr, pc
	bx	fp
	b	.L139
.L152:
	.align	2
.L151:
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
	.comm	levels,5360,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	aniFrame.5706, %object
	.size	aniFrame.5706, 4
aniFrame.5706:
	.space	4
	.type	frameCounter.5705, %object
	.size	frameCounter.5705, 4
frameCounter.5705:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
