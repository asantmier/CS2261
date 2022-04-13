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
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #100
	mov	r1, #1
	mov	r2, #6
	mov	ip, #10
	mov	r0, #8
	str	lr, [sp, #-4]!
	ldr	lr, .L4
	str	r3, [lr]
	ldr	lr, .L4+4
	str	r3, [lr]
	ldr	r3, .L4+8
	ldr	lr, [sp], #4
	str	r1, [r3]
	str	r1, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L5:
	.align	2
.L4:
	.word	submarineMaxHp
	.word	submarineHp
	.word	battleAllies
	.size	initGame, .-initGame
	.align	2
	.global	initParty
	.syntax unified
	.arm
	.fpu softvfp
	.type	initParty, %function
initParty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	mov	r2, #6
	mov	ip, #10
	mov	r0, #8
	ldr	r3, .L7
	str	r1, [r3]
	str	r1, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L8:
	.align	2
.L7:
	.word	battleAllies
	.size	initParty, .-initParty
	.comm	battleOpponents,48,4
	.comm	battleAllies,48,4
	.comm	submarineHp,4,4
	.comm	submarineMaxHp,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
