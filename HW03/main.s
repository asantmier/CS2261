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
.LC0:
	.ascii	"MARINE BIOLOGY SIMULATOR\000"
	.align	2
.LC1:
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
	mov	r4, #0
	ldr	r2, .L4
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	str	r4, [r2]
	ldr	r5, .L4+12
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r1, #60
	mov	r0, #48
	ldr	r2, .L4+16
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+20
	mov	r1, #80
	mov	r0, #60
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+28
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	28512
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	32767
	.word	.LC1
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Lives:\000"
	.align	2
.LC3:
	.ascii	"Score:\000"
	.align	2
.LC4:
	.ascii	"Hi-Score:\000"
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
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r3, .L11
	ldr	r2, .L11+4
	sub	sp, sp, #8
	ldrh	r0, [r3]
	ldr	r3, .L11+8
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r5, .L11+12
	mov	r0, r1
	str	r1, [sp]
	mov	r3, #10
	mov	r2, #240
	ldr	r6, .L11+16
	mov	lr, pc
	bx	r6
	ldr	r6, .L11+20
	mov	r1, r4
	mov	r0, r4
	mov	r3, r5
	ldr	r2, .L11+24
	mov	lr, pc
	bx	r6
	mov	r3, r5
	mov	r1, r4
	mov	r0, #71
	ldr	r2, .L11+28
	mov	lr, pc
	bx	r6
	mov	r3, r5
	mov	r1, r4
	mov	r0, #149
	ldr	r2, .L11+32
	mov	lr, pc
	bx	r6
	str	r5, [sp]
	ldr	r3, .L11+36
	mov	r1, r4
	mov	r0, r4
	mov	r2, #6
	ldr	r3, [r3]
	ldr	r4, .L11+40
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	bgColor
	.word	state
	.word	fillScreen
	.word	32767
	.word	drawRect
	.word	drawString
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	hiscore
	.word	drawScore
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
	ldr	r3, .L22
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L22+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	bl	goToGame
	ldr	r2, .L22+8
	ldr	r3, .L22+12
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r4, .L36
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L25
	ldr	r2, .L36+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L34
.L25:
	tst	r3, #8
	beq	.L24
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L35
.L24:
	pop	{r4, lr}
	bx	lr
.L35:
	pop	{r4, lr}
	b	goToStart
.L34:
	bl	goToGame
	ldr	r2, .L36+8
	ldr	r3, .L36+12
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L25
.L37:
	.align	2
.L36:
	.word	oldButtons
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
	ldr	r5, .L40
	ldrh	r3, [r5]
	sub	sp, sp, #12
	ldr	ip, .L40+4
	ldr	r4, .L40+8
	str	r3, [sp]
	mov	r2, #36
	mov	r3, #8
	mov	r1, #60
	mov	r0, #102
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
	mov	r3, #8
	str	r2, [sp]
	mov	r1, #90
	mov	r2, #138
	mov	r0, #51
	mov	lr, pc
	bx	r4
	ldrh	r2, [r5]
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
.L41:
	.align	2
.L40:
	.word	bgColor
	.word	state
	.word	drawRect
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
	ldr	r4, .L54
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L43
	ldr	r2, .L54+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L52
.L43:
	tst	r3, #8
	beq	.L42
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L42:
	pop	{r4, lr}
	bx	lr
.L53:
	pop	{r4, lr}
	b	goToStart
.L52:
	bl	goToGameFromPause
	ldrh	r3, [r4]
	b	.L43
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"PAUSED\000"
	.align	2
.LC6:
	.ascii	"press SELECT to unpause\000"
	.align	2
.LC7:
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
	ldr	ip, .L58
	ldr	r4, .L58+4
	mov	r3, #0
	mov	r1, #60
	mov	r0, #102
	ldr	r2, .L58+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #90
	mov	r0, #51
	ldr	r2, .L58+12
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #100
	mov	r0, #18
	ldr	r2, .L58+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	state
	.word	drawString
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"NEW HIGH SCORE!\000"
	.align	2
.LC9:
	.ascii	"YOU LOST\000"
	.align	2
.LC10:
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
	mov	r2, #3
	ldr	r3, .L65
	ldr	ip, .L65+4
	push	{r4, lr}
	ldr	r1, [ip]
	ldr	lr, [r3]
	ldr	r3, .L65+8
	cmp	lr, r1
	str	r2, [r3]
	bgt	.L63
	ldr	r4, .L65+12
.L61:
	mov	r3, #0
	mov	r1, #81
	mov	r0, #97
	ldr	r2, .L65+16
	mov	lr, pc
	bx	r4
	mov	r3, #31
	mov	r1, #80
	mov	r0, #96
	ldr	r2, .L65+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #100
	mov	r0, #45
	ldr	r2, .L65+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L63:
	mov	r3, #0
	mov	r1, #21
	mov	r0, #76
	ldr	r2, .L65+24
	ldr	r4, .L65+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #992
	mov	r1, #20
	mov	r0, #75
	ldr	r2, .L65+24
	mov	lr, pc
	bx	r4
	b	.L61
.L66:
	.align	2
.L65:
	.word	score
	.word	hiscore
	.word	state
	.word	drawString
	.word	.LC9
	.word	.LC10
	.word	.LC8
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
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L74
.L68:
	ldr	r3, .L76+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L67
	ldr	r3, .L76+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L75
.L67:
	pop	{r4, lr}
	bx	lr
.L74:
	bl	goToLose
	b	.L68
.L75:
	pop	{r4, lr}
	b	goToPause
.L77:
	.align	2
.L76:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
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
	mov	r1, #67108864
	ldr	r2, .L89
	ldr	r3, [r2]
	ldr	r0, .L89+4
	add	r3, r3, #1
	push	{r4, r7, fp, lr}
	str	r3, [r2]
	ldr	r3, .L89+8
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L89+12
	ldr	fp, .L89+16
	ldr	r5, .L89+20
	ldr	r10, .L89+24
	ldr	r9, .L89+28
	ldr	r8, .L89+32
	ldr	r7, .L89+36
	ldr	r4, .L89+40
.L79:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L80:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L82:
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
.L81:
	mov	lr, pc
	bx	r7
	b	.L79
.L83:
	mov	lr, pc
	bx	r8
	b	.L79
.L84:
	mov	lr, pc
	bx	r9
	b	.L79
.L85:
	mov	lr, pc
	bx	r10
	b	.L79
.L90:
	.align	2
.L89:
	.word	seed
	.word	1027
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	lose
	.word	67109120
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
