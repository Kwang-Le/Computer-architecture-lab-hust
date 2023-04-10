#Laboratory Exercise 4, Home Assignment 1
.text
start: 
	li $t0, 0	#No Overflow
	addu $s1,$zero, 0x7fffffff
	addu $s2,$zero, 0x00000001
	addu $s3, $s1, $s2 # s3 = s1 + s2
	xor $t1, $s1, $s2 #Test if $s1 and $s2 have the same sign

	bltz $t1, EXIT #if not, exit
	slt $t2, $s3, $s1
	bltz $s1, NEGATIVE #Test if #s1 and $s2 is negative?
	beq $t2, $zero, EXIT #s1 and s2 are positibe
	# if $s3 > $s1 then the result is not overflow
	j OVERFLOW #if $s3 < $s1 then overflow
NEGATIVE:
	bne $t2, $zero, EXIT #s1 and $s2 are negative
		# if $s3 < $s1 then the result is not overflow
OVERFLOW:
	li $t0, 1 #the result is overflow
EXIT: