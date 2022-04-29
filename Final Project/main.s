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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Konami %d\000"
	.align	2
.LC1:
	.ascii	"Konami reset %d\000"
	.align	2
.LC2:
	.ascii	"CHEATER\000"
	.align	2
.LC3:
	.ascii	"Konami code confirmed\000"
	.text
	.align	2
	.global	lmao
	.syntax unified
	.arm
	.fpu softvfp
	.type	lmao, %function
lmao:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L28
	ldr	r1, .L28+4
	ldr	r2, .L28+8
	ldr	r5, [r4]
	ldr	r3, .L28+12
	ldrh	r0, [r1]
	ldr	r2, [r2, r5, lsl #2]
	ldrh	r1, [r3]
	bics	r3, r2, r0
	mvn	lr, r1
	mvn	r0, r0
	bne	.L16
	ands	r2, r2, lr
	bne	.L25
.L14:
	asr	r3, r0, r2
	ands	r3, r3, #1
	asr	ip, lr, r2
	add	r2, r2, #1
	bne	.L13
	tst	ip, #1
	bne	.L26
.L13:
	cmp	r2, #10
	bne	.L14
.L12:
	cmp	r5, #11
	beq	.L27
	pop	{r4, r5, r6, lr}
	bx	lr
.L16:
	mov	r2, #0
	b	.L14
.L27:
	mov	ip, #1
	mov	r2, #5
	mov	r3, #99
	ldr	r0, .L28+16
	ldr	r1, .L28+20
	str	r2, [r0, #24]
	str	ip, [r1]
	ldr	r2, .L28+24
	ldr	r1, .L28+28
	str	r2, [r0, #40]
	str	r1, [r0, #44]
	mov	r2, #10
	ldr	r1, .L28+32
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	ldr	r3, .L28+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+40
	ldr	r2, .L28+44
	ldr	r1, [r3]
	ldr	r0, .L28+48
	ldr	r3, .L28+52
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	add	r1, r5, #1
	ldr	r0, .L28+56
	ldr	r3, .L28+52
	str	r1, [r4]
	mov	lr, pc
	bx	r3
	ldr	r5, [r4]
	b	.L12
.L26:
	ldr	r0, .L28+60
	ldr	r2, .L28+52
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r5, [r4]
	b	.L12
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	oldButtons
	.word	.LANCHOR1
	.word	buttons
	.word	battleAllies
	.word	cheater
	.word	MOVE_DEATHRAY
	.word	MOVE_BRUH
	.word	.LC2
	.word	strncpy
	.word	submarineMaxHp
	.word	submarineHp
	.word	.LC3
	.word	mgba_printf
	.word	.LC0
	.word	.LC1
	.size	lmao, .-lmao
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
	ldr	r4, .L32
	ldr	r3, .L32+4
	ldr	r2, .L32+8
	ldr	r1, .L32+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L32+16
	ldr	r2, .L32+20
	ldr	r1, .L32+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L32+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r4, #424
	mov	lr, #716
	mov	ip, #108544
	mov	r2, #0
	mov	r0, #352
	ldr	r1, .L32+32
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L32+36
	strh	r1, [r3, #10]	@ movhi
	ldr	r1, .L32+40
	strh	r1, [r3]	@ movhi
	ldr	r1, .L32+44
	str	r4, [r1]
	ldr	r1, .L32+48
	str	lr, [r1]
	str	ip, [r3, #40]
	ldr	r1, [r1]
	lsl	r1, r1, #8
	str	r1, [r3, #44]
	ldr	lr, .L32+52
	ldr	ip, .L32+56
	ldr	r1, .L32+60
	str	r2, [lr]
	str	r0, [ip]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	strh	r0, [r3, #22]	@ movhi
	str	r2, [r1]
	bx	lr
.L33:
	.align	2
.L32:
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
	ldr	r4, .L36
	ldr	r3, .L36+4
	ldr	r2, .L36+8
	ldr	r1, .L36+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L36+16
	ldr	r2, .L36+20
	ldr	r1, .L36+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L36+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #1
	ldr	ip, .L36+32
	ldr	r0, .L36+36
	ldr	r2, .L36+40
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L37:
	.align	2
.L36:
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
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L39
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L44
.L39:
	ldr	r3, .L45+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L44:
	bl	goToStart
	b	.L39
.L46:
	.align	2
.L45:
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
	ldr	r1, .L49
	ldr	r4, .L49+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L49+8
	ldr	r0, .L49+12
	ldr	r2, .L49+16
	strh	ip, [r3, #10]	@ movhi
	pop	{r4, lr}
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r2, .L53
	ldr	r4, .L53+4
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L53+12
	ldr	r2, .L53+16
	ldr	r1, .L53+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+24
	ldr	r2, .L53+28
	ldr	r1, .L53+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r1, .L53+36
	ldr	r3, .L53+40
	strh	r1, [r5]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r2, .L57+4
	ldr	r5, .L57+8
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r3, .L57+12
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L57+24
	ldr	r2, .L57+28
	ldr	r1, .L57+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r1, .L57+36
	ldr	r3, .L57+40
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r2, .L61+4
	ldr	r5, .L61+8
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r3, .L61+12
	ldr	r2, .L61+16
	ldr	r1, .L61+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L61+24
	ldr	r2, .L61+28
	ldr	r1, .L61+32
	mov	lr, pc
	bx	r5
	mov	r2, #5
	mov	ip, #1280
	mov	r0, #0
	mov	r1, #352
	ldr	lr, .L61+36
	ldr	r3, .L61+40
	str	r2, [lr]
	ldr	lr, .L61+44
	str	lr, [r3]
	str	ip, [r4, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r4, #44]
	ldr	r5, .L61+48
	ldr	lr, .L61+52
	ldr	ip, .L61+56
	ldr	r3, .L61+60
	str	r0, [r5]
	str	r1, [lr]
	strh	r0, [r4, #20]	@ movhi
	strh	r1, [r4, #22]	@ movhi
	strh	ip, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	mov	r2, #6
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
	ldr	r3, .L81
	push	{r4, r5, r6, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	ldr	r3, [r3]
	add	r2, r3, #1
	bics	r2, r2, #2
	beq	.L76
	ldr	r4, .L81+8
.L68:
	ldr	r3, .L81+12
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L81+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	ldr	r3, .L81+20
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #40]
	ldr	r3, .L81+24
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r2, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	cmn	r3, #1
	beq	.L79
	mov	r0, #1
	ldr	r3, .L81+28
	ldr	r2, [r3, #16]
	ldr	lr, [r3, #72]
	ldr	ip, [r3, #128]
	ldr	r1, [r3, #184]
	str	r2, [r3, #20]
.L78:
	str	ip, [r3, #132]
	str	lr, [r3, #76]
	str	r1, [r3, #188]
	ldr	r2, .L81+32
	mov	lr, pc
	bx	r2
	ldr	r3, .L81+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L81+8
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L81+16
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L81+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L81+44
	ldr	r3, .L81+48
	ldr	r1, [r2]
	ldr	r3, [r3]
	mov	r2, #1
	ldr	r0, .L81+52
	ldr	r5, .L81+56
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L81+60
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L81+64
	ldr	r0, .L81+68
	ldr	r2, .L81+72
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L68
.L79:
	ldr	r3, .L81+76
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L80
.L70:
	ldr	r1, .L81+80
	ldr	r3, .L81+28
	ldr	r2, [r1]
	ldr	r4, [r3, #16]
	sub	r2, r2, #10
	str	r2, [r1]
	mov	r0, #0
	ldr	lr, [r3, #72]
	ldr	ip, [r3, #128]
	ldr	r1, [r3, #184]
	str	r4, [r3, #20]
	b	.L78
.L80:
	bl	goToLose
	b	.L70
.L82:
	.align	2
.L81:
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
	ldr	r5, .L85
	ldr	r4, .L85+4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+8
	ldr	r1, .L85+12
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+16
	ldr	r1, .L85+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+24
	ldr	r1, .L85+28
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+32
	ldr	r1, .L85+36
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+40
	ldr	r1, .L85+44
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+48
	ldr	r1, .L85+52
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+56
	ldr	r1, .L85+60
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+64
	ldr	r1, .L85+68
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+72
	ldr	r1, .L85+76
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+80
	ldr	r1, .L85+84
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+88
	ldr	r1, .L85+92
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L85+96
	ldr	r1, .L85+100
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L86:
	.align	2
.L85:
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
	ldr	r6, .L89
	mov	r3, #256
	mov	r0, #3
	strh	r8, [r4]	@ movhi
	ldr	r2, .L89+4
	ldr	r1, .L89+8
	mov	lr, pc
	bx	r6
	ldr	r7, .L89+12
	mov	r0, #3
	ldr	r3, .L89+16
	ldr	r2, .L89+20
	ldr	r1, .L89+24
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L89+28
	ldr	r2, .L89+32
	ldr	r1, .L89+36
	mov	lr, pc
	bx	r6
	mov	r3, r7
	mov	r0, #3
	ldr	r2, .L89+40
	ldr	r1, .L89+44
	mov	lr, pc
	bx	r6
	ldr	r2, .L89+48
	mov	r0, #3
	strh	r2, [r4, #8]	@ movhi
	ldr	r3, .L89+52
	ldr	r2, .L89+56
	ldr	r1, .L89+60
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L89+64
	ldr	r2, .L89+68
	ldr	r1, .L89+72
	mov	lr, pc
	bx	r6
	ldr	r3, .L89+76
	ldr	r1, .L89+80
	ldr	r2, .L89+84
	strh	r3, [r4, #10]	@ movhi
	mov	r0, #3
	str	r5, [r1]
	str	r5, [r2]
	ldr	r3, .L89+88
	strh	r5, [r4, #20]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L89+92
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L89+96
	ldr	r2, .L89+100
	ldr	r1, .L89+104
	mov	lr, pc
	bx	r6
	ldr	r3, .L89+108
	ldm	r3, {r0, r1, r2, r3}
	add	ip, r4, #32
	stm	ip, {r0, r1, r2, r3}
	ldr	r1, .L89+112
	ldr	r2, .L89+116
	ldr	r3, .L89+120
	strh	r1, [r4, #12]	@ movhi
	str	r5, [r2]
	str	r5, [r3]
	str	r5, [r4, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r4, #44]
	ldr	r3, .L89+124
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L89+128
	mov	r2, #117440512
	mov	r3, #512
	mov	lr, pc
	bx	r6
	ldr	r3, .L89+132
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+136
	mov	lr, pc
	bx	r3
	ldr	r2, .L89+140
	ldr	r3, .L89+144
	strh	r8, [r7, #8]	@ movhi
	str	r2, [r3, #4092]
	bl	prepareWorldAnim
	ldr	r3, .L89+148
	mov	lr, pc
	bx	r3
	ldr	r2, .L89+152
	ldr	r3, .L89+156
	strh	r2, [r4]	@ movhi
	ldr	r0, .L89+160
	ldrh	r1, [r3, #48]
	ldr	r3, .L89+164
	ldr	r2, .L89+168
	strh	r5, [r0]	@ movhi
	str	r5, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r1, [r2]	@ movhi
	b	goToStart
.L90:
	.align	2
.L89:
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
	.word	-1918
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
	ldr	r3, .L103
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L92
	ldr	r2, .L103+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L101
.L92:
	tst	r3, #8
	beq	.L93
	ldr	r3, .L103+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L102
.L93:
	ldr	r3, .L103+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L101:
	ldr	r3, .L103+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L103+16
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L103+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #2
	ldr	ip, .L103+24
	ldr	r0, .L103+28
	ldr	r2, .L103+32
	strh	ip, [r3, #10]	@ movhi
	strh	r0, [r3]	@ movhi
	str	r1, [r2]
	b	.L93
.L102:
	bl	initialize
	b	.L93
.L104:
	.align	2
.L103:
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
	ldr	r3, .L112
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L106
	ldr	r3, .L112+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L111
.L106:
	ldr	r3, .L112+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L111:
	bl	initialize
	b	.L106
.L113:
	.align	2
.L112:
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
	ldr	r4, .L122
	ldr	r3, [r4, #8]
	cmp	r3, #30
	ldr	r3, [r4, #4]
	ble	.L116
	mov	r0, #0
	ldr	r1, .L122+4
	add	r2, r3, #1
	smull	ip, r3, r1, r2
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r2, r3
	str	r3, [r4, #4]
	str	r0, [r4, #8]
.L116:
	cmp	r3, #1
	beq	.L117
	cmp	r3, #2
	beq	.L118
	cmp	r3, #0
	beq	.L121
.L119:
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	ldr	r5, .L122+8
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+16
	ldr	r1, .L122+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+24
	ldr	r1, .L122+28
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+32
	ldr	r1, .L122+36
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+40
	ldr	r1, .L122+44
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+48
	ldr	r1, .L122+52
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+56
	ldr	r1, .L122+60
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+64
	ldr	r1, .L122+68
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+72
	ldr	r1, .L122+76
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+80
	ldr	r1, .L122+84
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+88
	ldr	r1, .L122+92
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+96
	ldr	r1, .L122+100
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+104
	ldr	r1, .L122+108
	mov	lr, pc
	bx	r5
	b	.L119
.L121:
	ldr	r5, .L122+8
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+16
	ldr	r1, .L122+112
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+24
	ldr	r1, .L122+116
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+32
	ldr	r1, .L122+120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+40
	ldr	r1, .L122+124
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+48
	ldr	r1, .L122+128
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+56
	ldr	r1, .L122+132
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+64
	ldr	r1, .L122+136
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+72
	ldr	r1, .L122+140
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+80
	ldr	r1, .L122+144
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+88
	ldr	r1, .L122+148
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+96
	ldr	r1, .L122+152
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+104
	ldr	r1, .L122+156
	mov	lr, pc
	bx	r5
	b	.L119
.L118:
	ldr	r5, .L122+8
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+16
	ldr	r1, .L122+160
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+24
	ldr	r1, .L122+164
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+32
	ldr	r1, .L122+168
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+40
	ldr	r1, .L122+172
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+48
	ldr	r1, .L122+176
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+56
	ldr	r1, .L122+180
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+64
	ldr	r1, .L122+184
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+72
	ldr	r1, .L122+188
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+80
	ldr	r1, .L122+192
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+88
	ldr	r1, .L122+196
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+96
	ldr	r1, .L122+200
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r3, .L122+12
	ldr	r2, .L122+104
	ldr	r1, .L122+204
	mov	lr, pc
	bx	r5
	b	.L119
.L123:
	.align	2
.L122:
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
	ldr	r4, .L136
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	bl	worldAnim
	ldr	r3, .L136+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L125
	ldr	r2, .L136+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L134
.L125:
	tst	r3, #8
	beq	.L126
	ldr	r3, .L136+8
	ldrh	r5, [r3]
	ands	r5, r5, #8
	beq	.L135
.L126:
	ldr	r3, .L136+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	mov	r3, #67108864
	ldr	r2, .L136+16
	strh	r2, [r3]	@ movhi
	bl	goToInstructions
	b	.L126
.L135:
	mov	r6, #67108864
	ldr	r0, [r4]
	ldr	r3, .L136+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+32
	ldr	ip, .L136+36
	ldr	r1, [r3]
	mov	r2, #1
	mov	r3, r5
	ldr	r0, .L136+40
	ldr	r4, .L136+44
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	ldr	r2, .L136+48
	ldr	r3, .L136+52
	str	r5, [r2]
	str	r5, [r3]
	str	r5, [r6, #40]
	ldr	r3, [r3]
	ldr	r1, .L136+56
	ldr	r2, .L136+60
	lsl	r3, r3, #8
	str	r3, [r6, #44]
	mov	r0, #3
	str	r5, [r1]
	str	r5, [r2]
	mov	r3, #256
	mov	r2, #83886080
	strh	r5, [r6, #20]	@ movhi
	ldr	r1, .L136+64
	strh	r5, [r6, #22]	@ movhi
	ldr	r4, .L136+68
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r0, .L136+72
	ldr	r1, .L136+16
	ldr	r3, .L136+76
	strh	r0, [r6, #10]	@ movhi
	strh	r1, [r6]	@ movhi
	str	r2, [r3]
	b	.L126
.L137:
	.align	2
.L136:
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
	ldr	r3, .L156
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, pc
	bx	r3
	bl	worldAnim
	ldr	r3, .L156+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L139
	ldr	r3, .L156+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L152
.L139:
	ldr	r3, .L156+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L153
.L140:
	mov	r5, #67108864
	ldr	r3, .L156+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L156+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L156+24
	mov	lr, pc
	bx	r6
	ldr	r1, .L156+28
	ldr	r3, [r1]
	lsl	r3, r3, #8
	str	r3, [r5, #40]
	ldr	r2, .L156+32
	ldr	r3, [r2]
	lsl	r3, r3, #8
	str	r3, [r5, #44]
	ldr	r3, [r1]
	cmp	r3, #0
	add	r4, r3, #3
	movlt	r3, r4
	ldr	r1, .L156+36
	asr	r4, r3, #2
	ldr	r0, [r2]
	ldr	r3, .L156+40
	str	r4, [r1]
	mov	lr, pc
	bx	r3
	ldr	r7, .L156+44
	mov	r2, #0
	ldr	r3, .L156+48
	mov	lr, pc
	bx	r7
	ldr	r3, .L156+52
	mov	lr, pc
	bx	r3
	ldr	r1, .L156+56
	lsl	r3, r4, #16
	str	r0, [r1]
	ldr	r1, .L156+60
	lsr	r3, r3, #16
	strh	r3, [r5, #20]	@ movhi
	ldr	r3, [r1]
	lsl	r2, r0, #16
	lsr	r2, r2, #16
	cmp	r3, #0
	strh	r2, [r5, #22]	@ movhi
	ble	.L154
.L141:
	ldr	r3, .L156+64
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L155
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L155:
	ldr	r3, .L156+68
	ldr	r2, .L156+72
	ldr	r1, [r3, #28]
	ldr	r3, .L156+76
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L156+80
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L156+24
	mov	lr, pc
	bx	r6
	ldr	r3, .L156+84
	ldr	r3, [r3]
	ldr	r2, .L156+88
	add	r1, r3, r3, lsl #2
	add	r3, r3, r1, lsl #1
	add	r3, r2, r3, lsl #2
	ldr	r0, [r3, #40]
	ldr	r3, .L156+92
	mov	lr, pc
	bx	r3
	ldr	r3, .L156+96
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L156+100
	ldreq	r2, .L156+104
	ldrne	r1, [r2]
	ldreq	r1, [r2]
	ldr	r4, .L156+108
	movne	r3, #0
	movne	r2, #1
	moveq	r2, #1
	ldrne	r0, .L156+112
	ldreq	r0, .L156+116
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	goToBattle
.L153:
	bl	goToWin
	b	.L140
.L154:
	bl	goToLose
	b	.L141
.L152:
	bl	goToPause
	b	.L139
.L157:
	.align	2
.L156:
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
	ldr	r3, .L171
	mov	lr, pc
	bx	r3
	ldr	r3, .L171+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L171+8
	ldr	r9, .L171+12
	ldr	r5, .L171+16
	ldr	fp, .L171+20
	ldr	r10, .L171+24
	ldr	r8, .L171+28
	ldr	r7, .L171+32
	ldr	r4, .L171+36
.L159:
	ldr	r2, [r6]
	ldrh	r3, [r9]
.L160:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r9]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L160
.L162:
	.word	.L167
	.word	.L166
	.word	.L165
	.word	.L164
	.word	.L163
	.word	.L161
	.word	.L161
.L161:
	mov	lr, pc
	bx	r7
	b	.L159
.L163:
	ldr	r3, .L171+40
	mov	lr, pc
	bx	r3
	b	.L159
.L164:
	ldr	r3, .L171+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r8
	b	.L159
.L165:
	ldr	r3, .L171+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r8
	b	.L159
.L166:
	mov	lr, pc
	bx	r10
	b	.L159
.L167:
	mov	lr, pc
	bx	fp
	b	.L159
.L172:
	.align	2
.L171:
	.word	mgba_open
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	lmao
	.word	win
	.word	67109120
	.word	pause
	.word	battle
	.word	game
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
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	konami.5702, %object
	.size	konami.5702, 44
konami.5702:
	.word	64
	.word	64
	.word	128
	.word	128
	.word	32
	.word	16
	.word	32
	.word	16
	.word	2
	.word	1
	.word	8
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	konamiIdx.5703, %object
	.size	konamiIdx.5703, 4
konamiIdx.5703:
	.space	4
	.type	aniFrame.5806, %object
	.size	aniFrame.5806, 4
aniFrame.5806:
	.space	4
	.type	frameCounter.5805, %object
	.size	frameCounter.5805, 4
frameCounter.5805:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
