	.data

A: 	.word    2,-1,-1,-2,
        	 1,-4, 0, 0,
            	 1, 2, 8, 2,
                 0, 4,-2, 3                                                                    

	.text
	.globl main
main:
	li 	$t0, 0
	li	$t1, 4
	la	$t5, A
for1:
	bge	$t0, $t1, fifor1
	li 	$t2, 0
	
for2:	
	bge	$t2, $t0, fifor2
	sll	$t3, $t0, 4
	sll	$t4, $t2, 2
	addu	$t4, $t4, $t3
	addu	$t4, $t4, $t5
	sll 	$t3, $t0, 2
	sll	$t6, $t2, 4
	addu 	$t6, $t6, $t3
	addu	$t6, $t6, $t5
	lw	$t9, 0($t4)
	lw	$t8, 0($t6)
	bge	$t9, $zero, else
	subu	$t7, $t9, $t8
	b 	fin
else:	
	move	$t7, $t9
fin:
	sw	$t7, 0($t6)
	addiu	$t2, $t2, 1
	b	for2
fifor2:	
	addiu 	$t0, $t0, 1
	b 	for1
fifor1:
      	jr  	$ra 

