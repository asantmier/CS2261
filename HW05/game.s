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
	.global	initMario
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMario, %function
initMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r0, #16
	ldr	r2, .L7
	str	lr, [sp, #-4]!
	ldr	r1, [r2]
	ldr	lr, .L7+4
	ldr	ip, .L7+8
	ldr	r2, .L7+12
	str	r3, [lr]
	str	r3, [ip]
	ldr	lr, .L7+16
	ldr	ip, .L7+20
	str	r3, [r2]
	ldr	r2, .L7+24
	cmp	r1, #1
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r2, #28]
	str	r3, [r2, #32]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	beq	.L2
	cmp	r1, #2
	moveq	r0, #176
	moveq	r1, #135
	stmeq	r2, {r0, r1}
	streq	r3, [r2, #24]
.L1:
	ldr	lr, [sp], #4
	bx	lr
.L2:
	mov	r0, #184
	mov	r1, #136
	str	r3, [r2, #24]
	stm	r2, {r0, r1}
	ldr	lr, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	level
	.word	hammerTimer
	.word	hammerState
	.word	jump
	.word	jumpTimer
	.word	ladder
	.word	mario
	.size	initMario, .-initMario
	.align	2
	.global	initDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDK, %function
initDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	ip, #64
	mov	r0, #32
	ldr	r3, .L14
	ldr	r1, [r3]
	str	lr, [sp, #-4]!
	ldr	r3, .L14+4
	ldr	lr, .L14+8
	cmp	r1, #1
	str	r2, [lr]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	beq	.L10
	cmp	r1, #2
	moveq	r1, #85
	stmeq	r3, {r1, r2}
.L9:
	ldr	lr, [sp], #4
	bx	lr
.L10:
	stm	r3, {r0, r2}
	ldr	lr, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	level
	.word	dk
	.word	barrelTimer
	.size	initDK, .-initDK
	.align	2
	.global	initPauline
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPauline, %function
initPauline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #16
	mov	ip, #32
	ldr	r3, .L21
	ldr	r1, [r3]
	ldr	r3, .L21+4
	cmp	r1, r0
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	beq	.L17
	cmp	r1, #2
	moveq	r1, #77
	stmeq	r3, {r1, r2}
.L16:
	ldr	lr, [sp], #4
	bx	lr
.L17:
	mov	r1, #120
	ldr	lr, [sp], #4
	stm	r3, {r1, r2}
	bx	lr
.L22:
	.align	2
.L21:
	.word	level
	.word	pauline
	.size	initPauline, .-initPauline
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L30
	ldr	r3, [r2]
	ldr	r1, .L30+4
	add	r3, r3, #1
	cmp	r0, #1
	push	{r4, lr}
	str	r0, [r1]
	str	r3, [r2]
	beq	.L24
	cmp	r0, #2
	moveq	r3, #67108864
	moveq	r2, #5120
	strheq	r2, [r3]	@ movhi
.L26:
	bl	initMario
	bl	initDK
	bl	initPauline
	mov	r2, #0
	mov	r1, #16
	ldr	r3, .L30+8
	add	r0, r3, #480
.L27:
	str	r2, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L27
	pop	{r4, lr}
	bx	lr
.L24:
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	b	.L26
.L31:
	.align	2
.L30:
	.word	levelsCleared
	.word	level
	.word	barrels
	.size	init, .-init
	.align	2
	.global	initBarrels
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBarrels, %function
initBarrels:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #16
	ldr	r3, .L36
	add	r0, r3, #480
.L33:
	str	r2, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L33
	bx	lr
.L37:
	.align	2
.L36:
	.word	barrels
	.size	initBarrels, .-initBarrels
	.align	2
	.global	updateMario
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMario, %function
updateMario:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L91
	ldr	r3, [r5]
	ldr	r4, .L91+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #36
	ble	.L39
	tst	r3, #3
	beq	.L88
.L40:
	sub	r3, r3, #1
	str	r3, [r5]
.L39:
	ldr	r1, [r4, #28]
	ldr	r2, .L91+8
	smull	r0, r3, r2, r1
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	bne	.L41
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	str	r2, [r4, #32]
.L41:
	ldr	r8, .L91+12
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L44
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L89
.L44:
	mov	r6, #1
	ldr	r3, .L91+16
	ldr	r7, .L91+20
	str	r3, [sp, #16]
	ldr	r9, .L91+24
	ldr	r3, [r3]
	add	fp, sp, #28
	add	r10, sp, #24
.L43:
	cmp	r3, #0
	beq	.L47
	ldr	r3, .L91+28
	ldrh	r2, [r3, #48]
	ands	r2, r2, #128
	beq	.L90
.L48:
	ldr	r2, .L91+32
	ldr	r3, [r2]
	cmp	r3, #10
	sub	r1, r3, #1
	ble	.L58
.L56:
	mvn	r3, #0
	str	r3, [r4, #12]
.L59:
	str	r1, [r2]
.L57:
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #16]
	ldr	ip, [r4]
	add	r1, r1, r2
	ldr	r2, [r7]
	add	r0, r0, r0, lsr #31
	str	r2, [sp]
	sub	r1, r1, #1
	ldr	r2, [r4, #8]
	add	r0, ip, r0, asr #1
	str	fp, [sp, #8]
	str	r10, [sp, #4]
	mov	lr, pc
	bx	r9
	ldr	r2, [r4, #16]
	ldr	ip, [sp, #24]
	ldr	r3, [r4, #20]
	ldr	r1, [sp, #28]
	add	r0, r2, r2, lsr #31
	sub	r0, ip, r0, asr #1
	sub	r1, r1, r3
	cmp	r0, #15
	add	r1, r1, #1
	stm	r4, {r0, r1}
	movle	r0, #16
	strle	r0, [r4]
	ble	.L62
	add	ip, r2, r0
	cmp	ip, #224
	rsbgt	r0, r2, #224
	strgt	r0, [r4]
.L62:
	cmp	r6, #0
	movne	lr, #0
	movne	ip, lr
	strne	lr, [r4, #28]
	strne	lr, [r4, #32]
	ldr	lr, [r5]
	ldreq	ip, [r4, #32]
	cmp	lr, #0
	ldr	lr, [r4, #24]
	ble	.L65
	ldr	r5, .L91+36
	ldr	r5, [r5]
	lsl	ip, ip, #16
	cmp	r5, #0
	lsr	ip, ip, #16
	bne	.L66
	lsl	ip, ip, #23
	ldr	r6, .L91+40
	cmp	lr, #1
	lsr	ip, ip, #16
	sub	r5, r5, #32768
	sub	r8, r1, #16
	orr	lr, r8, r5
	addeq	ip, ip, #12
	orr	r5, r0, r5
	addne	ip, ip, #10
	strh	lr, [r6]	@ movhi
	strh	r5, [r6, #2]	@ movhi
	strh	ip, [r6, #4]	@ movhi
.L68:
	ldr	ip, .L91+44
	add	r5, ip, #16
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L91+48
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L70
	ldr	r3, [r7]
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #1
	bl	init
.L70:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L58:
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r8]
	strgt	r3, [r4, #12]
	ldrle	r3, [r4, #12]
	b	.L59
.L88:
	ldr	r1, .L91+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L40
.L89:
	ldr	r3, .L91+28
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	str	r3, [sp, #20]
	bne	.L44
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r0, [r4]
	ldr	r7, .L91+20
	add	r1, r1, r2
	add	r3, r3, r3, lsr #31
	add	r0, r0, r3, asr #1
	ldr	r2, [r7]
	ldr	r3, .L91+52
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L45
	ldr	r3, .L91+16
	mov	r6, #1
	str	r3, [sp, #16]
	ldr	r9, .L91+24
	ldr	r3, [r3]
	add	fp, sp, #28
	add	r10, sp, #24
	b	.L43
.L46:
	ldr	r2, [sp, #20]
	mov	r6, r2
	ldr	r3, [r4, #4]
	ldr	r1, .L91+16
	sub	r3, r3, #2
	str	r2, [r1]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r3, [r4, #4]
.L47:
	ldr	r2, .L91+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	bne	.L52
	mvn	r2, #0
	mov	r6, r3
	str	r3, [r4, #24]
	str	r2, [r4, #8]
.L53:
	ldr	r3, .L91+56
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r8]
	beq	.L54
	ldr	r2, .L91+60
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L54
	cmp	r3, #0
	bne	.L48
	mov	r2, #1
	mov	r6, r3
	str	r2, [r8]
	mov	r1, #29
	ldr	r2, .L91+32
	b	.L56
.L54:
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #12]
	beq	.L57
	b	.L48
.L65:
	add	ip, lr, ip, lsl #5
	ldr	lr, .L91+40
	lsl	ip, ip, #1
	orr	r5, r0, #16384
	strh	ip, [lr, #4]	@ movhi
	strh	r1, [lr]	@ movhi
	strh	r5, [lr, #2]	@ movhi
	b	.L68
.L66:
	ldr	r5, .L91+40
	cmp	lr, #1
	orr	lr, r1, #16384
	strh	lr, [r5]	@ movhi
	subne	lr, r0, #16
	mvneq	lr, r0, lsl #17
	mvnne	lr, lr, lsl #17
	mvneq	lr, lr, lsr #17
	mvnne	lr, lr, lsr #17
	lsl	ip, ip, #22
	lsr	ip, ip, #16
	addeq	ip, ip, #14
	addne	ip, ip, #6
	strh	ip, [r5, #4]	@ movhi
	strh	lr, [r5, #2]	@ movhi
	b	.L68
.L52:
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	moveq	r2, #1
	moveq	r6, r3
	streq	r2, [r4, #8]
	streq	r2, [r4, #24]
	b	.L53
.L90:
	mov	r3, #1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	ip, [r4, #4]
	ldr	lr, [r4]
	add	r1, ip, r1
	ldr	ip, [r7]
	add	r0, r0, r0, lsr #31
	add	r0, lr, r0, asr r3
	stmib	sp, {r10, fp}
	str	ip, [sp]
	sub	r1, r1, #1
	str	r2, [sp, #20]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r9
	subs	r6, r0, #0
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	bne	.L49
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L48
	b	.L47
.L49:
	mov	r6, r2
	str	r2, [r3]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	b	.L47
.L45:
	mov	lr, #2
	mvn	r3, #0
	mov	ip, #1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r9, [r4, #4]
	ldr	r6, [r4]
	ldr	r2, [r7]
	str	lr, [r4, #24]
	add	r1, r9, r1
	ldr	lr, .L91+16
	ldr	r9, .L91+16
	add	r0, r0, r0, lsr #31
	add	fp, sp, #28
	add	r10, sp, #24
	stm	sp, {r2, r10, fp}
	str	r9, [sp, #16]
	add	r0, r6, r0, asr ip
	ldr	r2, [sp, #20]
	ldr	r9, .L91+24
	str	ip, [lr]
	add	r1, r1, r3
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r9
	subs	r6, r0, #0
	bne	.L46
	ldr	lr, .L91+16
	ldr	r3, [lr]
	b	.L43
.L92:
	.align	2
.L91:
	.word	hammerTimer
	.word	mario
	.word	1431655766
	.word	jump
	.word	ladder
	.word	level
	.word	checkCollisionMap
	.word	67109120
	.word	jumpTimer
	.word	hammerState
	.word	shadowOAM
	.word	pauline
	.word	collision
	.word	colorAt
	.word	oldButtons
	.word	buttons
	.size	updateMario, .-updateMario
	.align	2
	.global	updatePauline
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePauline, %function
updatePauline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L96
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L96+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	ip, .L96+8
	sub	r0, r0, r3
	cmp	ip, r0, ror #2
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #32]
	bcc	.L94
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r2, #32]
.L94:
	ldm	r2, {ip, lr}
	ldr	r0, .L96+12
	add	r3, r3, #10
	orr	lr, lr, r0
	orr	ip, ip, r0
	ldr	r0, .L96+16
	lsl	r3, r3, #1
	add	r1, r1, #1
	str	r1, [r2, #28]
	strh	lr, [r0, #16]	@ movhi
	strh	r3, [r0, #20]	@ movhi
	strh	ip, [r0, #18]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L97:
	.align	2
.L96:
	.word	pauline
	.word	143165576
	.word	71582788
	.word	-32768
	.word	shadowOAM
	.size	updatePauline, .-updatePauline
	.align	2
	.global	updateBarrels
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarrels, %function
updateBarrels:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L146
	ldr	r5, .L146+4
	ldr	r10, .L146+8
	ldr	r9, .L146+12
	ldr	fp, .L146+16
	sub	sp, sp, #36
	add	r6, r4, #480
	b	.L129
.L99:
	add	r4, r4, #48
	cmp	r4, r6
	add	r5, r5, #8
	beq	.L142
.L129:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L99
	ldr	r1, [r4, #4]
	ldr	ip, [r4, #20]
	ldr	r2, [r4, #44]
	ldr	r3, [r10]
	ldr	r0, [r4]
	add	r1, r1, ip
	add	r8, sp, #28
	add	r7, sp, #24
	stm	sp, {r3, r7, r8}
	add	r0, r0, r2
	ldr	r3, [r4, #12]
	mov	r2, #0
	sub	r1, r1, #1
	mov	lr, pc
	bx	r9
	subs	r2, r0, #0
	beq	.L143
.L100:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L102
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L144
	cmp	r3, #0
	moveq	r2, #1
	streq	r3, [r4, #44]
	streq	r2, [r4, #24]
	streq	r2, [r4, #8]
.L104:
	mov	r3, #0
	str	r3, [r4, #40]
.L102:
	ldr	r3, [r4, #20]
	ldr	r1, [r4, #4]
	add	r1, r1, r3
	ldr	r3, [r10]
	ldr	r2, [r4, #44]
	stmib	sp, {r7, r8}
	ldr	r0, [r4]
	str	r3, [sp]
	add	r0, r0, r2
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	sub	r1, r1, #1
	mov	lr, pc
	bx	r9
	mov	r1, #0
	ldr	r3, [sp, #28]
	ldr	ip, [r4, #20]
	ldr	r2, [sp, #24]
	ldr	r0, [r4, #44]
	sub	r3, r3, ip
	add	r3, r3, #1
	sub	r2, r2, r0
	stm	r4, {r2, r3}
.L101:
	ldr	r3, [r4]
	cmp	r3, #15
	movle	r3, #16
	strle	r3, [r4]
	ble	.L106
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #224
	rsbgt	r2, r2, #224
	strgt	r2, [r4]
.L106:
	ldr	r2, [r4, #28]
	smull	r0, r3, fp, r2
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r2, r3, lsl #1
	ldr	r3, [r4, #32]
	bne	.L108
	add	r3, r3, #1
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	rsbpl	r3, r0, #0
	str	r3, [r4, #32]
.L108:
	ldr	r0, [r4, #4]
	ldr	ip, [r4, #24]
	add	r0, r0, #3
	cmp	ip, #0
	strh	r0, [r5, #32]	@ movhi
	bne	.L109
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L110
.L112:
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L111
.L109:
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L110
.L121:
	.word	.L124
	.word	.L123
	.word	.L122
	.word	.L120
.L120:
	cmp	r1, #0
	ldr	r3, [r4]
	beq	.L128
.L140:
	ldr	r1, .L146+20
	orr	r3, r3, #16384
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
.L110:
	add	r2, r2, #1
	str	r2, [r4, #28]
.L145:
	add	r4, r4, #48
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L129
.L142:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L143:
	ldr	ip, [r4, #4]
	ldr	r1, [r4, #20]
	ldr	r3, [r10]
	ldr	lr, [r4]
	ldr	r0, [r4, #44]
	add	r1, ip, r1
	ldr	ip, [sp, #28]
	str	r3, [sp]
	stmib	sp, {r7, r8}
	ldr	r3, [r4, #12]
	add	r0, lr, r0
	str	ip, [sp, #20]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L100
	mov	r1, #1
	ldr	r3, [r4, #20]
	ldr	ip, [sp, #20]
	sub	r3, ip, r3
	add	r3, r3, r1
	str	r3, [r4, #4]
	str	r1, [r4, #40]
	b	.L101
.L122:
	cmp	r1, #0
	beq	.L127
.L139:
	mov	r1, #320
	ldr	r3, [r4]
	add	r2, r2, #1
	orr	r3, r3, #16384
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L113:
	cmp	r1, #0
	bne	.L139
	ldr	r3, [r4]
	ldr	r1, .L146+24
	orr	r3, r3, #16384
	add	r2, r2, #1
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L124:
	cmp	r1, #0
	bne	.L139
	mov	r1, #324
	ldr	r3, [r4]
	add	r2, r2, #1
	orr	r3, r3, #20480
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L111:
	cmp	r1, #0
	ldr	r3, [r4]
	bne	.L140
	ldr	r1, .L146+24
	orr	r3, r3, #24576
	add	r2, r2, #1
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L123:
	cmp	r1, #0
	beq	.L126
.L141:
	ldr	r3, [r4]
	ldr	r1, .L146+20
	orr	r3, r3, #16384
	add	r2, r2, #1
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L115:
	cmp	r1, #0
	bne	.L139
	mov	r1, #324
	ldr	r3, [r4]
	add	r2, r2, #1
	orr	r3, r3, #16384
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L114:
	cmp	r1, #0
	bne	.L141
	mov	r1, #324
	ldr	r3, [r4]
	add	r2, r2, #1
	orr	r3, r3, #24576
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L144:
	mvn	r2, #0
	mov	r1, #0
	ldr	r3, [r4, #16]
	add	r3, r3, r2
	str	r3, [r4, #44]
	str	r1, [r4, #24]
	str	r2, [r4, #8]
	b	.L104
.L126:
	mov	r1, #324
	ldr	r3, [r4]
	add	r2, r2, #1
	orr	r3, r3, #28672
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L127:
	ldr	r3, [r4]
	ldr	r1, .L146+24
	orr	r3, r3, #20480
	add	r2, r2, #1
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L128:
	ldr	r1, .L146+24
	orr	r3, r3, #28672
	add	r2, r2, #1
	strh	r3, [r5, #34]	@ movhi
	strh	r1, [r5, #36]	@ movhi
	str	r2, [r4, #28]
	b	.L145
.L147:
	.align	2
.L146:
	.word	barrels
	.word	shadowOAM
	.word	level
	.word	checkCollisionMap
	.word	715827883
	.word	322
	.word	326
	.size	updateBarrels, .-updateBarrels
	.align	2
	.global	throwBarrel
	.syntax unified
	.arm
	.fpu softvfp
	.type	throwBarrel, %function
throwBarrel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #1
	mov	r4, #96
	mov	lr, #16
	ldr	r2, .L155
	ldr	r3, .L155+4
	ldr	ip, [r2]
	add	r1, r3, #480
.L152:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bne	.L150
	cmp	ip, #1
	stmeq	r3, {r4, lr}
	str	r0, [r3, #36]
	str	r0, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	streq	ip, [r3, #8]
	streq	ip, [r3, #24]
	streq	r2, [r3, #44]
.L150:
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L152
	pop	{r4, lr}
	bx	lr
.L156:
	.align	2
.L155:
	.word	level
	.word	barrels
	.size	throwBarrel, .-throwBarrel
	.align	2
	.global	updateDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDK, %function
updateDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L181
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L181+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bcc	.L177
	ldr	r3, [r4, #24]
	cmp	r3, #3
	beq	.L178
	cmp	r3, #4
	beq	.L179
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	str	r3, [r4, #32]
.L177:
	ldr	r5, .L181+8
.L158:
	ldr	r2, [r4]
	mvn	r2, r2, lsl #18
	ldr	r3, [r5]
	cmp	r3, #180
	mvn	r2, r2, lsr #18
	beq	.L161
	ldr	r1, .L181+12
	ldr	ip, [r4, #4]
	ldr	r0, [r4, #24]
	strh	r2, [r1, #10]	@ movhi
	ldr	r2, [r4, #28]
	orr	ip, ip, #16384
	cmp	r0, #3
	strh	ip, [r1, #8]	@ movhi
	add	r2, r2, #1
	beq	.L162
	cmp	r0, #4
	beq	.L164
	cmp	r0, #0
	beq	.L180
.L165:
	add	r3, r3, #1
	str	r3, [r5]
	str	r2, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L161:
	ldr	r1, .L181+12
	mov	ip, #3
	ldr	r0, [r4, #4]
	strh	r2, [r1, #10]	@ movhi
	mov	r2, #1
	orr	r0, r0, #16384
	strh	r0, [r1, #8]	@ movhi
	str	ip, [r4, #24]
.L162:
	mov	r0, #384
	strh	r0, [r1, #12]	@ movhi
	b	.L165
.L180:
	ldr	r0, [r4, #32]
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L165
.L167:
	.word	.L166
	.word	.L169
	.word	.L168
	.word	.L166
.L164:
	mov	r0, #512
	strh	r0, [r1, #12]	@ movhi
	b	.L165
.L178:
	mov	r3, #4
	ldr	r5, .L181+8
	str	r3, [r4, #24]
	b	.L158
.L166:
	mov	r0, #408
	strh	r0, [r1, #12]	@ movhi
	b	.L165
.L169:
	mov	r0, #392
	strh	r0, [r1, #12]	@ movhi
	b	.L165
.L168:
	mov	r0, #400
	strh	r0, [r1, #12]	@ movhi
	b	.L165
.L179:
	mov	r3, #0
	ldr	r5, .L181+8
	str	r3, [r4, #24]
	str	r3, [r5]
	bl	throwBarrel
	b	.L158
.L182:
	.align	2
.L181:
	.word	dk
	.word	143165576
	.word	barrelTimer
	.word	shadowOAM
	.size	updateDK, .-updateDK
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateMario
	bl	updateDK
	bl	updatePauline
	pop	{r4, lr}
	b	updateBarrels
	.size	update, .-update
	.comm	barrels,480,4
	.comm	barrelTimer,4,4
	.comm	levelsCleared,4,4
	.comm	pauline,48,4
	.comm	dk,48,4
	.comm	ladder,4,4
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
