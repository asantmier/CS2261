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
	strh	r0, [r4, #132]	@ movhi
	ldr	r6, .L65+36
	ldr	r0, .L65+40
	strh	ip, [r4, #128]	@ movhi
	strh	lr, [r4, #130]	@ movhi
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
	strh	r0, [r4, #130]	@ movhi
	ldr	r0, .L65+40
	strh	ip, [r4, #128]	@ movhi
	strh	lr, [r4, #132]	@ movhi
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
	strh	ip, [r4, #128]	@ movhi
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
	ldr	r2, .L149
	push	{r4, r5, r6, lr}
	ldr	r1, .L149+4
	ldr	lr, .L149+8
	str	r3, [r2]
	ldr	r0, .L149+12
	ldr	r2, .L149+16
	str	r3, [lr]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	ldr	r2, .L149+20
	ldr	r3, [r2]
	ldr	r0, .L149+24
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	str	r3, [r0]
	bne	.L92
	ldr	ip, .L149+28
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L93
	ldr	r1, .L149+32
	mov	r4, #1
	mov	r5, r2
	mov	lr, r1
	mov	r3, r1
	mov	r6, r2
	str	r4, [ip]
	add	r4, r1, #224
.L95:
	ldr	ip, [r3, #12]
	cmp	ip, #0
	beq	.L94
	ldr	ip, [r3, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L94:
	add	r3, r3, #56
	cmp	r4, r3
	bne	.L95
	ldr	r3, .L149+36
	cmp	r6, #0
	ldr	r3, [r3]
	strne	r5, [r0]
	cmp	r3, #0
	ldrne	r3, [r0]
	addne	r3, r3, #1
	strne	r3, [r0]
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
	ldr	r3, .L149+40
	ldr	ip, .L149+44
	str	lr, [ip]
	strh	r0, [r3, #10]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	bx	lr
.L92:
	ldr	r3, .L149+28
	ldr	r3, [r3]
	ldr	ip, .L149+48
	cmp	r3, #0
	ldr	r2, [ip]
	bne	.L107
	ldr	lr, .L149+52
	add	r3, r2, #1
	add	r0, r2, #5
.L109:
	rsbs	r1, r3, #0
	and	r1, r1, #3
	and	r2, r3, #3
	rsbpl	r2, r1, #0
	rsb	r1, r2, r2, lsl #3
	add	r1, lr, r1, lsl #3
	ldr	r4, [r1, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L108
	ldr	r4, [r1, #20]
	cmp	r4, #0
	bgt	.L146
.L108:
	cmp	r3, r0
	bne	.L109
	b	.L99
.L107:
	ldr	lr, .L149+32
	add	r3, r2, #1
	add	r0, r2, #5
.L111:
	rsbs	r1, r3, #0
	and	r1, r1, #3
	and	r2, r3, #3
	rsbpl	r2, r1, #0
	rsb	r1, r2, r2, lsl #3
	add	r1, lr, r1, lsl #3
	ldr	r4, [r1, #12]
	cmp	r4, #0
	add	r3, r3, #1
	beq	.L110
	ldr	r4, [r1, #20]
	cmp	r4, #0
	bgt	.L146
.L110:
	cmp	r3, r0
	bne	.L111
	b	.L99
.L93:
	ldr	r1, .L149+52
	mov	r5, r3
	mov	lr, r1
	mov	r2, r1
	mov	r6, r3
	str	r3, [ip]
	add	r4, r1, #224
.L102:
	ldr	ip, [r2, #12]
	cmp	ip, #0
	beq	.L101
	ldr	ip, [r2, #20]
	cmp	ip, #0
	movgt	r6, #1
	addgt	r5, r5, r6
.L101:
	add	r2, r2, #56
	cmp	r2, r4
	bne	.L102
	cmp	r6, #0
	strne	r5, [r0]
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
	ldr	r3, .L149+56
	str	r2, [ip]
	str	r1, [r3]
	b	.L99
.L148:
	ldr	r0, .L149+56
	ldr	r1, .L149+48
	rsb	r2, r3, r3, lsl #3
	add	lr, lr, r2, lsl #3
	str	lr, [r0]
	str	r3, [r1]
	b	.L99
.L147:
	ldr	r0, .L149+56
	ldr	r1, .L149+48
	rsb	r3, r2, r2, lsl #3
	add	lr, lr, r3, lsl #3
	str	lr, [r0]
	str	r2, [r1]
	b	.L99
.L150:
	.align	2
.L149:
	.word	menu
	.word	numOpt
	.word	selOpt
	.word	.LC4
	.word	mgba_printf
	.word	turnPoints
	.word	nextTurnPoints
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L158
	ldr	r3, .L158+4
	sub	sp, sp, #12
	ldr	r2, [r6]
	ldr	r1, .L158+8
	ldr	r5, .L158+12
	ldr	r0, .L158+16
	ldr	r7, [r3]
	mov	lr, pc
	bx	r5
	mov	lr, #832
	ldr	ip, .L158+20
	add	r7, r7, #1
	add	r1, r7, r7, lsl #2
	rsb	r7, r7, r7, lsl #3
	add	r4, ip, r7, lsl #3
	ldr	r3, [r4, #16]
	lsl	r1, r1, #3
	add	r1, r1, #15
	ldr	r8, .L158+24
	ldr	ip, .L158+28
	str	r3, [sp]
	ldr	r7, .L158+32
	and	r1, r1, #255
	orr	r1, r1, #40960
	ldr	r3, [r4, #20]
	mov	r2, r4
	strh	r1, [r8, #128]	@ movhi
	mov	r0, r7
	strh	ip, [r8, #130]	@ movhi
	ldr	r1, .L158+36
	strh	lr, [r8, #132]	@ movhi
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
	strb	r9, [r7]
	ldr	r1, .L158+60
	strh	ip, [r8, #128]	@ movhi
	ldr	r0, .L158+16
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
	str	r9, [r5, #12]
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
	strh	r3, [r8, #128]	@ movhi
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
	.ascii	"YOU FAILED TO CAPTURE %s\000"
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
	strh	r1, [r4, #128]	@ movhi
	ldr	r9, .L172+28
	ldr	r1, .L172+32
	strh	lr, [r4, #130]	@ movhi
	strh	ip, [r4, #132]	@ movhi
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
	strh	r3, [r4, #128]	@ movhi
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
	strh	ip, [r4, #128]	@ movhi
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
	mov	r5, r1
	mov	r4, r0
	ldr	r6, .L200
	ldr	r1, .L200+4
	mov	r3, r5
	ldr	r1, [r1]
	ldr	r0, .L200+8
	ldr	r2, [r6]
	ldr	r7, .L200+12
	mov	lr, pc
	bx	r7
	ldr	r2, [r4, #84]
	cmp	r2, #0
	ldrne	r3, .L200+16
	ldreq	r3, .L200+20
	ldrne	r1, [r3]
	ldreq	r1, [r3]
	movne	r2, #0
	ldrne	r0, .L200+24
	ldreq	r0, .L200+28
	ldr	r3, .L200+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L177
	ldr	r3, .L200+36
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L198
	ldr	r2, .L200+40
	add	r0, r2, #224
.L188:
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L186
	ldr	r3, [r2, #20]
	cmp	r3, #0
	ble	.L186
	ldr	r1, [r4, #72]
	ldr	ip, [r4, #84]
	sub	r3, r3, r1
	ldr	r1, [r2, #16]
	add	r3, r3, ip
	cmp	r1, r3
	movlt	r3, r1
	str	r3, [r2, #20]
.L186:
	add	r2, r2, #56
	cmp	r2, r0
	bne	.L188
.L184:
	ldr	r3, .L200+44
	cmp	r4, r3
	ldreq	r2, .L200+48
	ldreq	r3, [r2]
	addeq	r3, r3, #2
	streq	r3, [r2]
	ldr	r3, .L200+52
	ldr	r2, [r6]
	cmp	r4, r3
	ldreq	r3, [r2, #16]
	add	r1, r4, #10
	streq	r3, [r2, #20]
	ldr	r4, .L200+56
	mov	r3, r5
	ldr	r0, .L200+60
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L200+64
	strb	r2, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishTurn
.L177:
	ldr	r2, [r4, #72]
	ldr	r3, [r5, #20]
	ldr	r1, [r4, #84]
	sub	r3, r3, r2
	ldr	r2, [r5, #16]
	add	r3, r3, r1
	cmp	r2, r3
	movlt	r3, r2
	str	r3, [r5, #20]
	b	.L184
.L198:
	ldr	r2, .L200+68
	ldr	r3, .L200+72
	ldr	lr, [r2]
	add	r0, r3, #224
.L183:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L180
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L199
.L181:
	ldr	r1, [r4, #72]
	ldr	ip, [r4, #84]
	sub	r2, r2, r1
	ldr	r1, [r3, #16]
	add	r2, r2, ip
	cmp	r1, r2
	movlt	r2, r1
	str	r2, [r3, #20]
.L180:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L183
	b	.L184
.L199:
	cmp	lr, #0
	beq	.L180
	b	.L181
.L201:
	.align	2
.L200:
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
	ldr	r5, .L267
	mov	r2, #61
	ldr	r1, .L267+4
	ldr	r3, .L267+8
	ldr	r0, .L267+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r2, [r5]
	ldr	r3, .L267+16
	ldr	r1, .L267+20
	cmp	r2, r1
	cmpne	r2, r3
	moveq	r3, #1
	movne	r3, #0
	ldr	r1, .L267+24
	cmp	r2, r1
	orreq	r3, r3, #1
	ldr	r1, .L267+28
	cmp	r2, r1
	orreq	r3, r3, #1
	cmp	r3, #0
	ldrne	r1, .L267+32
	ldrne	r3, .L267+36
	ldrne	r1, [r1]
	ldr	r6, .L267+40
	strne	r1, [r3]
	ldr	r3, [r6]
	cmp	r3, #1
	ldr	r3, [r2, #76]
	beq	.L260
	cmp	r3, #0
	beq	.L215
	ldr	r3, .L267+44
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L216
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L216
	mov	r2, #832
	ldr	r4, .L267+48
	strh	r2, [r4, #132]	@ movhi
	ldr	r2, .L267+52
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, [r3, #68]
	ldr	r1, .L267+56
	cmp	r2, #0
	strh	r1, [r4, #128]	@ movhi
	bne	.L261
.L218:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	ldr	r2, [r3, #124]
	cmp	r2, #0
	beq	.L220
.L265:
	ldr	r2, [r3, #132]
	cmp	r2, #0
	ble	.L220
	mov	r2, #832
	strh	r2, [r4, #148]	@ movhi
	ldr	r2, .L267+52
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, [r3, #180]
	ldr	r1, .L267+60
	cmp	r2, #0
	strh	r1, [r4, #144]	@ movhi
	bne	.L262
.L222:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
.L223:
	ldr	r2, [r5]
	ldr	r3, .L267+64
	ldr	r1, .L267+68
	ldr	r0, .L267+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L267+76
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L224
.L263:
	ldr	r3, .L267+80
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L267+84
	ldr	r3, .L267+88
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	ip, #1
	mov	r1, #0
	ldr	r2, .L267+92
	ldr	r0, [r2]
	ldr	r2, .L267+96
	ldr	r0, [r0, #24]
	strh	r3, [r4, #128]	@ movhi
	str	r0, [r2]
	ldr	r0, .L267+100
	ldr	r2, .L267+36
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	str	ip, [r0]
	str	r1, [r2]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L215:
	mov	ip, #832
	ldr	r3, .L267+36
	ldr	r3, [r3]
	ldr	r2, .L267+44
	add	r0, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	lsl	r0, r0, #3
	add	r2, r2, r3, lsl #3
	add	r0, r0, #15
	ldr	r3, [r2, #16]
	ldr	r4, .L267+48
	ldr	lr, .L267+52
	and	r0, r0, #255
.L258:
	str	r3, [sp]
	orr	r0, r0, #40960
	ldr	r3, [r2, #20]
	ldr	r1, .L267+104
	strh	r0, [r4, #128]	@ movhi
	ldr	r7, .L267+64
	ldr	r0, .L267+72
	strh	lr, [r4, #130]	@ movhi
	strh	ip, [r4, #132]	@ movhi
	mov	lr, pc
	bx	r7
.L214:
	ldr	r3, .L267+76
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L263
.L224:
	ldr	r3, .L267+108
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L264
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L216:
	mov	r2, #512
	ldr	r4, .L267+48
	strh	r2, [r4, #128]	@ movhi
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L218
.L261:
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ble	.L218
	mov	r2, #832
	strh	r2, [r4, #140]	@ movhi
	ldr	r2, .L267+52
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, [r3, #124]
	ldr	r1, .L267+112
	cmp	r2, #0
	strh	r1, [r4, #136]	@ movhi
	bne	.L265
.L220:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	ldr	r2, [r3, #180]
	cmp	r2, #0
	beq	.L222
.L262:
	ldr	r3, [r3, #188]
	cmp	r3, #0
	ble	.L222
	mov	r1, #832
	ldr	r2, .L267+116
	ldr	r3, .L267+52
	strh	r1, [r4, #156]	@ movhi
	strh	r2, [r4, #152]	@ movhi
	strh	r3, [r4, #154]	@ movhi
	b	.L223
.L260:
	cmp	r3, #0
	beq	.L205
	ldr	r3, .L267+120
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L266
.L206:
	mov	r2, #512
	ldr	r4, .L267+48
	strh	r2, [r4, #128]	@ movhi
.L207:
	ldr	r2, [r3, #68]
	cmp	r2, #0
	beq	.L208
	ldr	r2, [r3, #76]
	cmp	r2, #0
	ble	.L208
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #138]	@ movhi
	ldr	r2, .L267+112
	strh	r1, [r4, #140]	@ movhi
	strh	r2, [r4, #136]	@ movhi
.L209:
	ldr	r2, [r3, #124]
	cmp	r2, #0
	beq	.L210
	ldr	r2, [r3, #132]
	cmp	r2, #0
	ble	.L210
	mov	r2, #192
	mov	r1, #832
	strh	r2, [r4, #146]	@ movhi
	ldr	r2, .L267+60
	strh	r1, [r4, #148]	@ movhi
	strh	r2, [r4, #144]	@ movhi
.L211:
	ldr	r2, [r3, #180]
	cmp	r2, #0
	beq	.L212
	ldr	r3, [r3, #188]
	cmp	r3, #0
	ble	.L212
	mov	r1, #192
	mov	r2, #832
	ldr	r3, .L267+116
	strh	r1, [r4, #154]	@ movhi
	strh	r2, [r4, #156]	@ movhi
	strh	r3, [r4, #152]	@ movhi
.L213:
	ldr	r2, [r5]
	ldr	r1, .L267+124
	ldr	r3, .L267+64
	ldr	r0, .L267+72
	mov	lr, pc
	bx	r3
	b	.L214
.L264:
	ldr	r3, .L267+80
	ldr	r0, .L267+84
	ldr	r1, [r3]
	ldr	r3, .L267+88
	mov	lr, pc
	bx	r3
	mov	r3, #512
	ldr	r2, [r6]
	strh	r3, [r4, #128]	@ movhi
	strh	r3, [r4, #136]	@ movhi
	strh	r3, [r4, #144]	@ movhi
	strh	r3, [r4, #152]	@ movhi
	ldr	r3, .L267+36
	cmp	r2, #1
	ldr	r3, [r3]
	ldreq	r1, .L267+120
	ldrne	r1, .L267+44
	rsb	r3, r3, r3, lsl #3
	ldr	r0, [r5]
	add	r1, r1, r3, lsl #3
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	executeMove
.L266:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ble	.L206
	mov	r2, #192
	mov	r1, #832
	ldr	r4, .L267+48
	strh	r2, [r4, #130]	@ movhi
	ldr	r2, .L267+56
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #128]	@ movhi
	b	.L207
.L212:
	mov	r3, #512
	strh	r3, [r4, #152]	@ movhi
	b	.L213
.L210:
	mov	r2, #512
	strh	r2, [r4, #144]	@ movhi
	b	.L211
.L208:
	mov	r2, #512
	strh	r2, [r4, #136]	@ movhi
	b	.L209
.L205:
	ldr	r3, .L267+36
	ldr	r3, [r3]
	ldr	r2, .L267+120
	add	r0, r3, r3, lsl #2
	lsl	r0, r0, #3
	rsb	r3, r3, r3, lsl #3
	add	r2, r2, r3, lsl #3
	add	r0, r0, #15
	mov	lr, #192
	mov	ip, #832
	ldr	r3, [r2, #16]
	ldr	r4, .L267+48
	and	r0, r0, #255
	b	.L258
.L268:
	.align	2
.L267:
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
	ldr	r4, .L302
	ldr	r3, .L302+4
	mov	r2, #61
	ldr	r1, .L302+8
	ldr	r0, .L302+12
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L283
	cmp	r3, #3
	moveq	r1, #32
	moveq	r3, #42
	moveq	r0, r1
	moveq	r2, r1
	bne	.L300
.L270:
	stm	sp, {r0, r1}
	ldr	r5, .L302+16
	ldr	r1, .L302+20
	ldr	r0, .L302+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L302+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L301
.L269:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L283:
	mov	r1, #32
	mov	r2, #42
	mov	r0, r1
	mov	r3, r1
	b	.L270
.L300:
	cmp	r3, #1
	moveq	r1, #32
	moveq	r0, #42
	moveq	r3, r1
	moveq	r2, r1
	beq	.L270
	cmp	r3, #2
	movne	r1, #32
	movne	r0, r1
	movne	r3, r1
	movne	r2, r1
	moveq	r0, #32
	moveq	r1, #42
	moveq	r3, r0
	moveq	r2, r0
	b	.L270
.L301:
	ldr	r3, .L302+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L302+36
	ldr	r3, .L302+40
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L269
.L273:
	.word	.L276
	.word	.L275
	.word	.L274
	.word	.L272
.L272:
	mov	r3, #4
	mov	r2, #0
	ldr	r0, .L302+44
	ldr	r1, .L302+48
	str	r3, [r0]
	str	r3, [r1]
	ldr	r3, .L302+52
.L281:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L280
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L299
.L280:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #56
	bne	.L281
.L278:
	mov	r2, #1
	ldr	r3, .L302+56
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L274:
	mov	ip, #3
	mov	r1, #4
	mov	r2, #0
	ldr	r3, .L302+48
	ldr	r0, .L302+44
	str	r1, [r3]
	str	ip, [r0]
	ldr	r3, .L302+52
.L279:
	ldr	r1, [r3, #12]
	cmp	r1, #0
	beq	.L277
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bgt	.L299
.L277:
	add	r2, r2, #1
	cmp	r2, #4
	add	r3, r3, #56
	bne	.L279
	b	.L278
.L275:
	ldr	r3, .L302+60
	ldr	r1, .L302+64
	ldr	r2, [r3]
	ldr	r0, .L302+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L302+24
	strb	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	finishTurn
.L276:
	mov	r1, #1
	mov	r3, #0
	ldr	r2, .L302+60
	ldr	r2, [r2]
	ldr	r0, .L302+48
	ldr	ip, [r2, #24]
	ldr	r2, .L302+44
	str	ip, [r0]
	str	r1, [r2]
	str	r3, [r4]
	b	.L269
.L299:
	str	r2, [r4]
	b	.L278
.L303:
	.align	2
.L302:
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
	ldr	r3, .L324
	add	r1, r3, #224
.L307:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L305
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bgt	.L306
.L305:
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L307
	mov	r3, #1
	ldr	r2, .L324+4
	ldr	r1, [r2]
	ldr	r2, .L324+8
	cmp	r1, #0
	str	r3, [r2]
	bne	.L313
.L306:
	ldr	r3, .L324+12
	add	r1, r3, #224
.L311:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L309
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bxgt	lr
.L309:
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L311
	mvn	r2, #0
	ldr	r3, .L324+8
	str	r2, [r3]
	bx	lr
.L313:
	ldr	r2, .L324+16
	str	r3, [r2]
	b	.L306
.L325:
	.align	2
.L324:
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
	ldr	r3, .L327
	str	r2, [r3, #12]
	str	r2, [r3, #68]
	str	r2, [r3, #124]
	str	r2, [r3, #180]
	bx	lr
.L328:
	.align	2
.L327:
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
	ldr	r5, .L334
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
	ldr	r5, .L334+4
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
.L335:
	.align	2
.L334:
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
	ldr	r2, .L389
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L389+4
	subs	r1, r2, #1
	strh	r3, [r4, #160]	@ movhi
	strh	r3, [r4, #168]	@ movhi
	strh	r3, [r4, #176]	@ movhi
	strh	r3, [r4, #184]	@ movhi
	strh	r3, [r4, #192]	@ movhi
	strh	r3, [r4, #200]	@ movhi
	strh	r3, [r4, #208]	@ movhi
	strh	r3, [r4, #216]	@ movhi
	bmi	.L337
	rsb	r2, r2, r2, lsl #29
	ldr	lr, .L389+8
	ldr	ip, .L389+12
	ldr	r0, .L389+16
	add	r2, r4, r2, lsl #3
.L338:
	add	r3, r1, r1, lsl #3
	add	r3, r3, #57
	sub	r1, r1, #1
	and	r3, r3, ip
	cmn	r1, #1
	strh	lr, [r2, #224]	@ movhi
	strh	r0, [r2, #228]	@ movhi
	strh	r3, [r2, #226]	@ movhi
	add	r2, r2, #8
	bne	.L338
.L337:
	ldr	r5, .L389+20
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L339
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L381
.L339:
	mov	r3, #512
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #64]	@ movhi
.L340:
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L341
	ldr	r1, [r5, #76]
	cmp	r1, #0
	bgt	.L382
.L341:
	mov	r3, #512
	strh	r3, [r4, #8]	@ movhi
	strh	r3, [r4, #72]	@ movhi
.L342:
	ldr	r3, [r5, #124]
	cmp	r3, #0
	beq	.L343
	ldr	r1, [r5, #132]
	cmp	r1, #0
	bgt	.L383
.L343:
	mov	r3, #512
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #80]	@ movhi
.L344:
	ldr	r3, [r5, #180]
	cmp	r3, #0
	beq	.L345
	ldr	r1, [r5, #188]
	cmp	r1, #0
	bgt	.L384
.L345:
	mov	r3, #512
	strh	r3, [r4, #24]	@ movhi
	strh	r3, [r4, #88]	@ movhi
.L346:
	ldr	r5, .L389+24
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L347
	ldr	r1, [r5, #20]
	cmp	r1, #0
	bgt	.L385
.L347:
	mov	r3, #512
	strh	r3, [r4, #32]	@ movhi
	strh	r3, [r4, #96]	@ movhi
.L348:
	ldr	r3, [r5, #68]
	cmp	r3, #0
	beq	.L349
	ldr	r1, [r5, #76]
	cmp	r1, #0
	bgt	.L386
.L349:
	mov	r3, #512
	strh	r3, [r4, #40]	@ movhi
	strh	r3, [r4, #104]	@ movhi
.L350:
	ldr	r3, [r5, #124]
	cmp	r3, #0
	beq	.L351
	ldr	r1, [r5, #132]
	cmp	r1, #0
	bgt	.L387
.L351:
	mov	r3, #512
	strh	r3, [r4, #48]	@ movhi
	strh	r3, [r4, #112]	@ movhi
.L352:
	ldr	r3, [r5, #180]
	cmp	r3, #0
	beq	.L353
	ldr	r1, [r5, #188]
	cmp	r1, #0
	bgt	.L388
.L353:
	mov	r3, #512
	strh	r3, [r4, #56]	@ movhi
	strh	r3, [r4, #120]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L388:
	ldr	ip, .L389+28
	ldr	r0, [r5, #220]
	ldr	r2, [r5, #184]
	ldr	lr, .L389+32
	strh	ip, [r4, #56]	@ movhi
	ldr	r3, .L389+36
	ldr	ip, .L389+40
	strh	r3, [r4, #58]	@ movhi
	strh	r0, [r4, #60]	@ movhi
	strh	lr, [r4, #120]	@ movhi
	ldr	r5, .L389+44
	strh	ip, [r4, #122]	@ movhi
	mov	r3, #4
	mov	r0, #0
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #124]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L387:
	ldr	r0, [r5, #164]
	ldr	r3, .L389+48
	ldr	r2, .L389+36
	ldr	lr, .L389+52
	ldr	ip, .L389+40
	strh	r3, [r4, #48]	@ movhi
	strh	r2, [r4, #50]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #128]
	ldr	r6, .L389+44
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
	b	.L352
.L386:
	ldr	r0, [r5, #108]
	ldr	r3, .L389+56
	ldr	r2, .L389+36
	ldr	lr, .L389+60
	ldr	ip, .L389+40
	strh	r3, [r4, #40]	@ movhi
	strh	r2, [r4, #42]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #72]
	ldr	r6, .L389+44
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
	b	.L350
.L385:
	ldr	r0, [r5, #52]
	ldr	r3, .L389+64
	ldr	r2, .L389+36
	ldr	lr, .L389+68
	ldr	ip, .L389+40
	strh	r3, [r4, #32]	@ movhi
	strh	r2, [r4, #34]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L389+44
	strh	r0, [r4, #36]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #96]	@ movhi
	strh	ip, [r4, #98]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #100]	@ movhi
	b	.L348
.L384:
	ldr	ip, .L389+28
	ldr	r0, [r5, #220]
	ldr	r2, [r5, #184]
	ldr	r3, .L389+72
	ldr	lr, .L389+32
	strh	ip, [r4, #24]	@ movhi
	ldr	ip, .L389+76
	strh	r3, [r4, #26]	@ movhi
	strh	r0, [r4, #28]	@ movhi
	mov	r3, #4
	mov	r0, #0
	strh	lr, [r4, #88]	@ movhi
	ldr	r5, .L389+44
	strh	ip, [r4, #90]	@ movhi
	mov	lr, pc
	bx	r5
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #92]	@ movhi
	b	.L346
.L383:
	ldr	r0, [r5, #164]
	ldr	r3, .L389+48
	ldr	r2, .L389+72
	ldr	lr, .L389+52
	ldr	ip, .L389+76
	strh	r3, [r4, #16]	@ movhi
	strh	r2, [r4, #18]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #128]
	ldr	r6, .L389+44
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
	b	.L344
.L382:
	ldr	r0, [r5, #108]
	ldr	r3, .L389+56
	ldr	r2, .L389+72
	ldr	lr, .L389+60
	ldr	ip, .L389+76
	strh	r3, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #72]
	ldr	r6, .L389+44
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
	b	.L342
.L381:
	ldr	r0, [r5, #52]
	ldr	r3, .L389+64
	ldr	r2, .L389+72
	ldr	lr, .L389+68
	ldr	ip, .L389+76
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	mov	r3, #4
	ldr	r2, [r5, #16]
	ldr	r6, .L389+44
	strh	r0, [r4, #4]	@ movhi
	mov	r0, #0
	strh	lr, [r4, #64]	@ movhi
	strh	ip, [r4, #66]	@ movhi
	mov	lr, pc
	bx	r6
	rsb	r0, r0, #388
	add	r0, r0, #1
	lsl	r0, r0, #1
	strh	r0, [r4, #68]	@ movhi
	b	.L340
.L390:
	.align	2
.L389:
	.word	turnPoints
	.word	shadowOAM
	.word	8233
	.word	511
	.word	834
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
	ldr	r6, .L415
	ldr	r4, .L415+4
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L415+8
	ldr	r4, .L415+12
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L415+16
	ldr	r4, .L415+20
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L415+24
	ldr	r4, .L415+28
	str	r2, [r6]
	strb	r2, [r4]
	ldr	r6, .L415+32
	ldr	r4, .L415+36
	strb	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L415+40
	ldr	r4, .L415+44
	str	r2, [r6]
	str	r2, [r4]
	ldr	r6, .L415+48
	ldr	r4, .L415+52
	str	r2, [r6]
	mov	ip, r2
	mov	lr, r2
	str	r2, [r4]
	ldr	r2, .L415+56
	ldr	r1, .L415+60
	ldr	r6, .L415+64
	str	r5, [r2]
	mov	r3, r1
	str	r1, [r6]
	add	r1, r1, #224
.L393:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L392
	ldr	r2, [r3, #20]
	cmp	r2, #0
	movgt	ip, #1
	addgt	lr, lr, ip
.L392:
	add	r3, r3, #56
	cmp	r1, r3
	bne	.L393
	mov	r3, #0
	ldr	r2, .L415+68
	ldr	r5, .L415+72
	cmp	ip, #0
	strne	lr, [r4]
	str	r3, [r5]
	str	r3, [r2, #68]
	str	r3, [r2, #124]
	str	r3, [r2, #180]
	cmp	r0, #5
	ldrls	pc, [pc, r0, asl #2]
	b	.L395
.L397:
	.word	.L402
	.word	.L401
	.word	.L400
	.word	.L399
	.word	.L398
	.word	.L396
.L396:
	mov	r6, #1
	ldr	lr, .L415+76
	ldr	ip, .L415+68
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r4, .L415+80
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
	ldr	r5, .L415+84
	ldm	r4, {r0, r1}
	stm	lr, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	lr, .L415+88
.L413:
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
.L402:
	ldr	r4, .L415+92
	ldr	ip, .L415+68
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
	ldr	lr, .L415+96
.L414:
	ldmia	lr!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
.L412:
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
.L401:
	ldr	lr, .L415+88
	ldr	ip, .L415+68
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
	ldr	r5, .L415+92
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	lr, .L415+96
	stmia	r4!, {r0, r1, r2, r3}
	b	.L413
.L400:
	ldr	r4, .L415+100
	ldr	ip, .L415+68
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, .L415+88
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
	ldr	r4, .L415+92
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
.L399:
	ldr	lr, .L415+84
	ldr	ip, .L415+68
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r5, .L415+88
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
	ldr	lr, .L415+92
	stm	r4, {r0, r1}
	b	.L414
.L398:
	ldr	lr, .L415+80
	ldr	ip, .L415+68
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
	ldr	r5, .L415+88
	ldm	lr, {r0, r1}
	stm	r4, {r0, r1}
	ldmia	r5!, {r0, r1, r2, r3}
	add	r4, ip, #64
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	lr, .L415+92
	stmia	r4!, {r0, r1, r2, r3}
	b	.L413
.L395:
	ldr	r4, .L415+92
	ldr	ip, .L415+68
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, .L415+96
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
	b	.L412
.L416:
	.align	2
.L415:
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
	ldr	r3, .L420
	add	r2, r3, #800
.L418:
	strh	r1, [r3, #224]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L418
	mov	r2, #0
	ldr	r3, .L420+4
	str	r2, [r3]
	bx	lr
.L421:
	.align	2
.L420:
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
	beq	.L422
	mov	lr, r1
	ldr	r9, .L438
	ldr	r10, .L438+4
	b	.L428
.L437:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L422
.L428:
	cmp	ip, #10
	add	r5, lr, #12
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L425
	cmp	ip, #32
	beq	.L426
	ldr	ip, [r9]
	add	r4, ip, #28
	cmp	r4, #127
	bgt	.L422
	and	r7, r2, #255
	lsl	r6, lr, #23
	orr	r7, r7, #8192
	lsl	fp, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	strh	r7, [r10, fp]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L438+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L426:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #6
	addge	r2, r2, #8
.L425:
	cmp	r2, r8
	blt	.L437
.L422:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L439:
	.align	2
.L438:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L603
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #12
	bl	checkBattleStatus
	ldr	r3, .L603+4
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L440
	ldr	r3, .L603+8
	ldr	r6, [r3]
	ldr	r8, .L603+12
	ldr	r7, .L603+16
	cmp	r6, #0
	str	r4, [r8]
	str	r4, [r7]
	bne	.L444
	ldr	r4, .L603+20
	ldr	r5, .L603+24
	ldr	r3, [r4]
	ldrh	r1, [r5]
	cmp	r3, #5
	and	r2, r1, #128
	beq	.L594
	sub	r0, r3, #2
	cmp	r0, #2
	bhi	.L448
	cmp	r2, #0
	beq	.L449
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L449
	ldr	r2, .L603+32
	ldr	lr, .L603+36
	ldr	r2, [r2]
	ldr	r0, [lr]
	cmp	r2, #1
	add	ip, r0, #1
	beq	.L595
	cmp	ip, #3
	bgt	.L451
	ldr	r2, .L603+40
	rsb	r0, r0, r0, lsl #3
	add	r2, r2, r0, lsl #3
.L455:
	ldr	r0, [r2, #68]
	cmp	r0, #0
	beq	.L454
	ldr	r0, [r2, #76]
	cmp	r0, #0
	bgt	.L590
.L454:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #56
	bne	.L455
.L451:
	cmp	r3, #3
	beq	.L596
.L447:
	tst	r1, #1
	beq	.L473
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	tst	r2, #1
	moveq	r2, #1
	streq	r2, [r8]
.L473:
	tst	r1, #2
	beq	.L474
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	tst	r2, #2
	moveq	r2, #1
	streq	r2, [r7]
.L474:
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L475
.L477:
	.word	.L482
	.word	.L481
	.word	.L480
	.word	.L479
	.word	.L478
	.word	.L476
.L440:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L594:
	cmp	r2, #0
	beq	.L446
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	ands	r2, r2, #128
	bne	.L446
	ldr	r0, .L603+44
	ldr	lr, .L603+36
	ldr	ip, [r0]
	ldr	r0, [lr]
	sub	ip, ip, #1
	cmp	ip, r0
	ble	.L447
	ldr	r1, .L603+48
	add	r3, r0, #1
	ldr	r1, [r1]
	str	r3, [lr]
	ldr	r0, .L603+52
	ldr	r3, .L603+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L447
.L446:
	tst	r1, #64
	beq	.L447
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	ands	r2, r2, #64
	bne	.L447
	ldr	ip, .L603+36
	ldr	r0, [ip]
	cmp	r0, #0
	beq	.L447
	ldr	r1, .L603+48
	sub	r3, r0, #1
	b	.L593
.L449:
	tst	r1, #64
	beq	.L451
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L451
	ldr	r2, .L603+32
	ldr	lr, .L603+36
	ldr	r2, [r2]
	ldr	r0, [lr]
	cmp	r2, #1
	sub	ip, r0, #1
	beq	.L597
	cmp	ip, #0
	blt	.L451
	ldr	r2, .L603+40
	rsb	r0, r0, r0, lsl #3
	add	r2, r2, r0, lsl #3
.L460:
	ldr	r0, [r2, #-44]
	cmp	r0, #0
	beq	.L459
	ldr	r0, [r2, #-36]
	cmp	r0, #0
	bgt	.L590
.L459:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r2, r2, #56
	bne	.L460
	b	.L451
.L476:
	bl	replaceMenu
.L475:
	mov	r1, #512
	ldr	r3, .L603+60
	add	r2, r3, #800
.L499:
	strh	r1, [r3, #224]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L499
	mov	ip, #0
	mov	r4, #24
	ldr	r0, .L603+64
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L603+68
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L603+72
	bl	drawText
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	drawCombatants
.L444:
	ldr	r6, .L603+76
	mov	lr, pc
	bx	r6
	ldr	r2, .L603+80
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #2
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3
	cmp	r0, #6
	beq	.L598
	ldr	r5, .L603+84
	ldr	r9, .L603+88
	ldr	r2, [r5]
	ldr	r3, [r9]
	cmp	r2, #0
	ldr	r7, [r3, #24]
	beq	.L484
	ldr	r3, .L603+92
	ldr	r3, [r3]
	cmp	r3, #0
	subeq	r7, r7, #1
.L484:
	mov	lr, pc
	bx	r6
	ldr	r8, .L603+96
	mov	r1, r7
	mov	lr, pc
	bx	r8
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L485
	ldr	r3, [r9]
.L486:
	add	r7, r1, #6
	add	r3, r3, r7, lsl #2
	ldr	r3, [r3, #4]
	ldr	r5, [r3, #80]
	cmp	r5, #0
	bne	.L487
	ldr	r4, .L603+40
	mov	fp, r5
	mov	r10, r4
	mov	r3, r4
	ldr	r2, .L603+32
	str	r5, [r2]
	add	r0, r4, #224
.L489:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L488
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	fp, fp, #1
.L488:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L489
	mov	lr, pc
	bx	r6
	mov	r1, fp
	mov	lr, pc
	bx	r8
	mov	r2, r1
.L492:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L490
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ble	.L490
	cmp	r2, #0
	beq	.L599
	sub	r2, r2, #1
.L490:
	add	r5, r5, #1
	cmp	r5, #4
	add	r4, r4, #56
	bne	.L492
	b	.L475
.L448:
	cmp	r2, #0
	beq	.L466
	ldr	r3, .L603+28
	ldrh	r3, [r3]
	ands	r2, r3, #128
	bne	.L466
	ldr	r3, .L603+44
	ldr	ip, .L603+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #1
	cmp	r0, r3
	ble	.L467
	cmp	r3, #2
	cmpne	r3, #5
	beq	.L467
	ldr	r1, .L603+48
	add	r3, r3, #1
.L591:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L603+52
	ldr	r3, .L603+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L467:
	tst	r1, #16
	beq	.L468
	ldr	r3, .L603+28
	ldrh	r3, [r3]
	ands	r2, r3, #16
	bne	.L468
	ldr	r3, .L603+44
	ldr	ip, .L603+36
	ldr	r0, [r3]
	ldr	r3, [ip]
	sub	r0, r0, #3
	cmp	r0, r3
	movgt	r0, #1
	movle	r0, #0
	cmp	r3, #2
	movgt	r0, #0
	cmp	r0, #0
	beq	.L592
	ldr	r1, .L603+48
	add	r3, r3, #3
.L593:
	ldr	r1, [r1]
	str	r3, [ip]
	ldr	r0, .L603+52
	ldr	r3, .L603+56
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
.L592:
	ldr	r3, [r4]
	b	.L447
.L466:
	tst	r1, #64
	beq	.L467
	ldr	r3, .L603+28
	ldrh	r3, [r3]
	ands	r2, r3, #64
	bne	.L467
	ldr	ip, .L603+36
	ldr	r3, [ip]
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L467
	ldr	r1, .L603+48
	sub	r3, r3, #1
	b	.L591
.L468:
	tst	r1, #32
	beq	.L592
	ldr	r3, .L603+28
	ldrh	r3, [r3]
	ands	r2, r3, #32
	bne	.L592
	ldr	ip, .L603+36
	ldr	r3, [ip]
	cmp	r3, #2
	ble	.L592
	ldr	r1, .L603+48
	sub	r3, r3, #3
	b	.L593
.L485:
	ldr	r3, .L603+92
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r3, [r9]
	bne	.L486
	ldr	r2, [r3, #20]
	cmp	r2, #9
	movle	r1, #5
	b	.L486
.L478:
	bl	captureMenu
	b	.L475
.L479:
	bl	inspectMenu
	b	.L475
.L480:
	bl	targetMenu
	b	.L475
.L481:
	bl	attackMenu
	b	.L475
.L482:
	bl	frontMenu
	b	.L475
.L596:
	tst	r1, #16
	beq	.L461
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L461
	ldr	r2, .L603+32
	ldr	ip, [r2]
	cmp	ip, #0
	bne	.L461
	mov	r0, #1
	str	r0, [r2]
	ldr	r2, .L603+100
.L463:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L462
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L600
.L462:
	add	ip, ip, #1
	cmp	ip, #4
	add	r2, r2, #56
	bne	.L463
	b	.L447
.L487:
	ldr	r5, .L603+100
	mov	r1, #1
	mov	fp, #0
	mov	r10, r5
	mov	r3, r5
	ldr	r2, .L603+32
	str	r1, [r2]
	add	r0, r5, #224
.L494:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L493
	ldr	r2, [r3, #20]
	cmp	r2, #0
	addgt	fp, fp, #1
.L493:
	add	r3, r3, #56
	cmp	r3, r0
	bne	.L494
	mov	lr, pc
	bx	r6
	mov	r1, fp
	mov	lr, pc
	bx	r8
	mov	r2, r1
.L497:
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L495
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ble	.L495
	cmp	r2, #0
	beq	.L601
	sub	r2, r2, #1
.L495:
	add	r4, r4, #1
	cmp	r4, #4
	add	r5, r5, #56
	bne	.L497
	b	.L475
.L461:
	tst	r1, #32
	beq	.L447
	ldr	r2, .L603+28
	ldrh	r2, [r2]
	ands	r2, r2, #32
	bne	.L447
	ldr	r0, .L603+32
	ldr	ip, [r0]
	cmp	ip, #1
	bne	.L447
	str	r2, [r0]
	ldr	r2, .L603+40
.L465:
	ldr	r0, [r2, #12]
	cmp	r0, #0
	beq	.L464
	ldr	r0, [r2, #20]
	cmp	r0, #0
	bgt	.L602
.L464:
	add	r6, r6, #1
	cmp	r6, #4
	add	r2, r2, #56
	bne	.L465
	b	.L447
.L598:
	ldr	r3, .L603+88
	ldr	r1, .L603+104
	ldr	r2, [r3]
	ldr	r0, .L603+68
	ldr	r3, .L603+108
	mov	lr, pc
	bx	r3
	bl	finishTurn
	b	.L475
.L590:
	ldr	r3, .L603+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L603+52
	ldr	r3, .L603+56
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	ldrh	r1, [r5]
	b	.L451
.L595:
	cmp	ip, #3
	bgt	.L451
	ldr	r2, .L603+100
	rsb	r0, r0, r0, lsl #3
	add	r0, r2, r0, lsl #3
.L453:
	ldr	r2, [r0, #68]
	cmp	r2, #0
	beq	.L452
	ldr	r2, [r0, #76]
	cmp	r2, #0
	bgt	.L590
.L452:
	add	ip, ip, #1
	cmp	ip, #4
	add	r0, r0, #56
	bne	.L453
	b	.L451
.L597:
	cmp	ip, #0
	blt	.L451
	ldr	r2, .L603+100
	rsb	r0, r0, r0, lsl #3
	add	r0, r2, r0, lsl #3
.L458:
	ldr	r2, [r0, #-44]
	cmp	r2, #0
	beq	.L457
	ldr	r2, [r0, #-36]
	cmp	r2, #0
	bgt	.L590
.L457:
	sub	ip, ip, #1
	cmn	ip, #1
	sub	r0, r0, #56
	bne	.L458
	b	.L451
.L599:
	ldr	r3, [r9]
	rsb	r5, r5, r5, lsl #3
	add	r7, r3, r7, lsl #2
	ldr	r0, [r7, #4]
	add	r1, r10, r5, lsl #3
	bl	executeMove
	b	.L475
.L601:
	ldr	r3, [r9]
	rsb	r4, r4, r4, lsl #3
	add	r7, r3, r7, lsl #2
	ldr	r0, [r7, #4]
	add	r1, r10, r4, lsl #3
	bl	executeMove
	b	.L475
.L600:
	ldr	r2, .L603+48
	ldr	r3, .L603+36
	ldr	r1, [r2]
	str	ip, [r3]
	mov	r2, #0
	ldr	r3, .L603+56
	ldr	r0, .L603+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L447
.L602:
	ldr	r2, .L603+48
	ldr	r3, .L603+36
	ldr	r1, [r2]
	str	r6, [r3]
	mov	r2, #0
	ldr	r3, .L603+56
	ldr	r0, .L603+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r5]
	ldr	r3, [r4]
	b	.L447
.L604:
	.align	2
.L603:
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
	.word	.LC17
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
