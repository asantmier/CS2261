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
	mov	r1, #3
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
	ldr	r1, .L49
	ldr	r3, .L49+4
	ldr	r0, .L49+8
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	mov	r3, #556
	ldr	r4, .L49+12
	ldr	r2, [r4]
	ldr	r1, .L49+16
	add	ip, r2, r2, lsl #2
	ldr	r1, [r1]
	lsl	ip, ip, #3
	add	ip, ip, #15
	and	ip, ip, #255
	cmp	r1, #1
	mul	r2, r3, r2
	orr	ip, ip, #32768
	beq	.L48
	mov	r0, #832
	ldr	r3, .L49+20
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L49+24
	str	r3, [sp]
	ldr	lr, .L49+28
	ldr	r3, [r2, #20]
	ldr	r1, .L49+32
	strh	r0, [r5, #132]	@ movhi
	ldr	r6, .L49+36
	ldr	r0, .L49+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #130]	@ movhi
	mov	lr, pc
	bx	r6
.L42:
	ldr	r3, .L49+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L40
	mov	r2, #512
	mov	r3, #0
	mov	r1, #3
	strh	r2, [r5, #128]	@ movhi
	ldr	r0, .L49+48
	ldr	r2, .L49+52
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
.L40:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	mov	r0, #192
	mov	lr, #832
	ldr	r3, .L49+56
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L49+24
	str	r3, [sp]
	ldr	r1, .L49+32
	ldr	r3, [r2, #20]
	ldr	r6, .L49+36
	strh	r0, [r5, #130]	@ movhi
	ldr	r0, .L49+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #132]	@ movhi
	mov	lr, pc
	bx	r6
	b	.L42
.L50:
	.align	2
.L49:
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
	ldr	r4, .L70
	ldr	r1, .L70+4
	ldr	r3, .L70+8
	mov	r2, #61
	ldr	r0, .L70+12
	ldr	r5, .L70+16
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
	beq	.L58
	cmp	r0, #3
	moveq	r6, #42
	moveq	r2, #32
	addeq	ip, r1, #204
	bne	.L67
.L53:
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
.L55:
	add	r1, r1, #468
	stm	sp, {r6, r8, lr}
	str	r1, [sp, #36]
	str	r0, [sp, #32]
	str	r7, [sp, #28]
	str	ip, [sp, #24]
	str	r9, [sp, #20]
	str	fp, [sp, #16]
	str	r10, [sp, #12]
	ldr	r1, .L70+20
	ldr	r0, .L70+24
	ldr	r6, .L70+28
	mov	lr, pc
	bx	r6
	ldr	r3, .L70+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L56
	mov	r3, #0
	mov	r1, #3
	ldr	r0, .L70+36
	ldr	r2, .L70+40
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
.L51:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	cmp	r0, #1
	bne	.L68
	mov	r0, #32
	mov	lr, #42
	mov	ip, r0
	mov	fp, r0
	mov	r6, r0
	mov	r2, r0
	add	r7, r1, #204
	b	.L55
.L58:
	mov	r2, #42
	add	ip, r1, #204
.L52:
	mov	r6, #32
	b	.L53
.L56:
	ldr	r3, .L70+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [r4]
	add	r1, r3, r3, lsl #2
	ldr	r2, [r5]
	add	r3, r3, r1, lsl #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldr	r1, [r1, #108]
	rsbs	r1, r1, #1
	movcc	r1, #0
	ldr	ip, .L70+48
	ldr	r0, .L70+52
	add	r3, r3, #28
	add	r3, r2, r3
	str	r1, [ip]
	str	r3, [r0]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToTargetMenu
.L68:
	add	ip, r1, #204
	cmp	r0, #4
	mov	r7, ip
	bne	.L69
	mov	r0, #32
	mov	fp, #42
	mov	ip, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L55
.L69:
	cmp	r0, #2
	movne	r2, #32
	bne	.L52
	mov	r0, #32
	mov	ip, #42
	mov	fp, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L55
.L71:
	.align	2
.L70:
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
	mov	ip, #3
	ldr	r2, .L126
	push	{r4, r5, r6, lr}
	ldr	r1, .L126+4
	ldr	lr, .L126+8
	str	r3, [r2]
	ldr	r0, .L126+12
	ldr	r2, .L126+16
	str	r3, [lr]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	ldr	r0, .L126+20
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	bne	.L73
	ldr	ip, .L126+24
	ldr	r1, [ip]
	cmp	r1, #0
	bne	.L74
	ldr	r2, .L126+28
	mov	r4, #1
	mov	r5, r1
	mov	lr, r2
	mov	r3, r2
	mov	r6, r1
	str	r4, [ip]
	add	r4, r2, #2224
.L76:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	beq	.L75
	ldr	ip, [r3, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L75:
	add	r3, r3, #556
	cmp	r4, r3
	bne	.L76
	cmp	r6, #0
	strne	r5, [r0]
.L80:
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [r2, #20]
	cmp	r3, #0
	bgt	.L124
.L78:
	add	r1, r1, #1
	cmp	r1, #4
	add	r2, r2, #556
	bne	.L80
.L79:
	mov	r2, #100
	ldr	r3, .L126+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L73:
	ldr	r3, .L126+24
	ldr	r3, [r3]
	ldr	ip, .L126+36
	cmp	r3, #0
	mov	r5, #556
	ldr	r2, [ip]
	bne	.L87
	ldr	lr, .L126+40
	add	r3, r2, #1
	add	r2, r2, #5
.L89:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L88
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L123
.L88:
	cmp	r3, r2
	bne	.L89
	b	.L79
.L87:
	ldr	lr, .L126+28
	add	r3, r2, #1
	add	r2, r2, #5
.L91:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L90
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L123
.L90:
	cmp	r3, r2
	bne	.L91
	b	.L79
.L74:
	ldr	r1, .L126+40
	mov	r5, r3
	mov	lr, r1
	mov	r2, r1
	mov	r6, r3
	str	r3, [ip]
	add	r4, r1, #2224
.L82:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L81
	ldr	ip, [r2, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L81:
	add	r2, r2, #556
	cmp	r2, r4
	bne	.L82
	cmp	r6, #0
	strne	r5, [r0]
.L85:
	ldr	r2, [r1, #12]
	cmp	r2, #0
	beq	.L84
	ldr	r2, [r1, #20]
	cmp	r2, #0
	bgt	.L125
.L84:
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #556
	bne	.L85
	b	.L79
.L123:
	ldr	r3, .L126+44
	str	r1, [ip]
	str	r0, [r3]
	b	.L79
.L125:
	mov	r2, #556
	mla	lr, r2, r3, lr
	ldr	r1, .L126+44
	ldr	r2, .L126+36
	str	lr, [r1]
	str	r3, [r2]
	b	.L79
.L124:
	mov	r3, #556
	mla	lr, r3, r1, lr
	ldr	r2, .L126+44
	ldr	r3, .L126+36
	str	lr, [r2]
	str	r1, [r3]
	b	.L79
.L127:
	.align	2
.L126:
	.word	menu
	.word	numOpt
	.word	selOpt
	.word	.LC4
	.word	mgba_printf
	.word	turnPoints
	.word	turn
	.word	battleOpponents
	.word	waitTimer
	.word	fighterIdx
	.word	battleAllies
	.word	fighter
	.size	finishTurn, .-finishTurn
	.section	.rodata.str1.4
	.align	2
.LC5:
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
	ldr	r6, .L145
	ldr	r1, .L145+4
	mov	r3, r5
	ldr	r2, [r6]
	ldr	r1, [r1]
	ldr	r0, .L145+8
	ldr	r7, .L145+12
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L129
	ldr	r3, .L145+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L144
	ldr	r2, .L145+20
	add	r0, r2, #2224
.L139:
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L137
	ldr	r1, [r4, #72]
	ldr	r3, [r2, #20]
	ldr	ip, [r4, #84]
	sub	r3, r3, r1
	ldr	r1, [r2, #16]
	add	r3, r3, ip
	cmp	r1, r3
	movlt	r3, r1
	str	r3, [r2, #20]
.L137:
	add	r2, r2, #556
	cmp	r2, r0
	bne	.L139
.L135:
	mov	r3, r5
	ldr	r2, [r6]
	add	r1, r4, #10
	ldr	r0, .L145+24
	ldr	r4, .L145+28
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L145+32
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishTurn
.L129:
	ldr	r2, [r4, #72]
	ldr	r3, [r5, #20]
	ldr	r1, [r4, #84]
	sub	r3, r3, r2
	ldr	r2, [r5, #16]
	add	r3, r3, r1
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [r5, #20]
	b	.L135
.L144:
	ldr	r3, .L145+36
	add	r0, r3, #2224
.L134:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L132
	ldr	r1, [r4, #72]
	ldr	r2, [r3, #20]
	ldr	ip, [r4, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L132:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L134
	b	.L135
.L146:
	.align	2
.L145:
	.word	fighter
	.word	turn
	.word	.LC5
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
.LC6:
	.ascii	"CHOOSE A TARGET.\000"
	.align	2
.LC7:
	.ascii	"%s WILL AFFECT\012ALL ENEMIES\000"
	.align	2
.LC8:
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
	ldr	r6, .L165
	mov	r2, #61
	ldr	r3, .L165+4
	ldr	r1, .L165+8
	ldr	r0, .L165+12
	ldr	r5, .L165+16
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
	ldr	r2, [r5]
	cmp	r3, #1
	ldr	r3, [r2, #76]
	beq	.L162
	cmp	r3, #0
	bne	.L163
	ldr	r3, .L165+20
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	mov	r1, #556
	mvn	r0, r0, lsr #17
	mov	ip, #832
	ldr	r3, .L165+24
	mla	r2, r1, r2, r3
	ldr	r4, .L165+28
	ldr	r3, [r2, #16]
	ldr	lr, .L165+32
.L160:
	str	r3, [sp]
	ldr	r1, .L165+36
	ldr	r3, [r2, #20]
	ldr	r7, .L165+40
	strh	r0, [r4, #128]	@ movhi
	ldr	r0, .L165+44
	strh	lr, [r4, #130]	@ movhi
	strh	ip, [r4, #132]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	r3, .L165+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L152
.L164:
	mov	r3, #512
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L165+52
	ldr	r0, [r2]
	ldr	r2, .L165+56
	ldr	r0, [r0, #24]
	strh	r3, [r4, #128]	@ movhi
	str	r0, [r2]
	ldr	r0, .L165+60
	ldr	r2, .L165+20
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	str	ip, [r0]
	str	r1, [r2]
.L147:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L163:
	mov	r1, #4288
	mov	r3, #832
	ldr	r4, .L165+28
	ldr	lr, .L165+64
	ldr	ip, .L165+68
	strh	r1, [r4, #130]	@ movhi
	strh	r1, [r4, #138]	@ movhi
	strh	r1, [r4, #146]	@ movhi
	strh	r1, [r4, #154]	@ movhi
	ldr	r0, .L165+72
	strh	lr, [r4, #136]	@ movhi
	ldr	r1, .L165+76
	strh	ip, [r4, #128]	@ movhi
	add	ip, ip, #120
.L159:
	strh	r0, [r4, #144]	@ movhi
	ldr	r7, .L165+40
	ldr	r0, .L165+44
	strh	r3, [r4, #132]	@ movhi
	strh	r3, [r4, #140]	@ movhi
	strh	r3, [r4, #148]	@ movhi
	strh	r3, [r4, #156]	@ movhi
	strh	ip, [r4, #152]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	r3, .L165+48
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L164
.L152:
	ldr	r3, .L165+80
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L147
	mov	r1, #556
	mov	r3, #512
	ldr	r2, .L165+20
	ldr	r2, [r2]
	mul	r2, r1, r2
	ldr	r0, [r6]
	cmp	r0, #1
	ldreq	r1, .L165+84
	ldrne	r1, .L165+24
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
.L162:
	cmp	r3, #0
	beq	.L149
	mov	r1, #192
	ldr	r4, .L165+28
	ldr	ip, .L165+68
	ldr	lr, .L165+64
	strh	r1, [r4, #130]	@ movhi
	strh	r1, [r4, #138]	@ movhi
	strh	r1, [r4, #146]	@ movhi
	strh	r1, [r4, #154]	@ movhi
	strh	ip, [r4, #128]	@ movhi
	mov	r3, #832
	ldr	r0, .L165+72
	strh	lr, [r4, #136]	@ movhi
	ldr	r1, .L165+88
	add	ip, ip, #120
	b	.L159
.L149:
	mov	r1, #556
	ldr	r3, .L165+20
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	ldr	r3, .L165+84
	mla	r2, r1, r2, r3
	mvn	r0, r0, lsr #17
	mov	lr, #192
	mov	ip, #832
	ldr	r3, [r2, #16]
	ldr	r4, .L165+28
	b	.L160
.L166:
	.align	2
.L165:
	.word	targetTeam
	.word	strncpy
	.word	.LC6
	.word	topBuf
	.word	move
	.word	selOpt
	.word	battleAllies
	.word	shadowOAM
	.word	4136
	.word	.LC1
	.word	sprintf
	.word	botBuf
	.word	leave
	.word	fighter
	.word	numOpt
	.word	menu
	.word	-32713
	.word	-32753
	.word	-32673
	.word	.LC8
	.word	enter
	.word	battleOpponents
	.word	.LC7
	.size	targetMenu, .-targetMenu
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"WHAT WILL YOU DO?\000"
	.align	2
.LC10:
	.ascii	"%cATTACK\012%cPASS\012%cINSPECT\000"
	.align	2
.LC11:
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L189
	ldr	r3, .L189+4
	mov	r2, #61
	ldr	r1, .L189+8
	ldr	r0, .L189+12
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L175
	cmp	r3, #1
	moveq	r1, #32
	moveq	r3, #42
	moveq	r2, r1
	bne	.L186
.L168:
	ldr	r5, .L189+16
	str	r1, [sp]
	mov	r0, r5
	ldr	r1, .L189+20
	ldr	r6, .L189+24
	mov	lr, pc
	bx	r6
	ldr	r3, .L189+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L167
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L170
	cmp	r3, #2
	beq	.L171
	cmp	r3, #0
	beq	.L187
.L167:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L175:
	mov	r1, #32
	mov	r2, #42
	mov	r3, r1
	b	.L168
.L186:
	cmp	r3, #2
	movne	r1, #32
	movne	r3, r1
	movne	r2, r1
	moveq	r3, #32
	moveq	r1, #42
	moveq	r2, r3
	b	.L168
.L187:
	mov	r2, #1
	ldr	r3, .L189+32
	ldr	r3, [r3]
	ldr	r1, .L189+36
	ldr	r0, [r3, #24]
	ldr	r3, .L189+40
	str	r0, [r1]
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L170:
	ldr	r3, .L189+32
	ldr	r1, .L189+44
	ldr	r2, [r3]
	ldr	r0, .L189+12
	mov	lr, pc
	bx	r6
	mov	r3, #0
	strb	r3, [r5]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	finishTurn
.L171:
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L189+36
	ldr	r0, .L189+40
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L189+48
.L174:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L172
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L188
.L172:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L174
.L173:
	mov	r2, #1
	ldr	r3, .L189+52
	str	r2, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L188:
	str	r2, [r4]
	b	.L173
.L190:
	.align	2
.L189:
	.word	selOpt
	.word	strncpy
	.word	.LC9
	.word	topBuf
	.word	botBuf
	.word	.LC10
	.word	sprintf
	.word	enter
	.word	fighter
	.word	numOpt
	.word	menu
	.word	.LC11
	.word	battleOpponents
	.word	targetTeam
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
	ldr	r3, .L201
	add	r1, r3, #2224
.L193:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	add	r3, r3, #556
	bgt	.L192
	cmp	r3, r1
	bne	.L193
	mov	r2, #1
	ldr	r3, .L201+4
	str	r2, [r3]
.L192:
	ldr	r3, .L201+8
	add	r1, r3, #2224
.L196:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	add	r3, r3, #556
	bxgt	lr
	cmp	r1, r3
	bne	.L196
	mvn	r2, #0
	ldr	r3, .L201+4
	str	r2, [r3]
	bx	lr
.L202:
	.align	2
.L201:
	.word	battleOpponents
	.word	battleStatus
	.word	battleAllies
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
	ldr	r3, .L204
	str	r2, [r3, #12]
	str	r2, [r3, #568]
	str	r2, [r3, #1124]
	str	r2, [r3, #1680]
	bx	lr
.L205:
	.align	2
.L204:
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
	ldr	r5, .L211
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
	ldr	r5, .L211+4
	strh	ip, [r4, #2]	@ movhi
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L212:
	.align	2
.L211:
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
	ldr	r2, .L266
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L266+4
	subs	r1, r2, #1
	strh	r3, [r4, #160]	@ movhi
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	bmi	.L214
	mov	lr, #41
	mov	ip, #8
	rsb	r2, r2, r2, lsl #29
	ldr	r0, .L266+8
	add	r2, r4, r2, lsl #3
.L215:
	add	r3, r1, r1, lsl #3
	add	r3, r3, #57
	sub	r1, r1, #1
	and	r3, r3, r0
	cmn	r1, #1
	strh	lr, [r2, #192]	@ movhi
	strh	ip, [r2, #196]	@ movhi
	strh	r3, [r2, #194]	@ movhi
	add	r2, r2, #8
	bne	.L215
.L214:
	ldr	r5, .L266+12
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L216
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L258
.L216:
	mov	r3, #512
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #64]	@ movhi
.L217:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L218
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L259
.L218:
	mov	r3, #512
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #72]	@ movhi
.L219:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L220
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L260
.L220:
	mov	r3, #512
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #80]	@ movhi
.L221:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L222
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L261
.L222:
	mov	r3, #512
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #88]	@ movhi
.L223:
	ldr	r5, .L266+16
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L224
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L262
.L224:
	mov	r3, #512
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #96]	@ movhi
.L225:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L226
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L263
.L226:
	mov	r3, #512
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #104]	@ movhi
.L227:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L228
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L264
.L228:
	mov	r3, #512
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #112]	@ movhi
.L229:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L230
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L265
.L230:
	mov	r3, #512
	strh	r3, [r4, #56]	@ movhi
	strh	r3, [r4, #120]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L265:
	mov	ip, #16
	ldr	r2, [r5, #1684]
	ldr	lr, .L266+20
	strh	ip, [r4, #60]	@ movhi
	ldr	r3, .L266+24
	ldr	r0, .L266+28
	ldr	ip, .L266+32
	strh	r3, [r4, #56]	@ movhi
	strh	r0, [r4, #58]	@ movhi
	strh	lr, [r4, #120]	@ movhi
	ldr	r5, .L266+36
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
.L264:
	mov	r3, #16
	ldr	r2, .L266+40
	ldr	r0, .L266+28
	ldr	lr, .L266+44
	ldr	ip, .L266+32
	strh	r3, [r4, #52]	@ movhi
	strh	r2, [r4, #48]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L266+36
	strh	r0, [r4, #50]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #112]	@ movhi
	strh	ip, [r4, #114]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #116]	@ movhi
	b	.L229
.L263:
	mov	r3, #16
	ldr	r2, .L266+48
	ldr	r0, .L266+28
	ldr	lr, .L266+52
	ldr	ip, .L266+32
	strh	r3, [r4, #44]	@ movhi
	strh	r2, [r4, #40]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L266+36
	strh	r0, [r4, #42]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #104]	@ movhi
	strh	ip, [r4, #106]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #108]	@ movhi
	b	.L227
.L262:
	mov	r3, #16
	ldr	r2, .L266+56
	ldr	r0, .L266+28
	ldr	lr, .L266+60
	ldr	ip, .L266+32
	strh	r3, [r4, #36]	@ movhi
	strh	r2, [r4, #32]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L266+36
	strh	r0, [r4, #34]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #96]	@ movhi
	strh	ip, [r4, #98]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #100]	@ movhi
	b	.L225
.L261:
	mov	r0, #0
	ldr	ip, .L266+24
	ldr	r3, .L266+64
	ldr	lr, .L266+20
	ldr	r2, [r5, #1684]
	strh	ip, [r4, #24]	@ movhi
	sub	ip, ip, #127
	strh	r3, [r4, #26]	@ movhi
	strh	r0, [r4, #28]	@ movhi
	mov	r3, #4
	strh	lr, [r4, #88]	@ movhi
	ldr	r5, .L266+36
	strh	ip, [r4, #90]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #92]	@ movhi
	b	.L223
.L260:
	mov	r0, #0
	ldr	r3, .L266+40
	ldr	r2, .L266+64
	ldr	lr, .L266+44
	ldr	ip, .L266+68
	strh	r3, [r4, #16]	@ movhi
	strh	r2, [r4, #18]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L266+36
	strh	r0, [r4, #20]	@ movhi
	strh	lr, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #84]	@ movhi
	b	.L221
.L259:
	mov	r0, #0
	ldr	r3, .L266+48
	ldr	r2, .L266+64
	ldr	lr, .L266+52
	ldr	ip, .L266+68
	strh	r3, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L266+36
	strh	r0, [r4, #12]	@ movhi
	strh	lr, [r4, #72]	@ movhi
	strh	ip, [r4, #74]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #76]	@ movhi
	b	.L219
.L258:
	mov	r0, #0
	ldr	r3, .L266+56
	ldr	r2, .L266+64
	ldr	lr, .L266+60
	ldr	ip, .L266+68
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L266+36
	strh	r0, [r4, #4]	@ movhi
	strh	lr, [r4, #64]	@ movhi
	strh	ip, [r4, #66]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #68]	@ movhi
	b	.L217
.L267:
	.align	2
.L266:
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
.LC12:
	.ascii	"SHARK1\000"
	.align	2
.LC13:
	.ascii	"SHARK2\000"
	.align	2
.LC14:
	.ascii	"SHARK3\000"
	.align	2
.LC15:
	.ascii	"FISH1\000"
	.align	2
.LC16:
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
	mov	r4, #3
	ldr	lr, .L283
	ldr	r6, .L283+4
	str	r2, [lr]
	ldr	lr, .L283+8
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L283+12
	ldr	lr, .L283+16
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L283+20
	ldr	lr, .L283+24
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L283+28
	ldr	lr, .L283+32
	strb	r2, [r6]
	strb	r2, [lr]
	ldr	r6, .L283+36
	ldr	lr, .L283+40
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L283+44
	ldr	lr, .L283+48
	str	r2, [r6]
	mov	ip, r2
	mov	r5, r0
	str	r2, [lr]
	mov	r0, r2
	ldr	r2, .L283+52
	ldr	r1, .L283+56
	ldr	r6, .L283+60
	str	r4, [r2]
	mov	r3, r1
	str	r1, [r6]
	add	r1, r1, #2224
.L270:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L269
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	ip, #1
	addgt	r0, r0, ip
.L269:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L270
	mov	r3, #0
	ldr	r4, .L283+64
	cmp	ip, #0
	strne	r0, [lr]
	cmp	r5, #1
	str	r3, [r4, #12]
	str	r3, [r4, #568]
	str	r3, [r4, #1124]
	str	r3, [r4, #1680]
	beq	.L282
	mov	r5, #1
	mov	r6, #6
	ldr	r8, .L283+68
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L283+72
	mov	lr, pc
	bx	r8
	ldr	r7, .L283+76
	mov	r2, #88
	ldr	r1, .L283+80
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, #10
	ldr	r1, .L283+84
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	str	r5, [r4, #568]
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	add	r0, r4, #584
	mov	r2, #88
	ldr	r1, .L283+80
	mov	lr, pc
	bx	r7
	str	r5, [r4, #580]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L282:
	mov	r6, #6
	ldr	r8, .L283+68
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L283+88
	mov	lr, pc
	bx	r8
	ldr	r7, .L283+76
	mov	r2, #88
	ldr	r1, .L283+80
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, #10
	ldr	r1, .L283+92
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	mov	r2, #88
	ldr	r1, .L283+80
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	str	r5, [r4, #568]
	add	r0, r4, #584
	mov	lr, pc
	bx	r7
	add	r0, r4, #1104
	mov	r2, #10
	ldr	r1, .L283+96
	str	r5, [r4, #580]
	add	r0, r0, #8
	mov	lr, pc
	bx	r8
	add	r0, r4, #1136
	str	r6, [r4, #1128]
	str	r6, [r4, #1132]
	str	r5, [r4, #1124]
	mov	r2, #88
	ldr	r1, .L283+80
	add	r0, r0, #4
	mov	lr, pc
	bx	r7
	str	r5, [r4, #1136]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L284:
	.align	2
.L283:
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
	.word	move
	.word	turnPoints
	.word	numOpt
	.word	battleAllies
	.word	fighter
	.word	battleOpponents
	.word	strncpy
	.word	.LC15
	.word	memcpy
	.word	MOVE_SLASH
	.word	.LC16
	.word	.LC12
	.word	.LC13
	.word	.LC14
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
	ldr	r3, .L288
	add	r2, r3, #832
.L286:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L286
	mov	r2, #0
	ldr	r3, .L288+4
	str	r2, [r3]
	bx	lr
.L289:
	.align	2
.L288:
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
	beq	.L290
	mov	lr, r1
	ldr	r9, .L306
	ldr	r10, .L306+4
	b	.L296
.L305:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L290
.L296:
	cmp	ip, #10
	add	r5, lr, #12
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L293
	cmp	ip, #32
	beq	.L294
	ldr	ip, [r9]
	add	r4, ip, #24
	cmp	r4, #127
	bgt	.L290
	lsl	r6, lr, #23
	lsl	r7, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	and	fp, r2, #255
	strh	fp, [r10, r7]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L306+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L294:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #6
	addge	r2, r2, #8
.L293:
	cmp	r2, r8
	blt	.L305
.L290:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L307:
	.align	2
.L306:
	.word	lettersActive
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawText, .-drawText
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"%d\000"
	.global	__aeabi_idivmod
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
	ldr	r4, .L450
	ldr	r1, [r4]
	cmp	r1, #0
	sub	sp, sp, #20
	bne	.L439
	bl	checkBattleStatus
	ldr	r3, .L450+4
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L308
	ldr	r3, .L450+8
	ldr	ip, [r3]
	ldr	r5, .L450+12
	ldr	lr, .L450+16
	cmp	ip, #0
	str	r4, [r5]
	str	r4, [lr]
	bne	.L311
	ldr	r2, .L450+20
	ldr	r3, .L450+24
	ldr	r1, [r2]
	ldrh	r3, [r3]
	sub	r2, r1, #2
	cmp	r2, #1
	and	r2, r3, #128
	bls	.L440
	cmp	r2, #0
	beq	.L331
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L331
	ldr	r2, .L450+32
	ldr	ip, .L450+36
	ldr	r0, [r2]
	ldr	r2, [ip]
	sub	r0, r0, #1
	cmp	r0, r2
	ble	.L332
	cmp	r2, #2
	cmpne	r2, #5
	addne	r2, r2, #1
	strne	r2, [ip]
.L332:
	tst	r3, #16
	beq	.L333
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L441
.L333:
	tst	r3, #32
	beq	.L325
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L442
.L325:
	tst	r3, #1
	beq	.L334
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #1
	moveq	r2, #1
	streq	r2, [r5]
.L334:
	tst	r3, #2
	beq	.L335
	ldr	r3, .L450+28
	ldrh	r3, [r3]
	tst	r3, #2
	moveq	r3, #1
	streq	r3, [lr]
.L335:
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L336
.L338:
	.word	.L341
	.word	.L340
	.word	.L339
	.word	.L337
.L439:
	ldr	r3, .L450+40
	ldr	r0, .L450+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
.L308:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L440:
	cmp	r2, #0
	beq	.L313
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L313
	ldr	r2, .L450+48
	ldr	r4, .L450+36
	ldr	r0, [r2]
	ldr	r2, [r4]
	cmp	r0, #1
	add	r0, r2, #1
	beq	.L443
	cmp	r0, #3
	bgt	.L315
	mov	r7, #556
	ldr	r6, .L450+52
	mla	r2, r7, r2, r6
.L319:
	ldr	r6, [r2, #568]
	cmp	r6, #0
	beq	.L318
	ldr	r6, [r2, #576]
	cmp	r6, #0
	bgt	.L438
.L318:
	add	r0, r0, #1
	cmp	r0, #4
	add	r2, r2, #556
	bne	.L319
.L315:
	cmp	r1, #3
	bne	.L325
	tst	r3, #16
	beq	.L326
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L326
	ldr	r0, .L450+48
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L326
	mov	ip, #1
	str	ip, [r0]
	ldr	r0, .L450+56
.L328:
	ldr	ip, [r0, #12]
	cmp	ip, #0
	beq	.L327
	ldr	ip, [r0, #20]
	cmp	ip, #0
	bgt	.L444
.L327:
	add	r2, r2, #1
	cmp	r2, #4
	add	r0, r0, #556
	bne	.L328
	b	.L325
.L331:
	tst	r3, #64
	beq	.L332
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L332
	ldr	r0, .L450+36
	ldr	r2, [r0]
	cmp	r2, #0
	cmpne	r2, #3
	subne	r2, r2, #1
	strne	r2, [r0]
	b	.L332
.L337:
	bl	inspectMenu
.L336:
	mov	r1, #512
	ldr	r3, .L450+60
	add	r2, r3, #832
.L355:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r2, r3
	bne	.L355
	mov	ip, #0
	mov	r4, #24
	ldr	r0, .L450+64
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L450+68
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L450+72
	bl	drawText
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawCombatants
.L341:
	bl	frontMenu
	b	.L336
.L339:
	bl	targetMenu
	b	.L336
.L340:
	bl	attackMenu
	b	.L336
.L313:
	tst	r3, #64
	beq	.L315
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L315
	ldr	r2, .L450+48
	ldr	r4, .L450+36
	ldr	r0, [r2]
	ldr	r2, [r4]
	cmp	r0, #1
	sub	r0, r2, #1
	beq	.L445
	cmp	r0, #0
	blt	.L315
	mov	r7, #556
	ldr	r6, .L450+52
	mla	r2, r7, r2, r6
.L324:
	ldr	r6, [r2, #-544]
	cmp	r6, #0
	beq	.L323
	ldr	r6, [r2, #-536]
	cmp	r6, #0
	bgt	.L438
.L323:
	sub	r0, r0, #1
	cmn	r0, #1
	sub	r2, r2, #556
	bne	.L324
	b	.L315
.L311:
	ldr	r6, .L450+76
	mov	lr, pc
	bx	r6
	ldr	r2, .L450+80
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	cmp	r0, #6
	beq	.L446
	ldr	r8, .L450+84
	mov	lr, pc
	bx	r6
	ldr	r7, [r8]
	ldr	r9, .L450+88
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
	bne	.L343
	ldr	r4, .L450+52
	mov	r1, r7
	mov	fp, r4
	mov	r3, r4
	ldr	r2, .L450+48
	str	r7, [r2]
	add	r0, r4, #2224
.L345:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L344
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L344:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L345
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L348:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L346
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ble	.L346
	cmp	r2, #0
	beq	.L447
	sub	r2, r2, #1
.L346:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #556
	bne	.L348
	b	.L336
.L343:
	ldr	fp, .L450+56
	mov	r0, #1
	mov	r1, r4
	mov	r7, fp
	mov	r3, fp
	ldr	r2, .L450+48
	str	r0, [r2]
	add	r0, fp, #2224
.L350:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L349
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L349:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L350
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L353:
	ldr	r3, [fp, #12]
	cmp	r3, #0
	beq	.L351
	ldr	r3, [fp, #20]
	cmp	r3, #0
	ble	.L351
	cmp	r2, #0
	beq	.L448
	sub	r2, r2, #1
.L351:
	add	r4, r4, #1
	cmp	r4, #4
	add	fp, fp, #556
	bne	.L353
	b	.L336
.L441:
	ldr	r2, .L450+32
	ldr	ip, .L450+36
	ldr	r0, [r2]
	ldr	r2, [ip]
	sub	r0, r0, #3
	cmp	r0, r2
	movgt	r0, #1
	movle	r0, #0
	cmp	r2, #2
	movgt	r0, #0
	cmp	r0, #0
	addne	r2, r2, #3
	strne	r2, [ip]
	b	.L325
.L442:
	ldr	r0, .L450+36
	ldr	r2, [r0]
	cmp	r2, #2
	subgt	r2, r2, #3
	strgt	r2, [r0]
	b	.L325
.L446:
	ldr	r3, .L450+84
	ldr	r1, .L450+92
	ldr	r2, [r3]
	ldr	r0, .L450+68
	ldr	r3, .L450+96
	mov	lr, pc
	bx	r3
	bl	finishTurn
	b	.L336
.L326:
	tst	r3, #32
	beq	.L325
	ldr	r2, .L450+28
	ldrh	r2, [r2]
	ands	r2, r2, #32
	bne	.L325
	ldr	r0, .L450+48
	ldr	r4, [r0]
	cmp	r4, #1
	bne	.L325
	str	r2, [r0]
	ldr	r2, .L450+52
.L330:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L329
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L449
.L329:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #556
	bne	.L330
	b	.L325
.L438:
	str	r0, [r4]
	b	.L315
.L445:
	cmp	r0, #0
	blt	.L315
	mov	r7, #556
	ldr	r6, .L450+56
	mla	r2, r7, r2, r6
.L322:
	ldr	r6, [r2, #-544]
	cmp	r6, #0
	beq	.L321
	ldr	r6, [r2, #-536]
	cmp	r6, #0
	bgt	.L438
.L321:
	sub	r0, r0, #1
	cmn	r0, #1
	sub	r2, r2, #556
	bne	.L322
	b	.L315
.L443:
	cmp	r0, #3
	bgt	.L315
	mov	r7, #556
	ldr	r6, .L450+56
	mla	r2, r7, r2, r6
.L317:
	ldr	r6, [r2, #568]
	cmp	r6, #0
	beq	.L316
	ldr	r6, [r2, #576]
	cmp	r6, #0
	bgt	.L438
.L316:
	add	r0, r0, #1
	cmp	r0, #4
	add	r2, r2, #556
	bne	.L317
	b	.L315
.L448:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r4, r1, r7
	add	r0, r0, r3
	bl	executeMove
	b	.L336
.L447:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r7, r1, fp
	add	r0, r0, r3
	bl	executeMove
	b	.L336
.L449:
	ldr	r2, .L450+36
	str	ip, [r2]
	b	.L325
.L444:
	ldr	r0, .L450+36
	str	r2, [r0]
	b	.L325
.L451:
	.align	2
.L450:
	.word	waitTimer
	.word	battleStatus
	.word	turn
	.word	enter
	.word	leave
	.word	menu
	.word	oldButtons
	.word	buttons
	.word	numOpt
	.word	selOpt
	.word	mgba_printf
	.word	.LC17
	.word	targetTeam
	.word	battleAllies
	.word	battleOpponents
	.word	shadowOAM
	.word	lettersActive
	.word	topBuf
	.word	botBuf
	.word	rand
	.word	-1840700269
	.word	fighter
	.word	__aeabi_idivmod
	.word	.LC11
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
	.comm	botBuf,63,4
	.comm	topBuf,63,4
	.comm	leave,4,4
	.comm	enter,4,4
	.comm	waitTimer,4,4
	.comm	numOpt,4,4
	.comm	selOpt,4,4
	.comm	menu,4,4
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
