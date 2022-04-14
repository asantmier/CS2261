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
	.file	"battle.c"
	.text
	.align	2
	.global	goToFrontMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFrontMenu, %function
goToFrontMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #4
	ldr	ip, .L3
	ldr	r0, .L3+4
	ldr	r2, .L3+8
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	bx	lr
.L4:
	.align	2
.L3:
	.word	menu
	.word	selOpt
	.word	numOpt
	.size	goToFrontMenu, .-goToFrontMenu
	.align	2
	.global	goToAttackMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToAttackMenu, %function
goToAttackMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	mov	r2, #0
	ldr	r3, .L7
	ldr	r3, [r3]
	str	lr, [sp, #-4]!
	ldr	ip, .L7+4
	ldr	lr, [r3, #24]
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	fighter
	.word	numOpt
	.word	menu
	.word	selOpt
	.size	goToAttackMenu, .-goToAttackMenu
	.align	2
	.global	goToTargetMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTargetMenu, %function
goToTargetMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	mov	r0, #2
	ldr	r3, .L27
	ldr	ip, [r3]
	ldr	r1, .L27+4
	ldr	r3, .L27+8
	cmp	ip, #1
	str	r2, [r3]
	str	r0, [r1]
	mov	r2, #0
	ldrne	r3, .L27+12
	beq	.L26
.L15:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L14
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L25
.L14:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L15
	bx	lr
.L26:
	ldr	r3, .L27+16
.L13:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L11
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L25
.L11:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L13
	bx	lr
.L25:
	ldr	r3, .L27+20
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	targetTeam
	.word	menu
	.word	numOpt
	.word	battleAllies
	.word	battleOpponents
	.word	selOpt
	.size	goToTargetMenu, .-goToTargetMenu
	.align	2
	.global	goToInspectMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInspectMenu, %function
goToInspectMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L38
	ldr	r0, .L38+4
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L38+8
.L32:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L30
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L37
.L30:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L32
.L31:
	mov	r2, #1
	ldr	r3, .L38+12
	str	r2, [r3]
	bx	lr
.L37:
	ldr	r3, .L38+16
	str	r2, [r3]
	b	.L31
.L39:
	.align	2
.L38:
	.word	numOpt
	.word	menu
	.word	battleOpponents
	.word	targetTeam
	.word	selOpt
	.size	goToInspectMenu, .-goToInspectMenu
	.align	2
	.global	goToCaptureMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCaptureMenu, %function
goToCaptureMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #4
	mov	r2, #0
	ldr	r0, .L49
	ldr	r1, .L49+4
	str	r3, [r0]
	str	r3, [r1]
	ldr	r3, .L49+8
.L43:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L41
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L48
.L41:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L43
.L42:
	mov	r2, #1
	ldr	r3, .L49+12
	str	r2, [r3]
	bx	lr
.L48:
	ldr	r3, .L49+16
	str	r2, [r3]
	b	.L42
.L50:
	.align	2
.L49:
	.word	menu
	.word	numOpt
	.word	battleOpponents
	.word	targetTeam
	.word	selOpt
	.size	goToCaptureMenu, .-goToCaptureMenu
	.align	2
	.global	goToReplaceMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToReplaceMenu, %function
goToReplaceMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #5
	mov	r3, #0
	mov	ip, #3
	ldr	r2, .L53
	ldr	r0, .L53+4
	str	lr, [r2]
	ldr	r1, .L53+8
	ldr	r2, .L53+12
	str	ip, [r0]
	str	r3, [r1]
	str	r3, [r2]
	ldr	lr, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
	.word	menu
	.word	numOpt
	.word	selOpt
	.word	targetTeam
	.size	goToReplaceMenu, .-goToReplaceMenu
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"CHOOSE A COMBATANT\012TO INSPECT.\000"
	.align	2
.LC1:
	.ascii	"%s:%d/%d\000"
	.text
	.align	2
	.global	inspectMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	inspectMenu, %function
inspectMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #61
	ldr	r1, .L64
	ldr	r3, .L64+4
	ldr	r0, .L64+8
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	mov	r3, #556
	ldr	r4, .L64+12
	ldr	r2, [r4]
	ldr	r1, .L64+16
	add	ip, r2, r2, lsl #2
	ldr	r1, [r1]
	lsl	ip, ip, #3
	add	ip, ip, #15
	and	ip, ip, #255
	cmp	r1, #1
	mul	r2, r3, r2
	orr	ip, ip, #32768
	beq	.L63
	mov	r0, #832
	ldr	r3, .L64+20
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L64+24
	str	r3, [sp]
	ldr	lr, .L64+28
	ldr	r3, [r2, #20]
	ldr	r1, .L64+32
	strh	r0, [r5, #132]	@ movhi
	ldr	r6, .L64+36
	ldr	r0, .L64+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #130]	@ movhi
	mov	lr, pc
	bx	r6
.L57:
	ldr	r3, .L64+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L55
	mov	r2, #512
	mov	r3, #0
	mov	r1, #4
	strh	r2, [r5, #128]	@ movhi
	ldr	r0, .L64+48
	ldr	r2, .L64+52
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
.L55:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	mov	r0, #192
	mov	lr, #832
	ldr	r3, .L64+56
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L64+24
	str	r3, [sp]
	ldr	r1, .L64+32
	ldr	r3, [r2, #20]
	ldr	r6, .L64+36
	strh	r0, [r5, #130]	@ movhi
	ldr	r0, .L64+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #132]	@ movhi
	mov	lr, pc
	bx	r6
	b	.L57
.L65:
	.align	2
.L64:
	.word	.LC0
	.word	strncpy
	.word	topBuf
	.word	selOpt
	.word	targetTeam
	.word	battleAllies
	.word	shadowOAM
	.word	4136
	.word	.LC1
	.word	sprintf
	.word	botBuf
	.word	leave
	.word	menu
	.word	numOpt
	.word	battleOpponents
	.size	inspectMenu, .-inspectMenu
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"CHOOSE AN ATTACK.\000"
	.align	2
.LC3:
	.ascii	"%c%-9s%c%-9s%c%-9s%c%-9s%c%-9s%c%-9s\000"
	.text
	.align	2
	.global	attackMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	attackMenu, %function
attackMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L85
	ldr	r1, .L85+4
	ldr	r3, .L85+8
	mov	r2, #61
	ldr	r0, .L85+12
	ldr	r5, .L85+16
	sub	sp, sp, #44
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r1, [r5]
	cmp	r0, #0
	add	r3, r1, #28
	add	r8, r1, #292
	add	r10, r1, #116
	add	r9, r1, #380
	beq	.L73
	cmp	r0, #3
	moveq	r6, #42
	moveq	r2, #32
	addeq	ip, r1, #204
	bne	.L82
.L68:
	cmp	r0, #5
	movne	r0, #32
	mov	r7, ip
	movne	fp, r0
	movne	ip, r0
	movne	lr, r0
	moveq	ip, #32
	moveq	r0, #42
	moveq	fp, ip
	moveq	lr, ip
.L70:
	add	r1, r1, #468
	stm	sp, {r6, r8, lr}
	str	r1, [sp, #36]
	str	r0, [sp, #32]
	str	r7, [sp, #28]
	str	ip, [sp, #24]
	str	r9, [sp, #20]
	str	fp, [sp, #16]
	str	r10, [sp, #12]
	ldr	r1, .L85+20
	ldr	r0, .L85+24
	ldr	r6, .L85+28
	mov	lr, pc
	bx	r6
	ldr	r3, .L85+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
	mov	r3, #0
	mov	r1, #4
	ldr	r0, .L85+36
	ldr	r2, .L85+40
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
.L66:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L82:
	cmp	r0, #1
	bne	.L83
	mov	r0, #32
	mov	lr, #42
	mov	ip, r0
	mov	fp, r0
	mov	r6, r0
	mov	r2, r0
	add	r7, r1, #204
	b	.L70
.L73:
	mov	r2, #42
	add	ip, r1, #204
.L67:
	mov	r6, #32
	b	.L68
.L71:
	ldr	r3, .L85+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [r4]
	add	r1, r3, r3, lsl #2
	ldr	r2, [r5]
	add	r3, r3, r1, lsl #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldr	r1, [r1, #108]
	rsbs	r1, r1, #1
	movcc	r1, #0
	ldr	ip, .L85+48
	ldr	r0, .L85+52
	add	r3, r3, #28
	add	r3, r2, r3
	str	r1, [ip]
	str	r3, [r0]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToTargetMenu
.L83:
	add	ip, r1, #204
	cmp	r0, #4
	mov	r7, ip
	bne	.L84
	mov	r0, #32
	mov	fp, #42
	mov	ip, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L70
.L84:
	cmp	r0, #2
	movne	r2, #32
	bne	.L67
	mov	r0, #32
	mov	ip, #42
	mov	fp, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L70
.L86:
	.align	2
.L85:
	.word	selOpt
	.word	.LC2
	.word	strncpy
	.word	topBuf
	.word	fighter
	.word	.LC3
	.word	botBuf
	.word	sprintf
	.word	leave
	.word	menu
	.word	numOpt
	.word	enter
	.word	targetTeam
	.word	move
	.size	attackMenu, .-attackMenu
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Ending turn...\000"
	.text
	.align	2
	.global	finishTurn
	.syntax unified
	.arm
	.fpu softvfp
	.type	finishTurn, %function
finishTurn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	ip, #4
	ldr	r2, .L145
	push	{r4, r5, r6, lr}
	ldr	r1, .L145+4
	ldr	lr, .L145+8
	str	r3, [r2]
	ldr	r0, .L145+12
	ldr	r2, .L145+16
	str	r3, [lr]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	ldr	r0, .L145+20
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	bne	.L88
	ldr	ip, .L145+24
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L89
	ldr	r1, .L145+28
	mov	r4, #1
	mov	r5, r2
	mov	lr, r1
	mov	r3, r1
	mov	r6, r2
	str	r4, [ip]
	add	r4, r1, #2224
.L91:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	beq	.L90
	ldr	ip, [r3, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L90:
	add	r3, r3, #556
	cmp	r4, r3
	bne	.L91
	ldr	r3, .L145+32
	cmp	r6, #0
	ldr	r3, [r3]
	strne	r5, [r0]
	cmp	r3, #0
	ldrne	r3, [r0]
	addne	r3, r3, #1
	strne	r3, [r0]
.L96:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L94
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bgt	.L143
.L94:
	add	r2, r2, #1
	cmp	r2, #4
	add	r1, r1, #556
	bne	.L96
.L95:
	mov	r2, #100
	ldr	r3, .L145+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L88:
	ldr	r3, .L145+24
	ldr	r3, [r3]
	ldr	ip, .L145+40
	cmp	r3, #0
	mov	r5, #556
	ldr	r2, [ip]
	bne	.L103
	ldr	lr, .L145+44
	add	r3, r2, #1
	add	r2, r2, #5
.L105:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L104
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L142
.L104:
	cmp	r3, r2
	bne	.L105
	b	.L95
.L103:
	ldr	lr, .L145+28
	add	r3, r2, #1
	add	r2, r2, #5
.L107:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L106
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L142
.L106:
	cmp	r3, r2
	bne	.L107
	b	.L95
.L89:
	ldr	r1, .L145+44
	mov	r5, r3
	mov	lr, r1
	mov	r2, r1
	mov	r6, r3
	str	r3, [ip]
	add	r4, r1, #2224
.L98:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L97
	ldr	ip, [r2, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L97:
	add	r2, r2, #556
	cmp	r2, r4
	bne	.L98
	cmp	r6, #0
	strne	r5, [r0]
.L101:
	ldr	r2, [r1, #12]
	cmp	r2, #0
	beq	.L100
	ldr	r2, [r1, #20]
	cmp	r2, #0
	bgt	.L144
.L100:
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #556
	bne	.L101
	b	.L95
.L142:
	ldr	r3, .L145+48
	str	r1, [ip]
	str	r0, [r3]
	b	.L95
.L144:
	mov	r2, #556
	mla	lr, r2, r3, lr
	ldr	r1, .L145+48
	ldr	r2, .L145+40
	str	lr, [r1]
	str	r3, [r2]
	b	.L95
.L143:
	mov	r3, #556
	mla	lr, r3, r2, lr
	ldr	r1, .L145+48
	ldr	r3, .L145+40
	str	lr, [r1]
	str	r2, [r3]
	b	.L95
.L146:
	.align	2
.L145:
	.word	menu
	.word	numOpt
	.word	selOpt
	.word	.LC4
	.word	mgba_printf
	.word	turnPoints
	.word	turn
	.word	battleOpponents
	.word	bossBattle
	.word	waitTimer
	.word	fighterIdx
	.word	battleAllies
	.word	fighter
	.size	finishTurn, .-finishTurn
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"YOU CAPTURED %s! SELECT AN ALLY TO REPLACE\000"
	.align	2
.LC6:
	.ascii	"YOU RELEASED %s\000"
	.align	2
.LC7:
	.ascii	"%s REPLACED %s\000"
	.text
	.align	2
	.global	replaceMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	replaceMenu, %function
replaceMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L154
	ldr	r6, .L154+4
	ldr	r4, [r3]
	sub	sp, sp, #8
	ldr	r2, [r6]
	ldr	r1, .L154+8
	ldr	r5, .L154+12
	add	r4, r4, #1
	ldr	r0, .L154+16
	mov	lr, pc
	bx	r5
	add	r1, r4, r4, lsl #2
	lsl	r1, r1, #3
	add	r1, r1, #15
	and	r1, r1, #255
	mvn	r1, r1, lsl #17
	mov	r9, #556
	mvn	r1, r1, lsr #17
	mov	ip, #832
	ldr	r3, .L154+20
	mla	r4, r9, r4, r3
	ldr	r3, [r4, #16]
	ldr	r7, .L154+24
	ldr	lr, .L154+28
	str	r3, [sp]
	ldr	r10, .L154+32
	ldr	r3, [r4, #20]
	mov	r2, r4
	strh	r1, [r7, #128]	@ movhi
	mov	r0, r10
	strh	lr, [r7, #130]	@ movhi
	ldr	r1, .L154+36
	strh	ip, [r7, #132]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L154+40
	ldr	r8, [r3]
	cmp	r8, #0
	bne	.L152
	ldr	r3, .L154+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L153
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L153:
	mov	r0, #512
	mov	r3, r4
	ldr	r2, [r6]
	strh	r0, [r7, #128]	@ movhi
	ldr	r1, .L154+48
	ldr	r0, .L154+16
	strb	r8, [r10]
	mov	lr, pc
	bx	r5
	ldr	r5, [r6]
	mov	r2, r9
	mov	r0, r4
	mov	r1, r5
	ldr	r3, .L154+52
	mov	lr, pc
	bx	r3
	str	r8, [r5, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L152:
	mov	r3, #512
	ldr	r2, [r6]
	strh	r3, [r7, #128]	@ movhi
	ldr	r1, .L154+56
	ldr	r0, .L154+16
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, [r6]
	str	r2, [r3, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L155:
	.align	2
.L154:
	.word	selOpt
	.word	captured
	.word	.LC5
	.word	sprintf
	.word	topBuf
	.word	battleAllies
	.word	shadowOAM
	.word	4136
	.word	botBuf
	.word	.LC1
	.word	leave
	.word	enter
	.word	.LC7
	.word	memcpy
	.word	.LC6
	.size	replaceMenu, .-replaceMenu
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"CHOOSE AN OPPONENT\012TO CAPTURE.\000"
	.align	2
.LC9:
	.ascii	"YOU FAILED TO CAPTURE %s\000"
	.global	__aeabi_idivmod
	.text
	.align	2
	.global	captureMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	captureMenu, %function
captureMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L166
	sub	sp, sp, #8
	mov	r2, #61
	ldr	r1, .L166+4
	ldr	r3, .L166+8
	ldr	r0, .L166+12
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	add	r1, r2, r2, lsl #2
	lsl	r1, r1, #3
	add	r1, r1, #15
	and	r1, r1, #255
	mvn	r1, r1, lsl #17
	mov	r7, #556
	mvn	r1, r1, lsr #17
	mov	lr, #192
	mov	ip, #832
	ldr	r6, .L166+16
	mla	r2, r7, r2, r6
	ldr	r3, [r2, #16]
	ldr	r5, .L166+20
	str	r3, [sp]
	ldr	r8, .L166+24
	ldr	r3, [r2, #20]
	mov	r0, r8
	strh	r1, [r5, #128]	@ movhi
	ldr	r9, .L166+28
	ldr	r1, .L166+32
	strh	lr, [r5, #130]	@ movhi
	strh	ip, [r5, #132]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r3, .L166+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L157
	mov	r2, #512
	mov	r3, #0
	mov	r1, #4
	strh	r2, [r5, #128]	@ movhi
	ldr	r0, .L166+40
	ldr	r2, .L166+44
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
.L156:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L157:
	ldr	r2, .L166+48
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L156
	mov	r2, #512
	ldr	r1, .L166+52
	ldr	r10, [r1]
	cmp	r10, #0
	strb	r3, [r8]
	strh	r2, [r5, #128]	@ movhi
	beq	.L159
	ldr	r2, [r4]
	mla	r2, r7, r2, r6
	ldr	r1, .L166+56
.L165:
	ldr	r0, .L166+12
	mov	lr, pc
	bx	r9
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L159:
	ldr	r3, .L166+60
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	mla	r6, r7, r2, r6
	ldr	r3, .L166+64
	ldr	r1, [r6, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #20]
	cmp	r1, r3
	ble	.L160
	mov	r2, #5
	mov	r0, #3
	ldr	r3, .L166+40
	ldr	r1, .L166+44
	str	r2, [r3]
	ldr	r2, .L166+68
	ldr	r3, .L166+72
	str	r10, [r4]
	str	r0, [r1]
	str	r6, [r2]
	str	r10, [r3]
	b	.L156
.L160:
	mov	r2, r6
	ldr	r1, .L166+56
	b	.L165
.L167:
	.align	2
.L166:
	.word	selOpt
	.word	.LC8
	.word	strncpy
	.word	topBuf
	.word	battleOpponents
	.word	shadowOAM
	.word	botBuf
	.word	sprintf
	.word	.LC1
	.word	leave
	.word	menu
	.word	numOpt
	.word	enter
	.word	bossBattle
	.word	.LC9
	.word	rand
	.word	__aeabi_idivmod
	.word	captured
	.word	targetTeam
	.size	captureMenu, .-captureMenu
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"Executing move! Enemy turn: %d, Fighter %s, Target:"
	.ascii	" %s\000"
	.text
	.align	2
	.global	executeMove
	.syntax unified
	.arm
	.fpu softvfp
	.type	executeMove, %function
executeMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r4, r0
	ldr	r6, .L185
	ldr	r1, .L185+4
	mov	r3, r5
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, .L185+8
	ldr	r7, .L185+12
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L169
	ldr	r3, .L185+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L184
	ldr	r2, .L185+20
	add	r0, r2, #2224
.L179:
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L177
	ldr	r1, [r4, #72]
	ldr	r3, [r2, #20]
	ldr	ip, [r4, #84]
	sub	r3, r3, r1
	ldr	r1, [r2, #16]
	add	r3, r3, ip
	cmp	r1, r3
	movlt	r3, r1
	str	r3, [r2, #20]
.L177:
	add	r2, r2, #556
	cmp	r2, r0
	bne	.L179
.L175:
	mov	r3, r5
	ldr	r2, [r6]
	add	r1, r4, #10
	ldr	r0, .L185+24
	ldr	r4, .L185+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L185+32
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishTurn
.L169:
	ldr	r2, [r4, #72]
	ldr	r3, [r5, #20]
	ldr	r1, [r4, #84]
	sub	r3, r3, r2
	ldr	r2, [r5, #16]
	add	r3, r3, r1
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [r5, #20]
	b	.L175
.L184:
	ldr	r3, .L185+36
	add	r0, r3, #2224
.L174:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L172
	ldr	r1, [r4, #72]
	ldr	r2, [r3, #20]
	ldr	ip, [r4, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L172:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L174
	b	.L175
.L186:
	.align	2
.L185:
	.word	fighter
	.word	turn
	.word	.LC10
	.word	mgba_printf
	.word	targetTeam
	.word	battleAllies
	.word	topBuf
	.word	sprintf
	.word	botBuf
	.word	battleOpponents
	.size	executeMove, .-executeMove
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"CHOOSE A TARGET.\000"
	.align	2
.LC12:
	.ascii	"%s WILL AFFECT\012ALL ENEMIES\000"
	.align	2
.LC13:
	.ascii	"%s WILL AFFECT\012ALL ALLIES\000"
	.text
	.align	2
	.global	targetMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	targetMenu, %function
targetMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r6, .L247
	mov	r2, #61
	ldr	r3, .L247+4
	ldr	r1, .L247+8
	ldr	r0, .L247+12
	ldr	r5, .L247+16
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldr	r3, [r5]
	cmp	r2, #1
	ldr	r3, [r3, #76]
	beq	.L241
	cmp	r3, #0
	beq	.L199
	ldr	r3, .L247+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L200
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L200
	mov	r2, #4288
	mov	r1, #832
	ldr	r4, .L247+24
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, .L247+28
	strh	r2, [r4, #128]	@ movhi
	ldr	r2, [r3, #568]
	cmp	r2, #0
	strh	r1, [r4, #132]	@ movhi
	bne	.L242
.L202:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	beq	.L204
.L245:
	ldr	r2, [r3, #1132]
	cmp	r2, #0
	ble	.L204
	mov	r2, #4288
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L247+32
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	strh	r1, [r4, #148]	@ movhi
	bne	.L243
.L206:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
.L207:
	ldr	r3, .L247+36
	ldr	r2, [r5]
	ldr	r1, .L247+40
	ldr	r0, .L247+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L247+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L244
.L208:
	ldr	r3, .L247+52
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L187
	mov	r1, #556
	mov	r3, #512
	ldr	r2, .L247+56
	ldr	r2, [r2]
	mul	r2, r1, r2
	ldr	r0, [r6]
	cmp	r0, #1
	ldreq	r1, .L247+60
	ldrne	r1, .L247+20
	ldr	r0, [r5]
	add	r1, r1, r2
	strh	r3, [r4, #128]	@ movhi
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	executeMove
.L199:
	ldr	r3, .L247+56
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	mov	r1, #556
	mvn	r0, r0, lsr #17
	mov	ip, #832
	ldr	r3, .L247+20
	mla	r2, r1, r2, r3
	ldr	r4, .L247+24
	ldr	r3, [r2, #16]
	ldr	lr, .L247+64
.L239:
	str	r3, [sp]
	ldr	r1, .L247+68
	ldr	r3, [r2, #20]
	ldr	r7, .L247+36
	strh	r0, [r4, #128]	@ movhi
	ldr	r0, .L247+44
	strh	lr, [r4, #130]	@ movhi
	strh	ip, [r4, #132]	@ movhi
	mov	lr, pc
	bx	r7
.L198:
	ldr	r3, .L247+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L208
.L244:
	mov	r3, #512
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L247+72
	ldr	r0, [r2]
	ldr	r2, .L247+76
	ldr	r0, [r0, #24]
	strh	r3, [r4, #128]	@ movhi
	str	r0, [r2]
	ldr	r0, .L247+80
	ldr	r2, .L247+56
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	str	ip, [r0]
	str	r1, [r2]
.L187:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L200:
	mov	r2, #512
	ldr	r4, .L247+24
	strh	r2, [r4, #128]	@ movhi
	ldr	r2, [r3, #568]
	cmp	r2, #0
	beq	.L202
.L242:
	ldr	r2, [r3, #576]
	cmp	r2, #0
	ble	.L202
	mov	r2, #4288
	mov	r1, #832
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L247+84
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	strh	r1, [r4, #140]	@ movhi
	bne	.L245
.L204:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	beq	.L206
.L243:
	ldr	r3, [r3, #1688]
	cmp	r3, #0
	ble	.L206
	mov	r1, #4288
	mov	r2, #832
	ldr	r3, .L247+88
	strh	r1, [r4, #154]	@ movhi
	strh	r2, [r4, #156]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	b	.L207
.L241:
	cmp	r3, #0
	beq	.L189
	ldr	r3, .L247+60
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L246
.L190:
	mov	r2, #512
	ldr	r4, .L247+24
	strh	r2, [r4, #128]	@ movhi
.L191:
	ldr	r2, [r3, #568]
	cmp	r2, #0
	beq	.L192
	ldr	r2, [r3, #576]
	cmp	r2, #0
	ble	.L192
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L247+84
	strh	r1, [r4, #140]	@ movhi
	strh	r2, [r4, #136]	@ movhi
.L193:
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	beq	.L194
	ldr	r2, [r3, #1132]
	cmp	r2, #0
	ble	.L194
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L247+32
	strh	r1, [r4, #148]	@ movhi
	strh	r2, [r4, #144]	@ movhi
.L195:
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	beq	.L196
	ldr	r3, [r3, #1688]
	cmp	r3, #0
	ble	.L196
	mov	r1, #192
	mov	r2, #832
	ldr	r3, .L247+88
	strh	r1, [r4, #154]	@ movhi
	strh	r2, [r4, #156]	@ movhi
	strh	r3, [r4, #152]	@ movhi
.L197:
	ldr	r2, [r5]
	ldr	r1, .L247+92
	ldr	r3, .L247+36
	ldr	r0, .L247+44
	mov	lr, pc
	bx	r3
	b	.L198
.L246:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L190
	mov	r2, #192
	mov	r1, #832
	ldr	r4, .L247+24
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, .L247+28
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #128]	@ movhi
	b	.L191
.L196:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
	b	.L197
.L194:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	b	.L195
.L192:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	b	.L193
.L189:
	mov	r1, #556
	ldr	r3, .L247+56
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	ldr	r3, .L247+60
	mla	r2, r1, r2, r3
	mvn	r0, r0, lsr #17
	mov	lr, #192
	mov	ip, #832
	ldr	r3, [r2, #16]
	ldr	r4, .L247+24
	b	.L239
.L248:
	.align	2
.L247:
	.word	targetTeam
	.word	strncpy
	.word	.LC11
	.word	topBuf
	.word	move
	.word	battleAllies
	.word	shadowOAM
	.word	-32753
	.word	-32673
	.word	sprintf
	.word	.LC13
	.word	botBuf
	.word	leave
	.word	enter
	.word	selOpt
	.word	battleOpponents
	.word	4136
	.word	.LC1
	.word	fighter
	.word	numOpt
	.word	menu
	.word	-32713
	.word	-32633
	.word	.LC12
	.size	targetMenu, .-targetMenu
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"WHAT WILL YOU DO?\000"
	.align	2
.LC15:
	.ascii	"%cATTACK   %cCAPTURE\012%cPASS\012%cINSPECT\000"
	.align	2
.LC16:
	.ascii	"%s PASSED\000"
	.text
	.align	2
	.global	frontMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	frontMenu, %function
frontMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L281
	ldr	r3, .L281+4
	mov	r2, #61
	ldr	r1, .L281+8
	ldr	r0, .L281+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L263
	cmp	r3, #3
	moveq	r1, #32
	moveq	r3, #42
	moveq	r0, r1
	moveq	r2, r1
	bne	.L280
.L250:
	stm	sp, {r0, r1}
	ldr	r5, .L281+16
	ldr	r1, .L281+20
	ldr	r0, .L281+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L281+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L249
	ldr	r3, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L249
.L253:
	.word	.L256
	.word	.L255
	.word	.L254
	.word	.L252
.L256:
	mov	r1, #1
	mov	r3, #0
	ldr	r2, .L281+32
	ldr	r2, [r2]
	ldr	r0, .L281+36
	ldr	ip, [r2, #24]
	ldr	r2, .L281+40
	str	ip, [r0]
	str	r1, [r2]
	str	r3, [r4]
.L249:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L280:
	cmp	r3, #1
	moveq	r1, #32
	moveq	r0, #42
	moveq	r3, r1
	moveq	r2, r1
	beq	.L250
	cmp	r3, #2
	movne	r1, #32
	movne	r0, r1
	movne	r3, r1
	movne	r2, r1
	moveq	r0, #32
	moveq	r1, #42
	moveq	r3, r0
	moveq	r2, r0
	b	.L250
.L263:
	mov	r1, #32
	mov	r2, #42
	mov	r0, r1
	mov	r3, r1
	b	.L250
.L252:
	mov	r3, #4
	mov	r2, #0
	ldr	r0, .L281+40
	ldr	r1, .L281+36
	str	r3, [r0]
	str	r3, [r1]
	ldr	r3, .L281+44
.L261:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L260
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L279
.L260:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L261
.L258:
	mov	r2, #1
	ldr	r3, .L281+48
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L255:
	ldr	r3, .L281+32
	ldr	r1, .L281+52
	ldr	r2, [r3]
	ldr	r0, .L281+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L281+24
	strb	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	finishTurn
.L254:
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L281+36
	ldr	r0, .L281+40
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L281+44
.L259:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L257
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L279
.L257:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L259
	b	.L258
.L279:
	str	r2, [r4]
	b	.L258
.L282:
	.align	2
.L281:
	.word	selOpt
	.word	strncpy
	.word	.LC14
	.word	topBuf
	.word	sprintf
	.word	.LC15
	.word	botBuf
	.word	enter
	.word	fighter
	.word	numOpt
	.word	menu
	.word	battleOpponents
	.word	targetTeam
	.word	.LC16
	.size	frontMenu, .-frontMenu
	.align	2
	.global	checkBattleStatus
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBattleStatus, %function
checkBattleStatus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L303
	add	r1, r3, #2224
.L286:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L284
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bgt	.L285
.L284:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L286
	mov	r3, #1
	ldr	r2, .L303+4
	ldr	r1, [r2]
	ldr	r2, .L303+8
	cmp	r1, #0
	str	r3, [r2]
	bne	.L292
.L285:
	ldr	r3, .L303+12
	add	r1, r3, #2224
.L290:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L288
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxgt	lr
.L288:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L290
	mvn	r2, #0
	ldr	r3, .L303+8
	str	r2, [r3]
	bx	lr
.L292:
	ldr	r2, .L303+16
	str	r3, [r2]
	b	.L285
.L304:
	.align	2
.L303:
	.word	battleOpponents
	.word	bossBattle
	.word	battleStatus
	.word	battleAllies
	.word	gameVictory
	.size	checkBattleStatus, .-checkBattleStatus
	.align	2
	.global	resetOpponents
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetOpponents, %function
resetOpponents:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L306
	str	r2, [r3, #12]
	str	r2, [r3, #568]
	str	r2, [r3, #1124]
	str	r2, [r3, #1680]
	bx	lr
.L307:
	.align	2
.L306:
	.word	battleOpponents
	.size	resetOpponents, .-resetOpponents
	.align	2
	.global	tsel
	.syntax unified
	.arm
	.fpu softvfp
	.type	tsel, %function
tsel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	movne	r0, #42
	moveq	r0, #32
	bx	lr
	.size	tsel, .-tsel
	.align	2
	.global	drawHealthbar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealthbar, %function
drawHealthbar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, r2
	ldr	r5, .L313
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	and	r1, r1, #255
	add	r4, r5, r3, lsl #3
	orr	ip, r0, #16384
	lsl	r6, r3, #3
	orr	r0, r1, #16384
	ldr	r2, [r2, #16]
	ldr	r1, [lr, #20]
	mov	r3, #4
	strh	r0, [r5, r6]	@ movhi
	ldr	r5, .L313+4
	strh	ip, [r4, #2]	@ movhi
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L314:
	.align	2
.L313:
	.word	shadowOAM
	.word	tilesRed
	.size	drawHealthbar, .-drawHealthbar
	.align	2
	.global	drawCombatants
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCombatants, %function
drawCombatants:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #512
	ldr	r2, .L368
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L368+4
	subs	r1, r2, #1
	strh	r3, [r4, #160]	@ movhi
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	bmi	.L316
	mov	lr, #41
	mov	ip, #8
	rsb	r2, r2, r2, lsl #29
	ldr	r0, .L368+8
	add	r2, r4, r2, lsl #3
.L317:
	add	r3, r1, r1, lsl #3
	add	r3, r3, #57
	sub	r1, r1, #1
	and	r3, r3, r0
	cmn	r1, #1
	strh	lr, [r2, #192]	@ movhi
	strh	ip, [r2, #196]	@ movhi
	strh	r3, [r2, #194]	@ movhi
	add	r2, r2, #8
	bne	.L317
.L316:
	ldr	r5, .L368+12
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L318
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L360
.L318:
	mov	r3, #512
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #64]	@ movhi
.L319:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L320
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L361
.L320:
	mov	r3, #512
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #72]	@ movhi
.L321:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L322
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L362
.L322:
	mov	r3, #512
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #80]	@ movhi
.L323:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L324
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L363
.L324:
	mov	r3, #512
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #88]	@ movhi
.L325:
	ldr	r5, .L368+16
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L326
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L364
.L326:
	mov	r3, #512
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #96]	@ movhi
.L327:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L328
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L365
.L328:
	mov	r3, #512
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #104]	@ movhi
.L329:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L330
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L366
.L330:
	mov	r3, #512
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #112]	@ movhi
.L331:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L332
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L367
.L332:
	mov	r3, #512
	strh	r3, [r4, #56]	@ movhi
	strh	r3, [r4, #120]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L367:
	mov	ip, #16
	ldr	r2, [r5, #1684]
	ldr	lr, .L368+20
	strh	ip, [r4, #60]	@ movhi
	ldr	r3, .L368+24
	ldr	r0, .L368+28
	ldr	ip, .L368+32
	strh	r3, [r4, #56]	@ movhi
	strh	r0, [r4, #58]	@ movhi
	strh	lr, [r4, #120]	@ movhi
	ldr	r5, .L368+36
	strh	ip, [r4, #122]	@ movhi
	mov	r3, #4
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #124]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L366:
	mov	r3, #16
	ldr	r2, .L368+40
	ldr	r0, .L368+28
	ldr	lr, .L368+44
	ldr	ip, .L368+32
	strh	r3, [r4, #52]	@ movhi
	strh	r2, [r4, #48]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L368+36
	strh	r0, [r4, #50]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #112]	@ movhi
	strh	ip, [r4, #114]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #116]	@ movhi
	b	.L331
.L365:
	mov	r3, #16
	ldr	r2, .L368+48
	ldr	r0, .L368+28
	ldr	lr, .L368+52
	ldr	ip, .L368+32
	strh	r3, [r4, #44]	@ movhi
	strh	r2, [r4, #40]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L368+36
	strh	r0, [r4, #42]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #104]	@ movhi
	strh	ip, [r4, #106]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #108]	@ movhi
	b	.L329
.L364:
	mov	r3, #16
	ldr	r2, .L368+56
	ldr	r0, .L368+28
	ldr	lr, .L368+60
	ldr	ip, .L368+32
	strh	r3, [r4, #36]	@ movhi
	strh	r2, [r4, #32]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L368+36
	strh	r0, [r4, #34]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #96]	@ movhi
	strh	ip, [r4, #98]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #100]	@ movhi
	b	.L327
.L363:
	mov	r0, #0
	ldr	ip, .L368+24
	ldr	r3, .L368+64
	ldr	lr, .L368+20
	ldr	r2, [r5, #1684]
	strh	ip, [r4, #24]	@ movhi
	sub	ip, ip, #127
	strh	r3, [r4, #26]	@ movhi
	strh	r0, [r4, #28]	@ movhi
	mov	r3, #4
	strh	lr, [r4, #88]	@ movhi
	ldr	r5, .L368+36
	strh	ip, [r4, #90]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #92]	@ movhi
	b	.L325
.L362:
	mov	r0, #0
	ldr	r3, .L368+40
	ldr	r2, .L368+64
	ldr	lr, .L368+44
	ldr	ip, .L368+68
	strh	r3, [r4, #16]	@ movhi
	strh	r2, [r4, #18]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L368+36
	strh	r0, [r4, #20]	@ movhi
	strh	lr, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #84]	@ movhi
	b	.L323
.L361:
	mov	r0, #0
	ldr	r3, .L368+48
	ldr	r2, .L368+64
	ldr	lr, .L368+52
	ldr	ip, .L368+68
	strh	r3, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L368+36
	strh	r0, [r4, #12]	@ movhi
	strh	lr, [r4, #72]	@ movhi
	strh	ip, [r4, #74]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #76]	@ movhi
	b	.L321
.L360:
	mov	r0, #0
	ldr	r3, .L368+56
	ldr	r2, .L368+64
	ldr	lr, .L368+60
	ldr	ip, .L368+68
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L368+36
	strh	r0, [r4, #4]	@ movhi
	strh	lr, [r4, #64]	@ movhi
	strh	ip, [r4, #66]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #68]	@ movhi
	b	.L319
.L369:
	.align	2
.L368:
	.word	turnPoints
	.word	shadowOAM
	.word	511
	.word	battleAllies
	.word	battleOpponents
	.word	16511
	.word	16519
	.word	-32568
	.word	16584
	.word	tilesRed
	.word	16479
	.word	16471
	.word	16439
	.word	16431
	.word	16399
	.word	16391
	.word	-32760
	.word	16392
	.size	drawCombatants, .-drawCombatants
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"SHARK1\000"
	.align	2
.LC18:
	.ascii	"SHARK2\000"
	.align	2
.LC19:
	.ascii	"SHARK3\000"
	.align	2
.LC20:
	.ascii	"TUNA GOD\000"
	.align	2
.LC21:
	.ascii	"FISH1\000"
	.align	2
.LC22:
	.ascii	"FISH2\000"
	.text
	.align	2
	.global	initBattle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattle, %function
initBattle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #4
	ldr	r6, .L387
	ldr	lr, .L387+4
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L387+8
	ldr	lr, .L387+12
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L387+16
	ldr	lr, .L387+20
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L387+24
	ldr	lr, .L387+28
	str	r2, [r6]
	strb	r2, [lr]
	ldr	r6, .L387+32
	ldr	lr, .L387+36
	strb	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L387+40
	ldr	lr, .L387+44
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L387+48
	ldr	lr, .L387+52
	str	r2, [r6]
	mov	ip, r2
	mov	r5, r0
	str	r2, [lr]
	mov	r0, r2
	ldr	r2, .L387+56
	ldr	r1, .L387+60
	ldr	r6, .L387+64
	str	r4, [r2]
	mov	r3, r1
	str	r1, [r6]
	add	r1, r1, #2224
.L372:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L371
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	ip, #1
	addgt	r0, r0, ip
.L371:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L372
	mov	r3, #0
	ldr	r4, .L387+68
	cmp	ip, #0
	ldr	ip, .L387+72
	strne	r0, [lr]
	cmp	r5, #1
	str	r3, [ip]
	str	r3, [r4, #12]
	str	r3, [r4, #568]
	str	r3, [r4, #1124]
	str	r3, [r4, #1680]
	beq	.L374
	cmp	r5, #4
	beq	.L375
	mov	r5, #1
	mov	r6, #6
	ldr	r8, .L387+76
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L387+80
	mov	lr, pc
	bx	r8
	ldr	r7, .L387+84
	mov	r2, #88
	ldr	r1, .L387+88
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, #10
	ldr	r1, .L387+92
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	str	r5, [r4, #568]
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	add	r0, r4, #584
	mov	r2, #88
	ldr	r1, .L387+88
	mov	lr, pc
	bx	r7
	str	r5, [r4, #580]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L374:
	mov	r6, #10
	ldr	r8, .L387+76
	mov	r2, r6
	mov	r0, r4
	ldr	r1, .L387+96
	mov	lr, pc
	bx	r8
	ldr	r7, .L387+84
	mov	r2, #88
	ldr	r1, .L387+88
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, r6
	ldr	r1, .L387+100
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	mov	r2, #88
	ldr	r1, .L387+88
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	str	r5, [r4, #568]
	add	r0, r4, #584
	mov	lr, pc
	bx	r7
	add	r0, r4, #1104
	mov	r2, r6
	ldr	r1, .L387+104
	str	r5, [r4, #580]
	add	r0, r0, #8
	mov	lr, pc
	bx	r8
	add	r0, r4, #1136
	str	r6, [r4, #1128]
	str	r6, [r4, #1132]
	str	r5, [r4, #1124]
	mov	r2, #88
	ldr	r1, .L387+88
	add	r0, r0, #4
	mov	lr, pc
	bx	r7
	str	r5, [r4, #1136]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L375:
	mov	r5, #1
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L387+108
	ldr	r3, .L387+76
	str	r5, [ip]
	mov	lr, pc
	bx	r3
	mov	r3, #60
	ldr	r6, .L387+84
	str	r5, [r4, #12]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	add	r0, r4, #28
	mov	r2, #88
	ldr	r1, .L387+88
	mov	lr, pc
	bx	r6
	str	r5, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L388:
	.align	2
.L387:
	.word	battleStatus
	.word	lettersActive
	.word	menu
	.word	selOpt
	.word	waitTimer
	.word	enter
	.word	leave
	.word	topBuf
	.word	botBuf
	.word	turn
	.word	fighterIdx
	.word	captured
	.word	move
	.word	turnPoints
	.word	numOpt
	.word	battleAllies
	.word	fighter
	.word	battleOpponents
	.word	bossBattle
	.word	strncpy
	.word	.LC21
	.word	memcpy
	.word	MOVE_SLASH
	.word	.LC22
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.size	initBattle, .-initBattle
	.align	2
	.global	eraseAllText
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseAllText, %function
eraseAllText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L392
	add	r2, r3, #832
.L390:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L390
	mov	r2, #0
	ldr	r3, .L392+4
	str	r2, [r3]
	bx	lr
.L393:
	.align	2
.L392:
	.word	shadowOAM
	.word	lettersActive
	.size	eraseAllText, .-eraseAllText
	.align	2
	.global	drawText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrb	ip, [r0]	@ zero_extendqisi2
	ldr	r8, [sp, #36]
	cmp	ip, #0
	add	r3, r1, r3
	add	r8, r2, r8
	beq	.L394
	mov	lr, r1
	ldr	r9, .L410
	ldr	r10, .L410+4
	b	.L400
.L409:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L394
.L400:
	cmp	ip, #10
	add	r5, lr, #12
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L397
	cmp	ip, #32
	beq	.L398
	ldr	ip, [r9]
	add	r4, ip, #24
	cmp	r4, #127
	bgt	.L394
	lsl	r6, lr, #23
	lsl	r7, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	and	fp, r2, #255
	strh	fp, [r10, r7]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L410+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L398:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #6
	addge	r2, r2, #8
.L397:
	cmp	r2, r8
	blt	.L409
.L394:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L411:
	.align	2
.L410:
	.word	lettersActive
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawText, .-drawText
	.section	.rodata.str1.4
	.align	2
.LC23:
	.ascii	"%d\000"
	.text
	.align	2
	.global	updateBattle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattle, %function
updateBattle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L568
	ldr	r1, [r4]
	cmp	r1, #0
	sub	sp, sp, #20
	bne	.L558
	bl	checkBattleStatus
	ldr	r3, .L568+4
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L412
	ldr	r3, .L568+8
	ldr	r0, [r3]
	ldr	r5, .L568+12
	ldr	lr, .L568+16
	cmp	r0, #0
	str	r4, [r5]
	str	r4, [lr]
	bne	.L415
	ldr	r2, .L568+20
	ldr	r3, .L568+24
	ldr	r2, [r2]
	ldrh	r3, [r3]
	cmp	r2, #5
	and	r1, r3, #128
	beq	.L559
	sub	ip, r2, #2
	cmp	ip, #2
	bhi	.L421
	cmp	r1, #0
	beq	.L422
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #128
	bne	.L422
	ldr	r1, .L568+32
	ldr	r4, .L568+36
	ldr	ip, [r1]
	ldr	r1, [r4]
	cmp	ip, #1
	add	ip, r1, #1
	beq	.L560
	cmp	ip, #3
	bgt	.L424
	mov	r7, #556
	ldr	r6, .L568+40
	mla	r1, r7, r1, r6
.L428:
	ldr	r6, [r1, #568]
	cmp	r6, #0
	beq	.L427
	ldr	r6, [r1, #576]
	cmp	r6, #0
	bgt	.L557
.L427:
	add	ip, ip, #1
	cmp	ip, #4
	add	r1, r1, #556
	bne	.L428
.L424:
	cmp	r2, #3
	beq	.L561
.L419:
	tst	r3, #1
	beq	.L442
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #1
	moveq	r1, #1
	streq	r1, [r5]
.L442:
	tst	r3, #2
	beq	.L443
	ldr	r3, .L568+28
	ldrh	r3, [r3]
	tst	r3, #2
	moveq	r3, #1
	streq	r3, [lr]
.L443:
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L444
.L446:
	.word	.L451
	.word	.L450
	.word	.L449
	.word	.L448
	.word	.L447
	.word	.L445
.L558:
	ldr	r3, .L568+44
	ldr	r0, .L568+48
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
.L412:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L559:
	cmp	r1, #0
	beq	.L417
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #128
	bne	.L417
	ldr	r1, .L568+52
	ldr	ip, .L568+36
	ldr	r0, [r1]
	ldr	r1, [ip]
	sub	r0, r0, #1
	cmp	r0, r1
	addgt	r1, r1, #1
	strgt	r1, [ip]
	b	.L419
.L417:
	tst	r3, #64
	beq	.L419
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L419
	ldr	r0, .L568+36
	ldr	r1, [r0]
	cmp	r1, #0
	subne	r1, r1, #1
	strne	r1, [r0]
	b	.L419
.L422:
	tst	r3, #64
	beq	.L424
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L424
	ldr	r1, .L568+32
	ldr	r4, .L568+36
	ldr	ip, [r1]
	ldr	r1, [r4]
	cmp	ip, #1
	sub	ip, r1, #1
	beq	.L562
	cmp	ip, #0
	blt	.L424
	mov	r7, #556
	ldr	r6, .L568+40
	mla	r1, r7, r1, r6
.L433:
	ldr	r6, [r1, #-544]
	cmp	r6, #0
	beq	.L432
	ldr	r6, [r1, #-536]
	cmp	r6, #0
	bgt	.L557
.L432:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r1, r1, #556
	bne	.L433
	b	.L424
.L445:
	bl	replaceMenu
.L444:
	mov	r1, #512
	ldr	r3, .L568+56
	add	r2, r3, #832
.L465:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r2, r3
	bne	.L465
	mov	ip, #0
	mov	r4, #24
	ldr	r0, .L568+60
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L568+64
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L568+68
	bl	drawText
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawCombatants
.L415:
	ldr	r6, .L568+72
	mov	lr, pc
	bx	r6
	ldr	r2, .L568+76
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	cmp	r0, #6
	beq	.L563
	ldr	r8, .L568+80
	mov	lr, pc
	bx	r6
	ldr	r7, [r8]
	ldr	r9, .L568+84
	ldr	r1, [r7, #24]
	mov	lr, pc
	bx	r9
	add	r3, r1, r1, lsl #2
	add	r3, r1, r3, lsl #1
	add	r7, r7, r3, lsl #3
	ldr	r7, [r7, #108]
	cmp	r7, #0
	mov	r5, r1
	lsl	r10, r1, #2
	bne	.L453
	ldr	r4, .L568+40
	mov	r1, r7
	mov	fp, r4
	mov	r3, r4
	ldr	r2, .L568+32
	str	r7, [r2]
	add	r0, r4, #2224
.L455:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L454
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L454:
	add	r3, r3, #556
	cmp	r0, r3
	bne	.L455
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L458:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L456
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ble	.L456
	cmp	r2, #0
	beq	.L564
	sub	r2, r2, #1
.L456:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #556
	bne	.L458
	b	.L444
.L421:
	cmp	r1, #0
	beq	.L439
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #128
	bne	.L439
	ldr	r1, .L568+52
	ldr	ip, .L568+36
	ldr	r0, [r1]
	ldr	r1, [ip]
	sub	r0, r0, #1
	cmp	r0, r1
	ble	.L440
	cmp	r1, #2
	cmpne	r1, #5
	addne	r1, r1, #1
	strne	r1, [ip]
.L440:
	tst	r3, #16
	beq	.L441
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #16
	bne	.L441
	ldr	r1, .L568+52
	ldr	ip, .L568+36
	ldr	r0, [r1]
	ldr	r1, [ip]
	sub	r0, r0, #3
	cmp	r0, r1
	movgt	r0, #1
	movle	r0, #0
	cmp	r1, #2
	movgt	r0, #0
	cmp	r0, #0
	addne	r1, r1, #3
	strne	r1, [ip]
	b	.L419
.L439:
	tst	r3, #64
	beq	.L440
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L440
	ldr	r0, .L568+36
	ldr	r1, [r0]
	cmp	r1, #0
	cmpne	r1, #3
	subne	r1, r1, #1
	strne	r1, [r0]
	b	.L440
.L441:
	tst	r3, #32
	beq	.L419
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #32
	bne	.L419
	ldr	r0, .L568+36
	ldr	r1, [r0]
	cmp	r1, #2
	subgt	r1, r1, #3
	strgt	r1, [r0]
	b	.L419
.L453:
	ldr	fp, .L568+88
	mov	r0, #1
	mov	r1, r4
	mov	r7, fp
	mov	r3, fp
	ldr	r2, .L568+32
	str	r0, [r2]
	add	r0, fp, #2224
.L460:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L459
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L459:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L460
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L463:
	ldr	r3, [fp, #12]
	cmp	r3, #0
	beq	.L461
	ldr	r3, [fp, #20]
	cmp	r3, #0
	ble	.L461
	cmp	r2, #0
	beq	.L565
	sub	r2, r2, #1
.L461:
	add	r4, r4, #1
	cmp	r4, #4
	add	fp, fp, #556
	bne	.L463
	b	.L444
.L449:
	bl	targetMenu
	b	.L444
.L450:
	bl	attackMenu
	b	.L444
.L451:
	bl	frontMenu
	b	.L444
.L447:
	bl	captureMenu
	b	.L444
.L448:
	bl	inspectMenu
	b	.L444
.L561:
	tst	r3, #16
	beq	.L434
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	tst	r1, #16
	bne	.L434
	ldr	ip, .L568+32
	ldr	r1, [ip]
	cmp	r1, #0
	bne	.L434
	mov	r0, #1
	str	r0, [ip]
	ldr	r0, .L568+88
.L436:
	ldr	ip, [r0, #12]
	cmp	ip, #0
	beq	.L435
	ldr	ip, [r0, #20]
	cmp	ip, #0
	bgt	.L566
.L435:
	add	r1, r1, #1
	cmp	r1, #4
	add	r0, r0, #556
	bne	.L436
	b	.L419
.L563:
	ldr	r3, .L568+80
	ldr	r1, .L568+92
	ldr	r2, [r3]
	ldr	r0, .L568+64
	ldr	r3, .L568+96
	mov	lr, pc
	bx	r3
	bl	finishTurn
	b	.L444
.L434:
	tst	r3, #32
	beq	.L419
	ldr	r1, .L568+28
	ldrh	r1, [r1]
	ands	r1, r1, #32
	bne	.L419
	ldr	ip, .L568+32
	ldr	r4, [ip]
	cmp	r4, #1
	bne	.L419
	str	r1, [ip]
	ldr	r1, .L568+40
.L438:
	ldr	ip, [r1, #12]
	cmp	ip, #0
	beq	.L437
	ldr	ip, [r1, #20]
	cmp	ip, #0
	bgt	.L567
.L437:
	add	r0, r0, #1
	cmp	r0, #4
	add	r1, r1, #556
	bne	.L438
	b	.L419
.L557:
	str	ip, [r4]
	b	.L424
.L560:
	cmp	ip, #3
	bgt	.L424
	mov	r7, #556
	ldr	r6, .L568+88
	mla	r1, r7, r1, r6
.L426:
	ldr	r6, [r1, #568]
	cmp	r6, #0
	beq	.L425
	ldr	r6, [r1, #576]
	cmp	r6, #0
	bgt	.L557
.L425:
	add	ip, ip, #1
	cmp	ip, #4
	add	r1, r1, #556
	bne	.L426
	b	.L424
.L564:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r7, r1, fp
	add	r0, r0, r3
	bl	executeMove
	b	.L444
.L565:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r4, r1, r7
	add	r0, r0, r3
	bl	executeMove
	b	.L444
.L562:
	cmp	ip, #0
	blt	.L424
	mov	r7, #556
	ldr	r6, .L568+88
	mla	r1, r7, r1, r6
.L431:
	ldr	r6, [r1, #-544]
	cmp	r6, #0
	beq	.L430
	ldr	r6, [r1, #-536]
	cmp	r6, #0
	bgt	.L557
.L430:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r1, r1, #556
	bne	.L431
	b	.L424
.L567:
	ldr	r1, .L568+36
	str	r0, [r1]
	b	.L419
.L566:
	ldr	r0, .L568+36
	str	r1, [r0]
	b	.L419
.L569:
	.align	2
.L568:
	.word	waitTimer
	.word	battleStatus
	.word	turn
	.word	enter
	.word	leave
	.word	menu
	.word	oldButtons
	.word	buttons
	.word	targetTeam
	.word	selOpt
	.word	battleAllies
	.word	mgba_printf
	.word	.LC23
	.word	numOpt
	.word	shadowOAM
	.word	lettersActive
	.word	topBuf
	.word	botBuf
	.word	rand
	.word	-1840700269
	.word	fighter
	.word	__aeabi_idivmod
	.word	battleOpponents
	.word	.LC16
	.word	sprintf
	.size	updateBattle, .-updateBattle
	.align	2
	.global	setTopText
	.syntax unified
	.arm
	.fpu softvfp
	.type	setTopText, %function
setTopText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #24
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	str	r2, [sp]
	mov	r3, #121
	mov	r2, #11
	mov	r1, #59
	bl	drawText
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.size	setTopText, .-setTopText
	.align	2
	.global	setBottomText
	.syntax unified
	.arm
	.fpu softvfp
	.type	setBottomText, %function
setBottomText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #24
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	str	r2, [sp]
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	bl	drawText
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.size	setBottomText, .-setBottomText
	.comm	bossBattle,4,4
	.comm	botBuf,63,4
	.comm	topBuf,63,4
	.comm	leave,4,4
	.comm	enter,4,4
	.comm	waitTimer,4,4
	.comm	numOpt,4,4
	.comm	selOpt,4,4
	.comm	menu,4,4
	.comm	captured,4,4
	.comm	turnPoints,4,4
	.comm	move,4,4
	.comm	fighterIdx,4,4
	.comm	fighter,4,4
	.comm	targetTeam,4,4
	.comm	turn,4,4
	.comm	battleStatus,4,4
	.comm	lettersActive,4,4
	.global	text_tile_lkup
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	text_tile_lkup, %object
	.size	text_tile_lkup, 256
text_tile_lkup:
	.word	536
	.word	537
	.word	538
	.word	539
	.word	540
	.word	541
	.word	542
	.word	543
	.word	568
	.word	569
	.word	570
	.word	571
	.word	572
	.word	573
	.word	574
	.word	575
	.word	600
	.word	601
	.word	602
	.word	603
	.word	604
	.word	605
	.word	606
	.word	607
	.word	632
	.word	633
	.word	634
	.word	635
	.word	636
	.word	637
	.word	638
	.word	639
	.word	664
	.word	665
	.word	666
	.word	667
	.word	668
	.word	669
	.word	670
	.word	671
	.word	696
	.word	697
	.word	698
	.word	699
	.word	700
	.word	701
	.word	702
	.word	703
	.word	728
	.word	729
	.word	730
	.word	731
	.word	732
	.word	733
	.word	734
	.word	735
	.word	760
	.word	761
	.word	762
	.word	763
	.word	764
	.word	765
	.word	766
	.word	767
	.ident	"GCC: (devkitARM release 53) 9.1.0"
