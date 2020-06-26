.data 
array1:    .word    5, 8, 3, 4, 7, 2
arrend:
product: .asciiz "The product is : "
newline: .asciiz "\n"

.globl main
.text

main: 
	li $t0,1
	la $t3,array1
	la $t2,arrend
	j Product

Loop:
	
	lw $t4,0($t3)
	addi $t3,$t3,4 
	multu $t0,$t4
	mflo $t0

Product:
	blt $t3,$t2,Loop  

	li $v0, 4
	la $a0, product
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall 
