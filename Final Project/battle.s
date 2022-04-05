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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrb	ip, [r0]	@ zero_extendqisi2
	ldr	r8, [sp, #36]
	cmp	ip, #0
	add	r3, r1, r3
	add	r8, r2, r8
	beq	.L1
	mov	lr, r1
	ldr	r9, .L18
	ldr	r10, .L18+4
	b	.L7
.L17:
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L1
.L7:
	cmp	ip, #10
	add	r5, lr, #14
	addeq	r2, r2, #8
	moveq	lr, r1
	beq	.L4
	cmp	ip, #32
	beq	.L5
	ldr	ip, [r9]
	add	r4, ip, #8
	cmp	r4, #127
	bgt	.L1
	lsl	r6, lr, #23
	lsl	r7, r4, #3
	lsr	r6, r6, #23
	add	r4, r10, r4, lsl #3
	and	fp, r2, #255
	strh	fp, [r10, r7]	@ movhi
	strh	r6, [r4, #2]	@ movhi
	ldrb	r6, [r0]	@ zero_extendqisi2
	ldr	r7, .L18+8
	sub	r6, r6, #33
	ldr	r6, [r7, r6, lsl #2]
	add	ip, ip, #1
	str	ip, [r9]
	strh	r6, [r4, #4]	@ movhi
.L5:
	cmp	r5, r3
	movge	lr, r1
	addlt	lr, lr, #7
	addge	r2, r2, #8
.L4:
	cmp	r2, r8
	blt	.L17
.L1:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawText, .-drawText
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"BATTLE MODE\012TESTING A REALLY  LONG LINE OF TEXT\000"
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
	mov	r4, #24
	ldr	r0, .L22
	sub	sp, sp, #8
	str	r4, [sp]
	mov	r3, #121
	str	ip, [r0]
	mov	r2, #11
	mov	r1, #59
	ldr	r0, .L22+4
	bl	drawText
	mov	r3, #121
	mov	r2, #123
	mov	r1, #59
	str	r4, [sp]
	ldr	r0, .L22+8
	bl	drawText
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	lettersActive, %object
	.size	lettersActive, 4
lettersActive:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
