.data 

promptA: .asciiz "How many numbers?  "
promptB: .asciiz "Enter an int : "
product: .asciiz "The product is : "
even: .asciiz "is even"
newline: .asciiz "\n"
N: .word 5

.globl main
.text

main: 

	li $v0, 4		  
	la $a0, promptA 
	syscall  
		
	li $v0, 5
	syscall 
	move $t3,$v0

LOOPINIT:
	li $t0,1
	li $t2,1

WHILE:
	subu $t1, $t0, $t3
	bgtz $t1,DONE
	
	li $v0, 4		  
	la $a0, promptB
	syscall  
		
	li $v0, 5
	syscall 
	
	multu $t2,$v0
	mflo $t2
	
	addi $t0, $t0, 1
	j WHILE	

DONE:

	li $v0, 4
	la $a0, product
	syscall
	
	li $v0, 1
	move $a0, $t2	
	syscall 