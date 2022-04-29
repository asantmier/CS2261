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
	add	r3, r3, #56
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
	add	r3, r3, #56
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
	add	r3, r3, #56
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
	add	r3, r3, #56
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
	ldr	r5, .L65
	mov	r2, #61
	ldr	r1, .L65+4
	ldr	r3, .L65+8
	ldr	r0, .L65+12
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	ldr	r2, .L65+16
	add	ip, r3, r3, lsl #2
	ldr	r2, [r2]
	lsl	ip, ip, #3
	add	ip, ip, #15
	and	ip, ip, #255
	cmp	r2, #1
	orr	ip, ip, #40960
	lsl	r1, r3, #3
	beq	.L63
	mov	r0, #832
	ldr	r2, .L65+20
	sub	r3, r1, r3
	add	r2, r2, r3, lsl #3
	ldr	r3, [r2, #16]
	ldr	r4, .L65+24
	str	r3, [sp]
	ldr	lr, .L65+28
	ldr	r3, [r2, #20]
	ldr	r1, .L65+32
	strh	r0, [r4, #140]	@ movhi
	ldr	r6, .L65+36
	ldr	r0, .L65+40
	strh	ip, [r4, #136]	@ movhi
	strh	lr, [r4, #138]	@ movhi
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
	ldr	r2, .L65+48
	sub	r3, r1, r3
	add	r2, r2, r3, lsl #3
	ldr	r3, [r2, #16]
	ldr	r4, .L65+24
	str	r3, [sp]
	ldr	r1, .L65+32
	ldr	r3, [r2, #20]
	ldr	r6, .L65+36
	strh	r0, [r4, #138]	@ movhi
	ldr	r0, .L65+40
	strh	ip, [r4, #136]	@ movhi
	strh	lr, [r4, #140]	@ movhi
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
	strh	ip, [r4, #136]	@ movhi
	str	r3, [r5]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	selOpt
	.word	.LC0
	.word	strncpy
	.word	topBuf
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
	ldr	r4, .L89
	ldr	r1, .L89+4
	mov	r2, #61
	ldr	r0, .L89+8
	ldr	r3, .L89+12
	sub	sp, sp, #44
	mov	lr, pc
	bx	r3
	ldr	r1, [r4]
	ldr	r6, .L89+16
	cmp	r1, #0
	ldr	fp, [r6]
	beq	.L68
	cmp	r1, #3
	ldr	r3, [fp, #28]
	ldr	r10, [fp, #40]
	ldr	r8, [fp, #32]
	ldr	r9, [fp, #44]
	bne	.L83
	mov	lr, #42
	mov	r2, #32
	ldr	r0, [fp, #36]
.L69:
	cmp	r1, #5
	movne	r1, #32
	mov	r7, r0
	movne	r5, r1
	movne	r0, r1
	movne	ip, r1
	moveq	r0, #32
	moveq	r1, #42
	moveq	r5, r0
	moveq	ip, r0
.L71:
	ldr	fp, [fp, #48]
	str	r1, [sp, #32]
	str	r0, [sp, #24]
	str	r5, [sp, #16]
	stmib	sp, {r10, ip}
	str	fp, [sp, #36]
	str	r7, [sp, #28]
	str	r9, [sp, #20]
	str	r8, [sp, #12]
	str	lr, [sp]
	ldr	r1, .L89+20
	ldr	r0, .L89+24
	ldr	r5, .L89+28
	mov	lr, pc
	bx	r5
	ldr	r3, .L89+32
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L84
	ldr	r3, .L89+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L85
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L83:
	cmp	r1, #1
	bne	.L86
	mov	r1, #32
	mov	ip, #42
	mov	r0, r1
	mov	r5, r1
	mov	lr, r1
	mov	r2, r1
	ldr	r7, [fp, #36]
	b	.L71
.L68:
	mov	r2, #42
	ldr	r3, [fp, #28]
	ldr	r10, [fp, #40]
	ldr	r8, [fp, #32]
	ldr	r9, [fp, #44]
	ldr	r0, [fp, #36]
.L74:
	mov	lr, #32
	b	.L69
.L86:
	ldr	r0, [fp, #36]
	cmp	r1, #4
	mov	r7, r0
	bne	.L87
	mov	r1, #32
	mov	r5, #42
	mov	r0, r1
	mov	ip, r1
	mov	lr, r1
	mov	r2, r1
	b	.L71
.L87:
	cmp	r1, #2
	bne	.L88
	mov	r1, #32
	mov	r0, #42
	mov	r5, r1
	mov	ip, r1
	mov	lr, r1
	mov	r2, r1
	b	.L71
.L85:
	ldr	r3, .L89+40
	ldr	r0, .L89+44
	ldr	r1, [r3]
	ldr	r3, .L89+48
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r3, [r6]
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #28]
	ldr	r3, [r2, #80]
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r0, .L89+52
	ldr	r1, .L89+56
	str	r2, [r0]
	str	r3, [r1]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	goToTargetMenu
.L84:
	ldr	r3, .L89+40
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L89+44
	ldr	r3, .L89+48
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #4
	ldr	r0, .L89+60
	ldr	r2, .L89+64
	str	r3, [r4]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L88:
	mov	r2, #32
	b	.L74
.L90:
	.align	2
.L89:
	.word	selOpt
	.word	.LC2
	.word	topBuf
	.word	strncpy
	.word	fighter
	.word	.LC3
	.word	botBuf
	.word	sprintf
	.word	leave
	.word	enter
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	move
	.word	targetTeam
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r1, .L149
	ldr	lr, .L149+4
	ldr	r4, .L149+8
	ldr	r0, .L149+12
	ldr	r2, .L149+16
	str	r3, [lr]
	str	ip, [r1]
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	ip, .L149+20
	ldr	r1, .L149+24
	ldr	r3, [ip]
	ldr	r2, .L149+28
	sub	r3, r3, #1
	ldr	lr, .L149+32
	ldr	r1, [r1]
	ldr	r0, .L149+36
	ldr	r2, [r2]
	ldr	r5, .L149+40
	cmp	r3, #0
	str	r3, [ip]
	str	r3, [lr]
	str	r1, [r0]
	str	r2, [r5]
	bne	.L92
	cmp	r2, #0
	bne	.L93
	ldr	r1, .L149+44
	mov	ip, #1
	mov	r6, r2
	mov	r4, r1
	mov	r3, r1
	mov	r7, r2
	str	ip, [r5]
	add	r5, r1, #224
.L95:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	beq	.L94
	ldr	ip, [r3, #20]
	cmp	ip, #0
	movgt	r7, #1
	addgt	r6, r6, r7
.L94:
	add	r3, r3, #56
	cmp	r5, r3
	bne	.L95
	ldr	r3, .L149+48
	cmp	r7, #0
	ldr	r3, [r3]
	strne	r6, [lr]
	cmp	r3, #0
	ldrne	r3, [lr]
	addne	r3, r3, #1
	strne	r3, [lr]
.L100:
	ldr	r3, [r1, #12]
	cmp	r3, #0
	beq	.L98
	ldr	r3, [r1, #20]
	cmp	r3, #0
	bgt	.L147
.L98:
	add	r2, r2, #1
	cmp	r2, #4
	add	r1, r1, #56
	bne	.L100
.L99:
	mov	lr, #1
	mov	r0, #0
	mov	r1, #32768
	mov	r2, #195
	ldr	r3, .L149+52
	ldr	ip, .L149+56
	str	lr, [ip]
	strh	r0, [r3, #10]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	bx	lr
.L92:
	cmp	r2, #0
	bne	.L107
	ldr	r4, .L149+60
	add	r3, r1, #1
	add	r1, r1, #5
.L109:
	rsbs	ip, r3, #0
	and	ip, ip, #3
	and	r2, r3, #3
	rsbpl	r2, ip, #0
	rsb	ip, r2, r2, lsl #3
	add	ip, r4, ip, lsl #3
	ldr	lr, [ip, #12]
	cmp	lr, #0
	add	r3, r3, #1
	beq	.L108
	ldr	lr, [ip, #20]
	cmp	lr, #0
	bgt	.L146
.L108:
	cmp	r3, r1
	bne	.L109
	b	.L99
.L107:
	ldr	r4, .L149+44
	add	r3, r1, #1
	add	r1, r1, #5
.L111:
	rsbs	ip, r3, #0
	and	ip, ip, #3
	and	r2, r3, #3
	rsbpl	r2, ip, #0
	rsb	ip, r2, r2, lsl #3
	add	ip, r4, ip, lsl #3
	ldr	lr, [ip, #12]
	cmp	lr, #0
	add	r3, r3, #1
	beq	.L110
	ldr	lr, [ip, #20]
	cmp	lr, #0
	bgt	.L146
.L110:
	cmp	r3, r1
	bne	.L111
	b	.L99
.L93:
	ldr	r1, .L149+60
	mov	r6, r3
	mov	r4, r1
	mov	r2, r1
	mov	r7, r3
	str	r3, [r5]
	add	r5, r1, #224
.L102:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L101
	ldr	ip, [r2, #20]
	cmp	ip, #0
	movgt	r7, #1
	addgt	r6, r6, r7
.L101:
	add	r2, r2, #56
	cmp	r2, r5
	bne	.L102
	cmp	r7, #0
	strne	r6, [lr]
.L105:
	ldr	r2, [r1, #12]
	cmp	r2, #0
	beq	.L104
	ldr	r2, [r1, #20]
	cmp	r2, #0
	bgt	.L148
.L104:
	add	r3, r3, #1
	cmp	r3, #4
	add	r1, r1, #56
	bne	.L105
	b	.L99
.L146:
	ldr	r3, .L149+64
	str	r2, [r0]
	str	ip, [r3]
	b	.L99
.L148:
	ldr	r1, .L149+64
	rsb	r2, r3, r3, lsl #3
	add	r4, r4, r2, lsl #3
	str	r3, [r0]
	str	r4, [r1]
	b	.L99
.L147:
	ldr	r1, .L149+64
	rsb	r3, r2, r2, lsl #3
	add	r4, r4, r3, lsl #3
	str	r2, [r0]
	str	r4, [r1]
	b	.L99
.L150:
	.align	2
.L149:
	.word	numOpt
	.word	selOpt
	.word	menu
	.word	.LC4
	.word	mgba_printf
	.word	turnPoints
	.word	fighterIdx
	.word	turn
	.word	nextTurnPoints
	.word	nextFighterIdx
	.word	nextTurn
	.word	battleOpponents
	.word	bossBattle
	.word	67109120
	.word	waiting
	.word	battleAllies
	.word	fighter
	.size	finishTurn, .-finishTurn
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"YOU CAPTURED A\012%s! SELECT\012AN ALLY TO REPLACE."
	.ascii	"\000"
	.align	2
.LC6:
	.ascii	"YOU RELEASED\012%s.\000"
	.align	2
.LC7:
	.ascii	"%s REPLACED\012%s.\000"
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L158
	ldr	r3, .L158+4
	sub	sp, sp, #12
	ldr	r2, [r6]
	ldr	r1, .L158+8
	ldr	r5, .L158+12
	ldr	r0, .L158+16
	ldr	r4, [r3]
	mov	lr, pc
	bx	r5
	mov	ip, #832
	ldr	r3, .L158+20
	add	r4, r4, #1
	add	r1, r4, r4, lsl #2
	rsb	r4, r4, r4, lsl #3
	add	r4, r3, r4, lsl #3
	ldr	r3, [r4, #16]
	lsl	r1, r1, #3
	add	r1, r1, #15
	ldr	r8, .L158+24
	ldr	lr, .L158+28
	str	r3, [sp]
	ldr	r7, .L158+32
	and	r1, r1, #255
	orr	r1, r1, #40960
	ldr	r3, [r4, #20]
	mov	r2, r4
	strh	r1, [r8, #136]	@ movhi
	mov	r0, r7
	strh	lr, [r8, #138]	@ movhi
	ldr	r1, .L158+36
	strh	ip, [r8, #140]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r3, .L158+40
	ldr	r9, [r3]
	cmp	r9, #0
	bne	.L156
	ldr	r3, .L158+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L157
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L157:
	ldr	r3, .L158+48
	mov	r2, r9
	ldr	r1, [r3]
	ldr	r0, .L158+52
	ldr	r3, .L158+56
	mov	lr, pc
	bx	r3
	mov	ip, #512
	mov	r3, r4
	ldr	r2, [r6]
	strh	ip, [r8, #136]	@ movhi
	ldr	r1, .L158+60
	ldr	r0, .L158+16
	strb	r9, [r7]
	mov	lr, pc
	bx	r5
	ldr	r5, [r6]
	mov	lr, r5
	mov	ip, r4
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	add	r3, r3, r3, lsr #31
	cmp	r2, r3, asr #1
	asr	r3, r3, #1
	str	r9, [r5, #12]
	strlt	r3, [r4, #20]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	finishTurn
.L156:
	ldr	r3, .L158+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L158+52
	ldr	r3, .L158+56
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, [r6]
	strh	r3, [r8, #136]	@ movhi
	ldr	r1, .L158+64
	ldr	r0, .L158+16
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, [r6]
	str	r2, [r3, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	finishTurn
.L159:
	.align	2
.L158:
	.word	captured
	.word	selOpt
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
	.word	.LC6
	.size	replaceMenu, .-replaceMenu
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"CHOOSE AN OPPONENT\012TO CAPTURE.\000"
	.align	2
.LC9:
	.ascii	"YOU CANNOT\012CAPTURE SUCH A\012FIERCE OPPONENT!\000"
	.global	__aeabi_idivmod
	.align	2
.LC10:
	.ascii	"YOU FAILED TO\012CAPTURE %s.\000"
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
	mov	r2, #61
	sub	sp, sp, #8
	ldr	r1, .L172
	ldr	r3, .L172+4
	ldr	r0, .L172+8
	mov	lr, pc
	bx	r3
	mov	lr, #192
	mov	ip, #832
	ldr	r5, .L172+12
	ldr	r2, [r5]
	ldr	r7, .L172+16
	add	r1, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #3
	add	r2, r7, r2, lsl #3
	ldr	r3, [r2, #16]
	lsl	r1, r1, #3
	add	r1, r1, #15
	ldr	r4, .L172+20
	str	r3, [sp]
	ldr	r6, .L172+24
	and	r1, r1, #255
	orr	r1, r1, #40960
	ldr	r3, [r2, #20]
	mov	r0, r6
	strh	r1, [r4, #136]	@ movhi
	ldr	r9, .L172+28
	ldr	r1, .L172+32
	strh	lr, [r4, #138]	@ movhi
	strh	ip, [r4, #140]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r3, .L172+36
	ldr	r8, [r3]
	cmp	r8, #0
	bne	.L170
	ldr	r3, .L172+40
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L171
.L160:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L171:
	ldr	r3, .L172+44
	mov	r2, r8
	ldr	r1, [r3]
	ldr	r0, .L172+48
	ldr	r3, .L172+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, .L172+56
	ldr	r10, [r2]
	cmp	r10, #0
	strb	r8, [r6]
	strh	r3, [r4, #136]	@ movhi
	beq	.L163
	mov	r2, #43
	ldr	r1, .L172+60
	ldr	r0, .L172+8
	ldr	r3, .L172+64
	mov	lr, pc
	bx	r3
.L169:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	finishTurn
.L170:
	ldr	r3, .L172+44
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L172+48
	ldr	r3, .L172+52
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	ip, #512
	mov	r1, #4
	ldr	r0, .L172+68
	ldr	r2, .L172+72
	strh	ip, [r4, #136]	@ movhi
	str	r3, [r5]
	str	r3, [r0]
	str	r1, [r2]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L163:
	ldr	r3, .L172+76
	mov	lr, pc
	bx	r3
	ldr	r2, [r5]
	rsb	r2, r2, r2, lsl #3
	add	r7, r7, r2, lsl #3
	ldr	r3, .L172+80
	ldr	r1, [r7, #16]
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #20]
	cmp	r1, r3
	ble	.L164
	mov	r2, #5
	mov	r0, #3
	ldr	r3, .L172+68
	ldr	r1, .L172+72
	str	r2, [r3]
	ldr	r2, .L172+84
	ldr	r3, .L172+88
	str	r10, [r5]
	str	r0, [r1]
	str	r7, [r2]
	str	r10, [r3]
	b	.L160
.L164:
	mov	r2, r7
	ldr	r1, .L172+92
	ldr	r0, .L172+8
	mov	lr, pc
	bx	r9
	b	.L169
.L173:
	.align	2
.L172:
	.word	.LC8
	.word	strncpy
	.word	topBuf
	.word	selOpt
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
	.word	memcpy
	.word	menu
	.word	numOpt
	.word	rand
	.word	__aeabi_idivmod
	.word	captured
	.word	targetTeam
	.word	.LC10
	.size	captureMenu, .-captureMenu
	.section	.rodata.str1.4
	.align	2
.LC11:
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
	mov	r6, r1
	mov	r5, r0
	ldr	r4, .L214
	ldr	r1, .L214+4
	mov	r3, r6
	ldr	r1, [r1]
	ldr	r0, .L214+8
	ldr	r2, [r4]
	ldr	r7, .L214+12
	mov	lr, pc
	bx	r7
	ldr	r2, [r5, #84]
	cmp	r2, #0
	ldrne	r3, .L214+16
	ldreq	r3, .L214+20
	ldrne	r1, [r3]
	ldreq	r1, [r3]
	movne	r2, #0
	ldrne	r0, .L214+24
	ldreq	r0, .L214+28
	ldr	r3, .L214+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r5, #76]
	cmp	r3, #0
	beq	.L177
	ldr	r3, .L214+36
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L211
	ldr	r3, .L214+40
	add	r0, r3, #224
.L188:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L186
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L186
	ldr	r1, [r5, #72]
	ldr	ip, [r5, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L186:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L188
	ldr	r3, .L214+44
	cmp	r5, r3
	bne	.L191
.L212:
	ldr	r2, .L214+48
	ldr	r3, [r2]
	add	r3, r3, #2
	cmp	r3, #9
	movgt	r3, #9
	str	r3, [r2]
	b	.L191
.L177:
	ldr	r2, [r5, #72]
	ldr	r3, [r6, #20]
	ldr	r1, [r5, #84]
	sub	r3, r3, r2
	ldr	r2, [r6, #16]
	add	r3, r3, r1
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [r6, #20]
.L184:
	ldr	r3, .L214+44
	cmp	r5, r3
	beq	.L212
.L191:
	ldr	r3, .L214+52
	ldr	r8, [r4]
	cmp	r5, r3
	ldreq	r3, [r8, #16]
	streq	r3, [r8, #20]
	ldr	r3, .L214+40
	add	r7, r3, #168
.L196:
	ldr	r2, [r3, #68]
	cmp	r2, #0
	add	r4, r3, #56
	beq	.L195
	ldr	r2, [r3, #76]
	cmp	r2, #0
	bgt	.L195
	mov	ip, r4
	ldr	lr, .L214+56
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
.L195:
	cmp	r4, r7
	mov	r3, r4
	bne	.L196
	mov	r3, r6
	mov	r2, r8
	ldr	r4, .L214+60
	add	r1, r5, #10
	ldr	r0, .L214+64
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L214+68
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishTurn
.L211:
	ldr	r2, .L214+72
	ldr	r3, .L214+76
	ldr	lr, [r2]
	add	r0, r3, #224
.L183:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L180
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L213
.L181:
	ldr	r1, [r5, #72]
	ldr	ip, [r5, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L180:
	add	r3, r3, #56
	cmp	r0, r3
	bne	.L183
	b	.L184
.L213:
	cmp	lr, #0
	beq	.L180
	b	.L181
.L215:
	.align	2
.L214:
	.word	fighter
	.word	turn
	.word	.LC11
	.word	mgba_printf
	.word	fanfaresfx_length
	.word	damagesfx_length
	.word	fanfaresfx_data
	.word	damagesfx_data
	.word	playSoundB
	.word	targetTeam
	.word	battleAllies
	.word	MOVE_DASH
	.word	turnPoints
	.word	MOVE_TRANSCEND
	.word	CBT_NONE
	.word	sprintf
	.word	topBuf
	.word	botBuf
	.word	bossBattle
	.word	battleOpponents
	.size	executeMove, .-executeMove
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"CHOOSE A TARGET.\000"
	.align	2
.LC13:
	.ascii	"%s WILL AFFECT\012ALL ENEMIES\000"
	.align	2
.LC14:
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
	ldr	r5, .L281
	mov	r2, #61
	ldr	r1, .L281+4
	ldr	r3, .L281+8
	ldr	r0, .L281+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r2, [r5]
	ldr	r3, .L281+16
	ldr	r1, .L281+20
	cmp	r2, r1
	cmpne	r2, r3
	moveq	r3, #1
	movne	r3, #0
	ldr	r1, .L281+24
	cmp	r2, r1
	orreq	r3, r3, #1
	ldr	r1, .L281+28
	cmp	r2, r1
	orreq	r3, r3, #1
	cmp	r3, #0
	ldrne	r1, .L281+32
	ldrne	r3, .L281+36
	ldrne	r1, [r1]
	ldr	r6, .L281+40
	strne	r1, [r3]
	ldr	r3, [r6]
	cmp	r3, #1
	ldr	r3, [r2, #76]
	beq	.L274
	cmp	r3, #0
	beq	.L229
	ldr	r3, .L281+44
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L230
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L230
	mov	r2, #832
	ldr	r4, .L281+48
	strh	r2, [r4, #140]	@ movhi
	ldr	r2, .L281+52
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, [r3, #68]
	ldr	r1, .L281+56
	cmp	r2, #0
	strh	r1, [r4, #136]	@ movhi
	bne	.L275
.L232:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #124]
	cmp	r2, #0
	beq	.L234
.L279:
	ldr	r2, [r3, #132]
	cmp	r2, #0
	ble	.L234
	mov	r2, #832
	strh	r2, [r4, #156]	@ movhi
	ldr	r2, .L281+52
	strh	r2, [r4, #154]	@ movhi
	ldr	r2, [r3, #180]
	ldr	r1, .L281+60
	cmp	r2, #0
	strh	r1, [r4, #152]	@ movhi
	bne	.L276
.L236:
	mov	r3, #512
	strh	r3, [r4, #160]	@ movhi
.L237:
	ldr	r2, [r5]
	ldr	r3, .L281+64
	ldr	r1, .L281+68
	ldr	r0, .L281+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L281+76
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L238
.L277:
	ldr	r3, .L281+80
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L281+84
	ldr	r3, .L281+88
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L281+92
	ldr	r0, [r2]
	ldr	r2, .L281+96
	ldr	r0, [r0, #24]
	strh	r3, [r4, #136]	@ movhi
	str	r0, [r2]
	ldr	r0, .L281+100
	ldr	r2, .L281+36
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	strh	r3, [r4, #160]	@ movhi
	str	ip, [r0]
	str	r1, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L229:
	mov	ip, #832
	ldr	r3, .L281+36
	ldr	r3, [r3]
	ldr	r2, .L281+44
	add	r0, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	lsl	r0, r0, #3
	add	r2, r2, r3, lsl #3
	add	r0, r0, #15
	ldr	r3, [r2, #16]
	ldr	r4, .L281+48
	ldr	lr, .L281+52
	and	r0, r0, #255
.L272:
	str	r3, [sp]
	orr	r0, r0, #40960
	ldr	r3, [r2, #20]
	ldr	r1, .L281+104
	strh	r0, [r4, #136]	@ movhi
	ldr	r7, .L281+64
	ldr	r0, .L281+72
	strh	lr, [r4, #138]	@ movhi
	strh	ip, [r4, #140]	@ movhi
	mov	lr, pc
	bx	r7
.L228:
	ldr	r3, .L281+76
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L277
.L238:
	ldr	r3, .L281+108
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L278
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L230:
	mov	r2, #512
	ldr	r4, .L281+48
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L232
.L275:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ble	.L232
	mov	r2, #832
	strh	r2, [r4, #148]	@ movhi
	ldr	r2, .L281+52
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, [r3, #124]
	ldr	r1, .L281+112
	cmp	r2, #0
	strh	r1, [r4, #144]	@ movhi
	bne	.L279
.L234:
	mov	r2, #512
	strh	r2, [r4, #152]	@ movhi
	ldr	r2, [r3, #180]
	cmp	r2, #0
	beq	.L236
.L276:
	ldr	r3, [r3, #188]
	cmp	r3, #0
	ble	.L236
	mov	r1, #832
	ldr	r2, .L281+116
	ldr	r3, .L281+52
	strh	r1, [r4, #164]	@ movhi
	strh	r2, [r4, #160]	@ movhi
	strh	r3, [r4, #162]	@ movhi
	b	.L237
.L274:
	cmp	r3, #0
	beq	.L219
	ldr	r3, .L281+120
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L280
.L220:
	mov	r2, #512
	ldr	r4, .L281+48
	strh	r2, [r4, #136]	@ movhi
.L221:
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L222
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ble	.L222
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L281+112
	strh	r1, [r4, #148]	@ movhi
	strh	r2, [r4, #144]	@ movhi
.L223:
	ldr	r2, [r3, #124]
	cmp	r2, #0
	beq	.L224
	ldr	r2, [r3, #132]
	cmp	r2, #0
	ble	.L224
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #154]	@ movhi
	ldr	r2, .L281+60
	strh	r1, [r4, #156]	@ movhi
	strh	r2, [r4, #152]	@ movhi
.L225:
	ldr	r2, [r3, #180]
	cmp	r2, #0
	beq	.L226
	ldr	r3, [r3, #188]
	cmp	r3, #0
	ble	.L226
	mov	r1, #192
	mov	r2, #832
	ldr	r3, .L281+116
	strh	r1, [r4, #162]	@ movhi
	strh	r2, [r4, #164]	@ movhi
	strh	r3, [r4, #160]	@ movhi
.L227:
	ldr	r2, [r5]
	ldr	r1, .L281+124
	ldr	r3, .L281+64
	ldr	r0, .L281+72
	mov	lr, pc
	bx	r3
	b	.L228
.L278:
	ldr	r3, .L281+80
	ldr	r0, .L281+84
	ldr	r1, [r3]
	ldr	r3, .L281+88
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, [r6]
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	strh	r3, [r4, #160]	@ movhi
	ldr	r3, .L281+36
	cmp	r2, #1
	ldr	r3, [r3]
	ldreq	r1, .L281+120
	ldrne	r1, .L281+44
	rsb	r3, r3, r3, lsl #3
	ldr	r0, [r5]
	add	r1, r1, r3, lsl #3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	executeMove
.L280:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L220
	mov	r2, #192
	mov	r1, #832
	ldr	r4, .L281+48
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L281+56
	strh	r1, [r4, #140]	@ movhi
	strh	r2, [r4, #136]	@ movhi
	b	.L221
.L226:
	mov	r3, #512
	strh	r3, [r4, #160]	@ movhi
	b	.L227
.L224:
	mov	r2, #512
	strh	r2, [r4, #152]	@ movhi
	b	.L225
.L222:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	b	.L223
.L219:
	ldr	r3, .L281+36
	ldr	r3, [r3]
	ldr	r2, .L281+120
	add	r0, r3, r3, lsl #2
	lsl	r0, r0, #3
	rsb	r3, r3, r3, lsl #3
	add	r2, r2, r3, lsl #3
	add	r0, r0, #15
	mov	lr, #192
	mov	ip, #832
	ldr	r3, [r2, #16]
	ldr	r4, .L281+48
	and	r0, r0, #255
	b	.L272
.L282:
	.align	2
.L281:
	.word	move
	.word	.LC12
	.word	strncpy
	.word	topBuf
	.word	MOVE_RESOLVE
	.word	MOVE_REGEN
	.word	MOVE_DASH
	.word	MOVE_TRANSCEND
	.word	fighterIdx
	.word	selOpt
	.word	targetTeam
	.word	battleAllies
	.word	shadowOAM
	.word	4136
	.word	-24561
	.word	-24481
	.word	sprintf
	.word	.LC14
	.word	botBuf
	.word	leave
	.word	menuhighsfx_length
	.word	menuhighsfx_data
	.word	playSoundB
	.word	fighter
	.word	numOpt
	.word	menu
	.word	.LC1
	.word	enter
	.word	-24521
	.word	-24441
	.word	battleOpponents
	.word	.LC13
	.size	targetMenu, .-targetMenu
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"WHAT WILL YOU DO?\000"
	.align	2
.LC16:
	.ascii	"%cATTACK   %cCAPTURE\012%cPASS\012%cINSPECT\000"
	.align	2
.LC17:
	.ascii	"%s PASSED.\000"
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
	ldr	r4, .L316
	ldr	r3, .L316+4
	mov	r2, #61
	ldr	r1, .L316+8
	ldr	r0, .L316+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L297
	cmp	r3, #3
	moveq	r1, #32
	moveq	r3, #42
	moveq	r0, r1
	moveq	r2, r1
	bne	.L314
.L284:
	stm	sp, {r0, r1}
	ldr	r5, .L316+16
	ldr	r1, .L316+20
	ldr	r0, .L316+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L316+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L315
.L283:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L297:
	mov	r1, #32
	mov	r2, #42
	mov	r0, r1
	mov	r3, r1
	b	.L284
.L314:
	cmp	r3, #1
	moveq	r1, #32
	moveq	r0, #42
	moveq	r3, r1
	moveq	r2, r1
	beq	.L284
	cmp	r3, #2
	movne	r1, #32
	movne	r0, r1
	movne	r3, r1
	movne	r2, r1
	moveq	r0, #32
	moveq	r1, #42
	moveq	r3, r0
	moveq	r2, r0
	b	.L284
.L315:
	ldr	r3, .L316+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L316+36
	ldr	r3, .L316+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L283
.L287:
	.word	.L290
	.word	.L289
	.word	.L288
	.word	.L286
.L286:
	mov	r3, #4
	mov	r2, #0
	ldr	r0, .L316+44
	ldr	r1, .L316+48
	str	r3, [r0]
	str	r3, [r1]
	ldr	r3, .L316+52
.L295:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L294
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L313
.L294:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #56
	bne	.L295
.L292:
	mov	r2, #1
	ldr	r3, .L316+56
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L288:
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L316+48
	ldr	r0, .L316+44
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L316+52
.L293:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L291
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L313
.L291:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #56
	bne	.L293
	b	.L292
.L289:
	ldr	r3, .L316+60
	ldr	r1, .L316+64
	ldr	r2, [r3]
	ldr	r0, .L316+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L316+24
	strb	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	finishTurn
.L290:
	mov	r1, #1
	mov	r3, #0
	ldr	r2, .L316+60
	ldr	r2, [r2]
	ldr	r0, .L316+48
	ldr	ip, [r2, #24]
	ldr	r2, .L316+44
	str	ip, [r0]
	str	r1, [r2]
	str	r3, [r4]
	b	.L283
.L313:
	str	r2, [r4]
	b	.L292
.L317:
	.align	2
.L316:
	.word	selOpt
	.word	strncpy
	.word	.LC15
	.word	topBuf
	.word	sprintf
	.word	.LC16
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
	.word	.LC17
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
	ldr	r3, .L338
	add	r1, r3, #224
.L321:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L319
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bgt	.L320
.L319:
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L321
	mov	r3, #1
	ldr	r2, .L338+4
	ldr	r1, [r2]
	ldr	r2, .L338+8
	cmp	r1, #0
	str	r3, [r2]
	bne	.L327
.L320:
	ldr	r3, .L338+12
	add	r1, r3, #224
.L325:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L323
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxgt	lr
.L323:
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L325
	mvn	r2, #0
	ldr	r3, .L338+8
	str	r2, [r3]
	bx	lr
.L327:
	ldr	r2, .L338+16
	str	r3, [r2]
	b	.L320
.L339:
	.align	2
.L338:
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
	ldr	r3, .L341
	str	r2, [r3, #12]
	str	r2, [r3, #68]
	str	r2, [r3, #124]
	str	r2, [r3, #180]
	bx	lr
.L342:
	.align	2
.L341:
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
	ldr	r5, .L348
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	and	r1, r1, #255
	add	r4, r5, r3, lsl #3
	orr	ip, r0, #16384
	lsl	r6, r3, #3
	orr	r0, r1, #24576
	ldr	r2, [r2, #16]
	ldr	r1, [lr, #20]
	mov	r3, #4
	strh	r0, [r5, r6]	@ movhi
	ldr	r5, .L348+4
	strh	ip, [r4, #2]	@ movhi
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L349:
	.align	2
.L348:
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
	ldr	r2, .L405
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L405+4
	subs	r1, r2, #1
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	strh	r3, [r4, #192]	@ movhi
	strh	r3, [r4, #200]	@ movhi
	strh	r3, [r4, #208]	@ movhi
	strh	r3, [r4, #216]	@ movhi
	strh	r3, [r4, #224]	@ movhi
	bmi	.L351
	rsb	r2, r2, r2, lsl #29
	ldr	lr, .L405+8
	ldr	ip, .L405+12
	ldr	r0, .L405+16
	add	r2, r4, r2, lsl #3
.L352:
	add	r3, r1, r1, lsl #3
	add	r3, r3, #57
	sub	r1, r1, #1
	and	r3, r3, ip
	cmn	r1, #1
	strh	lr, [r2, #232]	@ movhi
	strh	r0, [r2, #236]	@ movhi
	strh	r3, [r2, #234]	@ movhi
	add	r2, r2, #8
	bne	.L352
.L351:
	ldr	r3, .L405+20
	ldr	r1, [r3]
	ldr	r3, .L405+24
	cmp	r1, #0
	ldr	r2, .L405+28
	mov	r1, #520
	movne	r2, r3
	ldr	r3, .L405+32
	ldr	r3, [r3]
	ldr	r5, .L405+36
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #3
	ldr	r0, [r5, #12]
	add	r3, r3, #15
	and	r3, r3, #255
	orr	r3, r3, #24576
	cmp	r0, #0
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	beq	.L354
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L397
.L354:
	mov	r3, #512
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #72]	@ movhi
.L355:
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L356
	ldr	r1, [r5, #76]
	cmp	r1, #0
	bgt	.L398
.L356:
	mov	r3, #512
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #80]	@ movhi
.L357:
	ldr	r3, [r5, #124]
	cmp	r3, #0
	beq	.L358
	ldr	r1, [r5, #132]
	cmp	r1, #0
	bgt	.L399
.L358:
	mov	r3, #512
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #88]	@ movhi
.L359:
	ldr	r3, [r5, #180]
	cmp	r3, #0
	beq	.L360
	ldr	r1, [r5, #188]
	cmp	r1, #0
	bgt	.L400
.L360:
	mov	r3, #512
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #96]	@ movhi
.L361:
	ldr	r5, .L405+40
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L362
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L401
.L362:
	mov	r3, #512
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #104]	@ movhi
.L363:
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L364
	ldr	r1, [r5, #76]
	cmp	r1, #0
	bgt	.L402
.L364:
	mov	r3, #512
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #112]	@ movhi
.L365:
	ldr	r3, [r5, #124]
	cmp	r3, #0
	beq	.L366
	ldr	r1, [r5, #132]
	cmp	r1, #0
	bgt	.L403
.L366:
	mov	r3, #512
	strh	r3, [r4, #56]	@ movhi
	strh	r3, [r4, #120]	@ movhi
.L367:
	ldr	r3, [r5, #180]
	cmp	r3, #0
	beq	.L368
	ldr	r1, [r5, #188]
	cmp	r1, #0
	bgt	.L404
.L368:
	mov	r3, #512
	strh	r3, [r4, #64]	@ movhi
	strh	r3, [r4, #128]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L404:
	ldr	ip, .L405+44
	ldr	r0, [r5, #220]
	ldr	r2, [r5, #184]
	ldr	lr, .L405+48
	strh	ip, [r4, #64]	@ movhi
	ldr	r3, .L405+52
	ldr	ip, .L405+56
	strh	r3, [r4, #66]	@ movhi
	strh	r0, [r4, #68]	@ movhi
	strh	lr, [r4, #128]	@ movhi
	ldr	r5, .L405+60
	strh	ip, [r4, #130]	@ movhi
	mov	r3, #4
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #132]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L403:
	ldr	r0, [r5, #164]
	ldr	r3, .L405+64
	ldr	r2, .L405+52
	ldr	lr, .L405+68
	ldr	ip, .L405+56
	strh	r3, [r4, #56]	@ movhi
	strh	r2, [r4, #58]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #128]
	ldr	r6, .L405+60
	strh	r0, [r4, #60]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #120]	@ movhi
	strh	ip, [r4, #122]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #124]	@ movhi
	b	.L367
.L402:
	ldr	r0, [r5, #108]
	ldr	r3, .L405+72
	ldr	r2, .L405+52
	ldr	lr, .L405+76
	ldr	ip, .L405+56
	strh	r3, [r4, #48]	@ movhi
	strh	r2, [r4, #50]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #72]
	ldr	r6, .L405+60
	strh	r0, [r4, #52]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #112]	@ movhi
	strh	ip, [r4, #114]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #116]	@ movhi
	b	.L365
.L401:
	ldr	r0, [r5, #52]
	ldr	r3, .L405+80
	ldr	r2, .L405+52
	ldr	lr, .L405+84
	ldr	ip, .L405+56
	strh	r3, [r4, #40]	@ movhi
	strh	r2, [r4, #42]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L405+60
	strh	r0, [r4, #44]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #104]	@ movhi
	strh	ip, [r4, #106]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #108]	@ movhi
	b	.L363
.L400:
	ldr	ip, .L405+44
	ldr	r0, [r5, #220]
	ldr	r2, [r5, #184]
	ldr	r3, .L405+88
	ldr	lr, .L405+48
	strh	ip, [r4, #32]	@ movhi
	ldr	ip, .L405+92
	strh	r3, [r4, #34]	@ movhi
	strh	r0, [r4, #36]	@ movhi
	mov	r3, #4
	mov	r0, #0
	strh	lr, [r4, #96]	@ movhi
	ldr	r5, .L405+60
	strh	ip, [r4, #98]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #100]	@ movhi
	b	.L361
.L399:
	ldr	r0, [r5, #164]
	ldr	r3, .L405+64
	ldr	r2, .L405+88
	ldr	lr, .L405+68
	ldr	ip, .L405+92
	strh	r3, [r4, #24]	@ movhi
	strh	r2, [r4, #26]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #128]
	ldr	r6, .L405+60
	strh	r0, [r4, #28]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #88]	@ movhi
	strh	ip, [r4, #90]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #92]	@ movhi
	b	.L359
.L398:
	ldr	r0, [r5, #108]
	ldr	r3, .L405+72
	ldr	r2, .L405+88
	ldr	lr, .L405+76
	ldr	ip, .L405+92
	strh	r3, [r4, #16]	@ movhi
	strh	r2, [r4, #18]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #72]
	ldr	r6, .L405+60
	strh	r0, [r4, #20]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #80]	@ movhi
	strh	ip, [r4, #82]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #84]	@ movhi
	b	.L357
.L397:
	ldr	r0, [r5, #52]
	ldr	r3, .L405+80
	ldr	r2, .L405+88
	ldr	lr, .L405+84
	ldr	ip, .L405+92
	strh	r3, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L405+60
	strh	r0, [r4, #12]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #72]	@ movhi
	strh	ip, [r4, #74]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #76]	@ movhi
	b	.L355
.L406:
	.align	2
.L405:
	.word	turnPoints
	.word	shadowOAM
	.word	8233
	.word	511
	.word	834
	.word	turn
	.word	32968
	.word	32776
	.word	fighterIdx
	.word	battleAllies
	.word	battleOpponents
	.word	24711
	.word	24703
	.word	-28472
	.word	16584
	.word	tilesRed
	.word	24671
	.word	24663
	.word	24631
	.word	24623
	.word	24591
	.word	24583
	.word	-32760
	.word	16392
	.size	drawCombatants, .-drawCombatants
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
	push	{r4, r5, r6, lr}
	mov	r5, #4
	ldr	r6, .L429
	ldr	r4, .L429+4
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L429+8
	ldr	r4, .L429+12
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L429+16
	ldr	r4, .L429+20
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L429+24
	ldr	r4, .L429+28
	str	r2, [r6]
	strb	r2, [r4]
	ldr	r6, .L429+32
	ldr	r4, .L429+36
	strb	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L429+40
	ldr	r4, .L429+44
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L429+48
	ldr	r4, .L429+52
	str	r2, [r6]
	mov	lr, r2
	mov	r1, r2
	str	r2, [r4]
	ldr	r2, .L429+56
	ldr	ip, .L429+60
	ldr	r6, .L429+64
	str	r5, [r2]
	mov	r3, ip
	str	ip, [r6]
	add	ip, ip, #224
.L409:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L408
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	lr, #1
	addgt	r1, r1, lr
.L408:
	add	r3, r3, #56
	cmp	ip, r3
	bne	.L409
	cmp	lr, #0
	mov	r3, #0
	moveq	r1, lr
	ldr	ip, .L429+68
	ldr	r2, .L429+72
	ldr	lr, .L429+76
	str	r1, [r2]
	str	r3, [ip]
	ldr	r2, .L429+80
	ldr	ip, .L429+84
	ldr	r5, .L429+88
	strne	r1, [r4]
	str	r3, [lr]
	strh	r3, [ip, #10]	@ movhi
	str	r3, [r2, #68]
	str	r3, [r5]
	str	r3, [r2, #124]
	str	r3, [r2, #180]
	cmp	r0, #5
	ldrls	pc, [pc, r0, asl #2]
	b	.L411
.L413:
	.word	.L418
	.word	.L417
	.word	.L416
	.word	.L415
	.word	.L414
	.word	.L412
.L412:
	mov	r6, #1
	ldr	lr, .L429+92
	ldr	ip, .L429+80
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r4, .L429+96
	ldm	lr, {r0, r1}
	str	r6, [r5]
	stm	ip, {r0, r1}
	ldmia	r4!, {r0, r1, r2, r3}
	add	lr, ip, #8
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r5, .L429+100
	ldm	r4, {r0, r1}
	stm	lr, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	lr, .L429+104
.L427:
	ldm	r5, {r0, r1}
	stm	r4, {r0, r1}
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, #120
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	pop	{r4, r5, r6, lr}
	b	drawCombatants
.L418:
	ldr	r4, .L429+108
	ldr	ip, .L429+80
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1}
	sub	lr, r4, #48
	stm	ip, {r0, r1}
	ldmia	lr!, {r0, r1, r2, r3}
	add	r5, ip, #8
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1}
	stm	r5, {r0, r1}
	ldr	lr, .L429+112
.L428:
	ldmia	lr!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
.L426:
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	sub	r5, lr, #48
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, ip, #120
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	pop	{r4, r5, r6, lr}
	stm	ip, {r0, r1}
	b	drawCombatants
.L417:
	ldr	lr, .L429+104
	ldr	ip, .L429+80
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	sub	r5, lr, #48
	stm	ip, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r5, .L429+108
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	lr, .L429+112
	stmia	r4!, {r0, r1, r2, r3}
	b	.L427
.L416:
	ldr	r4, .L429+116
	ldr	ip, .L429+80
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, .L429+104
	ldm	r4, {r0, r1}
	stm	ip, {r0, r1}
	ldmia	lr!, {r0, r1, r2, r3}
	add	r4, ip, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	sub	r6, lr, #48
	stm	r4, {r0, r1}
	ldmia	r6!, {r0, r1, r2, r3}
	add	r5, ip, #64
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldr	r4, .L429+108
	ldm	lr, {r0, r1}
	stm	r5, {r0, r1}
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, ip, #120
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1}
	pop	{r4, r5, r6, lr}
	stm	ip, {r0, r1}
	b	drawCombatants
.L415:
	ldr	lr, .L429+100
	ldr	ip, .L429+80
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r5, .L429+104
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1}
	ldr	lr, .L429+108
	stm	r4, {r0, r1}
	b	.L428
.L414:
	ldr	lr, .L429+96
	ldr	ip, .L429+80
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	sub	r5, lr, #48
	stm	ip, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r5, .L429+104
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	lr, .L429+108
	stmia	r4!, {r0, r1, r2, r3}
	b	.L427
.L411:
	ldr	r4, .L429+108
	ldr	ip, .L429+80
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, .L429+112
	ldm	r4, {r0, r1}
	stm	ip, {r0, r1}
	ldmia	lr!, {r0, r1, r2, r3}
	add	r4, ip, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	sub	r5, lr, #48
	stm	r4, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	b	.L426
.L430:
	.align	2
.L429:
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
	.word	nextFighterIdx
	.word	nextTurnPoints
	.word	nextTurn
	.word	battleOpponents
	.word	67109120
	.word	bossBattle
	.word	CBT_GOD
	.word	CBT_BARRACUDA
	.word	CBT_PUFFER
	.word	CBT_SHARK
	.word	CBT_FISH
	.word	CBT_NONE
	.word	CBT_ANGLER
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
	ldr	r3, .L434
	add	r2, r3, #792
.L432:
	strh	r1, [r3, #232]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L432
	mov	r2, #0
	ldr	r3, .L434+4
	str	r2, [r3]
	bx	lr
.L435:
	.align	2
.L434:
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
	beq	.L436
	mov	lr, r1
	ldr	r9, .L452
	ldr	r10, .L452+4
	b	.L442
.L451:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L436
.L442:
	cmp	ip, #10
	add	r5, lr, #12
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L439
	cmp	ip, #32
	beq	.L440
	ldr	ip, [r9]
	add	r4, ip, #29
	cmp	r4, #127
	bgt	.L436
	and	r7, r2, #255
	lsl	r6, lr, #23
	orr	r7, r7, #8192
	lsl	fp, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	strh	r7, [r10, fp]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L452+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L440:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #6
	addge	r2, r2, #8
.L439:
	cmp	r2, r8
	blt	.L451
.L436:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L453:
	.align	2
.L452:
	.word	lettersActive
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawText, .-drawText
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"%s PASSED\000"
	.text
	.align	2
	.global	updateBattle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattle, %function
updateBattle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L617
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #12
	bl	checkBattleStatus
	ldr	r3, .L617+4
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L454
	ldr	r3, .L617+8
	ldr	r6, [r3]
	ldr	r8, .L617+12
	ldr	r7, .L617+16
	cmp	r6, #0
	str	r4, [r8]
	str	r4, [r7]
	bne	.L458
	ldr	r4, .L617+20
	ldr	r5, .L617+24
	ldr	r3, [r4]
	ldrh	r1, [r5]
	cmp	r3, #5
	and	r2, r1, #128
	beq	.L608
	sub	r0, r3, #2
	cmp	r0, #2
	bhi	.L462
	cmp	r2, #0
	beq	.L463
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L463
	ldr	r2, .L617+32
	ldr	lr, .L617+36
	ldr	r2, [r2]
	ldr	r0, [lr]
	cmp	r2, #1
	add	ip, r0, #1
	beq	.L609
	cmp	ip, #3
	bgt	.L465
	ldr	r2, .L617+40
	rsb	r0, r0, r0, lsl #3
	add	r2, r2, r0, lsl #3
.L469:
	ldr	r0, [r2, #68]
	cmp	r0, #0
	beq	.L468
	ldr	r0, [r2, #76]
	cmp	r0, #0
	bgt	.L604
.L468:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #56
	bne	.L469
.L465:
	cmp	r3, #3
	beq	.L610
.L461:
	tst	r1, #1
	beq	.L487
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	tst	r2, #1
	moveq	r2, #1
	streq	r2, [r8]
.L487:
	tst	r1, #2
	beq	.L488
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	tst	r2, #2
	moveq	r2, #1
	streq	r2, [r7]
.L488:
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L489
.L491:
	.word	.L496
	.word	.L495
	.word	.L494
	.word	.L493
	.word	.L492
	.word	.L490
.L454:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L608:
	cmp	r2, #0
	beq	.L460
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	ands	r2, r2, #128
	bne	.L460
	ldr	r0, .L617+44
	ldr	lr, .L617+36
	ldr	ip, [r0]
	ldr	r0, [lr]
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L461
	ldr	r1, .L617+48
	add	r3, r0, #1
	ldr	r1, [r1]
	str	r3, [lr]
	ldr	r0, .L617+52
	ldr	r3, .L617+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L461
.L460:
	tst	r1, #64
	beq	.L461
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	ands	r2, r2, #64
	bne	.L461
	ldr	ip, .L617+36
	ldr	r0, [ip]
	cmp	r0, #0
	beq	.L461
	ldr	r1, .L617+48
	sub	r3, r0, #1
	b	.L607
.L463:
	tst	r1, #64
	beq	.L465
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L465
	ldr	r2, .L617+32
	ldr	lr, .L617+36
	ldr	r2, [r2]
	ldr	r0, [lr]
	cmp	r2, #1
	sub	ip, r0, #1
	beq	.L611
	cmp	ip, #0
	blt	.L465
	ldr	r2, .L617+40
	rsb	r0, r0, r0, lsl #3
	add	r2, r2, r0, lsl #3
.L474:
	ldr	r0, [r2, #-44]
	cmp	r0, #0
	beq	.L473
	ldr	r0, [r2, #-36]
	cmp	r0, #0
	bgt	.L604
.L473:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r2, r2, #56
	bne	.L474
	b	.L465
.L490:
	bl	replaceMenu
.L489:
	mov	r1, #512
	ldr	r3, .L617+60
	add	r2, r3, #792
.L513:
	strh	r1, [r3, #232]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L513
	mov	ip, #0
	mov	r4, #24
	ldr	r0, .L617+64
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L617+68
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L617+72
	bl	drawText
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawCombatants
.L458:
	ldr	r6, .L617+76
	mov	lr, pc
	bx	r6
	ldr	r2, .L617+80
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	cmp	r0, #6
	beq	.L612
	ldr	r5, .L617+84
	ldr	r9, .L617+88
	ldr	r2, [r5]
	ldr	r3, [r9]
	cmp	r2, #0
	ldr	r7, [r3, #24]
	beq	.L498
	ldr	r3, .L617+92
	ldr	r3, [r3]
	cmp	r3, #0
	subeq	r7, r7, #1
.L498:
	mov	lr, pc
	bx	r6
	ldr	r8, .L617+96
	mov	r1, r7
	mov	lr, pc
	bx	r8
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L499
	ldr	r3, [r9]
.L500:
	add	r7, r1, #6
	add	r3, r3, r7, lsl #2
	ldr	r3, [r3, #4]
	ldr	r5, [r3, #80]
	cmp	r5, #0
	bne	.L501
	ldr	r4, .L617+40
	mov	fp, r5
	mov	r10, r4
	mov	r3, r4
	ldr	r2, .L617+32
	str	r5, [r2]
	add	r0, r4, #224
.L503:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L502
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	fp, fp, #1
.L502:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L503
	mov	lr, pc
	bx	r6
	mov	r1, fp
	mov	lr, pc
	bx	r8
	mov	r2, r1
.L506:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L504
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ble	.L504
	cmp	r2, #0
	beq	.L613
	sub	r2, r2, #1
.L504:
	add	r5, r5, #1
	cmp	r5, #4
	add	r4, r4, #56
	bne	.L506
	b	.L489
.L462:
	cmp	r2, #0
	beq	.L480
	ldr	r3, .L617+28
	ldrh	r3, [r3]
	ands	r2, r3, #128
	bne	.L480
	ldr	r3, .L617+44
	ldr	ip, .L617+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #1
	cmp	r0, r3
	ble	.L481
	cmp	r3, #2
	cmpne	r3, #5
	beq	.L481
	ldr	r1, .L617+48
	add	r3, r3, #1
.L605:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L617+52
	ldr	r3, .L617+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L481:
	tst	r1, #16
	beq	.L482
	ldr	r3, .L617+28
	ldrh	r3, [r3]
	ands	r2, r3, #16
	bne	.L482
	ldr	r3, .L617+44
	ldr	ip, .L617+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #3
	cmp	r0, r3
	movgt	r0, #1
	movle	r0, #0
	cmp	r3, #2
	movgt	r0, #0
	cmp	r0, #0
	beq	.L606
	ldr	r1, .L617+48
	add	r3, r3, #3
.L607:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L617+52
	ldr	r3, .L617+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L606:
	ldr	r3, [r4]
	b	.L461
.L480:
	tst	r1, #64
	beq	.L481
	ldr	r3, .L617+28
	ldrh	r3, [r3]
	ands	r2, r3, #64
	bne	.L481
	ldr	ip, .L617+36
	ldr	r3, [ip]
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L481
	ldr	r1, .L617+48
	sub	r3, r3, #1
	b	.L605
.L482:
	tst	r1, #32
	beq	.L606
	ldr	r3, .L617+28
	ldrh	r3, [r3]
	ands	r2, r3, #32
	bne	.L606
	ldr	ip, .L617+36
	ldr	r3, [ip]
	cmp	r3, #2
	ble	.L606
	ldr	r1, .L617+48
	sub	r3, r3, #3
	b	.L607
.L499:
	ldr	r3, .L617+92
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r3, [r9]
	bne	.L500
	ldr	r2, [r3, #20]
	cmp	r2, #9
	movle	r1, #5
	b	.L500
.L492:
	bl	captureMenu
	b	.L489
.L493:
	bl	inspectMenu
	b	.L489
.L494:
	bl	targetMenu
	b	.L489
.L495:
	bl	attackMenu
	b	.L489
.L496:
	bl	frontMenu
	b	.L489
.L610:
	tst	r1, #16
	beq	.L475
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L475
	ldr	r2, .L617+32
	ldr	ip, [r2]
	cmp	ip, #0
	bne	.L475
	mov	r0, #1
	str	r0, [r2]
	ldr	r2, .L617+100
.L477:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L476
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L614
.L476:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #56
	bne	.L477
	b	.L461
.L501:
	ldr	r5, .L617+100
	mov	r1, #1
	mov	fp, #0
	mov	r10, r5
	mov	r3, r5
	ldr	r2, .L617+32
	str	r1, [r2]
	add	r0, r5, #224
.L508:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L507
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	fp, fp, #1
.L507:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L508
	mov	lr, pc
	bx	r6
	mov	r1, fp
	mov	lr, pc
	bx	r8
	mov	r2, r1
.L511:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L509
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L509
	cmp	r2, #0
	beq	.L615
	sub	r2, r2, #1
.L509:
	add	r4, r4, #1
	cmp	r4, #4
	add	r5, r5, #56
	bne	.L511
	b	.L489
.L475:
	tst	r1, #32
	beq	.L461
	ldr	r2, .L617+28
	ldrh	r2, [r2]
	ands	r2, r2, #32
	bne	.L461
	ldr	r0, .L617+32
	ldr	ip, [r0]
	cmp	ip, #1
	bne	.L461
	str	r2, [r0]
	ldr	r2, .L617+40
.L479:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L478
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L616
.L478:
	add	r6, r6, #1
	cmp	r6, #4
	add	r2, r2, #56
	bne	.L479
	b	.L461
.L612:
	ldr	r3, .L617+88
	ldr	r1, .L617+104
	ldr	r2, [r3]
	ldr	r0, .L617+68
	ldr	r3, .L617+108
	mov	lr, pc
	bx	r3
	bl	finishTurn
	b	.L489
.L604:
	ldr	r3, .L617+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L617+52
	ldr	r3, .L617+56
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	ldrh	r1, [r5]
	b	.L465
.L609:
	cmp	ip, #3
	bgt	.L465
	ldr	r2, .L617+100
	rsb	r0, r0, r0, lsl #3
	add	r0, r2, r0, lsl #3
.L467:
	ldr	r2, [r0, #68]
	cmp	r2, #0
	beq	.L466
	ldr	r2, [r0, #76]
	cmp	r2, #0
	bgt	.L604
.L466:
	add	ip, ip, #1
	cmp	ip, #4
	add	r0, r0, #56
	bne	.L467
	b	.L465
.L611:
	cmp	ip, #0
	blt	.L465
	ldr	r2, .L617+100
	rsb	r0, r0, r0, lsl #3
	add	r0, r2, r0, lsl #3
.L472:
	ldr	r2, [r0, #-44]
	cmp	r2, #0
	beq	.L471
	ldr	r2, [r0, #-36]
	cmp	r2, #0
	bgt	.L604
.L471:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r0, r0, #56
	bne	.L472
	b	.L465
.L613:
	ldr	r3, [r9]
	rsb	r5, r5, r5, lsl #3
	add	r7, r3, r7, lsl #2
	ldr	r0, [r7, #4]
	add	r1, r10, r5, lsl #3
	bl	executeMove
	b	.L489
.L615:
	ldr	r3, [r9]
	rsb	r4, r4, r4, lsl #3
	add	r7, r3, r7, lsl #2
	ldr	r0, [r7, #4]
	add	r1, r10, r4, lsl #3
	bl	executeMove
	b	.L489
.L614:
	ldr	r2, .L617+48
	ldr	r3, .L617+36
	ldr	r1, [r2]
	str	ip, [r3]
	mov	r2, #0
	ldr	r3, .L617+56
	ldr	r0, .L617+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L461
.L616:
	ldr	r2, .L617+48
	ldr	r3, .L617+36
	ldr	r1, [r2]
	str	r6, [r3]
	mov	r2, #0
	ldr	r3, .L617+56
	ldr	r0, .L617+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L461
.L618:
	.align	2
.L617:
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
	.word	bossBattle
	.word	fighter
	.word	fighterIdx
	.word	__aeabi_idivmod
	.word	battleOpponents
	.word	.LC18
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
	.comm	nextTurn,4,4
	.comm	nextFighterIdx,4,4
	.comm	nextTurnPoints,4,4
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
	.word	0
	.word	2
	.word	4
	.word	6
	.word	8
	.word	10
	.word	12
	.word	14
	.word	32
	.word	34
	.word	36
	.word	38
	.word	40
	.word	42
	.word	44
	.word	46
	.word	64
	.word	66
	.word	68
	.word	70
	.word	72
	.word	74
	.word	76
	.word	78
	.word	96
	.word	98
	.word	100
	.word	102
	.word	104
	.word	106
	.word	108
	.word	110
	.word	128
	.word	130
	.word	132
	.word	134
	.word	136
	.word	138
	.word	140
	.word	142
	.word	160
	.word	162
	.word	164
	.word	166
	.word	168
	.word	170
	.word	172
	.word	174
	.word	192
	.word	194
	.word	196
	.word	198
	.word	200
	.word	202
	.word	204
	.word	206
	.word	224
	.word	226
	.word	228
	.word	230
	.word	232
	.word	234
	.word	236
	.word	238
	.ident	"GCC: (devkitARM release 53) 9.1.0"
