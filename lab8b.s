.data 
# TODO: What are the following 5 lines doing?
promptA: .asciiz "Enter an int A: "
promptB: .asciiz "Enter an int B: "
promptC: .asciiz "Enter an int C: "
resultAdd: .asciiz "A + B + C= "
newline: .asciiz "\n"

.globl main
.text

main: 
    # TODO: Set a breakpoint here and step through. 
    # What does this block of 3 lines do?
	li $v0, 4		    #Loads immediate value of 4 , set $v0 to it
	la $a0, promptA 		#Set $a0 to A
	syscall    	#System call

    # TODO: Set a breakpoint here and step through. 
    # What does this block of 3 lines do?
	li $v0, 5		#Loads immediate value of 5  , set $v0 to it 
	syscall 		#System call
	move $t0, $v0		#Set $t0 to content of $v0

    # TODO: What is the value of "promptB"? Hint: Check the
    # value of $a0 and see what it corresponds to.
	li $v0, 4
	la $a0, promptB
	syscall

    # TODO: Explain what happens if a non-integer is entered
    # by the user.
	li $v0, 5
	syscall 
    # TODO: t stands for "temp" -- why is the value from $v0 
    # being moved to $t1?
	move $t1, $v0

	li $v0, 4
	la $a0, promptC
	syscall 
	
	li $v0, 5
	syscall 
	move $t2, $v0
	
	
	# TODO: What if I want to get A + 1 and B + 42 instead
	add $t3, $t0,$t1
	add $t4, $t3, $t2

	li $v0, 4
	la $a0, resultAdd 	
	syscall

    # TODO: What is the difference between "li" and "move"?
	li $v0, 1
	move $a0, $t4	
	syscall 
	
