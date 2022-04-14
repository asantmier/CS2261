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
	.file	"game.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"PLAYER\000"
	.align	2
.LC1:
	.ascii	"DUDE\000"
	.text
	.align	2
	.global	initParty
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initParty, %function
initParty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #10
	mov	r7, #88
	mov	r9, #1
	ldr	r4, .L4
	ldr	r10, .L4+4
	mov	r2, r5
	ldr	fp, .L4+8
	ldr	r8, .L4+12
	mov	r0, r4
	ldr	r1, .L4+16
	mov	lr, pc
	bx	fp
	ldr	r6, .L4+20
	mov	r2, r7
	mov	r1, r10
	add	r0, r4, #28
	str	r9, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	mov	lr, pc
	bx	r6
	mov	r2, r7
	mov	r1, r8
	add	r0, r4, #204
	mov	lr, pc
	bx	r6
	mov	r3, #3
	mov	r2, r5
	ldr	r1, .L4+24
	add	r0, r4, #556
	str	r3, [r4, #24]
	mov	lr, pc
	bx	fp
	mov	r1, r10
	mov	r2, r7
	add	r0, r4, #584
	str	r9, [r4, #568]
	str	r5, [r4, #572]
	str	r5, [r4, #576]
	mov	lr, pc
	bx	r6
	mov	r2, r7
	mov	r1, r8
	add	r0, r4, #116
	mov	lr, pc
	bx	r6
	mov	r3, #2
	str	r3, [r4, #580]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	battleAllies
	.word	MOVE_SLASH
	.word	strncpy
	.word	MOVE_HEAL
	.word	.LC0
	.word	memcpy
	.word	.LC1
	.size	initParty, .-initParty
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #100
	mov	r1, #0
	ldr	ip, .L7
	ldr	r0, .L7+4
	ldr	r2, .L7+8
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	b	initParty
.L8:
	.align	2
.L7:
	.word	submarineMaxHp
	.word	submarineHp
	.word	gameVictory
	.size	initGame, .-initGame
	.global	__aeabi_idiv
	.align	2
	.global	tilesRed
	.syntax unified
	.arm
	.fpu softvfp
	.type	tilesRed, %function
tilesRed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mul	r4, r2, r0
	mov	r5, r1
	mov	r0, r4
	mov	r1, r3
	ldr	r8, .L16
	mov	r6, r2
	mov	r7, r3
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	movge	r0, #0
	bge	.L9
	add	r4, r4, r6
	mov	r0, r4
	mov	r1, r7
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	movge	r0, #1
	bge	.L9
	add	r4, r4, r6
	mov	r0, r4
	mov	r1, r7
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	movge	r0, #2
	bge	.L9
	mov	r1, r7
	add	r0, r4, r6
	mov	lr, pc
	bx	r8
	cmp	r0, r5
	movlt	r0, #4
	movge	r0, #3
.L9:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	__aeabi_idiv
	.size	tilesRed, .-tilesRed
	.comm	battleOpponents,2224,4
	.comm	battleAllies,2224,4
	.comm	gameVictory,4,4
	.comm	submarineHp,4,4
	.comm	submarineMaxHp,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
