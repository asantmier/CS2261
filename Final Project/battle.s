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
	.global	drawText
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawText, %function
drawText:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	ip, [r0]	@ zero_extendqisi2
	cmp	ip, #0
	bxeq	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r6, r1
	mov	lr, r4
	ldr	r9, .L22
	ldr	r10, .L22+4
	add	r0, r0, #1
.L8:
	cmp	ip, #10
	beq	.L21
	cmp	ip, #32
	beq	.L5
	ldr	r5, [r9]
	add	ip, r5, #8
	cmp	ip, #127
	bgt	.L1
	lsl	r7, r6, #23
	lsl	fp, ip, #3
	and	r8, r2, #255
	add	ip, r10, ip, lsl #3
	lsr	r7, r7, #23
	strh	r8, [r10, fp]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	ldrb	r7, [r0, #-1]	@ zero_extendqisi2
	ldr	r8, .L22+8
	sub	r7, r7, #44
	ldr	r7, [r8, r7, lsl #2]
	add	r5, r5, #1
	str	r5, [r9]
	strh	r7, [ip, #4]	@ movhi
.L5:
	add	lr, lr, #1
	cmp	lr, r3
	addlt	r6, r6, #8
	blt	.L4
	ldr	ip, [sp, #36]
	add	r4, r4, #1
	cmp	r4, ip
	add	r2, r2, #8
	bge	.L1
	mov	r6, r1
	mov	lr, #0
.L4:
	ldrb	ip, [r0], #1	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L8
.L1:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	ldr	ip, [sp, #36]
	add	r4, r4, #1
	cmp	ip, r4
	ble	.L1
	mov	r6, r1
	mov	lr, #0
	add	r2, r2, #8
	b	.L4
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawText, .-drawText
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"BATTLE MODE\000"
	.align	2
.LC1:
	.ascii	"L BUMPER:LOSE\012R BUMPER:WIN\000"
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
	push	{r4, lr}
	mov	ip, #0
	mov	r4, #3
	ldr	r0, .L26
	sub	sp, sp, #8
	str	r4, [sp]
	mov	r3, #14
	str	ip, [r0]
	mov	r2, #12
	mov	r1, #64
	ldr	r0, .L26+4
	bl	drawText
	mov	r3, #14
	mov	r2, #124
	mov	r1, #64
	str	r4, [sp]
	ldr	r0, .L26+8
	bl	drawText
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.size	initBattle, .-initBattle
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
	@ link register save eliminated.
	bx	lr
	.size	updateBattle, .-updateBattle
	.global	lettersActive
	.global	text_tile_lkup
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	text_tile_lkup, %object
	.size	text_tile_lkup, 188
text_tile_lkup:
	.word	670
	.word	-1
	.word	669
	.word	671
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
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
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
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lettersActive, %object
	.size	lettersActive, 4
lettersActive:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
