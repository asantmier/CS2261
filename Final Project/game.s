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
	.ascii	"BUDDY\000"
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
	ldr	ip, .L4
	push	{r4, r5, r6, lr}
	ldr	r5, .L4+4
	mov	r4, ip
	mov	lr, r5
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, [r5, #16]
	ldm	r4, {r0, r1}
	add	ip, ip, #56
	stm	lr, {r0, r1}
	str	r3, [r5, #20]
	ldmia	ip!, {r0, r1, r2, r3}
	add	lr, r5, #56
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1}
	ldr	ip, [r5, #72]
	stm	lr, {r0, r1}
	str	ip, [r5, #76]
	add	r0, r5, #56
	mov	r2, #10
	ldr	r1, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	battleAllies
	.word	.LC0
	.word	strncpy
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
	.comm	battleOpponents,224,4
	.comm	battleAllies,224,4
	.global	CBT_NONE
	.global	CBT_SUBMARINE
	.global	CBT_GOD
	.global	CBT_BARRACUDA
	.global	CBT_PUFFER
	.global	CBT_ANGLER
	.global	CBT_SHARK
	.global	CBT_FISH
	.comm	gameVictory,4,4
	.comm	submarineHp,4,4
	.comm	submarineMaxHp,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CBT_SUBMARINE, %object
	.size	CBT_SUBMARINE, 56
CBT_SUBMARINE:
	.ascii	"SUBMARINE\000"
	.space	2
	.word	1
	.word	20
	.word	20
	.word	3
	.word	MOVE_TORPEDO1
	.word	MOVE_SHIELD1
	.word	MOVE_BLAST1
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	512
	.type	CBT_FISH, %object
	.size	CBT_FISH, 56
CBT_FISH:
	.ascii	"FISH\000"
	.space	5
	.space	2
	.word	1
	.word	10
	.word	10
	.word	3
	.word	MOVE_NIBBLE
	.word	MOVE_FLAIL
	.word	MOVE_REGEN
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	576
	.type	CBT_NONE, %object
	.size	CBT_NONE, 56
CBT_NONE:
	.ascii	"NONE\000"
	.space	5
	.space	2
	.word	0
	.word	99
	.word	0
	.word	0
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	512
	.type	CBT_GOD, %object
	.size	CBT_GOD, 56
CBT_GOD:
	.ascii	"TUNA GOD\000"
	.space	1
	.space	2
	.word	1
	.word	60
	.word	60
	.word	6
	.word	MOVE_BITE
	.word	MOVE_SLASH
	.word	MOVE_RESOLVE
	.word	MOVE_LHEALBURST
	.word	MOVE_WAVE
	.word	MOVE_TRANSCEND
	.word	848
	.type	CBT_BARRACUDA, %object
	.size	CBT_BARRACUDA, 56
CBT_BARRACUDA:
	.ascii	"BARRACUDA\000"
	.space	2
	.word	1
	.word	14
	.word	14
	.word	2
	.word	MOVE_BITE
	.word	MOVE_DASH
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	640
	.type	CBT_PUFFER, %object
	.size	CBT_PUFFER, 56
CBT_PUFFER:
	.ascii	"PUFFER\000"
	.space	3
	.space	2
	.word	1
	.word	28
	.word	28
	.word	3
	.word	MOVE_NIBBLE
	.word	MOVE_PUFFUP
	.word	MOVE_SHEALBURST
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	712
	.type	CBT_ANGLER, %object
	.size	CBT_ANGLER, 56
CBT_ANGLER:
	.ascii	"ANGLER\000"
	.space	3
	.space	2
	.word	1
	.word	24
	.word	24
	.word	3
	.word	MOVE_BITE
	.word	MOVE_LHEAL
	.word	MOVE_LHEALBURST
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	648
	.type	CBT_SHARK, %object
	.size	CBT_SHARK, 56
CBT_SHARK:
	.ascii	"SHARK\000"
	.space	4
	.space	2
	.word	1
	.word	16
	.word	16
	.word	2
	.word	MOVE_STRIKE
	.word	MOVE_SHEAL
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	MOVE_NONE
	.word	704
	.ident	"GCC: (devkitARM release 53) 9.1.0"
