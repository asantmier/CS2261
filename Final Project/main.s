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
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r6, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r3, .L4+12
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r6
	mov	r4, #0
	mov	lr, #63488
	ldr	r3, .L4+24
	ldm	r3, {r0, r1, r2, r3}
	add	ip, r5, #32
	stm	ip, {r0, r1, r2, r3}
	ldr	r2, .L4+28
	ldr	r3, .L4+32
	strh	lr, [r5, #12]	@ movhi
	str	r4, [r3]
	str	r4, [r2]
	str	r4, [r5, #40]
	ldr	r3, [r3]
	lsl	r3, r3, #8
	str	r3, [r5, #44]
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r6
	ldr	r2, .L4+44
	ldr	r3, .L4+48
	strh	r2, [r5]	@ movhi
	ldr	ip, .L4+52
	ldrh	r0, [r3, #48]
	ldr	r1, .L4+56
	ldr	r2, .L4+60
	ldr	r3, .L4+64
	strh	r4, [ip]	@ movhi
	str	r4, [r2]
	str	r4, [r3]
	strh	r0, [r1]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	tempspritesheetPal
	.word	67117056
	.word	100728832
	.word	tempspritesheetTiles
	.word	bg_aff_default
	.word	bg2xOff
	.word	bg2yOff
	.word	hideSprites
	.word	shadowOAM
	.word	5121
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	randTimer
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
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L7
	str	r2, [r3]
	bx	lr
.L8:
	.align	2
.L7:
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
	ldr	r3, .L11
	ldr	r0, [r3]
	push	{r4, lr}
	add	r0, r0, #1
	ldr	r2, .L11+4
	str	r0, [r3]
	mov	lr, pc
	bx	r2
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L11+12
	ldr	r3, .L11+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	randTimer
	.word	srand
	.word	init
	.word	state
	.word	waitForVBlank
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
	mov	r2, #1
	ldr	r3, .L14
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
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
	push	{r4, lr}
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L18+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L18+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
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
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r6, .L30+4
	ldr	r10, .L30+8
	ldr	r5, .L30+12
	ldr	r9, .L30+16
	ldr	r8, .L30+20
	ldr	r7, .L30+24
	ldr	r4, .L30+28
.L21:
	ldr	r2, [r6]
	ldrh	r3, [r10]
.L27:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r2, #4
	strh	r3, [r10]	@ movhi
	bgt	.L27
	cmp	r2, #1
	ble	.L29
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r3, [r10]
	b	.L27
.L29:
	cmp	r2, #0
	beq	.L24
	cmp	r2, #1
	bne	.L27
	mov	lr, pc
	bx	r8
	b	.L21
.L24:
	mov	lr, pc
	bx	r9
	b	.L21
.L31:
	.align	2
.L30:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	waitForVBlank
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
	mov	r2, #2
	ldr	r3, .L33
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
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
	push	{r4, lr}
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
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
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L40
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
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
	push	{r4, lr}
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
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
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L47
	str	r2, [r3]
	bx	lr
.L48:
	.align	2
.L47:
	.word	state
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
	push	{r4, lr}
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	waitForVBlank
	.size	lose, .-lose
	.comm	randTimer,4,4
	.comm	bg2yOff,4,4
	.comm	bg2xOff,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
