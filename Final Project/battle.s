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
	.global	resetOpponents
	.arch armv4t
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
	ldr	r3, .L3
	str	r2, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	bx	lr
.L4:
	.align	2
.L3:
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
	.global	drawCombatants
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCombatants, %function
drawCombatants:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L56
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L9
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ble	.L9
	mov	ip, #0
	ldr	r3, .L56+4
	ldr	r1, .L56+8
	strh	r1, [r3, #2]	@ movhi
	ldr	r1, [r2, #12]
	ldr	r0, .L56+12
	cmp	r1, #0
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3]	@ movhi
	bne	.L49
.L11:
	mov	r1, #512
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L13
.L53:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	ble	.L13
	mov	ip, #0
	ldr	r1, .L56+8
	strh	r1, [r3, #18]	@ movhi
	ldr	r1, [r2, #36]
	ldr	r0, .L56+16
	cmp	r1, #0
	strh	ip, [r3, #20]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	bne	.L50
.L15:
	mov	r2, #512
	strh	r2, [r3, #24]	@ movhi
	ldr	r2, .L56+20
	ldr	r1, [r2]
	cmp	r1, #0
	beq	.L17
.L54:
	ldr	r1, [r2, #4]
	cmp	r1, #0
	ble	.L17
	mov	ip, #16
	ldr	r1, .L56+24
	strh	r1, [r3, #34]	@ movhi
	ldr	r1, [r2, #12]
	ldr	r0, .L56+12
	cmp	r1, #0
	strh	ip, [r3, #36]	@ movhi
	strh	r0, [r3, #32]	@ movhi
	bne	.L51
.L19:
	mov	r1, #512
	strh	r1, [r3, #40]	@ movhi
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L21
.L55:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	ble	.L21
	mov	ip, #16
	ldr	r1, .L56+24
	strh	r1, [r3, #50]	@ movhi
	ldr	r1, [r2, #36]
	ldr	r0, .L56+16
	cmp	r1, #0
	strh	ip, [r3, #52]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	bne	.L52
.L23:
	mov	r2, #512
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L9:
	mov	r1, #512
	ldr	r3, .L56+4
	strh	r1, [r3]	@ movhi
	ldr	r1, [r2, #12]
	cmp	r1, #0
	beq	.L11
.L49:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	ble	.L11
	mov	ip, #0
	ldr	r1, .L56+8
	strh	r1, [r3, #10]	@ movhi
	ldr	r1, [r2, #24]
	ldr	r0, .L56+28
	cmp	r1, #0
	strh	ip, [r3, #12]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	bne	.L53
.L13:
	mov	r1, #512
	strh	r1, [r3, #16]	@ movhi
	ldr	r1, [r2, #36]
	cmp	r1, #0
	beq	.L15
.L50:
	ldr	r2, [r2, #40]
	cmp	r2, #0
	ble	.L15
	mov	r0, #0
	ldr	r2, .L56+8
	ldr	r1, .L56+32
	strh	r2, [r3, #26]	@ movhi
	ldr	r2, .L56+20
	strh	r1, [r3, #24]	@ movhi
	ldr	r1, [r2]
	cmp	r1, #0
	strh	r0, [r3, #28]	@ movhi
	bne	.L54
.L17:
	mov	r1, #512
	strh	r1, [r3, #32]	@ movhi
	ldr	r1, [r2, #12]
	cmp	r1, #0
	beq	.L19
.L51:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	ble	.L19
	mov	ip, #16
	ldr	r1, .L56+24
	strh	r1, [r3, #42]	@ movhi
	ldr	r1, [r2, #24]
	ldr	r0, .L56+28
	cmp	r1, #0
	strh	ip, [r3, #44]	@ movhi
	strh	r0, [r3, #40]	@ movhi
	bne	.L55
.L21:
	mov	r1, #512
	strh	r1, [r3, #48]	@ movhi
	ldr	r1, [r2, #36]
	cmp	r1, #0
	beq	.L23
.L52:
	ldr	r2, [r2, #40]
	cmp	r2, #0
	ble	.L23
	mov	r0, #16
	ldr	r1, .L56+32
	ldr	r2, .L56+24
	strh	r0, [r3, #60]	@ movhi
	strh	r1, [r3, #56]	@ movhi
	strh	r2, [r3, #58]	@ movhi
	bx	lr
.L57:
	.align	2
.L56:
	.word	battleAllies
	.word	shadowOAM
	.word	-32760
	.word	16399
	.word	16479
	.word	battleOpponents
	.word	-32576
	.word	16439
	.word	16519
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
	mov	r3, #0
	ldr	r2, .L62
	str	lr, [sp, #-4]!
	ldr	ip, .L62+4
	str	r3, [r2]
	ldr	lr, .L62+8
	ldr	r1, .L62+12
	ldr	r2, .L62+16
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L62+20
	ldr	r2, .L62+24
	ldr	lr, .L62+28
	ldr	ip, .L62+32
	cmp	r0, #1
	str	r3, [r1]
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r2, #12]
	str	r3, [r2, #24]
	str	r3, [r2, #36]
	moveq	r1, #14
	moveq	r3, #6
	movne	r0, #1
	movne	r1, #8
	movne	r3, #5
	ldr	lr, [sp], #4
	stm	r2, {r0, r1, r3}
	b	drawCombatants
.L63:
	.align	2
.L62:
	.word	battleStatus
	.word	turn
	.word	lettersActive
	.word	menu
	.word	menuOption
	.word	go
	.word	battleOpponents
	.word	action
	.word	target
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
	ldr	r3, .L67
	add	r2, r3, #960
.L65:
	strh	r1, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L65
	mov	r2, #0
	ldr	r3, .L67+4
	str	r2, [r3]
	bx	lr
.L68:
	.align	2
.L67:
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
	beq	.L69
	mov	lr, r1
	ldr	r9, .L85
	ldr	r10, .L85+4
	b	.L75
.L84:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L69
.L75:
	cmp	ip, #10
	add	r5, lr, #14
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L72
	cmp	ip, #32
	beq	.L73
	ldr	ip, [r9]
	add	r4, ip, #8
	cmp	r4, #127
	bgt	.L69
	lsl	r6, lr, #23
	lsl	r7, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	and	fp, r2, #255
	strh	fp, [r10, r7]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L85+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L73:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #7
	addge	r2, r2, #8
.L72:
	cmp	r2, r8
	blt	.L84
.L69:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	lettersActive
	.word	shadowOAM
	.word	.LANCHOR0
	.size	drawText, .-drawText
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"PLAYER PASSES\000"
	.align	2
.LC1:
	.ascii	"YOU ATTACK ENEMY %d\000"
	.align	2
.LC2:
	.ascii	"HP %d->%d\000"
	.align	2
.LC3:
	.ascii	"ENEMY PASSES\000"
	.align	2
.LC4:
	.ascii	"ENEMY ATTACKS ALLY %d\000"
	.align	2
.LC5:
	.ascii	"WHAT WILL YOU DO?\000"
	.align	2
.LC6:
	.ascii	"%cATTACK\012%cPASS\000"
	.align	2
.LC7:
	.ascii	"CHOOSE AN ATTACK\000"
	.align	2
.LC8:
	.ascii	"%cPUNCH\012%cKICK\000"
	.align	2
.LC9:
	.ascii	"CHOOSE A TARGET\000"
	.align	2
.LC10:
	.ascii	"%cENEMY1\012\000"
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
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L235
	ldr	r3, [r5]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L88
	ldr	r4, .L235+4
	ldr	r6, [r4]
	cmp	r6, #120
	beq	.L223
	cmp	r6, #0
	bgt	.L221
	mov	r3, #120
	ldr	r7, .L235+8
	mov	r2, #0
	ldr	r0, [r7]
	rsbs	r0, r0, #1
	movcc	r0, #0
	str	r3, [r4]
	ldr	r3, .L235+12
	ldr	r1, .L235+16
	str	r2, [r3]
	ldr	r3, .L235+20
	str	r2, [r1]
	str	r2, [r3]
	ldr	r1, .L235+24
	ldr	r3, .L235+28
	str	r0, [r7]
	str	r2, [r5]
	str	r2, [r1]
	add	r1, r3, #48
.L106:
	ldr	r2, [r3, #-4]
	cmp	r2, #0
	beq	.L104
	ldr	r2, [r3]
	cmp	r2, #0
	bgt	.L105
.L104:
	add	r3, r3, #12
	cmp	r3, r1
	bne	.L106
.L107:
	mvn	r2, #0
	ldr	r3, .L235+32
	str	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L88:
	ldr	r7, .L235+8
	ldr	r0, [r7]
.L110:
	cmp	r0, #0
	beq	.L224
	ldr	r4, .L235+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L235+40
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	subs	r3, r0, r3
	bne	.L225
	mov	r2, #1
	ldr	r3, .L235+20
	str	r2, [r3]
.L132:
	mov	lr, pc
	bx	r4
	mov	ip, #0
	mov	r1, r0
	mov	r3, ip
	ldr	r6, .L235+24
	subs	r0, ip, r0
	and	r0, r0, #3
	ldr	r4, [r6]
	ldr	r2, .L235+28
	and	r1, r1, #3
	rsbpl	r1, r0, #0
.L135:
	ldr	r0, [r2, #-4]
	cmp	r0, #0
	sub	lr, r1, r3
	beq	.L134
	ldr	r0, [r2]
	cmp	r0, #0
	movgt	r0, #1
	movle	r0, #0
	cmp	lr, #0
	movgt	r0, #0
	cmp	r0, #0
	movne	ip, r0
	movne	r4, r3
.L134:
	add	r3, r3, #1
	cmp	r3, #4
	add	r2, r2, #12
	bne	.L135
	mov	r3, #1
	cmp	ip, #0
	strne	r4, [r6]
	ldr	r0, [r7]
	str	r3, [r5]
.L121:
	mov	r1, #512
	ldr	r3, .L235+44
	add	r2, r3, #960
.L137:
	strh	r1, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L137
	mov	r2, #0
	ldr	r3, .L235+48
	cmp	r0, r2
	str	r2, [r3]
	bne	.L138
	ldr	r3, .L235+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L139
	cmp	r3, #2
	beq	.L140
	cmp	r3, r2
	beq	.L226
.L138:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	drawCombatants
.L224:
	ldr	r3, .L235+52
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L227
.L114:
	tst	r3, #64
	beq	.L115
	ldr	r2, .L235+56
	ldrh	r2, [r2]
	tst	r2, #64
	ldreq	r1, .L235+16
	ldreq	r2, [r1]
	subeq	r2, r2, #1
	streq	r2, [r1]
.L115:
	tst	r3, #16
	beq	.L116
	ldr	r2, .L235+56
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L116
	ldr	r1, .L235+16
	ldr	r2, [r1]
	add	r2, r2, #3
	str	r2, [r1]
.L117:
	ands	r1, r3, #1
	ldrne	r2, .L235+56
	ldrhne	r1, [r2]
	mvnne	r1, r1
	andne	r1, r1, #1
	ands	r3, r3, #2
	beq	.L119
	ldr	r3, .L235+56
	ldrh	r3, [r3]
	lsr	r3, r3, #1
	eor	r3, r3, #1
	and	r3, r3, #1
.L119:
	ldr	ip, .L235+12
	ldr	r2, [ip]
	cmp	r2, #1
	beq	.L144
	cmp	r2, #2
	beq	.L145
	cmp	r2, #0
	bne	.L121
	ldr	r0, .L235+16
	ldr	r3, [r0]
	cmp	r3, #1
	ble	.L120
	mov	r3, #1
	cmp	r1, #0
	str	r3, [r0]
	bne	.L124
.L219:
	mov	r0, #0
	b	.L121
.L223:
	ldr	r3, .L235+8
	ldr	r2, [r3]
	ldr	r3, .L235+20
	cmp	r2, #0
	ldr	r3, [r3]
	bne	.L90
	cmp	r3, #2
	beq	.L91
	cmp	r3, #3
	bne	.L228
	mov	r0, #512
	ldr	r6, .L235+24
	ldr	r2, [r6]
	ldr	r5, .L235+60
	ldr	r3, .L235+64
	add	r1, r2, r2, lsl #1
	add	r1, r5, r1, lsl #2
	ldr	r7, [r1, #4]
	ldr	ip, [r3, #8]
	ldr	r3, .L235+44
	sub	ip, r7, ip
	str	ip, [r1, #4]
	add	r1, r3, #960
.L96:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L96
.L222:
	mov	ip, #0
	mov	r8, #24
	ldr	r3, .L235+48
	ldr	r1, .L235+68
.L217:
	ldr	r9, .L235+72
	ldr	r0, .L235+76
	str	ip, [r3]
	mov	lr, pc
	bx	r9
	mov	r3, #121
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L235+76
	str	r8, [sp]
	bl	drawText
	ldr	r3, [r6]
	add	r3, r3, r3, lsl #1
	add	r5, r5, r3, lsl #2
	mov	r2, r7
	ldr	r3, [r5, #4]
	ldr	r1, .L235+80
	ldr	r0, .L235+76
	mov	lr, pc
	bx	r9
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r8, [sp]
	ldr	r0, .L235+76
	bl	drawText
	ldr	r6, [r4]
.L221:
	sub	r6, r6, #1
	str	r6, [r4]
.L87:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L105:
	ldr	r3, .L235+64
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ldrgt	r3, .L235+84
	addgt	r1, r3, #48
	ble	.L107
.L111:
	ldr	r2, [r3, #-4]
	cmp	r2, #0
	beq	.L109
	ldr	r2, [r3]
	cmp	r2, #0
	bgt	.L110
.L109:
	add	r3, r3, #12
	cmp	r1, r3
	bne	.L111
	mov	r2, #1
	ldr	r3, .L235+32
	str	r2, [r3]
	b	.L87
.L227:
	ldr	r2, .L235+56
	ldrh	r2, [r2]
	tst	r2, #128
	bne	.L114
	ldr	r1, .L235+16
	ldr	r2, [r1]
	add	r2, r2, #1
	str	r2, [r1]
	b	.L115
.L228:
	cmp	r3, #1
	bne	.L221
	mov	r1, #512
	ldr	r3, .L235+44
	add	r2, r3, #960
.L94:
	strh	r1, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L94
	mov	r3, #24
	mov	ip, #0
	ldr	r0, .L235+48
	str	r3, [sp]
	mov	r2, #11
	str	ip, [r0]
	mov	r3, #121
	mov	r1, #59
	ldr	r0, .L235+88
	bl	drawText
	b	.L221
.L116:
	tst	r3, #32
	beq	.L117
	ldr	r2, .L235+56
	ldrh	r2, [r2]
	tst	r2, #32
	ldreq	r1, .L235+16
	ldreq	r2, [r1]
	subeq	r2, r2, #3
	streq	r2, [r1]
	b	.L117
.L145:
	ldr	lr, .L235+16
	ldr	r2, [lr]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [lr]
	cmp	r1, #0
	bne	.L229
.L149:
	cmp	r3, #0
	beq	.L157
	mov	r2, #0
	mov	r3, #1
	str	r2, [lr]
	str	r3, [ip]
	b	.L121
.L157:
	mov	r0, r3
	b	.L121
.L144:
	ldr	lr, .L235+16
	ldr	r4, [lr]
	cmp	r4, #1
	ble	.L125
	cmp	r1, #0
	str	r2, [lr]
	bne	.L126
.L127:
	cmp	r3, #0
	beq	.L157
	mov	r3, #0
	str	r3, [lr]
	str	r3, [ip]
	b	.L121
.L225:
	cmp	r3, #1
	beq	.L230
	cmp	r3, #2
	moveq	r2, #3
	ldreq	r3, .L235+20
	streq	r2, [r3]
	b	.L132
.L226:
	mov	r2, #24
	mov	r3, #121
	str	r2, [sp]
	mov	r1, #59
	mov	r2, #11
	ldr	r0, .L235+92
	bl	drawText
	ldr	r3, .L235+16
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #32
	moveq	r2, #42
	bne	.L231
.L141:
	ldr	r1, .L235+96
.L220:
	ldr	r4, .L235+72
	ldr	r0, .L235+76
	mov	lr, pc
	bx	r4
	mov	r2, #24
	mov	r3, #121
	str	r2, [sp]
	mov	r1, #59
	mov	r2, #123
	ldr	r0, .L235+76
	bl	drawText
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	drawCombatants
.L140:
	mov	r4, #24
	mov	r2, #11
	mov	r3, #121
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L235+100
	bl	drawText
	ldr	r3, .L235+16
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r2, #42
	movne	r2, #32
	ldr	r1, .L235+104
	ldr	r3, .L235+72
	ldr	r0, .L235+76
	mov	lr, pc
	bx	r3
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L235+76
	bl	drawText
	b	.L138
.L139:
	mov	r2, #24
	mov	r3, #121
	str	r2, [sp]
	mov	r1, #59
	mov	r2, #11
	ldr	r0, .L235+108
	bl	drawText
	ldr	r3, .L235+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L232
	mov	r3, #32
	mov	r2, #42
	str	r3, [sp, #12]
.L142:
	ldr	r3, [sp, #12]
	ldr	r1, .L235+112
	b	.L220
.L90:
	cmp	r3, #2
	beq	.L97
	cmp	r3, #3
	beq	.L98
	cmp	r3, #1
	bne	.L221
	mov	r1, #512
	ldr	r3, .L235+44
	add	r2, r3, #960
.L99:
	strh	r1, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r2
	bne	.L99
	mov	r3, #24
	mov	ip, #0
	ldr	r0, .L235+48
	str	r3, [sp]
	mov	r2, #11
	str	ip, [r0]
	mov	r3, #121
	mov	r1, #59
	ldr	r0, .L235+116
	bl	drawText
	b	.L221
.L120:
	cmp	r3, #0
	blt	.L233
	cmp	r1, #0
	beq	.L219
	cmp	r3, #0
	beq	.L123
.L124:
	mov	r3, #1
	ldr	r2, .L235+20
	str	r3, [r5]
	str	r3, [r2]
	b	.L219
.L125:
	cmp	r4, #0
	blt	.L234
	cmp	r1, #0
	beq	.L127
	cmp	r4, #0
	beq	.L130
.L126:
	mov	r4, #3
	mov	r5, #0
	mov	r2, #2
	ldr	r1, .L235+20
	str	r5, [lr]
	str	r4, [r1]
	str	r2, [ip]
	b	.L127
.L231:
	cmp	r3, #1
	movne	r3, #32
	moveq	r3, #42
	movne	r2, r3
	moveq	r2, #32
	b	.L141
.L232:
	cmp	r3, #1
	movne	r3, #32
	movne	r2, r3
	strne	r3, [sp, #12]
	moveq	r3, #42
	moveq	r2, #32
	streq	r3, [sp, #12]
	b	.L142
.L91:
	mov	r0, #512
	ldr	r6, .L235+24
	ldr	r2, [r6]
	ldr	r5, .L235+60
	ldr	r3, .L235+64
	add	r1, r2, r2, lsl #1
	add	r1, r5, r1, lsl #2
	ldr	r7, [r1, #4]
	ldr	ip, [r3, #8]
	ldr	r3, .L235+44
	sub	ip, r7, ip
	str	ip, [r1, #4]
	add	r1, r3, #960
.L95:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L95
	b	.L222
.L97:
	mov	r0, #512
	ldr	r6, .L235+24
	ldr	r2, [r6]
	ldr	r5, .L235+64
	ldr	r3, .L235+60
	add	r1, r2, r2, lsl #1
	add	r1, r5, r1, lsl #2
	ldr	r7, [r1, #4]
	ldr	ip, [r3, #8]
	ldr	r3, .L235+44
	sub	ip, r7, ip
	str	ip, [r1, #4]
	add	r1, r3, #960
.L100:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r1, r3
	bne	.L100
.L218:
	mov	ip, #0
	mov	r8, #24
	ldr	r3, .L235+48
	ldr	r1, .L235+120
	b	.L217
.L98:
	mov	r0, #512
	ldr	r6, .L235+24
	ldr	r2, [r6]
	ldr	r5, .L235+64
	ldr	r3, .L235+60
	add	r1, r2, r2, lsl #1
	add	r1, r5, r1, lsl #2
	ldr	r7, [r1, #4]
	ldr	ip, [r3, #8]
	ldr	r3, .L235+44
	sub	ip, r7, ip
	str	ip, [r1, #4]
	add	r1, r3, #960
.L101:
	strh	r0, [r3, #64]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L101
	b	.L218
.L230:
	mov	r2, #2
	ldr	r3, .L235+20
	str	r2, [r3]
	b	.L132
.L233:
	cmp	r1, #0
	str	r2, [r0]
	beq	.L219
.L123:
	mov	r3, #1
	mov	r0, #0
	str	r3, [ip]
	b	.L121
.L229:
	mov	r1, #0
	mov	r4, #1
	ldr	r2, .L235+24
	str	r4, [r5]
	str	r1, [r2]
	b	.L149
.L234:
	mov	r2, #0
	cmp	r1, r2
	str	r2, [lr]
	beq	.L127
.L130:
	mov	r2, #2
	mov	r1, #0
	ldr	r4, .L235+20
	str	r2, [ip]
	str	r2, [r4]
	str	r1, [lr]
	b	.L127
.L236:
	.align	2
.L235:
	.word	go
	.word	.LANCHOR1
	.word	turn
	.word	menu
	.word	menuOption
	.word	action
	.word	target
	.word	battleAllies+4
	.word	battleStatus
	.word	rand
	.word	1431655766
	.word	shadowOAM
	.word	lettersActive
	.word	oldButtons
	.word	buttons
	.word	battleOpponents
	.word	battleAllies
	.word	.LC1
	.word	sprintf
	.word	.LANCHOR2
	.word	.LC2
	.word	battleOpponents+4
	.word	.LC0
	.word	.LC5
	.word	.LC6
	.word	.LC9
	.word	.LC10
	.word	.LC7
	.word	.LC8
	.word	.LC3
	.word	.LC4
	.size	updateBattle, .-updateBattle
	.comm	go,4,4
	.comm	target,4,4
	.comm	action,4,4
	.comm	menuOption,4,4
	.comm	turn,4,4
	.comm	menu,4,4
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
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	turnwait.5254, %object
	.size	turnwait.5254, 4
turnwait.5254:
	.word	120
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	buf.5253, %object
	.size	buf.5253, 128
buf.5253:
	.space	128
	.ident	"GCC: (devkitARM release 53) 9.1.0"
