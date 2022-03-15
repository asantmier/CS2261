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
	mov	r3, #256
	ldr	r4, .L8
	ldr	r5, .L8+4
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
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L8+20
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	lr, pc
	bx	r4
	mov	r3, r5
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
	mov	r3, r5
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
	mov	r5, #67108864
	mov	r3, #7296
	ldr	r1, .L8+84
	ldr	r2, .L8+88
	strh	r3, [r5, #8]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	ldr	r3, .L8+92
	strh	r2, [r5, #12]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+96
	mov	lr, pc
	bx	r4
	mov	r3, #4352
	mov	r2, #0
	strh	r3, [r5]	@ movhi
	ldr	r3, .L8+100
	ldr	r1, .L8+104
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+108
	pop	{r4, r5, r6, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
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
	.word	67109008
	.word	100696064
	.word	level2Tiles
	.word	100724736
	.word	level2Map
	.word	83886592
	.word	spritesheetPal
	.word	67117056
	.word	100728832
	.word	spritesheetTiles
	.word	7556
	.word	7816
	.word	hideSprites
	.word	shadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
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
	ldr	r3, .L17
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L11
	ldr	r3, .L17+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
.L11:
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	mov	r0, #1
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #4608
	mov	r2, #1
	ldr	r3, .L17+16
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	.L11
.L18:
	.align	2
.L17:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
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
	beq	.L20
	cmp	r0, #2
	moveq	r3, #67108864
	moveq	r2, #5120
	strheq	r2, [r3]	@ movhi
.L22:
	mov	r2, #1
	ldr	r3, .L23
	str	r2, [r3]
	bx	lr
.L20:
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	b	.L22
.L24:
	.align	2
.L23:
	.word	state
	.size	goToGame, .-goToGame
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
	ldr	r3, .L35
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L26
	ldr	r2, .L35+4
	ldrh	r2, [r2]
	tst	r2, #8
	moveq	r1, #300
	ldreq	r2, .L35+8
	streq	r1, [r2]
.L26:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	ands	r3, r3, #4
	ldreq	r2, .L35+8
	streq	r3, [r2]
.L27:
	ldr	r3, .L35+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L35+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L35+20
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L35+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	oldButtons
	.word	buttons
	.word	hammerTimer
	.word	update
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
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
	push	{r7, lr}
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	ldr	r6, .L44+4
	ldr	r9, .L44+8
	ldr	r5, .L44+12
	ldr	r8, .L44+16
	ldr	r7, .L44+20
	ldr	r4, .L44+24
.L38:
	ldr	r2, [r6]
	ldrh	r3, [r9]
.L41:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r2, #0
	strh	r3, [r9]	@ movhi
	beq	.L39
	cmp	r2, #1
	bne	.L41
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r3, [r9]
	b	.L41
.L39:
	mov	lr, pc
	bx	r8
	b	.L38
.L45:
	.align	2
.L44:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	67109120
	.size	main, .-main
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
	.size	goToLose, .-goToLose
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
	bx	lr
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
