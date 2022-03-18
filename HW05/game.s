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
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #64
	mov	r0, #32
	ldr	r3, .L14
	ldr	r1, [r3]
	ldr	r3, .L14+4
	cmp	r1, #1
	str	ip, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #24]
	beq	.L10
	cmp	r1, #2
	moveq	r1, #85
	stmeq	r3, {r1, r2}
	bx	lr
.L10:
	stm	r3, {r0, r2}
	bx	lr
.L15:
	.align	2
.L14:
	.word	level
	.word	dk
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
	ldr	r2, .L28
	ldr	r3, [r2]
	ldr	r1, .L28+4
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
	pop	{r4, lr}
	b	initPauline
.L24:
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	bl	initMario
	bl	initDK
	pop	{r4, lr}
	b	initPauline
.L29:
	.align	2
.L28:
	.word	levelsCleared
	.word	level
	.size	init, .-init
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
	ldr	r5, .L83
	ldr	r3, [r5]
	ldr	r4, .L83+4
	cmp	r3, r2
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	sub	sp, sp, #36
	ble	.L31
	tst	r3, #3
	beq	.L80
.L32:
	sub	r3, r3, #1
	str	r3, [r5]
.L31:
	ldr	r1, [r4, #28]
	ldr	r2, .L83+8
	smull	r0, r3, r2, r1
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	cmp	r1, r3
	bne	.L33
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	sub	r2, r3, r2
	str	r2, [r4, #32]
.L33:
	ldr	r8, .L83+12
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L36
	ldr	r3, [r5]
	cmp	r3, #0
	ble	.L81
.L36:
	mov	r6, #1
	ldr	r3, .L83+16
	ldr	r7, .L83+20
	str	r3, [sp, #16]
	ldr	r9, .L83+24
	ldr	r3, [r3]
	add	fp, sp, #28
	add	r10, sp, #24
.L35:
	cmp	r3, #0
	beq	.L39
	ldr	r3, .L83+28
	ldrh	r2, [r3, #48]
	ands	r2, r2, #128
	beq	.L82
.L40:
	ldr	r2, .L83+32
	ldr	r3, [r2]
	cmp	r3, #10
	sub	r1, r3, #1
	ble	.L50
.L48:
	mvn	r3, #0
	str	r3, [r4, #12]
.L51:
	str	r1, [r2]
.L49:
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
	ble	.L54
	add	ip, r2, r0
	cmp	ip, #224
	rsbgt	r0, r2, #224
	strgt	r0, [r4]
.L54:
	cmp	r6, #0
	movne	lr, #0
	movne	ip, lr
	strne	lr, [r4, #28]
	strne	lr, [r4, #32]
	ldr	lr, [r5]
	ldreq	ip, [r4, #32]
	cmp	lr, #0
	ldr	lr, [r4, #24]
	ble	.L57
	ldr	r5, .L83+36
	ldr	r5, [r5]
	lsl	ip, ip, #16
	cmp	r5, #0
	lsr	ip, ip, #16
	bne	.L58
	lsl	ip, ip, #23
	ldr	r6, .L83+40
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
.L60:
	ldr	ip, .L83+44
	add	r5, ip, #16
	ldm	r5, {r5, lr}
	str	lr, [sp, #12]
	ldm	ip, {ip, lr}
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L83+48
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L62
	ldr	r3, [r7]
	cmp	r3, #1
	moveq	r0, #2
	movne	r0, #1
	bl	init
.L62:
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L50:
	cmp	r3, #0
	mov	r3, #0
	strle	r3, [r8]
	strgt	r3, [r4, #12]
	ldrle	r3, [r4, #12]
	b	.L51
.L80:
	ldr	r1, .L83+36
	ldr	r2, [r1]
	rsbs	r2, r2, #1
	movcc	r2, #0
	str	r2, [r1]
	b	.L32
.L81:
	ldr	r3, .L83+28
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	str	r3, [sp, #20]
	bne	.L36
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #16]
	ldr	r0, [r4]
	ldr	r7, .L83+20
	add	r1, r1, r2
	add	r3, r3, r3, lsr #31
	add	r0, r0, r3, asr #1
	ldr	r2, [r7]
	ldr	r3, .L83+52
	sub	r1, r1, #1
	mov	lr, pc
	bx	r3
	cmp	r0, #3
	beq	.L37
	ldr	r3, .L83+16
	mov	r6, #1
	str	r3, [sp, #16]
	ldr	r9, .L83+24
	ldr	r3, [r3]
	add	fp, sp, #28
	add	r10, sp, #24
	b	.L35
.L38:
	ldr	r2, [sp, #20]
	mov	r6, r2
	ldr	r3, [r4, #4]
	ldr	r1, .L83+16
	sub	r3, r3, #2
	str	r2, [r1]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	str	r3, [r4, #4]
.L39:
	ldr	r2, .L83+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #32
	bne	.L44
	mvn	r2, #0
	mov	r6, r3
	str	r3, [r4, #24]
	str	r2, [r4, #8]
.L45:
	ldr	r3, .L83+56
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r8]
	beq	.L46
	ldr	r2, .L83+60
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L46
	cmp	r3, #0
	bne	.L40
	mov	r2, #1
	mov	r6, r3
	str	r2, [r8]
	mov	r1, #29
	ldr	r2, .L83+32
	b	.L48
.L46:
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4, #12]
	beq	.L49
	b	.L40
.L57:
	add	ip, lr, ip, lsl #5
	ldr	lr, .L83+40
	lsl	ip, ip, #1
	orr	r5, r0, #16384
	strh	ip, [lr, #4]	@ movhi
	strh	r1, [lr]	@ movhi
	strh	r5, [lr, #2]	@ movhi
	b	.L60
.L58:
	ldr	r5, .L83+40
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
	b	.L60
.L44:
	ldrh	r3, [r2, #48]
	ands	r3, r3, #16
	moveq	r2, #1
	moveq	r6, r3
	streq	r2, [r4, #8]
	streq	r2, [r4, #24]
	b	.L45
.L82:
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
	bne	.L41
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L40
	b	.L39
.L41:
	mov	r6, r2
	str	r2, [r3]
	str	r2, [r4, #12]
	str	r2, [r4, #24]
	b	.L39
.L37:
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
	ldr	lr, .L83+16
	ldr	r9, .L83+16
	add	r0, r0, r0, lsr #31
	add	fp, sp, #28
	add	r10, sp, #24
	stm	sp, {r2, r10, fp}
	str	r9, [sp, #16]
	add	r0, r6, r0, asr ip
	ldr	r2, [sp, #20]
	ldr	r9, .L83+24
	str	ip, [lr]
	add	r1, r1, r3
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r9
	subs	r6, r0, #0
	bne	.L38
	ldr	lr, .L83+16
	ldr	r3, [lr]
	b	.L35
.L84:
	.align	2
.L83:
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
	.global	updateDK
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDK, %function
updateDK:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L93
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L93+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r0, r3
	cmp	r0, r3, ror #1
	str	lr, [sp, #-4]!
	bcc	.L86
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	rsbs	r0, r3, #0
	and	r0, r0, #3
	and	r3, r3, #3
	rsbpl	r3, r0, #0
	str	r3, [r2, #32]
.L86:
	ldr	r3, [r2]
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r0, [r2, #4]
	ldr	lr, [r2, #24]
	ldr	ip, .L93+8
	orr	r0, r0, #16384
	cmp	lr, #0
	strh	r3, [ip, #10]	@ movhi
	strh	r0, [ip, #8]	@ movhi
	bne	.L87
	ldr	r3, [r2, #32]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L87
.L89:
	.word	.L88
	.word	.L91
	.word	.L90
	.word	.L88
.L88:
	mov	r3, #408
	strh	r3, [ip, #12]	@ movhi
.L87:
	add	r1, r1, #1
	str	r1, [r2, #28]
	ldr	lr, [sp], #4
	bx	lr
.L91:
	mov	r3, #392
	add	r1, r1, #1
	strh	r3, [ip, #12]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #28]
	bx	lr
.L90:
	mov	r3, #400
	add	r1, r1, #1
	strh	r3, [ip, #12]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #28]
	bx	lr
.L94:
	.align	2
.L93:
	.word	dk
	.word	143165576
	.word	shadowOAM
	.size	updateDK, .-updateDK
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
	ldr	r2, .L98
	ldr	r1, [r2, #28]
	add	r3, r1, r1, lsl #4
	ldr	r0, .L98+4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	ldr	ip, .L98+8
	sub	r0, r0, r3
	cmp	ip, r0, ror #2
	str	lr, [sp, #-4]!
	ldr	r3, [r2, #32]
	bcc	.L96
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r2, #32]
.L96:
	ldm	r2, {ip, lr}
	ldr	r0, .L98+12
	add	r3, r3, #10
	orr	lr, lr, r0
	orr	ip, ip, r0
	ldr	r0, .L98+16
	lsl	r3, r3, #1
	add	r1, r1, #1
	str	r1, [r2, #28]
	strh	lr, [r0, #16]	@ movhi
	strh	r3, [r0, #20]	@ movhi
	strh	ip, [r0, #18]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L99:
	.align	2
.L98:
	.word	pauline
	.word	143165576
	.word	71582788
	.word	-32768
	.word	shadowOAM
	.size	updatePauline, .-updatePauline
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
	pop	{r4, lr}
	b	updatePauline
	.size	update, .-update
	.comm	levelsCleared,4,4
	.comm	pauline,36,4
	.comm	dk,36,4
	.comm	ladder,4,4
	.comm	jumpTimer,4,4
	.comm	jump,4,4
	.comm	level,4,4
	.comm	hammerState,4,4
	.comm	hammerTimer,4,4
	.comm	mario,36,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
