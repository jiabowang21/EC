	.data
vec:  	.word 0,0,1,1,2,2,3,3,4,4
vec_c: 	.asciiz "EXAMENCASA"
res:	.word 0
sortida1: .asciiz "Caracter retornat per examen: "
sortida2: .asciiz "Valor de la variable res: "

	.text
	.globl main
	
# ESCRIU AQUI EL TEU CODI
examen:
	addiu 	$sp, $sp, -68
	sw	$ra, 52($sp)
	sw	$s0, 56($sp)
	sw	$s1, 60($sp)
	sw	$s2, 64($sp)
	move	$s0, $a0
	move	$s2, $a2
	move	$a0, $a1
	move 	$a1, $sp
	jal	ini_vl1
	move	$s1, $v0
	addiu	$a0, $sp, 12
	move	$a1, $s0
	move	$a2, $s1
	jal	ini_vl2
	move	$t7, $v0
	li 	$t0, 0
	li	$t1, 2
	li 	$t2, 10
	addiu	$t5, $sp, 12
for:
	bge	$t1, $t2, fifor
	sll	$t4, $t1, 2
	addu	$t4, $t4, $t5
	lw	$t4, 0($t4)
	addu	$t0, $t4, $t0
	addiu	$t1, $t1, 1
	b for
fifor:
	multu	$t0, $t0
	mflo	$t0
	sw	$t0, 0($s2)
	sll	$t7, $t7, 2
	addu	$t7, $t7, $t5
	lw	$t7, 0($t7)
	addu	$t7, $t7, $sp
	lb	$v0, 0($t7)
	lw 	$s0, 56($sp)
	lw	$s1, 60($sp)
	lw	$s2, 64($sp)
	lw	$ra, 52($sp)
	addiu 	$sp, $sp, 68
	jr 	$ra
	



	
# NO CANVIEU RES DEL CODI A PARTIR D'ADQUESTA LINIA	 	

main:
	addiu	$sp, $sp, -16
	sw	$ra, 0($sp)
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)
	sw 	$s2, 12($sp)
	
	li	$v0, 4
	la	$a0, sortida1
	syscall 
	jal	nofares
	la	$s0, vec
	la 	$s1, vec_c
	la	$s2, res
	move 	$a0, $s0
	move 	$a1, $s1
	move 	$a2, $s2
	jal	examen
	move 	$a0, $s0
	move 	$a1, $s1
	move 	$a2, $s2
	jal 	examen
	move	$a0, $v0
	li	$v0, 11
	syscall
	li	$a0, 10
	li	$v0, 11
	syscall
	la	$a0, sortida2
	li	$v0, 4
	syscall
	la	$t0, res
	lw	$a0, 0($t0)
	li	$v0, 1
	syscall
	
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)
	lw	$s2, 12($sp)
	addiu	$sp, $sp, 16
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra

#inits vl1 with values of vec_c
ini_vl1:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$t1, 0
	li 	$t3, 10
l_vl1:	lb	$t2, 0($a0)
	sb	$t2, 0($a1)
	addiu	$a1, $a1, 1
	addiu	$a0, $a0, 1
	addiu	$t1, $t1, 1
	bne	$t1, $t3, l_vl1
	jal	nofares
	li	$v0, 2
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

#inits vl2 with values of vec+2
ini_vl2:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	li	$t1, 0
	li 	$t3, 10
l_vl2:	lw	$t2, 0($a1)
	addu	$t2, $t2, $a2
	sw	$t2, 0($a0)
	addiu	$a0, $a0, 4
	addiu	$a1, $a1, 4
	addiu	$t1, $t1, 1
	bne	$t1, $t3, l_vl2	
	jal	nofares
	li	$v0, 1
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

