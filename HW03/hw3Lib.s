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
	.file	"hw3Lib.c"
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
	cmp	r2, #20
	push	{r4, r5, r6, lr}
	bgt	.L6
	cmp	r3, #0
	ble	.L5
	mov	lr, #0
	ldr	ip, .L16
	rsb	r1, r1, r1, lsl #4
	ldr	ip, [ip]
	add	r1, r0, r1, lsl #4
	add	r1, r1, r2
	rsb	r4, r2, r2, lsl #31
	add	ip, ip, r1, lsl #1
	lsl	r4, r4, #1
.L8:
	cmp	r2, #0
	addgt	r0, ip, r4
	ble	.L12
.L10:
	ldrh	r1, [sp, #16]
	strh	r1, [r0], #2	@ movhi
	cmp	r0, ip
	bne	.L10
.L12:
	add	lr, lr, #1
	cmp	r3, lr
	add	ip, ip, #480
	bne	.L8
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L6:
	cmp	r3, #0
	ble	.L5
	mov	ip, #67108864
	mov	r5, #0
	ldr	r6, .L16
	add	r3, r1, r3
	rsb	lr, r3, r3, lsl #4
	rsb	r4, r1, r1, lsl #4
	ldr	r3, [r6]
	add	r1, r0, lr, lsl #4
	add	r4, r0, r4, lsl #4
	orr	r0, r2, #-2130706432
	add	r2, r3, r1, lsl #1
	add	r3, r3, r4, lsl #1
.L9:
	add	r1, sp, #16
	str	r5, [ip, #220]
	str	r1, [ip, #212]
	str	r3, [ip, #216]
	add	r3, r3, #480
	cmp	r2, r3
	str	r0, [ip, #220]
	bne	.L9
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
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
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	str	r1, [sp]
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	bl	drawRect
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.size	eraseFullSprite, .-eraseFullSprite
	.align	2
	.global	drawImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage, %function
drawImage:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	cmp	r2, #20
	ldr	r5, [sp, #20]
	bgt	.L21
	cmp	r2, #0
	ble	.L20
	mov	r4, #0
	ldr	ip, .L31
	add	r1, r1, r3
	ldr	lr, [ip]
	rsb	r1, r1, r1, lsl #4
	add	r0, r0, r1, lsl #4
	sub	r6, r3, r3, lsl #4
	add	lr, lr, r0, lsl #1
	lsl	r6, r6, #5
	lsl	r7, r2, #1
.L23:
	cmp	r3, #0
	addgt	r0, r5, r4, lsl #1
	addgt	r1, lr, r6
	ble	.L27
.L25:
	ldrh	ip, [r0], r7
	strh	ip, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, lr
	bne	.L25
.L27:
	add	r4, r4, #1
	cmp	r2, r4
	add	lr, lr, #2
	bne	.L23
.L20:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L21:
	cmp	r3, #0
	ble	.L20
	mov	ip, r5
	mov	r4, #67108864
	mov	r5, #0
	ldr	r7, .L31
	add	r3, r1, r3
	rsb	lr, r3, r3, lsl #4
	rsb	r6, r1, r1, lsl #4
	ldr	r3, [r7]
	add	r1, r0, lr, lsl #4
	add	r0, r0, r6, lsl #4
	add	r1, r3, r1, lsl #1
	add	r3, r3, r0, lsl #1
	orr	r0, r2, #-2147483648
	lsl	r2, r2, #1
.L24:
	str	r5, [r4, #220]
	str	ip, [r4, #212]
	str	r3, [r4, #216]
	add	r3, r3, #480
	cmp	r1, r3
	str	r0, [r4, #220]
	add	ip, ip, r2
	bne	.L24
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	drawImage, .-drawImage
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
	str	lr, [sp, #-4]!
	ldr	r2, [r0, #32]
	sub	sp, sp, #12
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	bl	drawImage
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.size	drawSprite, .-drawSprite
	.align	2
	.global	eraseMovingImage
	.syntax unified
	.arm
	.fpu softvfp
	.type	eraseMovingImage, %function
eraseMovingImage:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, [sp, #24]
	cmp	r0, r2
	movlt	r6, r7
	movge	r4, #0
	sublt	r4, r2, r0
	sublt	r4, r7, r4
	subge	r6, r0, r2
	cmp	r6, r4
	ldr	r5, [sp, #28]
	ldrh	ip, [sp, #32]
	ble	.L38
	ldr	lr, .L53
	add	r0, r3, r5
	rsb	r0, r0, r0, lsl #4
	ldr	lr, [lr]
	add	r0, r2, r0, lsl #4
	add	r0, r0, r4
	sub	r8, r5, r5, lsl #4
	add	r6, r6, r2
	add	r4, r4, r2
	add	lr, lr, r0, lsl #1
	lsl	r8, r8, #5
.L39:
	cmp	r5, #0
	addgt	r0, lr, r8
	ble	.L42
.L40:
	strh	ip, [r0]	@ movhi
	add	r0, r0, #480
	cmp	r0, lr
	bne	.L40
.L42:
	add	r4, r4, #1
	cmp	r4, r6
	add	lr, lr, #2
	bne	.L39
.L38:
	cmp	r1, r3
	movge	r0, #0
	sublt	r1, r3, r1
	sublt	r0, r5, r1
	subge	r5, r1, r3
	cmp	r5, r0
	ble	.L35
	ldr	lr, .L53
	add	r3, r3, r0
	rsb	r1, r3, r3, lsl #4
	add	r3, r2, r7
	ldr	r2, [lr]
	add	r3, r3, r1, lsl #4
	rsb	r1, r7, r7, lsl #31
	add	r2, r2, r3, lsl #1
	lsl	r1, r1, #1
.L46:
	cmp	r7, #0
	addgt	r3, r2, r1
	ble	.L49
.L47:
	strh	ip, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L47
.L49:
	add	r0, r0, #1
	cmp	r5, r0
	add	r2, r2, #480
	bne	.L46
.L35:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.size	eraseMovingImage, .-eraseMovingImage
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
	str	lr, [sp, #-4]!
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	sub	sp, sp, #20
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	bl	eraseMovingImage
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
	.size	eraseMovingSprite, .-eraseMovingSprite
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	ip, #0
	sub	sp, sp, #16
	strh	r0, [sp, #6]	@ movhi
	ldrh	r2, [sp, #6]
	ldrh	r1, [sp, #6]
	add	r0, sp, #12
	orr	r2, r2, r1, lsl #16
	str	r2, [sp, #12]
	ldr	r1, .L59
	str	ip, [r3, #220]
	str	r0, [r3, #212]
	ldr	r2, .L59+4
	ldr	r1, [r1]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L60:
	.align	2
.L59:
	.word	.LANCHOR0
	.word	-2063578368
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
	cmp	r3, ip
	blt	.L71
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L71
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L71
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
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
