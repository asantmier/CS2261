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
	.file	"main.c"
	.text
	.align	2
	.global	base
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	base, %function
base:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L94
	push	{r4, r5, r6, lr}
	ldr	lr, [r3]
	add	ip, lr, #9152
	add	r3, ip, #20
	add	ip, ip, #38
.L2:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L2
	add	ip, lr, #8192
	add	r4, ip, #1456
	add	r3, lr, #9600
	add	r5, lr, #9664
	strh	r2, [r4]	@ movhi
	add	r3, r3, #52
	strh	r2, [r4, #2]	@ movhi
	add	r4, r5, #6
.L3:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L3
	add	r4, lr, #10112
	strh	r2, [r5, #6]	@ movhi
	add	r3, r4, #16
	strh	r2, [r5, #8]	@ movhi
	add	r4, r4, #42
	strh	r2, [r4, #-28]	@ movhi
.L4:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L4
	add	r3, ip, #1952
	add	r4, ip, #1968
	add	r6, ip, #2400
	strh	r2, [r3, #10]	@ movhi
	add	r5, lr, #10624
	strh	r2, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	strh	r2, [r4]	@ movhi
	add	r3, lr, #10560
	strh	r2, [r4, #2]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	add	r3, r3, #46
	add	r4, r5, #12
.L5:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L5
	add	r3, ip, #2448
	add	r4, lr, #11072
	strh	r2, [r5, #12]	@ movhi
	strh	r2, [r5, #14]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	add	r3, r4, #12
	add	r4, r4, #46
.L6:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L6
	add	r4, ip, #2928
	add	r3, ip, #2912
	add	r5, ip, #3360
	strh	r2, [r3, #14]	@ movhi
	add	r6, lr, #11584
	strh	r0, [r4]	@ movhi
	add	r3, lr, #11520
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [r4, #4]	@ movhi
	strh	r0, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	add	r3, r3, #42
	add	r4, r6, #14
.L7:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L7
	add	r3, ip, #3408
	add	r4, lr, #12032
	strh	r2, [r6, #14]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	add	r3, r4, #10
	add	r4, r4, #46
.L8:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L8
	add	r4, ip, #3888
	add	r3, ip, #3872
	add	ip, lr, #12288
	strh	r2, [r3, #14]	@ movhi
	add	r5, lr, #12544
	strh	r0, [r4]	@ movhi
	add	r3, lr, #12480
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [r4, #4]	@ movhi
	strh	r0, [r4, #6]	@ movhi
	strh	r0, [r4, #8]	@ movhi
	strh	r0, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	strh	r2, [ip, #230]	@ movhi
	add	r3, r3, #40
	add	r4, r5, #12
.L9:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L9
	add	r3, ip, #268
	strh	r2, [r3]	@ movhi
	add	r4, r5, #30
	strh	r2, [r3, #2]	@ movhi
	add	r3, r5, #16
.L10:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L10
	add	r3, ip, #284
	strh	r2, [r3, #2]	@ movhi
	add	r4, ip, #708
	add	r3, lr, #12992
	strh	r2, [r4, #2]	@ movhi
	add	r5, r3, #44
	add	r4, r3, #8
.L11:
	strh	r0, [r4], #2	@ movhi
	cmp	r4, r5
	bne	.L11
	add	r4, ip, #748
	strh	r2, [r4]	@ movhi
	add	r3, r3, #46
	add	r4, lr, #13056
.L12:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L12
	add	r4, ip, #1184
	strh	r2, [r3]	@ movhi
	add	r5, ip, #1200
	strh	r2, [r4, #6]	@ movhi
	add	r3, lr, #13440
	strh	r2, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r0, [r4, #12]	@ movhi
	strh	r0, [r4, #14]	@ movhi
	add	r4, lr, #13504
	strh	r0, [r5]	@ movhi
	add	r3, r3, #60
	strh	r0, [r5, #2]	@ movhi
	strh	r0, [r5, #4]	@ movhi
	strh	r0, [r5, #6]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	add	r5, r4, #12
.L13:
	strh	r0, [r3], #2	@ movhi
	cmp	r5, r3
	bne	.L13
	strh	r2, [r4, #12]	@ movhi
	add	r3, r4, #14
	add	r4, r4, #32
.L14:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L14
	add	r4, ip, #1680
	add	r3, lr, #13952
	add	r5, ip, #1248
	strh	r2, [r5]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	add	r5, r3, #44
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [r4, #4]	@ movhi
	strh	r2, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	add	r4, r3, #30
.L15:
	strh	r0, [r4], #2	@ movhi
	cmp	r4, r5
	bne	.L15
	add	r4, ip, #1696
	add	r6, lr, #14016
	strh	r2, [r4, #12]	@ movhi
	add	r3, r3, #46
	add	r4, r6, #2
.L16:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L16
	add	r3, ip, #2160
	add	r4, lr, #14464
	add	r5, ip, #2144
	strh	r2, [r6, #2]	@ movhi
	strh	r2, [r5, #6]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	strh	r2, [r5, #12]	@ movhi
	strh	r0, [r5, #14]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r0, [r4]	@ movhi
	add	r3, r4, #14
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [r4, #4]	@ movhi
	strh	r0, [r4, #6]	@ movhi
	strh	r0, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	add	r4, r4, #34
.L17:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L17
	add	r3, lr, #14912
	add	r4, ip, #2640
	add	r5, ip, #2208
	strh	r2, [r5, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	add	r5, r3, #42
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r0, [r4, #4]	@ movhi
	strh	r0, [r4, #6]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r2, [r4, #10]	@ movhi
	add	r4, r3, #28
.L18:
	strh	r0, [r4], #2	@ movhi
	cmp	r4, r5
	bne	.L18
	add	r4, ip, #2656
	add	r5, lr, #14976
	strh	r2, [r4, #10]	@ movhi
	add	r3, r3, #44
	add	r4, r5, #2
.L19:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L19
	add	r4, ip, #3104
	strh	r2, [r5, #2]	@ movhi
	add	r3, lr, #15360
	strh	r2, [r4, #6]	@ movhi
	add	r4, lr, #15424
	add	r3, r3, #40
	add	r5, r4, #8
.L20:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r5
	bne	.L20
	strh	r2, [r4, #8]	@ movhi
	add	r3, r4, #12
	strh	r2, [r4, #10]	@ movhi
	add	r4, r4, #34
.L21:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L21
	add	r3, lr, #15872
	add	r4, ip, #3168
	strh	r2, [r4, #2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	add	r4, r3, #8
	add	r5, r3, #38
.L22:
	strh	r0, [r4], #2	@ movhi
	cmp	r4, r5
	bne	.L22
	add	r4, ip, #3616
	add	r5, lr, #15936
	strh	r2, [r4, #6]	@ movhi
	add	r3, r3, #42
	strh	r2, [r4, #8]	@ movhi
	add	r4, r5, #2
.L23:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L23
	add	ip, ip, #4064
	strh	r2, [r5, #2]	@ movhi
	add	r3, lr, #16320
	strh	r2, [ip, #8]	@ movhi
	add	ip, lr, #16384
	add	r3, r3, #42
	add	r4, ip, #4
.L24:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L24
	strh	r2, [ip, #4]	@ movhi
	strh	r2, [ip, #6]	@ movhi
	add	r3, ip, #8
	add	r4, ip, #34
.L25:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L25
	add	r4, ip, #456
	add	r3, lr, #16640
	strh	r2, [ip, #34]	@ movhi
	add	r5, r3, #228
	strh	r2, [r4]	@ movhi
	add	r4, r3, #202
.L26:
	strh	r0, [r4], #2	@ movhi
	cmp	r5, r4
	bne	.L26
	add	r4, ip, #484
	add	r5, lr, #16896
	strh	r2, [r4]	@ movhi
	add	r3, r3, #230
	add	r4, r5, #2
.L27:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L27
	add	r3, ip, #936
	add	r4, lr, #17152
	strh	r2, [r5, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r5, r4, #194
	add	r3, r4, #172
.L28:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r5
	bne	.L28
	add	r3, ip, #964
	add	r5, ip, #960
	strh	r2, [r5, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	add	r3, r4, #198
	add	r4, r4, #226
.L29:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L29
	add	r4, ip, #992
	strh	r2, [r4, #2]	@ movhi
	add	r3, ip, #1408
	add	r4, lr, #17664
	strh	r2, [r3, #12]	@ movhi
	add	r5, r4, #158
	add	r3, r4, #142
.L30:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r5
	bne	.L30
	add	r3, ip, #1440
	add	r5, ip, #1424
	strh	r2, [r5, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r4, #164
	add	r4, r4, #194
.L31:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L31
	add	r4, ip, #1888
	add	r5, ip, #1472
	strh	r2, [r5, #2]	@ movhi
	add	r3, ip, #1904
	strh	r2, [r4, #14]	@ movhi
	add	r4, lr, #18176
	strh	r0, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	add	r3, r4, #128
	add	r4, r4, #162
.L32:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L32
	add	r4, ip, #1952
	strh	r2, [r4, #2]	@ movhi
	add	r3, ip, #2384
	add	r4, lr, #18688
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	add	r3, r4, #92
	add	r4, r4, #130
.L33:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L33
	add	r4, ip, #2432
	strh	r2, [r4, #2]	@ movhi
	add	r3, ip, #2864
	add	r4, lr, #19200
	strh	r2, [r3]	@ movhi
	add	r3, r4, #50
	add	r4, r4, #98
.L34:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L34
	add	r4, ip, #2912
	strh	r2, [r4, #2]	@ movhi
	add	r3, ip, #3344
	add	r4, lr, #19712
	strh	r2, [r3]	@ movhi
	add	r3, r4, #18
	add	r4, r4, #66
.L35:
	strh	r1, [r3], #2	@ movhi
	cmp	r3, r4
	bne	.L35
	add	r3, ip, #3392
	add	r4, ip, #3824
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r4]	@ movhi
	add	r3, lr, #19968
	add	r4, lr, #20224
	add	r3, r3, #242
	add	r4, r4, #34
.L36:
	strh	r0, [r3], #2	@ movhi
	cmp	r4, r3
	bne	.L36
	add	r3, lr, #20480
	add	r4, lr, #20736
	add	ip, ip, #3872
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r3, #208]	@ movhi
	add	ip, lr, #20992
	strh	r0, [r3, #210]	@ movhi
	strh	r1, [r3, #212]	@ movhi
	strh	r0, [r3, #214]	@ movhi
	strh	r0, [r3, #216]	@ movhi
	strh	r0, [r3, #218]	@ movhi
	strh	r0, [r3, #220]	@ movhi
	strh	r1, [r3, #222]	@ movhi
	strh	r0, [r3, #224]	@ movhi
	strh	r0, [r3, #226]	@ movhi
	strh	r0, [r3, #228]	@ movhi
	strh	r0, [r3, #230]	@ movhi
	strh	r1, [r3, #232]	@ movhi
	strh	r0, [r3, #234]	@ movhi
	strh	r0, [r3, #236]	@ movhi
	strh	r0, [r3, #238]	@ movhi
	strh	r0, [r3, #240]	@ movhi
	strh	r1, [r3, #242]	@ movhi
	strh	r0, [r3, #244]	@ movhi
	strh	r0, [r3, #246]	@ movhi
	strh	r0, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r0, [r3, #254]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	add	r4, lr, #24832
	add	ip, ip, #226
	add	r4, r4, #226
.L38:
	strh	r2, [ip, #-50]	@ movhi
	sub	r3, ip, #48
.L37:
	strh	r0, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L37
	strh	r2, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r4
	bne	.L38
	add	r4, lr, #24576
	add	r3, r4, #432
	add	r5, r4, #436
	strh	r2, [r3]	@ movhi
	add	ip, r4, #440
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r5]	@ movhi
	add	r3, r4, #444
	strh	r0, [r5, #2]	@ movhi
	add	r5, r4, #448
	strh	r0, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	ip, r4, #452
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r5]	@ movhi
	add	r3, r4, #456
	strh	r0, [r5, #2]	@ movhi
	add	r5, r4, #460
	strh	r0, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	ip, r4, #464
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r5]	@ movhi
	add	r3, r4, #468
	strh	r0, [r5, #2]	@ movhi
	add	r5, r4, #472
	strh	r0, [ip]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	ip, r4, #476
	strh	r0, [r3, #2]	@ movhi
	strh	r0, [r5]	@ movhi
	add	r3, r4, #480
	strh	r0, [r5, #2]	@ movhi
	add	r5, r4, #912
	strh	r1, [ip]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	ip, lr, #25344
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r5]	@ movhi
	add	r3, ip, #146
	add	ip, ip, #194
.L39:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L39
	add	ip, r4, #960
	strh	r2, [ip, #2]	@ movhi
	add	r3, r4, #1392
	add	ip, lr, #25856
	strh	r2, [r3]	@ movhi
	add	r3, ip, #114
	add	ip, ip, #162
.L40:
	strh	r1, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L40
	add	r3, r4, #1440
	add	ip, lr, #26368
	strh	r2, [r3, #2]	@ movhi
	ldr	r5, .L94+4
	ldr	r6, .L94+8
	add	ip, ip, #130
.L42:
	strh	r2, [ip, #-50]	@ movhi
	sub	r3, ip, #48
.L41:
	strh	r0, [r3], #2	@ movhi
	cmp	ip, r3
	bne	.L41
	add	r5, r5, #240
	cmp	r5, r6
	strh	r2, [ip]	@ movhi
	add	ip, ip, #480
	bne	.L42
	add	r4, r4, #3792
	strh	r2, [r4]	@ movhi
	add	r3, lr, #28160
	strh	r2, [r4, #2]	@ movhi
	add	r3, r3, #212
	add	ip, lr, #28416
.L43:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L43
	add	r0, lr, #28672
	strh	r2, [r3]	@ movhi
	add	ip, r0, #226
	strh	r2, [r3, #2]	@ movhi
	add	r3, r0, #178
.L44:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L44
	add	r3, r0, #668
	strh	r2, [r3, #2]	@ movhi
	add	ip, r0, #672
	add	r3, r0, #676
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	add	ip, r0, #680
	strh	r1, [r3, #2]	@ movhi
	add	r3, r0, #684
	strh	r1, [ip]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	ip, r0, #688
	strh	r2, [r3, #2]	@ movhi
	add	r3, r0, #1152
	strh	r2, [ip]	@ movhi
	strh	r2, [r3]	@ movhi
	add	ip, r0, #1632
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	add	r3, r0, #2112
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	strh	r2, [ip, #6]	@ movhi
	strh	r2, [ip, #8]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	strh	r2, [ip, #12]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	ip, r0, #2592
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	add	r3, lr, #31744
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	strh	r2, [ip, #8]	@ movhi
	strh	r2, [ip, #10]	@ movhi
	strh	r2, [r3]	@ movhi
	add	ip, r0, #3536
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	add	r3, r0, #3552
	strh	r2, [ip, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	add	ip, r0, #4016
	strh	r1, [r3, #2]	@ movhi
	add	r0, r0, #4032
	strh	r1, [r3, #4]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	add	r3, lr, #33024
	strh	r2, [ip, #12]	@ movhi
	strh	r2, [ip, #14]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	strh	r2, [r0, #6]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	strh	r1, [r0, #10]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	strh	r2, [r0, #14]	@ movhi
	mov	r0, r3
	add	r3, r3, #146
	add	r0, r0, #166
.L45:
	strh	r2, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L45
	add	r0, lr, #32768
	add	ip, r0, #424
	add	r4, r0, #420
	strh	r1, [r4, #2]	@ movhi
	add	r3, lr, #33536
	strh	r1, [ip]	@ movhi
	add	lr, r0, #428
	strh	r1, [ip, #2]	@ movhi
	add	ip, r0, #432
	add	r0, r0, #436
	strh	r1, [lr]	@ movhi
	strh	r2, [lr, #2]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	add	r1, r3, #120
	add	r3, r3, #156
.L46:
	strh	r2, [r1], #2	@ movhi
	cmp	r3, r1
	bne	.L46
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	videoBuffer
	.word	13200
	.word	14160
	.size	base, .-base
	.align	2
	.global	bucket
	.syntax unified
	.arm
	.fpu softvfp
	.type	bucket, %function
bucket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L124
	rsb	r5, r1, r1, lsl #4
	add	r4, r0, #8
	add	ip, r0, #9
	ldr	lr, [lr]
	add	r4, r4, r5, lsl #4
	add	ip, ip, r5, lsl #4
	lsl	r5, r5, #4
	lsl	ip, ip, #1
	add	r6, r5, #240
	lsl	r4, r4, #1
	add	r1, r0, #7
	add	r1, r1, r6
	strh	r3, [lr, r4]	@ movhi
	add	r6, r6, r0
	strh	r3, [lr, ip]	@ movhi
	add	ip, lr, #22
	add	r1, lr, r1, lsl #1
	add	ip, ip, r6, lsl #1
.L97:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L97
	add	ip, r5, #480
	add	ip, r0, ip
	add	r9, lr, #36
	add	r1, lr, ip, lsl #1
	add	ip, r9, ip, lsl #1
.L98:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L98
	add	r10, r5, #720
	add	ip, r10, r0
	add	r4, r0, #1
	lsl	ip, ip, #1
	add	r6, lr, #34
	add	r1, r10, r4
	strh	r3, [lr, ip]	@ movhi
	add	r1, lr, r1, lsl #1
	add	ip, r6, ip
.L99:
	strh	r2, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L99
	add	r7, r0, #17
	add	r8, r5, #960
	add	r1, r10, r7
	lsl	r1, r1, #1
	add	ip, r8, r0
	strh	r3, [lr, r1]	@ movhi
	lsl	ip, ip, #1
	add	r1, r4, r8
	strh	r3, [lr, ip]	@ movhi
	add	r1, lr, r1, lsl #1
	add	ip, r6, ip
.L100:
	strh	r2, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L100
	add	ip, r5, #1200
	add	r1, r7, r8
	add	r7, r4, ip
	lsl	r1, r1, #1
	lsl	r7, r7, #1
	add	r8, r0, #2
	strh	r3, [lr, r1]	@ movhi
	add	r10, ip, r0
	strh	r3, [lr, r7]	@ movhi
	add	r1, ip, r8
	add	r7, lr, #32
	add	r1, lr, r1, lsl #1
	add	r10, r7, r10, lsl #1
.L101:
	strh	r2, [r1], #2	@ movhi
	cmp	r1, r10
	bne	.L101
	add	r1, r0, #16
	add	ip, ip, r1
	lsl	r10, ip, #1
	add	ip, r5, #1440
	add	ip, r0, ip
	strh	r3, [lr, r10]	@ movhi
	add	r9, r9, ip, lsl #1
	add	ip, lr, ip, lsl #1
.L102:
	strh	r3, [ip], #2	@ movhi
	cmp	ip, r9
	bne	.L102
	add	ip, r5, #1680
	add	r1, r1, ip
	mov	r9, ip
	add	r10, r5, #3360
	add	ip, lr, r1, lsl #1
.L104:
	strh	r3, [ip, #-30]	@ movhi
	sub	r1, ip, #28
.L103:
	strh	r2, [r1], #2	@ movhi
	cmp	r1, ip
	bne	.L103
	add	r9, r9, #240
	cmp	r9, r10
	strh	r3, [r1]	@ movhi
	add	ip, r1, #480
	bne	.L104
	add	r1, r8, r10
	lsl	r1, r1, #1
	add	ip, r0, #3
	strh	r3, [lr, r1]	@ movhi
	add	r9, lr, #30
	add	r1, r10, ip
	add	fp, r10, r0
	add	r1, lr, r1, lsl #1
	add	fp, r9, fp, lsl #1
.L105:
	strh	r2, [r1], #2	@ movhi
	cmp	fp, r1
	bne	.L105
	add	fp, r0, #15
	add	r1, r10, fp
	lsl	r1, r1, #1
	add	r10, r5, #3600
	strh	r3, [lr, r1]	@ movhi
	add	r1, r4, r10
	add	r10, r10, r0
	add	r1, lr, r1, lsl #1
	add	r6, r6, r10, lsl #1
.L106:
	strh	r3, [r1], #2	@ movhi
	cmp	r6, r1
	bne	.L106
	add	r6, r5, #3840
	add	r1, r8, r6
	lsl	r1, r1, #1
	strh	r3, [lr, r1]	@ movhi
	add	r4, r6, r0
	add	r1, ip, r6
	add	r1, lr, r1, lsl #1
	add	r4, r9, r4, lsl #1
.L107:
	strh	r2, [r1], #2	@ movhi
	cmp	r4, r1
	bne	.L107
	add	r4, r5, #4080
	add	r1, fp, r6
	add	r6, r8, r4
	lsl	r1, r1, #1
	lsl	r6, r6, #1
	strh	r3, [lr, r1]	@ movhi
	add	r1, ip, r4
	strh	r3, [lr, r6]	@ movhi
	add	ip, r4, r0
	add	r1, lr, r1, lsl #1
	add	r9, r9, ip, lsl #1
.L108:
	strh	r2, [r1], #2	@ movhi
	cmp	r9, r1
	bne	.L108
	add	r5, r5, #4288
	add	r5, r5, #32
	add	r2, fp, r4
	add	r8, r8, r5
	lsl	r2, r2, #1
	add	r5, r5, r0
	strh	r3, [lr, r2]	@ movhi
	add	r5, r7, r5, lsl #1
	add	lr, lr, r8, lsl #1
.L109:
	strh	r3, [lr], #2	@ movhi
	cmp	r5, lr
	bne	.L109
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L125:
	.align	2
.L124:
	.word	videoBuffer
	.size	bucket, .-bucket
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r3
	mov	r4, r2
	mov	r5, r0
	ldrh	r7, [sp, #24]
	bl	base
	mov	r3, r7
	mov	r2, r6
	mov	r1, #40
	mov	r0, #2
	bl	bucket
	ldr	r3, .L132
	ldr	r1, [r3]
	add	r2, r1, #16384
	add	r0, r2, #1920
	add	ip, r2, #1440
	strh	r4, [ip, #8]	@ movhi
	add	r3, r1, #20480
	strh	r4, [ip, #10]	@ movhi
	add	lr, r2, #2400
	strh	r4, [ip, #12]	@ movhi
	add	r7, r2, #3808
	strh	r4, [r0, #6]	@ movhi
	add	ip, r2, #2880
	strh	r4, [r0, #8]	@ movhi
	add	r6, r1, #20224
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	add	r0, r2, #3360
	add	r2, r2, #3824
	strh	r4, [lr, #4]	@ movhi
	strh	r4, [lr, #12]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	add	lr, r3, #680
	strh	r4, [ip, #12]	@ movhi
	strh	r4, [r0]	@ movhi
	add	ip, r3, #696
	strh	r5, [r0, #2]	@ movhi
	strh	r5, [r0, #4]	@ movhi
	strh	r5, [r0, #6]	@ movhi
	strh	r5, [r0, #8]	@ movhi
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r7, #14]	@ movhi
	add	r0, r3, #684
	strh	r4, [r2, #14]	@ movhi
	strh	r4, [r6, #8]	@ movhi
	add	r2, r3, #1152
	add	r6, r3, #708
	strh	r4, [r3, #204]	@ movhi
	strh	r5, [r3, #206]	@ movhi
	strh	r4, [r3, #220]	@ movhi
	strh	r5, [r3, #222]	@ movhi
	strh	r4, [r3, #230]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r4, [r0]	@ movhi
	add	lr, r3, #1168
	strh	r4, [r0, #2]	@ movhi
	add	r0, r3, #1632
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [r6]	@ movhi
	add	ip, r3, #1184
	strh	r4, [r2, #6]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	r5, [r2, #10]	@ movhi
	strh	r5, [r2, #12]	@ movhi
	strh	r5, [r2, #14]	@ movhi
	add	r2, r3, #1648
	strh	r4, [lr, #8]	@ movhi
	add	r6, r3, #1664
	strh	r4, [ip, #2]	@ movhi
	add	lr, r3, #2112
	strh	r5, [r0, #8]	@ movhi
	add	ip, r3, #2128
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	strh	r4, [r2, #6]	@ movhi
	add	r2, r3, #2608
	strh	r4, [r6]	@ movhi
	add	r0, r3, #3056
	strh	r4, [lr, #6]	@ movhi
	add	r6, r1, #23552
	strh	r4, [lr, #8]	@ movhi
	strh	r4, [ip, #4]	@ movhi
	add	lr, r3, #3088
	strh	r4, [ip, #14]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	add	ip, r3, #3568
	strh	r4, [r2, #4]	@ movhi
	strh	r4, [r2, #6]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	r4, [r2, #12]	@ movhi
	add	r2, r3, #3552
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	strh	r4, [r6, #12]	@ movhi
	add	r0, r1, #24320
	strh	r4, [r6, #14]	@ movhi
	strh	r4, [lr, #8]	@ movhi
	strh	r4, [lr, #10]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	strh	r4, [r2, #6]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	strh	r4, [r2, #10]	@ movhi
	strh	r5, [r2, #12]	@ movhi
	strh	r5, [r2, #14]	@ movhi
	strh	r5, [ip]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [ip, #4]	@ movhi
	strh	r4, [ip, #6]	@ movhi
	add	r2, r0, #184
	add	r0, r0, #198
.L127:
	strh	r4, [r2], #2	@ movhi
	cmp	r0, r2
	bne	.L127
	add	r3, r3, #4032
	add	r0, r1, #24576
	strh	r5, [r3, #6]	@ movhi
	add	r2, r1, #25344
	strh	r5, [r3, #8]	@ movhi
	add	r1, r0, #416
	strh	r5, [r3, #10]	@ movhi
	add	ip, r0, #412
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	add	r3, r0, #420
	add	r0, r0, #424
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [r1]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r5, [r3]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	add	r3, r2, #120
	add	r2, r2, #134
.L128:
	strh	r4, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L128
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	videoBuffer
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r3
	mov	r4, r2
	mov	r5, r0
	ldrh	r7, [sp, #24]
	bl	base
	mov	r2, r6
	mov	r3, r7
	mov	r1, #19
	mov	r0, #0
	bl	bucket
	ldr	r3, .L144
	ldr	r2, [r3]
	add	r3, r2, #12288
	add	r0, r3, #2128
	add	ip, r3, #1648
	strh	r4, [ip, #8]	@ movhi
	add	r1, r2, #16384
	strh	r4, [ip, #10]	@ movhi
	add	lr, r3, #2608
	strh	r4, [r0, #4]	@ movhi
	add	ip, r3, #3088
	strh	r4, [r0, #6]	@ movhi
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	add	r0, r3, #3568
	strh	r4, [lr, #2]	@ movhi
	strh	r4, [lr, #6]	@ movhi
	strh	r4, [lr, #8]	@ movhi
	strh	r4, [lr, #14]	@ movhi
	strh	r4, [ip, #4]	@ movhi
	add	lr, r2, #15872
	strh	r4, [ip, #8]	@ movhi
	strh	r4, [ip, #10]	@ movhi
	strh	r4, [ip, #12]	@ movhi
	strh	r4, [r0, #6]	@ movhi
	add	ip, r3, #4048
	strh	r4, [r0, #8]	@ movhi
	add	r3, r3, #4064
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	add	r0, r1, #440
	strh	r5, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	strh	r4, [ip, #8]	@ movhi
	add	lr, r1, #444
	strh	r4, [ip, #10]	@ movhi
	strh	r4, [ip, #12]	@ movhi
	strh	r5, [ip, #14]	@ movhi
	strh	r4, [r3]	@ movhi
	add	ip, r1, #448
	strh	r5, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	add	r0, r1, #452
	strh	r4, [lr]	@ movhi
	add	r3, r1, #928
	strh	r5, [lr, #2]	@ movhi
	add	r6, r1, #924
	strh	r5, [ip]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	add	r0, r1, #932
	strh	r4, [r6, #2]	@ movhi
	add	lr, r1, #936
	strh	r5, [r3]	@ movhi
	add	ip, r1, #968
	strh	r5, [r3, #2]	@ movhi
	strh	r5, [r0]	@ movhi
	add	r3, r1, #1408
	strh	r4, [r0, #2]	@ movhi
	add	r0, r2, #17664
	strh	r4, [lr]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [r3]	@ movhi
	strh	r4, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	strh	r5, [r3, #6]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	add	r3, r0, #138
	add	r0, r0, #174
.L135:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r0
	bne	.L135
	add	r3, r1, #1888
	add	r0, r2, #18176
	strh	r4, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r5, [r3, #10]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	add	r3, r0, #112
	add	r0, r0, #138
.L136:
	strh	r5, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L136
	add	r0, r1, #1920
	add	r3, r1, #2368
	add	ip, r1, #2384
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	add	r0, r2, #18688
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	strh	r4, [ip]	@ movhi
	add	r3, r0, #82
	add	r0, r0, #106
.L137:
	strh	r5, [r3], #2	@ movhi
	cmp	r0, r3
	bne	.L137
	add	r1, r1, #2400
	add	r2, r2, #19200
	strh	r4, [r1, #10]	@ movhi
	strh	r4, [r1, #12]	@ movhi
	add	r3, r2, #46
	add	r2, r2, #76
.L138:
	strh	r4, [r3], #2	@ movhi
	cmp	r3, r2
	bne	.L138
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	videoBuffer
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r3
	mov	r4, r2
	mov	r5, r0
	ldrh	r7, [sp, #24]
	bl	base
	mov	r3, r7
	mov	r2, r6
	mov	r1, #0
	mov	r0, #13
	bl	bucket
	ldr	r3, .L148
	ldr	ip, [r3]
	add	r0, ip, #4096
	add	lr, ip, #6272
	strh	r4, [lr, #12]	@ movhi
	add	lr, r0, #2192
	strh	r4, [lr]	@ movhi
	add	lr, r0, #2656
	strh	r4, [lr, #12]	@ movhi
	add	lr, r0, #2672
	strh	r4, [lr]	@ movhi
	strh	r4, [lr, #4]	@ movhi
	add	lr, ip, #7232
	strh	r4, [lr, #12]	@ movhi
	add	lr, r0, #3152
	strh	r4, [lr]	@ movhi
	add	r3, ip, #8192
	strh	r4, [lr, #4]	@ movhi
	add	lr, r0, #3616
	add	r0, r0, #3632
	strh	r4, [lr, #12]	@ movhi
	add	r6, r3, #492
	strh	r4, [lr, #14]	@ movhi
	strh	r4, [r0]	@ movhi
	add	lr, r3, #496
	strh	r4, [r0, #4]	@ movhi
	add	r0, r3, #968
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	strh	r4, [r6]	@ movhi
	strh	r4, [r6, #2]	@ movhi
	strh	r4, [lr]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r4, [r0]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	add	r0, r3, #972
	strh	r4, [r0]	@ movhi
	add	lr, r3, #976
	strh	r5, [r0, #2]	@ movhi
	add	r0, r3, #1440
	strh	r4, [lr]	@ movhi
	add	r6, r3, #1456
	strh	r4, [r0, #8]	@ movhi
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	add	r0, ip, #10112
	strh	r5, [r6]	@ movhi
	add	lr, r3, #1936
	strh	r4, [r0, #8]	@ movhi
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	add	r0, r3, #2400
	strh	r4, [lr, #2]	@ movhi
	add	r2, ip, #12288
	strh	r4, [r0, #10]	@ movhi
	add	lr, r3, #2896
	strh	r4, [r0, #12]	@ movhi
	add	r6, r3, #2416
	strh	r4, [r0, #14]	@ movhi
	add	r0, r3, #3376
	add	r3, r3, #3856
	strh	r4, [r6, #2]	@ movhi
	strh	r4, [lr]	@ movhi
	add	r6, r2, #720
	strh	r4, [lr, #4]	@ movhi
	strh	r4, [r0]	@ movhi
	add	lr, r2, #724
	strh	r4, [r0, #4]	@ movhi
	strh	r4, [r3]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	add	r3, r2, #728
	strh	r4, [r2, #242]	@ movhi
	add	r0, r2, #1200
	strh	r4, [r2, #246]	@ movhi
	strh	r4, [r6, #2]	@ movhi
	strh	r4, [lr, #2]	@ movhi
	strh	r4, [r3]	@ movhi
	add	lr, r2, #1680
	add	r3, r2, #2160
	strh	r4, [r0, #2]	@ movhi
	add	r1, ip, #16384
	strh	r4, [r0, #6]	@ movhi
	add	r7, r2, #2656
	strh	r5, [r0, #8]	@ movhi
	add	r6, r2, #3120
	strh	r4, [lr, #4]	@ movhi
	add	r0, r2, #2640
	strh	r5, [lr, #8]	@ movhi
	add	ip, ip, #15424
	strh	r5, [lr, #10]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	add	lr, r2, #3600
	strh	r5, [r3, #6]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	strh	r5, [r3, #10]	@ movhi
	strh	r5, [r3, #12]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	add	r3, r2, #3616
	strh	r4, [r0, #6]	@ movhi
	add	r2, r2, #4080
	strh	r5, [r0, #8]	@ movhi
	strh	r5, [r0, #10]	@ movhi
	strh	r4, [r7]	@ movhi
	add	r0, r1, #484
	strh	r4, [r6, #8]	@ movhi
	add	r7, r1, #476
	strh	r4, [ip, #2]	@ movhi
	add	r6, r1, #488
	strh	r4, [lr, #10]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	add	r3, r1, #960
	strh	r4, [r2, #12]	@ movhi
	add	lr, r1, #964
	strh	r5, [r1, #4]	@ movhi
	add	r2, r1, #1920
	strh	r4, [r7, #2]	@ movhi
	add	ip, r1, #968
	strh	r5, [r0]	@ movhi
	strh	r4, [r6]	@ movhi
	add	r0, r1, #1440
	strh	r4, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	add	r3, r1, #2400
	add	r1, r1, #2880
	strh	r5, [lr]	@ movhi
	strh	r4, [ip, #2]	@ movhi
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #12]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	strh	r4, [r2, #10]	@ movhi
	strh	r4, [r2, #12]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r1, #10]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	videoBuffer
	.size	frame3, .-frame3
	.align	2
	.global	frame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame4, %function
frame4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, r3
	mov	r4, r2
	mov	r5, r0
	ldrh	r7, [sp, #24]
	bl	base
	mov	r3, r7
	mov	r2, r6
	mov	r1, #0
	mov	r0, #25
	bl	bucket
	ldr	r3, .L156
	ldr	r2, [r3]
	add	r1, r2, #5824
	add	r0, r2, #4096
	strh	r4, [r1, #6]	@ movhi
	add	lr, r0, #2208
	strh	r4, [r1, #10]	@ movhi
	add	r0, r0, #3168
	add	r3, r2, #6784
	add	ip, r2, #7744
	add	r1, r2, #8192
	strh	r4, [lr, #6]	@ movhi
	strh	r4, [lr, #10]	@ movhi
	strh	r4, [lr, #14]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r3, #14]	@ movhi
	strh	r4, [r0, #6]	@ movhi
	add	r3, r2, #8704
	strh	r4, [r0, #8]	@ movhi
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r0, #14]	@ movhi
	strh	r4, [ip, #6]	@ movhi
	add	r0, r2, #11072
	strh	r5, [ip, #8]	@ movhi
	strh	r4, [ip, #10]	@ movhi
	strh	r4, [ip, #12]	@ movhi
	strh	r4, [r1, #38]	@ movhi
	strh	r5, [r1, #40]	@ movhi
	strh	r4, [r1, #42]	@ movhi
	strh	r4, [r1, #44]	@ movhi
	add	r3, r3, #6
	add	r0, r0, #38
.L151:
	strh	r4, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	add	r3, r3, #480
	cmp	r0, r3
	bne	.L151
	add	r3, r2, #11584
	add	r0, r1, #2912
	add	r1, r1, #3872
	strh	r4, [r0, #6]	@ movhi
	strh	r4, [r0, #8]	@ movhi
	strh	r4, [r0, #10]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r1, #4]	@ movhi
	add	r3, r2, #12544
	strh	r4, [r1, #6]	@ movhi
	strh	r4, [r1, #10]	@ movhi
	add	r1, r2, #18176
	add	r3, r3, #4
	add	r1, r1, #132
.L152:
	strh	r4, [r3]	@ movhi
	strh	r5, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	add	r3, r3, #480
	cmp	r1, r3
	bne	.L152
	add	r2, r2, #16384
	add	r3, r2, #1920
	add	r1, r2, #2400
	add	r2, r2, #2880
	strh	r4, [r3, #4]	@ movhi
	strh	r4, [r3, #6]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	r4, [r1, #6]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	r4, [r1, #10]	@ movhi
	strh	r4, [r2, #8]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	.align	2
.L156:
	.word	videoBuffer
	.size	frame4, .-frame4
	.align	2
	.global	drawFrame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFrame, %function
drawFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L172
	ldr	r3, .L172+4
	sub	sp, sp, #12
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, [r5]
	sub	r3, r3, #1
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L159
.L161:
	.word	.L164
	.word	.L163
	.word	.L162
	.word	.L160
.L164:
	ldr	r3, .L172+8
	ldrh	r3, [r3]
	mov	r2, r3
	mov	r1, r3
	mov	r0, r3
	str	r3, [sp]
	bl	frame1
.L159:
	sub	r0, r4, #1
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L165
.L167:
	.word	.L170
	.word	.L169
	.word	.L168
	.word	.L166
.L166:
	ldr	r2, .L172+12
	ldr	r3, .L172+16
	str	r2, [sp]
	ldr	r1, .L172+20
	mov	r2, #0
	ldr	r0, .L172+24
	bl	frame4
.L165:
	ldr	r3, .L172+28
	ldr	r3, [r3]
	str	r3, [r5]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L168:
	ldr	r2, .L172+12
	ldr	r3, .L172+16
	str	r2, [sp]
	ldr	r1, .L172+20
	mov	r2, #0
	ldr	r0, .L172+24
	bl	frame3
	b	.L165
.L169:
	ldr	r2, .L172+12
	ldr	r3, .L172+16
	str	r2, [sp]
	ldr	r1, .L172+20
	mov	r2, #0
	ldr	r0, .L172+24
	bl	frame2
	b	.L165
.L170:
	ldr	r2, .L172+12
	ldr	r3, .L172+16
	str	r2, [sp]
	ldr	r1, .L172+20
	mov	r2, #0
	ldr	r0, .L172+24
	bl	frame1
	b	.L165
.L160:
	ldr	r3, .L172+8
	ldrh	r3, [r3]
	mov	r2, r3
	mov	r1, r3
	mov	r0, r3
	str	r3, [sp]
	bl	frame4
	b	.L159
.L163:
	ldr	r3, .L172+8
	ldrh	r3, [r3]
	mov	r2, r3
	mov	r1, r3
	mov	r0, r3
	str	r3, [sp]
	bl	frame2
	b	.L159
.L162:
	ldr	r3, .L172+8
	ldrh	r3, [r3]
	mov	r2, r3
	mov	r1, r3
	mov	r0, r3
	str	r3, [sp]
	bl	frame3
	b	.L159
.L173:
	.align	2
.L172:
	.word	lastFrame
	.word	waitForVBlank
	.word	bgColor
	.word	6342
	.word	12684
	.word	17078
	.word	22397
	.word	frame
	.size	drawFrame, .-drawFrame
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	push	{r4, lr}
	mvn	r1, #32768
	mov	r4, #0
	ldr	r0, .L176
	ldr	r2, .L176+4
	strh	r0, [r3]	@ movhi
	ldr	r3, .L176+8
	ldrh	r0, [r2, #48]
	ldr	ip, .L176+12
	ldr	r2, .L176+16
	strh	r0, [r3]	@ movhi
	ldr	r0, .L176+20
	ldr	r3, .L176+24
	strh	r4, [ip]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r2, .L176+28
	ldr	r3, .L176+32
	str	r4, [r2]
	pop	{r4, lr}
	str	r0, [r3]
	b	drawFrame
.L177:
	.align	2
.L176:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	bgColor
	.word	32767
	.word	fillScreen
	.word	lastFrame
	.word	frame
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r6, #1
	push	{r7, lr}
	ldr	r4, .L193
	ldr	r7, .L193+4
	ldr	r3, .L193+8
	mov	lr, pc
	bx	r3
	ldr	r8, .L193+12
	ldrh	r2, [r7]
	ldr	r0, [r4]
	ldr	r5, .L193+16
	ldr	r9, .L193+20
.L179:
	strh	r2, [r8]	@ movhi
	ldrh	r3, [r9, #48]
	tst	r2, #1
	strh	r3, [r7]	@ movhi
	beq	.L180
	tst	r3, #1
	bne	.L180
	add	r0, r0, #1
	cmp	r0, #4
	movgt	r0, #1
	strle	r0, [r4]
	strgt	r6, [r4]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r8]
	ldrh	r3, [r7]
	ldr	r0, [r4]
.L180:
	tst	r2, #2
	beq	.L183
	tst	r3, #2
	bne	.L183
	sub	r0, r0, #1
	cmp	r0, #0
	movle	r3, #4
	movle	r0, r3
	strgt	r0, [r4]
	strle	r3, [r4]
	mov	lr, pc
	bx	r5
	ldrh	r3, [r7]
	ldr	r0, [r4]
.L183:
	mov	r2, r3
	b	.L179
.L194:
	.align	2
.L193:
	.word	frame
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	drawFrame
	.word	67109120
	.size	main, .-main
	.comm	lastFrame,4,4
	.comm	frame,4,4
	.comm	bgColor,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
