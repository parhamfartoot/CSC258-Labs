.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int A: "
odd: .asciiz "TOO MANY TIMES"
even: .asciiz "is even"
newline: .asciiz "\n"
N: .word 5

.globl main
.text

main: 
	lw $a1, N 

	
	LOOPINIT:
		li $t0,1

	WHILE:
	
		subu $t1, $t0, $a1
		bgtz $t1,DONE
		
		li $v0, 4		  
		la $a0, promptA 
		syscall  
		
		li $v0, 5
		syscall 
		
		IF:
			andi $a0, $v0, 1
			bgtz $a0, ELSE
			THEN:

			li $v0, 4
			la $a0, even
			syscall
			
			li $v0, 4
			la $a0, newline
			syscall
			
			j DONE1
		ELSE:
		
		addi $t0, $t0, 1
		j WHILE	
		
	DONE:
		li $v0, 4
		la $a0, odd
		syscall
	DONE1:

		
	
