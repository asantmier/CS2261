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
	ldr	r1, .L65
	ldr	r3, .L65+4
	ldr	r0, .L65+8
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	mov	r3, #556
	ldr	r4, .L65+12
	ldr	r2, [r4]
	ldr	r1, .L65+16
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
	ldr	r3, .L65+20
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L65+24
	str	r3, [sp]
	ldr	lr, .L65+28
	ldr	r3, [r2, #20]
	ldr	r1, .L65+32
	strh	r0, [r5, #132]	@ movhi
	ldr	r6, .L65+36
	ldr	r0, .L65+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #130]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r3, .L65+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L64
.L55:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	mov	r0, #192
	mov	lr, #832
	ldr	r3, .L65+48
	add	r2, r3, r2
	ldr	r3, [r2, #16]
	ldr	r5, .L65+24
	str	r3, [sp]
	ldr	r1, .L65+32
	ldr	r3, [r2, #20]
	ldr	r6, .L65+36
	strh	r0, [r5, #130]	@ movhi
	ldr	r0, .L65+40
	strh	ip, [r5, #128]	@ movhi
	strh	lr, [r5, #132]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r3, .L65+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L55
.L64:
	ldr	r3, .L65+52
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L65+56
	ldr	r3, .L65+60
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #512
	mov	r1, #4
	ldr	r0, .L65+64
	ldr	r2, .L65+68
	strh	ip, [r5, #128]	@ movhi
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
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
	.word	battleOpponents
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	menu
	.word	numOpt
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
	ldr	r4, .L88
	ldr	r1, .L88+4
	ldr	r3, .L88+8
	mov	r2, #61
	ldr	r0, .L88+12
	ldr	r5, .L88+16
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
	beq	.L74
	cmp	r0, #3
	moveq	r6, #42
	moveq	r2, #32
	addeq	ip, r1, #204
	bne	.L83
.L69:
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
.L71:
	add	r1, r1, #468
	stm	sp, {r6, r8, lr}
	str	r1, [sp, #36]
	str	r0, [sp, #32]
	str	r7, [sp, #28]
	str	ip, [sp, #24]
	str	r9, [sp, #20]
	str	fp, [sp, #16]
	str	r10, [sp, #12]
	ldr	r1, .L88+20
	ldr	r0, .L88+24
	ldr	r6, .L88+28
	mov	lr, pc
	bx	r6
	ldr	r3, .L88+32
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L84
	ldr	r3, .L88+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L85
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L83:
	cmp	r0, #1
	bne	.L86
	mov	r0, #32
	mov	lr, #42
	mov	ip, r0
	mov	fp, r0
	mov	r6, r0
	mov	r2, r0
	add	r7, r1, #204
	b	.L71
.L74:
	mov	r2, #42
	add	ip, r1, #204
.L68:
	mov	r6, #32
	b	.L69
.L86:
	add	ip, r1, #204
	cmp	r0, #4
	mov	r7, ip
	bne	.L87
	mov	r0, #32
	mov	fp, #42
	mov	ip, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L71
.L87:
	cmp	r0, #2
	movne	r2, #32
	bne	.L68
	mov	r0, #32
	mov	ip, #42
	mov	fp, r0
	mov	lr, r0
	mov	r6, r0
	mov	r2, r0
	b	.L71
.L85:
	ldr	r3, .L88+40
	ldr	r0, .L88+44
	ldr	r1, [r3]
	ldr	r3, .L88+48
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	add	r1, r3, r3, lsl #2
	ldr	r2, [r5]
	add	r3, r3, r1, lsl #1
	lsl	r3, r3, #3
	add	r1, r2, r3
	ldr	r1, [r1, #108]
	rsbs	r1, r1, #1
	movcc	r1, #0
	ldr	ip, .L88+52
	ldr	r0, .L88+56
	add	r3, r3, #28
	add	r3, r2, r3
	str	r1, [ip]
	str	r3, [r0]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToTargetMenu
.L84:
	ldr	r3, .L88+40
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L88+44
	ldr	r3, .L88+48
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #4
	ldr	r0, .L88+60
	ldr	r2, .L88+64
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	selOpt
	.word	.LC2
	.word	strncpy
	.word	topBuf
	.word	fighter
	.word	.LC3
	.word	botBuf
	.word	sprintf
	.word	leave
	.word	enter
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	targetTeam
	.word	move
	.word	menu
	.word	numOpt
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
	ldr	r2, .L148
	push	{r4, r5, r6, lr}
	ldr	r1, .L148+4
	ldr	lr, .L148+8
	str	r3, [r2]
	ldr	r0, .L148+12
	ldr	r2, .L148+16
	str	r3, [lr]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	ldr	r0, .L148+20
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	bne	.L91
	ldr	ip, .L148+24
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L92
	ldr	r1, .L148+28
	mov	r4, #1
	mov	r5, r2
	mov	lr, r1
	mov	r3, r1
	mov	r6, r2
	str	r4, [ip]
	add	r4, r1, #2224
.L94:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	beq	.L93
	ldr	ip, [r3, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L93:
	add	r3, r3, #556
	cmp	r4, r3
	bne	.L94
	ldr	r3, .L148+32
	cmp	r6, #0
	ldr	r3, [r3]
	strne	r5, [r0]
	cmp	r3, #0
	ldrne	r3, [r0]
	addne	r3, r3, #1
	strne	r3, [r0]
.L99:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L97
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bgt	.L146
.L97:
	add	r2, r2, #1
	cmp	r2, #4
	add	r1, r1, #556
	bne	.L99
.L98:
	mov	lr, #1
	mov	r0, #0
	mov	r1, #32768
	mov	r2, #195
	ldr	r3, .L148+36
	ldr	ip, .L148+40
	str	lr, [ip]
	strh	r0, [r3, #10]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	bx	lr
.L91:
	ldr	r3, .L148+24
	ldr	r3, [r3]
	ldr	ip, .L148+44
	cmp	r3, #0
	mov	r5, #556
	ldr	r2, [ip]
	bne	.L106
	ldr	lr, .L148+48
	add	r3, r2, #1
	add	r2, r2, #5
.L108:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L107
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L145
.L107:
	cmp	r3, r2
	bne	.L108
	b	.L98
.L106:
	ldr	lr, .L148+28
	add	r3, r2, #1
	add	r2, r2, #5
.L110:
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r1, r3, #3
	rsbpl	r1, r0, #0
	mla	r0, r5, r1, lr
	ldr	r4, [r0, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L109
	ldr	r4, [r0, #20]
	cmp	r4, #0
	bgt	.L145
.L109:
	cmp	r3, r2
	bne	.L110
	b	.L98
.L92:
	ldr	r1, .L148+48
	mov	r5, r3
	mov	lr, r1
	mov	r2, r1
	mov	r6, r3
	str	r3, [ip]
	add	r4, r1, #2224
.L101:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L100
	ldr	ip, [r2, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L100:
	add	r2, r2, #556
	cmp	r2, r4
	bne	.L101
	cmp	r6, #0
	strne	r5, [r0]
.L104:
	ldr	r2, [r1, #12]
	cmp	r2, #0
	beq	.L103
	ldr	r2, [r1, #20]
	cmp	r2, #0
	bgt	.L147
.L103:
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #556
	bne	.L104
	b	.L98
.L145:
	ldr	r3, .L148+52
	str	r1, [ip]
	str	r0, [r3]
	b	.L98
.L147:
	mov	r2, #556
	mla	lr, r2, r3, lr
	ldr	r1, .L148+52
	ldr	r2, .L148+44
	str	lr, [r1]
	str	r3, [r2]
	b	.L98
.L146:
	mov	r3, #556
	mla	lr, r3, r2, lr
	ldr	r1, .L148+52
	ldr	r3, .L148+44
	str	lr, [r1]
	str	r2, [r3]
	b	.L98
.L149:
	.align	2
.L148:
	.word	menu
	.word	numOpt
	.word	selOpt
	.word	.LC4
	.word	mgba_printf
	.word	turnPoints
	.word	turn
	.word	battleOpponents
	.word	bossBattle
	.word	67109120
	.word	waiting
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
	ldr	r3, .L157
	ldr	r6, .L157+4
	ldr	r4, [r3]
	sub	sp, sp, #8
	ldr	r2, [r6]
	ldr	r1, .L157+8
	ldr	r5, .L157+12
	add	r4, r4, #1
	ldr	r0, .L157+16
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
	ldr	r3, .L157+20
	mla	r4, r9, r4, r3
	ldr	r3, [r4, #16]
	ldr	r7, .L157+24
	ldr	lr, .L157+28
	str	r3, [sp]
	ldr	r10, .L157+32
	ldr	r3, [r4, #20]
	mov	r2, r4
	strh	r1, [r7, #128]	@ movhi
	mov	r0, r10
	strh	lr, [r7, #130]	@ movhi
	ldr	r1, .L157+36
	strh	ip, [r7, #132]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L157+40
	ldr	r8, [r3]
	cmp	r8, #0
	bne	.L155
	ldr	r3, .L157+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L156
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L156:
	ldr	r3, .L157+48
	mov	r2, r8
	ldr	r1, [r3]
	ldr	r0, .L157+52
	ldr	r3, .L157+56
	mov	lr, pc
	bx	r3
	mov	ip, #512
	mov	r3, r4
	ldr	r2, [r6]
	strh	ip, [r7, #128]	@ movhi
	ldr	r1, .L157+60
	ldr	r0, .L157+16
	strb	r8, [r10]
	mov	lr, pc
	bx	r5
	ldr	r5, [r6]
	mov	r2, r9
	mov	r0, r4
	mov	r1, r5
	ldr	r3, .L157+64
	mov	lr, pc
	bx	r3
	str	r8, [r5, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L155:
	ldr	r3, .L157+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L157+52
	ldr	r3, .L157+56
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, [r6]
	strh	r3, [r7, #128]	@ movhi
	ldr	r1, .L157+68
	ldr	r0, .L157+16
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, [r6]
	str	r2, [r3, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L158:
	.align	2
.L157:
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
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L171
	sub	sp, sp, #12
	mov	r2, #61
	ldr	r1, .L171+4
	ldr	r3, .L171+8
	ldr	r0, .L171+12
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	add	r1, r2, r2, lsl #2
	lsl	r1, r1, #3
	add	r1, r1, #15
	and	r1, r1, #255
	mvn	r1, r1, lsl #17
	mov	r8, #556
	mvn	r1, r1, lsr #17
	mov	lr, #192
	mov	ip, #832
	ldr	r7, .L171+16
	mla	r2, r8, r2, r7
	ldr	r3, [r2, #16]
	ldr	r5, .L171+20
	str	r3, [sp]
	ldr	r9, .L171+24
	ldr	r3, [r2, #20]
	mov	r0, r9
	strh	r1, [r5, #128]	@ movhi
	ldr	r10, .L171+28
	ldr	r1, .L171+32
	strh	lr, [r5, #130]	@ movhi
	strh	ip, [r5, #132]	@ movhi
	mov	lr, pc
	bx	r10
	ldr	r3, .L171+36
	ldr	r6, [r3]
	cmp	r6, #0
	bne	.L169
	ldr	r3, .L171+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L170
.L159:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L170:
	ldr	r3, .L171+44
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L171+48
	ldr	r3, .L171+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, .L171+56
	ldr	fp, [r2]
	cmp	fp, #0
	strb	r6, [r9]
	strh	r3, [r5, #128]	@ movhi
	beq	.L162
	ldr	r2, [r4]
	mla	r2, r8, r2, r7
	ldr	r1, .L171+60
.L168:
	ldr	r0, .L171+12
	mov	lr, pc
	bx	r10
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	finishTurn
.L169:
	ldr	r3, .L171+44
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L171+48
	ldr	r3, .L171+52
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #512
	mov	r1, #4
	ldr	r0, .L171+64
	ldr	r2, .L171+68
	strh	ip, [r5, #128]	@ movhi
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L162:
	ldr	r3, .L171+72
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	mla	r7, r8, r2, r7
	ldr	r3, .L171+76
	ldr	r1, [r7, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #20]
	cmp	r1, r3
	ble	.L163
	mov	r2, #5
	mov	r0, #3
	ldr	r3, .L171+64
	ldr	r1, .L171+68
	str	r2, [r3]
	ldr	r2, .L171+80
	ldr	r3, .L171+84
	str	fp, [r4]
	str	r0, [r1]
	str	r7, [r2]
	str	fp, [r3]
	b	.L159
.L163:
	mov	r2, r7
	ldr	r1, .L171+60
	b	.L168
.L172:
	.align	2
.L171:
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
	.word	enter
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	bossBattle
	.word	.LC9
	.word	menu
	.word	numOpt
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
	ldr	r6, .L192
	ldr	r1, .L192+4
	mov	r3, r5
	ldr	r1, [r1]
	ldr	r0, .L192+8
	ldr	r2, [r6]
	ldr	r7, .L192+12
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #84]
	cmp	r2, #0
	ldrne	r3, .L192+16
	ldreq	r3, .L192+20
	ldrne	r1, [r3]
	ldreq	r1, [r3]
	movne	r2, #0
	ldrne	r0, .L192+24
	ldreq	r0, .L192+28
	ldr	r3, .L192+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L176
	ldr	r3, .L192+36
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L191
	ldr	r2, .L192+40
	add	r0, r2, #2224
.L186:
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L184
	ldr	r1, [r4, #72]
	ldr	r3, [r2, #20]
	ldr	ip, [r4, #84]
	sub	r3, r3, r1
	ldr	r1, [r2, #16]
	add	r3, r3, ip
	cmp	r1, r3
	movlt	r3, r1
	str	r3, [r2, #20]
.L184:
	add	r2, r2, #556
	cmp	r2, r0
	bne	.L186
.L182:
	mov	r3, r5
	ldr	r2, [r6]
	add	r1, r4, #10
	ldr	r0, .L192+44
	ldr	r4, .L192+48
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L192+52
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishTurn
.L176:
	ldr	r2, [r4, #72]
	ldr	r3, [r5, #20]
	ldr	r1, [r4, #84]
	sub	r3, r3, r2
	ldr	r2, [r5, #16]
	add	r3, r3, r1
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [r5, #20]
	b	.L182
.L191:
	ldr	r3, .L192+56
	add	r0, r3, #2224
.L181:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L179
	ldr	r1, [r4, #72]
	ldr	r2, [r3, #20]
	ldr	ip, [r4, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L179:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L181
	b	.L182
.L193:
	.align	2
.L192:
	.word	fighter
	.word	turn
	.word	.LC10
	.word	mgba_printf
	.word	fanfaresfx_length
	.word	damagesfx_length
	.word	fanfaresfx_data
	.word	damagesfx_data
	.word	playSoundB
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
	ldr	r6, .L255
	mov	r2, #61
	ldr	r3, .L255+4
	ldr	r1, .L255+8
	ldr	r0, .L255+12
	ldr	r5, .L255+16
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldr	r3, [r5]
	cmp	r2, #1
	ldr	r3, [r3, #76]
	beq	.L248
	cmp	r3, #0
	beq	.L206
	ldr	r3, .L255+20
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L207
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L207
	mov	r2, #4288
	mov	r1, #832
	ldr	r4, .L255+24
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, .L255+28
	strh	r2, [r4, #128]	@ movhi
	ldr	r2, [r3, #568]
	cmp	r2, #0
	strh	r1, [r4, #132]	@ movhi
	bne	.L249
.L209:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	beq	.L211
.L253:
	ldr	r2, [r3, #1132]
	cmp	r2, #0
	ble	.L211
	mov	r2, #4288
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L255+32
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	strh	r1, [r4, #148]	@ movhi
	bne	.L250
.L213:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
.L214:
	ldr	r2, [r5]
	ldr	r3, .L255+36
	ldr	r1, .L255+40
	ldr	r0, .L255+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L255+48
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L215
.L251:
	ldr	r3, .L255+52
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L255+56
	ldr	r3, .L255+60
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L255+64
	ldr	r0, [r2]
	ldr	r2, .L255+68
	ldr	r0, [r0, #24]
	strh	r3, [r4, #128]	@ movhi
	str	r0, [r2]
	ldr	r0, .L255+72
	ldr	r2, .L255+76
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	str	ip, [r0]
	str	r1, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L206:
	ldr	r3, .L255+76
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	mov	r1, #556
	mvn	r0, r0, lsr #17
	mov	ip, #832
	ldr	r3, .L255+20
	mla	r2, r1, r2, r3
	ldr	r4, .L255+24
	ldr	r3, [r2, #16]
	ldr	lr, .L255+80
.L246:
	str	r3, [sp]
	ldr	r1, .L255+84
	ldr	r3, [r2, #20]
	ldr	r7, .L255+36
	strh	r0, [r4, #128]	@ movhi
	ldr	r0, .L255+44
	strh	lr, [r4, #130]	@ movhi
	strh	ip, [r4, #132]	@ movhi
	mov	lr, pc
	bx	r7
.L205:
	ldr	r3, .L255+48
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L251
.L215:
	ldr	r3, .L255+88
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L252
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L207:
	mov	r2, #512
	ldr	r4, .L255+24
	strh	r2, [r4, #128]	@ movhi
	ldr	r2, [r3, #568]
	cmp	r2, #0
	beq	.L209
.L249:
	ldr	r2, [r3, #576]
	cmp	r2, #0
	ble	.L209
	mov	r2, #4288
	mov	r1, #832
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L255+92
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	strh	r1, [r4, #140]	@ movhi
	bne	.L253
.L211:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	beq	.L213
.L250:
	ldr	r3, [r3, #1688]
	cmp	r3, #0
	ble	.L213
	mov	r1, #4288
	mov	r2, #832
	ldr	r3, .L255+96
	strh	r1, [r4, #154]	@ movhi
	strh	r2, [r4, #156]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	b	.L214
.L248:
	cmp	r3, #0
	beq	.L196
	ldr	r3, .L255+100
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L254
.L197:
	mov	r2, #512
	ldr	r4, .L255+24
	strh	r2, [r4, #128]	@ movhi
.L198:
	ldr	r2, [r3, #568]
	cmp	r2, #0
	beq	.L199
	ldr	r2, [r3, #576]
	cmp	r2, #0
	ble	.L199
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L255+92
	strh	r1, [r4, #140]	@ movhi
	strh	r2, [r4, #136]	@ movhi
.L200:
	ldr	r2, [r3, #1124]
	cmp	r2, #0
	beq	.L201
	ldr	r2, [r3, #1132]
	cmp	r2, #0
	ble	.L201
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L255+32
	strh	r1, [r4, #148]	@ movhi
	strh	r2, [r4, #144]	@ movhi
.L202:
	ldr	r2, [r3, #1680]
	cmp	r2, #0
	beq	.L203
	ldr	r3, [r3, #1688]
	cmp	r3, #0
	ble	.L203
	mov	r1, #192
	mov	r2, #832
	ldr	r3, .L255+96
	strh	r1, [r4, #154]	@ movhi
	strh	r2, [r4, #156]	@ movhi
	strh	r3, [r4, #152]	@ movhi
.L204:
	ldr	r2, [r5]
	ldr	r1, .L255+104
	ldr	r3, .L255+36
	ldr	r0, .L255+44
	mov	lr, pc
	bx	r3
	b	.L205
.L252:
	ldr	r3, .L255+52
	ldr	r0, .L255+56
	ldr	r1, [r3]
	ldr	r3, .L255+60
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r1, #556
	ldr	r2, [r6]
	cmp	r2, #1
	ldr	r2, .L255+76
	strh	r3, [r4, #128]	@ movhi
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	ldr	r2, [r2]
	ldreq	r3, .L255+100
	ldrne	r3, .L255+20
	mla	r1, r2, r1, r3
	ldr	r0, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	executeMove
.L254:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L197
	mov	r2, #192
	mov	r1, #832
	ldr	r4, .L255+24
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, .L255+28
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #128]	@ movhi
	b	.L198
.L203:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
	b	.L204
.L201:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	b	.L202
.L199:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	b	.L200
.L196:
	mov	r1, #556
	ldr	r3, .L255+76
	ldr	r2, [r3]
	add	r0, r2, r2, lsl #2
	lsl	r0, r0, #3
	add	r0, r0, #15
	and	r0, r0, #255
	mvn	r0, r0, lsl #17
	ldr	r3, .L255+100
	mla	r2, r1, r2, r3
	mvn	r0, r0, lsr #17
	mov	lr, #192
	mov	ip, #832
	ldr	r3, [r2, #16]
	ldr	r4, .L255+24
	b	.L246
.L256:
	.align	2
.L255:
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
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	fighter
	.word	numOpt
	.word	menu
	.word	selOpt
	.word	4136
	.word	.LC1
	.word	enter
	.word	-32713
	.word	-32633
	.word	battleOpponents
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
	ldr	r4, .L290
	ldr	r3, .L290+4
	mov	r2, #61
	ldr	r1, .L290+8
	ldr	r0, .L290+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L271
	cmp	r3, #3
	moveq	r1, #32
	moveq	r3, #42
	moveq	r0, r1
	moveq	r2, r1
	bne	.L288
.L258:
	stm	sp, {r0, r1}
	ldr	r5, .L290+16
	ldr	r1, .L290+20
	ldr	r0, .L290+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L290+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L289
.L257:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L271:
	mov	r1, #32
	mov	r2, #42
	mov	r0, r1
	mov	r3, r1
	b	.L258
.L288:
	cmp	r3, #1
	moveq	r1, #32
	moveq	r0, #42
	moveq	r3, r1
	moveq	r2, r1
	beq	.L258
	cmp	r3, #2
	movne	r1, #32
	movne	r0, r1
	movne	r3, r1
	movne	r2, r1
	moveq	r0, #32
	moveq	r1, #42
	moveq	r3, r0
	moveq	r2, r0
	b	.L258
.L289:
	ldr	r3, .L290+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L290+36
	ldr	r3, .L290+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L257
.L261:
	.word	.L264
	.word	.L263
	.word	.L262
	.word	.L260
.L260:
	mov	r3, #4
	mov	r2, #0
	ldr	r0, .L290+44
	ldr	r1, .L290+48
	str	r3, [r0]
	str	r3, [r1]
	ldr	r3, .L290+52
.L269:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L268
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L287
.L268:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L269
.L266:
	mov	r2, #1
	ldr	r3, .L290+56
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L262:
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L290+48
	ldr	r0, .L290+44
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L290+52
.L267:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L265
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L287
.L265:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #556
	bne	.L267
	b	.L266
.L263:
	ldr	r3, .L290+60
	ldr	r1, .L290+64
	ldr	r2, [r3]
	ldr	r0, .L290+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L290+24
	strb	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	finishTurn
.L264:
	mov	r1, #1
	mov	r3, #0
	ldr	r2, .L290+60
	ldr	r2, [r2]
	ldr	r0, .L290+48
	ldr	ip, [r2, #24]
	ldr	r2, .L290+44
	str	ip, [r0]
	str	r1, [r2]
	str	r3, [r4]
	b	.L257
.L287:
	str	r2, [r4]
	b	.L266
.L291:
	.align	2
.L290:
	.word	selOpt
	.word	strncpy
	.word	.LC14
	.word	topBuf
	.word	sprintf
	.word	.LC15
	.word	botBuf
	.word	enter
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	menu
	.word	numOpt
	.word	battleOpponents
	.word	targetTeam
	.word	fighter
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
	ldr	r3, .L312
	add	r1, r3, #2224
.L295:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L293
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bgt	.L294
.L293:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L295
	mov	r3, #1
	ldr	r2, .L312+4
	ldr	r1, [r2]
	ldr	r2, .L312+8
	cmp	r1, #0
	str	r3, [r2]
	bne	.L301
.L294:
	ldr	r3, .L312+12
	add	r1, r3, #2224
.L299:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L297
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxgt	lr
.L297:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L299
	mvn	r2, #0
	ldr	r3, .L312+8
	str	r2, [r3]
	bx	lr
.L301:
	ldr	r2, .L312+16
	str	r3, [r2]
	b	.L294
.L313:
	.align	2
.L312:
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
	ldr	r3, .L315
	str	r2, [r3, #12]
	str	r2, [r3, #568]
	str	r2, [r3, #1124]
	str	r2, [r3, #1680]
	bx	lr
.L316:
	.align	2
.L315:
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
	ldr	r5, .L322
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
	ldr	r5, .L322+4
	strh	ip, [r4, #2]	@ movhi
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L323:
	.align	2
.L322:
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
	ldr	r2, .L377
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L377+4
	subs	r1, r2, #1
	strh	r3, [r4, #160]	@ movhi
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	bmi	.L325
	mov	lr, #41
	mov	ip, #8
	rsb	r2, r2, r2, lsl #29
	ldr	r0, .L377+8
	add	r2, r4, r2, lsl #3
.L326:
	add	r3, r1, r1, lsl #3
	add	r3, r3, #57
	sub	r1, r1, #1
	and	r3, r3, r0
	cmn	r1, #1
	strh	lr, [r2, #192]	@ movhi
	strh	ip, [r2, #196]	@ movhi
	strh	r3, [r2, #194]	@ movhi
	add	r2, r2, #8
	bne	.L326
.L325:
	ldr	r5, .L377+12
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L327
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L369
.L327:
	mov	r3, #512
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #64]	@ movhi
.L328:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L329
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L370
.L329:
	mov	r3, #512
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #72]	@ movhi
.L330:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L331
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L371
.L331:
	mov	r3, #512
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #80]	@ movhi
.L332:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L333
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L372
.L333:
	mov	r3, #512
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #88]	@ movhi
.L334:
	ldr	r5, .L377+16
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L335
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L373
.L335:
	mov	r3, #512
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #96]	@ movhi
.L336:
	ldr	r3, [r5, #568]
	cmp	r3, #0
	beq	.L337
	ldr	r1, [r5, #576]
	cmp	r1, #0
	bgt	.L374
.L337:
	mov	r3, #512
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #104]	@ movhi
.L338:
	ldr	r3, [r5, #1124]
	cmp	r3, #0
	beq	.L339
	ldr	r1, [r5, #1132]
	cmp	r1, #0
	bgt	.L375
.L339:
	mov	r3, #512
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #112]	@ movhi
.L340:
	ldr	r3, [r5, #1680]
	cmp	r3, #0
	beq	.L341
	ldr	r1, [r5, #1688]
	cmp	r1, #0
	bgt	.L376
.L341:
	mov	r3, #512
	strh	r3, [r4, #56]	@ movhi
	strh	r3, [r4, #120]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L376:
	mov	ip, #928
	ldr	r2, [r5, #1684]
	ldr	lr, .L377+20
	strh	ip, [r4, #60]	@ movhi
	ldr	r3, .L377+24
	ldr	r0, .L377+28
	ldr	ip, .L377+32
	strh	r3, [r4, #56]	@ movhi
	strh	r0, [r4, #58]	@ movhi
	strh	lr, [r4, #120]	@ movhi
	ldr	r5, .L377+36
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
.L375:
	mov	r3, #928
	ldr	r2, .L377+40
	ldr	r0, .L377+28
	ldr	lr, .L377+44
	ldr	ip, .L377+32
	strh	r3, [r4, #52]	@ movhi
	strh	r2, [r4, #48]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L377+36
	strh	r0, [r4, #50]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #112]	@ movhi
	strh	ip, [r4, #114]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #116]	@ movhi
	b	.L340
.L374:
	mov	r3, #928
	ldr	r2, .L377+48
	ldr	r0, .L377+28
	ldr	lr, .L377+52
	ldr	ip, .L377+32
	strh	r3, [r4, #44]	@ movhi
	strh	r2, [r4, #40]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L377+36
	strh	r0, [r4, #42]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #104]	@ movhi
	strh	ip, [r4, #106]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #108]	@ movhi
	b	.L338
.L373:
	mov	r3, #928
	ldr	r2, .L377+56
	ldr	r0, .L377+28
	ldr	lr, .L377+60
	ldr	ip, .L377+32
	strh	r3, [r4, #36]	@ movhi
	strh	r2, [r4, #32]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L377+36
	strh	r0, [r4, #34]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #96]	@ movhi
	strh	ip, [r4, #98]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #100]	@ movhi
	b	.L336
.L372:
	mov	ip, #8
	mov	r3, #928
	ldr	r0, .L377+24
	ldr	lr, .L377+20
	ldr	r2, [r5, #1684]
	strh	ip, [r4, #26]	@ movhi
	add	ip, ip, #16384
	strh	r3, [r4, #28]	@ movhi
	strh	r0, [r4, #24]	@ movhi
	mov	r3, #4
	mov	r0, #0
	strh	lr, [r4, #88]	@ movhi
	ldr	r5, .L377+36
	strh	ip, [r4, #90]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #92]	@ movhi
	b	.L334
.L371:
	mov	r3, #8
	mov	r2, #928
	ldr	r0, .L377+40
	ldr	lr, .L377+44
	ldr	ip, .L377+64
	strh	r3, [r4, #18]	@ movhi
	strh	r2, [r4, #20]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #1128]
	ldr	r6, .L377+36
	strh	r0, [r4, #16]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #84]	@ movhi
	b	.L332
.L370:
	mov	r3, #8
	mov	r2, #928
	ldr	r0, .L377+48
	ldr	lr, .L377+52
	ldr	ip, .L377+64
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #572]
	ldr	r6, .L377+36
	strh	r0, [r4, #8]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #72]	@ movhi
	strh	ip, [r4, #74]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #76]	@ movhi
	b	.L330
.L369:
	mov	r3, #8
	mov	r2, #896
	ldr	r0, .L377+56
	ldr	lr, .L377+60
	ldr	ip, .L377+64
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L377+36
	strh	r0, [r4]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #64]	@ movhi
	strh	ip, [r4, #66]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #772
	add	r0, r0, #1
	strh	r0, [r4, #68]	@ movhi
	b	.L328
.L378:
	.align	2
.L377:
	.word	turnPoints
	.word	shadowOAM
	.word	511
	.word	battleAllies
	.word	battleOpponents
	.word	16511
	.word	16519
	.word	4296
	.word	16584
	.word	tilesRed
	.word	16479
	.word	16471
	.word	16439
	.word	16431
	.word	16399
	.word	16391
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
	ldr	r6, .L396
	ldr	lr, .L396+4
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L396+8
	ldr	lr, .L396+12
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L396+16
	ldr	lr, .L396+20
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L396+24
	ldr	lr, .L396+28
	str	r2, [r6]
	strb	r2, [lr]
	ldr	r6, .L396+32
	ldr	lr, .L396+36
	strb	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L396+40
	ldr	lr, .L396+44
	str	r2, [r6]
	str	r2, [lr]
	ldr	r6, .L396+48
	ldr	lr, .L396+52
	str	r2, [r6]
	mov	ip, r2
	mov	r5, r0
	str	r2, [lr]
	mov	r0, r2
	ldr	r2, .L396+56
	ldr	r1, .L396+60
	ldr	r6, .L396+64
	str	r4, [r2]
	mov	r3, r1
	str	r1, [r6]
	add	r1, r1, #2224
.L381:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L380
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	ip, #1
	addgt	r0, r0, ip
.L380:
	add	r3, r3, #556
	cmp	r3, r1
	bne	.L381
	mov	r3, #0
	ldr	r4, .L396+68
	cmp	ip, #0
	ldr	ip, .L396+72
	strne	r0, [lr]
	cmp	r5, #1
	str	r3, [ip]
	str	r3, [r4, #12]
	str	r3, [r4, #568]
	str	r3, [r4, #1124]
	str	r3, [r4, #1680]
	beq	.L383
	cmp	r5, #4
	beq	.L384
	mov	r5, #1
	mov	r6, #6
	ldr	r8, .L396+76
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L396+80
	mov	lr, pc
	bx	r8
	ldr	r7, .L396+84
	mov	r2, #88
	ldr	r1, .L396+88
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, #10
	ldr	r1, .L396+92
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	str	r5, [r4, #568]
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	add	r0, r4, #584
	mov	r2, #88
	ldr	r1, .L396+88
	mov	lr, pc
	bx	r7
	str	r5, [r4, #580]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L383:
	mov	r6, #10
	ldr	r8, .L396+76
	mov	r2, r6
	mov	r0, r4
	ldr	r1, .L396+96
	mov	lr, pc
	bx	r8
	ldr	r7, .L396+84
	mov	r2, #88
	ldr	r1, .L396+88
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	add	r0, r4, #28
	mov	lr, pc
	bx	r7
	mov	r2, r6
	ldr	r1, .L396+100
	str	r5, [r4, #24]
	add	r0, r4, #556
	mov	lr, pc
	bx	r8
	mov	r2, #88
	ldr	r1, .L396+88
	str	r6, [r4, #572]
	str	r6, [r4, #576]
	str	r5, [r4, #568]
	add	r0, r4, #584
	mov	lr, pc
	bx	r7
	add	r0, r4, #1104
	mov	r2, r6
	ldr	r1, .L396+104
	str	r5, [r4, #580]
	add	r0, r0, #8
	mov	lr, pc
	bx	r8
	add	r0, r4, #1136
	str	r6, [r4, #1128]
	str	r6, [r4, #1132]
	str	r5, [r4, #1124]
	mov	r2, #88
	ldr	r1, .L396+88
	add	r0, r0, #4
	mov	lr, pc
	bx	r7
	str	r5, [r4, #1136]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L384:
	mov	r5, #1
	mov	r2, #10
	mov	r0, r4
	ldr	r1, .L396+108
	ldr	r3, .L396+76
	str	r5, [ip]
	mov	lr, pc
	bx	r3
	mov	r3, #60
	ldr	r6, .L396+84
	str	r5, [r4, #12]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	add	r0, r4, #28
	mov	r2, #88
	ldr	r1, .L396+88
	mov	lr, pc
	bx	r6
	str	r5, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	drawCombatants
.L397:
	.align	2
.L396:
	.word	battleStatus
	.word	lettersActive
	.word	menu
	.word	selOpt
	.word	waiting
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
	ldr	r3, .L401
	add	r2, r3, #832
.L399:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L399
	mov	r2, #0
	ldr	r3, .L401+4
	str	r2, [r3]
	bx	lr
.L402:
	.align	2
.L401:
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
	beq	.L403
	mov	lr, r1
	ldr	r9, .L419
	ldr	r10, .L419+4
	b	.L409
.L418:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L403
.L409:
	cmp	ip, #10
	add	r5, lr, #12
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L406
	cmp	ip, #32
	beq	.L407
	ldr	ip, [r9]
	add	r4, ip, #24
	cmp	r4, #127
	bgt	.L403
	lsl	r6, lr, #23
	lsl	r7, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	and	fp, r2, #255
	strh	fp, [r10, r7]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L419+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L407:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #6
	addge	r2, r2, #8
.L406:
	cmp	r2, r8
	blt	.L418
.L403:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L420:
	.align	2
.L419:
	.word	lettersActive
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawText, .-drawText
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
	ldr	r3, .L578
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	bl	checkBattleStatus
	ldr	r3, .L578+4
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L421
	ldr	r3, .L578+8
	ldr	r8, [r3]
	ldr	r7, .L578+12
	ldr	r6, .L578+16
	cmp	r8, #0
	str	r4, [r7]
	str	r4, [r6]
	bne	.L425
	ldr	r4, .L578+20
	ldr	r5, .L578+24
	ldr	r3, [r4]
	ldrh	r1, [r5]
	cmp	r3, #5
	and	r2, r1, #128
	beq	.L569
	sub	r0, r3, #2
	cmp	r0, #2
	bhi	.L429
	cmp	r2, #0
	beq	.L430
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L430
	ldr	r2, .L578+32
	ldr	lr, .L578+36
	ldr	r0, [r2]
	ldr	r2, [lr]
	cmp	r0, #1
	add	ip, r2, #1
	beq	.L570
	cmp	ip, #3
	bgt	.L432
	mov	r9, #556
	ldr	r0, .L578+40
	mla	r2, r9, r2, r0
.L436:
	ldr	r0, [r2, #568]
	cmp	r0, #0
	beq	.L435
	ldr	r0, [r2, #576]
	cmp	r0, #0
	bgt	.L565
.L435:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #556
	bne	.L436
.L432:
	cmp	r3, #3
	beq	.L571
.L428:
	tst	r1, #1
	beq	.L454
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	tst	r2, #1
	moveq	r2, #1
	streq	r2, [r7]
.L454:
	tst	r1, #2
	beq	.L455
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	tst	r2, #2
	moveq	r2, #1
	streq	r2, [r6]
.L455:
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L456
.L458:
	.word	.L463
	.word	.L462
	.word	.L461
	.word	.L460
	.word	.L459
	.word	.L457
.L421:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L569:
	cmp	r2, #0
	beq	.L427
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	ands	r2, r2, #128
	bne	.L427
	ldr	r0, .L578+44
	ldr	lr, .L578+36
	ldr	ip, [r0]
	ldr	r0, [lr]
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L428
	ldr	r1, .L578+48
	add	r3, r0, #1
	ldr	r1, [r1]
	str	r3, [lr]
	ldr	r0, .L578+52
	ldr	r3, .L578+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L428
.L427:
	tst	r1, #64
	beq	.L428
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	ands	r2, r2, #64
	bne	.L428
	ldr	ip, .L578+36
	ldr	r0, [ip]
	cmp	r0, #0
	beq	.L428
	ldr	r1, .L578+48
	sub	r3, r0, #1
	b	.L568
.L430:
	tst	r1, #64
	beq	.L432
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L432
	ldr	r2, .L578+32
	ldr	lr, .L578+36
	ldr	r0, [r2]
	ldr	r2, [lr]
	cmp	r0, #1
	sub	ip, r2, #1
	beq	.L572
	cmp	ip, #0
	blt	.L432
	mov	r9, #556
	ldr	r0, .L578+40
	mla	r2, r9, r2, r0
.L441:
	ldr	r0, [r2, #-544]
	cmp	r0, #0
	beq	.L440
	ldr	r0, [r2, #-536]
	cmp	r0, #0
	bgt	.L565
.L440:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r2, r2, #556
	bne	.L441
	b	.L432
.L457:
	bl	replaceMenu
.L456:
	mov	r1, #512
	ldr	r3, .L578+60
	add	r2, r3, #832
.L477:
	strh	r1, [r3, #192]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L477
	mov	ip, #0
	mov	r4, #24
	ldr	r0, .L578+64
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L578+68
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L578+72
	bl	drawText
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawCombatants
.L425:
	ldr	r6, .L578+76
	mov	lr, pc
	bx	r6
	ldr	r2, .L578+80
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	cmp	r0, #6
	beq	.L573
	ldr	r8, .L578+84
	mov	lr, pc
	bx	r6
	ldr	r7, [r8]
	ldr	r9, .L578+88
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
	bne	.L465
	ldr	r4, .L578+40
	mov	r1, r7
	mov	fp, r4
	mov	r3, r4
	ldr	r2, .L578+32
	str	r7, [r2]
	add	r0, r4, #2224
.L467:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L466
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L466:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L467
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L470:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L468
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ble	.L468
	cmp	r2, #0
	beq	.L574
	sub	r2, r2, #1
.L468:
	add	r7, r7, #1
	cmp	r7, #4
	add	r4, r4, #556
	bne	.L470
	b	.L456
.L429:
	cmp	r2, #0
	beq	.L447
	ldr	r3, .L578+28
	ldrh	r3, [r3]
	ands	r2, r3, #128
	bne	.L447
	ldr	r3, .L578+44
	ldr	ip, .L578+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #1
	cmp	r0, r3
	ble	.L448
	cmp	r3, #2
	cmpne	r3, #5
	beq	.L448
	ldr	r1, .L578+48
	add	r3, r3, #1
.L566:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L578+52
	ldr	r3, .L578+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L448:
	tst	r1, #16
	beq	.L449
	ldr	r3, .L578+28
	ldrh	r3, [r3]
	ands	r2, r3, #16
	bne	.L449
	ldr	r3, .L578+44
	ldr	ip, .L578+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #3
	cmp	r0, r3
	movgt	r0, #1
	movle	r0, #0
	cmp	r3, #2
	movgt	r0, #0
	cmp	r0, #0
	beq	.L567
	ldr	r1, .L578+48
	add	r3, r3, #3
.L568:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L578+52
	ldr	r3, .L578+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L567:
	ldr	r3, [r4]
	b	.L428
.L447:
	tst	r1, #64
	beq	.L448
	ldr	r3, .L578+28
	ldrh	r3, [r3]
	ands	r2, r3, #64
	bne	.L448
	ldr	ip, .L578+36
	ldr	r3, [ip]
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L448
	ldr	r1, .L578+48
	sub	r3, r3, #1
	b	.L566
.L449:
	tst	r1, #32
	beq	.L567
	ldr	r3, .L578+28
	ldrh	r3, [r3]
	ands	r2, r3, #32
	bne	.L567
	ldr	ip, .L578+36
	ldr	r3, [ip]
	cmp	r3, #2
	ble	.L567
	ldr	r1, .L578+48
	sub	r3, r3, #3
	b	.L568
.L465:
	ldr	fp, .L578+92
	mov	r0, #1
	mov	r1, r4
	mov	r7, fp
	mov	r3, fp
	ldr	r2, .L578+32
	str	r0, [r2]
	add	r0, fp, #2224
.L472:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L471
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	r1, r1, #1
.L471:
	add	r3, r3, #556
	cmp	r3, r0
	bne	.L472
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	mov	r2, r1
.L475:
	ldr	r3, [fp, #12]
	cmp	r3, #0
	beq	.L473
	ldr	r3, [fp, #20]
	cmp	r3, #0
	ble	.L473
	cmp	r2, #0
	beq	.L575
	sub	r2, r2, #1
.L473:
	add	r4, r4, #1
	cmp	r4, #4
	add	fp, fp, #556
	bne	.L475
	b	.L456
.L461:
	bl	targetMenu
	b	.L456
.L462:
	bl	attackMenu
	b	.L456
.L463:
	bl	frontMenu
	b	.L456
.L459:
	bl	captureMenu
	b	.L456
.L460:
	bl	inspectMenu
	b	.L456
.L571:
	tst	r1, #16
	beq	.L442
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L442
	ldr	r2, .L578+32
	ldr	ip, [r2]
	cmp	ip, #0
	bne	.L442
	mov	r0, #1
	str	r0, [r2]
	ldr	r2, .L578+92
.L444:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L443
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L576
.L443:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #556
	bne	.L444
	b	.L428
.L573:
	ldr	r3, .L578+84
	ldr	r1, .L578+96
	ldr	r2, [r3]
	ldr	r0, .L578+68
	ldr	r3, .L578+100
	mov	lr, pc
	bx	r3
	bl	finishTurn
	b	.L456
.L442:
	tst	r1, #32
	beq	.L428
	ldr	r2, .L578+28
	ldrh	r2, [r2]
	ands	r2, r2, #32
	bne	.L428
	ldr	r0, .L578+32
	ldr	ip, [r0]
	cmp	ip, #1
	bne	.L428
	str	r2, [r0]
	ldr	r2, .L578+40
.L446:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L445
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L577
.L445:
	add	r8, r8, #1
	cmp	r8, #4
	add	r2, r2, #556
	bne	.L446
	b	.L428
.L565:
	ldr	r3, .L578+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L578+52
	ldr	r3, .L578+56
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	ldrh	r1, [r5]
	b	.L432
.L570:
	cmp	ip, #3
	bgt	.L432
	mov	r0, #556
	ldr	r9, .L578+92
	mla	r2, r0, r2, r9
.L434:
	ldr	r0, [r2, #568]
	cmp	r0, #0
	beq	.L433
	ldr	r0, [r2, #576]
	cmp	r0, #0
	bgt	.L565
.L433:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #556
	bne	.L434
	b	.L432
.L574:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r7, r1, fp
	add	r0, r0, r3
	bl	executeMove
	b	.L456
.L575:
	mov	r1, #556
	add	r3, r10, r5
	add	r3, r5, r3, lsl #1
	ldr	r0, [r8]
	lsl	r3, r3, #3
	add	r3, r3, #28
	mla	r1, r4, r1, r7
	add	r0, r0, r3
	bl	executeMove
	b	.L456
.L572:
	cmp	ip, #0
	blt	.L432
	mov	r0, #556
	ldr	r9, .L578+92
	mla	r2, r0, r2, r9
.L439:
	ldr	r0, [r2, #-544]
	cmp	r0, #0
	beq	.L438
	ldr	r0, [r2, #-536]
	cmp	r0, #0
	bgt	.L565
.L438:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r2, r2, #556
	bne	.L439
	b	.L432
.L577:
	ldr	r2, .L578+48
	ldr	r3, .L578+36
	ldr	r1, [r2]
	str	r8, [r3]
	mov	r2, #0
	ldr	r3, .L578+56
	ldr	r0, .L578+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L428
.L576:
	ldr	r2, .L578+48
	ldr	r3, .L578+36
	ldr	r1, [r2]
	str	ip, [r3]
	mov	r2, #0
	ldr	r3, .L578+56
	ldr	r0, .L578+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L428
.L579:
	.align	2
.L578:
	.word	waiting
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
	.word	numOpt
	.word	menulowsfx_length
	.word	menulowsfx_data
	.word	playSoundB
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
	.comm	waiting,4,4
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
	.comm	soundB,32,4
	.comm	soundA,32,4
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
