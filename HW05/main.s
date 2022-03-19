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
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r4, .L8
	ldr	r6, .L8+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r0, #3
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r0, #3
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r0, #3
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L8+44
	ldr	r2, .L8+48
	ldr	r1, .L8+52
	mov	lr, pc
	bx	r4
	mov	r3, r6
	mov	r0, #3
	ldr	r2, .L8+56
	ldr	r1, .L8+60
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+64
	ldr	r1, .L8+68
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L8+72
	ldr	r2, .L8+76
	ldr	r1, .L8+80
	mov	lr, pc
	bx	r4
	ldr	r1, .L8+84
	ldr	r2, .L8+88
	ldr	r3, .L8+92
	strh	r3, [r5, #8]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	ldr	r3, .L8+96
	strh	r2, [r5, #12]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+100
	mov	lr, pc
	bx	r4
	mov	r2, #4352
	mov	r3, #0
	strh	r2, [r5]	@ movhi
	ldr	r2, .L8+104
	ldr	r0, .L8+108
	ldrh	ip, [r2, #48]
	ldr	r1, .L8+112
	ldr	r2, .L8+116
	pop	{r4, r5, r6, lr}
	strh	ip, [r0]	@ movhi
	strh	r3, [r1]	@ movhi
	str	r3, [r2]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	67109376
	.word	titlePal
	.word	67109024
	.word	titleTiles
	.word	100720640
	.word	titleMap
	.word	100679680
	.word	level1Tiles
	.word	100722688
	.word	level1Map
	.word	67109040
	.word	100696064
	.word	level2Tiles
	.word	100724736
	.word	level2Map
	.word	83886592
	.word	spritesheetPal
	.word	67117056
	.word	100728832
	.word	spritesheetTiles
	.word	7557
	.word	7817
	.word	7297
	.word	hideSprites
	.word	shadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	randTimer
	.size	initialize, .-initialize
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
	ldr	r3, .L18
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, r5, r6, lr}
	bne	.L15
	ldr	r4, .L18+4
.L11:
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r3, .L18+12
	ldrh	r3, [r3]
	ands	r5, r3, #8
	ldr	r4, .L18+4
	bne	.L11
	ldr	r3, .L18+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r3, .L18+20
	ldr	r1, .L18+24
	ldr	r2, .L18+28
	str	r0, [r3]
	mov	r0, #1
	ldr	r3, .L18+32
	str	r5, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #4608
	mov	r2, #1
	ldr	r3, .L18+36
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L11
.L19:
	.align	2
.L18:
	.word	oldButtons
	.word	randTimer
	.word	waitForVBlank
	.word	buttons
	.word	srand
	.word	lives
	.word	levelsCleared
	.word	score
	.word	init
	.word	state
	.size	start, .-start
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
	@ link register save eliminated.
	cmp	r0, #1
	beq	.L21
	cmp	r0, #2
	moveq	r3, #67108864
	moveq	r2, #5120
	strheq	r2, [r3]	@ movhi
.L23:
	mov	r2, #1
	ldr	r3, .L24
	str	r2, [r3]
	bx	lr
.L21:
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	b	.L23
.L25:
	.align	2
.L24:
	.word	state
	.size	goToGame, .-goToGame
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
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L27
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r3, .L38
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L30
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L30
	ldr	r3, .L38+8
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L31
	cmp	r3, #2
	beq	.L32
.L33:
	mov	r2, #1
	ldr	r3, .L38+12
	str	r2, [r3]
.L30:
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	mov	r3, #67108864
	mov	r2, #5120
	strh	r2, [r3]	@ movhi
	b	.L33
.L31:
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	b	.L33
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	buttons
	.word	level
	.word	state
	.word	waitForVBlank
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
	ldr	r1, .L42
	push	{r4, lr}
	ldr	r3, .L42+4
	ldr	lr, .L42+8
	ldr	r0, .L42+12
	add	r2, r1, #800
	add	ip, r1, #804
	strh	r3, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	strh	lr, [ip]	@ movhi
	ldr	r4, .L42+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L42+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	shadowOAM
	.word	16456
	.word	661
	.word	-16304
	.word	DMANow
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
	ldr	r3, .L51
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L45
	ldr	r3, .L51+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L45:
	ldr	r3, .L51+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L50:
	bl	goToStart
	b	.L45
.L52:
	.align	2
.L51:
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
	mov	r2, #800
	push	{r4, lr}
	mov	lr, #808
	mov	r4, #72
	ldr	r1, .L55
	ldr	r0, .L55+4
	add	r3, r1, r2
	strh	r0, [r3]	@ movhi
	ldr	r0, .L55+8
	strh	r0, [r3, #2]	@ movhi
	add	r3, r1, #804
	ldr	r0, .L55+12
	strh	r2, [r3]	@ movhi
	add	ip, r1, #812
	add	r2, r1, lr
	strh	r4, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	strh	lr, [ip]	@ movhi
	ldr	r4, .L55+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L55+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	shadowOAM
	.word	16456
	.word	-16304
	.word	16528
	.word	DMANow
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
	ldr	r3, .L67
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L58
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r2, #2
	ldreq	r3, .L67+8
	streq	r2, [r3]
.L58:
	ldr	r3, .L67+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L67+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L67+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L67+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L65
	ldr	r3, .L67+32
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L66
.L57:
	pop	{r4, lr}
	bx	lr
.L65:
	bl	goToLose
	ldr	r3, .L67+32
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L57
.L66:
	pop	{r4, lr}
	b	goToWin
.L68:
	.align	2
.L67:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	update
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	lives
	.word	levelsCleared
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
	ldr	r3, .L80
	mov	lr, pc
	bx	r3
	ldr	r6, .L80+4
	ldr	fp, .L80+8
	ldr	r5, .L80+12
	ldr	r10, .L80+16
	ldr	r9, .L80+20
	ldr	r8, .L80+24
	ldr	r7, .L80+28
	ldr	r4, .L80+32
.L70:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L71:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L71
.L73:
	.word	.L76
	.word	.L75
	.word	.L74
	.word	.L72
	.word	.L72
.L72:
	mov	lr, pc
	bx	r7
	b	.L70
.L74:
	mov	lr, pc
	bx	r8
	b	.L70
.L75:
	mov	lr, pc
	bx	r9
	b	.L70
.L76:
	mov	lr, pc
	bx	r10
	b	.L70
.L81:
	.align	2
.L80:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
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
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
