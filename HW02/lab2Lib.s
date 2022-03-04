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
	.file	"lab2Lib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	subs	r4, r2, #0
	ldrh	ip, [sp, #8]
	ble	.L5
	ldr	lr, .L13
	add	r2, r1, r3
	rsb	r2, r2, r2, lsl #4
	ldr	r1, [lr]
	add	r2, r0, r2, lsl #4
	sub	lr, r3, r3, lsl #4
	add	r4, r4, r0
	add	r1, r1, r2, lsl #1
	lsl	lr, lr, #5
.L7:
	cmp	r3, #0
	addgt	r2, r1, lr
	ble	.L10
.L8:
	strh	ip, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L8
.L10:
	add	r0, r0, #1
	cmp	r0, r4
	add	r1, r1, #2
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	drawSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSprite, %function
drawSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r6, [r0, #28]
	cmp	r6, #0
	ble	.L15
	mov	lr, #0
	ldr	r3, .L23
	ldr	r4, [r0, #24]
	ldr	r5, [r3]
	lsl	r7, r6, #1
.L17:
	cmp	r4, #0
	ble	.L20
	ldr	r3, [r0]
	ldr	r2, [r0, #4]
	add	ip, r4, r3
	rsb	r1, r3, r3, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r3, lr, r2
	ldr	r2, [r0, #32]
	add	ip, r3, ip, lsl #4
	add	r3, r3, r1, lsl #4
	add	ip, r5, ip, lsl #1
	add	r3, r5, r3, lsl #1
	add	r2, r2, lr, lsl #1
.L18:
	ldrh	r1, [r2], r7
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, ip
	bne	.L18
.L20:
	add	lr, lr, #1
	cmp	lr, r6
	bne	.L17
.L15:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	drawSprite, .-drawSprite
	.align	2
	.global	eraseFullSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseFullSprite, %function
eraseFullSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r6, [r0, #28]
	cmp	r6, #0
	ble	.L25
	mov	lr, #0
	ldr	r3, .L33
	ldr	r4, [r0, #24]
	ldr	r5, [r3]
.L27:
	cmp	r4, #0
	ble	.L30
	ldr	r3, [r0]
	ldr	r2, [r0, #4]
	add	ip, r4, r3
	rsb	r7, r3, r3, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r3, lr, r2
	add	r2, r3, ip, lsl #4
	add	r3, r3, r7, lsl #4
	add	r2, r5, r2, lsl #1
	add	r3, r5, r3, lsl #1
.L28:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L28
.L30:
	add	lr, lr, #1
	cmp	lr, r6
	bne	.L27
.L25:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	eraseFullSprite, .-eraseFullSprite
	.align	2
	.global	eraseMovingSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseMovingSprite, %function
eraseMovingSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r0, #4]
	ldr	r5, [r0, #12]
	cmp	r3, r5
	movge	ip, #0
	ldrlt	lr, [r0, #28]
	sublt	ip, r5, r3
	sublt	ip, lr, ip
	subge	lr, r3, r5
	cmp	lr, ip
	ldr	r6, [r0, #8]
	ble	.L38
	ldr	r4, [r0, #24]
	ldr	r2, .L53
	add	r3, r6, r4
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r2]
	add	r3, r5, r3, lsl #4
	add	r3, r3, ip
	sub	r7, r4, r4, lsl #4
	add	lr, lr, r5
	add	ip, r5, ip
	add	r2, r2, r3, lsl #1
	lsl	r7, r7, #5
.L39:
	cmp	r4, #0
	addgt	r3, r2, r7
	ble	.L42
.L40:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L40
.L42:
	add	ip, ip, #1
	cmp	ip, lr
	add	r2, r2, #2
	bne	.L39
.L38:
	ldr	r3, [r0]
	cmp	r3, r6
	movge	ip, #0
	ldrlt	lr, [r0, #28]
	sublt	r3, r6, r3
	sublt	ip, lr, r3
	subge	lr, r3, r6
	cmp	lr, ip
	ble	.L35
	ldr	r0, [r0, #28]
	ldr	r3, .L53
	add	r6, r6, ip
	ldr	r2, [r3]
	add	r5, r5, r0
	rsb	r6, r6, r6, lsl #4
	add	r3, r5, r6, lsl #4
	rsb	r4, r0, r0, lsl #31
	add	r2, r2, r3, lsl #1
	lsl	r4, r4, #1
.L46:
	cmp	r0, #0
	addgt	r3, r2, r4
	ble	.L49
.L47:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L47
.L49:
	add	ip, ip, #1
	cmp	lr, ip
	add	r2, r2, #480
	bne	.L46
.L35:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	eraseMovingSprite, .-eraseMovingSprite
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L59
	ldr	r3, [r3]
	add	r2, r3, #76800
.L56:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L56
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L62:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L62
	mov	r2, #67108864
.L63:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L63
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	sub	r3, r3, #1
	cmp	r3, ip
	ble	.L71
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L71
	ldr	r3, [sp]
	add	r2, r0, r2
	sub	r2, r2, #1
	cmp	r2, r3
	ble	.L71
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, r0
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L71:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
