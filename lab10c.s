.data
prompt: .asciiz "Enter an int : "
res: .asciiz "The result is : "

.text 
main:
	li $v0, 4		  
	la $a0, prompt 
	syscall  
	
	li $v0, 5
	syscall 
	
	move $a0,$v0
	jal mystery
	
	li $v0,4
	la $a0,res
	syscall 
	
	add $a0, $v0, $zero
   	li  $v0, 1
    	syscall

    	li $v0, 10
    	syscall
	
	
	
mystery:
	addi $sp,$sp,-12
	sw $ra, 0($sp) 
	sw   $s0, 4($sp)
	sw   $s1, 8($sp)
	
	add $s0, $a0, $zero
	 
	beq  $s0, $zero, return0

	addi $a0, $s0, -1
	
	jal mystery
	
	add $s1, $zero, $v0 # $s1 = mystery(n-1)
	
	mul $t5,$a0,2
	addi $t5,$t5,-1
	add $v0,$t5,$zero       # $v0 = 2*n -1
	
	add $v0, $t5, $s1  # $v0 = mystery(n-1) + 2*n -1
	

exit:

        lw   $ra, 0($sp)   
        lw   $s0, 4($sp)
        lw   $s1, 8($sp)
        addi $sp, $sp, 12 
        jr $ra	
			
return0:
	
	li $v0,0	
	j exit
	
