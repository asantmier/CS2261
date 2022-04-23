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
	.file	"moves.c"
	.text
	.global	MOVE_HEAL
	.global	MOVE_BLAST
	.global	MOVE_SLASH
	.data
	.align	2
	.type	MOVE_HEAL, %object
	.size	MOVE_HEAL, 88
MOVE_HEAL:
	.ascii	"HEAL\000"
	.space	5
	.ascii	"%s HEALED %s!\000"
	.space	47
	.space	1
	.word	0
	.word	0
	.word	1
	.word	3
	.type	MOVE_BLAST, %object
	.size	MOVE_BLAST, 88
MOVE_BLAST:
	.ascii	"BLAST\000"
	.space	4
	.ascii	"%s BLASTED THE ENEMY!\000"
	.space	39
	.space	1
	.word	3
	.word	1
	.word	0
	.word	0
	.type	MOVE_SLASH, %object
	.size	MOVE_SLASH, 88
MOVE_SLASH:
	.ascii	"SLASH\000"
	.space	4
	.ascii	"%s STRUCK %s!\000"
	.space	47
	.space	1
	.word	4
	.word	0
	.word	0
	.word	0
	.ident	"GCC: (devkitARM release 53) 9.1.0"
