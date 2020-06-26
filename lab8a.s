.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int A: "
odd: .asciiz "is odd"
even: .asciiz "is even"
newline: .asciiz "\n"

.globl main
.text

main: 
	li $v0, 4		    #Loads immediate value of 4 , set $v0 to it
	la $a0, promptA 		#Set $a0 to A
	syscall    		#System call


	li $v0, 5		#Loads immediate value of 5  , set $v0 to it
	syscall 		#System call
	
	IF:
		andi $a0, $v0, 1
		bgtz $a0, ELSE
	THEN:

		li $v0, 4
		la $a0, even
		syscall
		
		j DONE
		
		
	ELSE:
		li $v0, 4
		la $a0, odd
		syscall
		
	DONE:
		

		
	
