.data
binarynum: .space 20 
me:.asciiz " enter size of binarnumber  : - \n "
me2:.asciiz " enter  binarnumber  : - \n "
me3:.asciiz " end  : - \n "
me4:.asciiz " result decimal is   : - \n "
.text
.globl main
calculatepower:
add $sp,$sp,-4
sw $ra,($sp)
li $s1,0
li $v0,1
pow:
  beq $s1,$a2,endof 
    mul $v0,$v0,2
    add $s1,$s1,1
    j pow 
endof :   
lw $ra,($sp)
add $sp,$sp,4
jr $ra
convert: # pass result in v1
add $sp,$sp,-4
sw $ra,($sp)
li $t0,0 
li $v1,0
la $s0,binarynum
mul $t7,$a1,4
sub $t7,$t7,4
add $s0,$s0,$t7
calculate: # tprint number as array 
 beq $t0,$a1,endcalculate
 lw $a0,($s0)
 add $a2,$t0,0
 jal calculatepower # pass result in $v0 , pass argument in $a2
 mul $t6,$v0,$a0
 add $v1,$v1,$t6
 sub $s0,$s0,4
 add $t0,$t0,1
 j calculate
endcalculate:
lw $ra,($sp)
add $sp,$sp,4
jr $ra
main:
li $v0,4
la $a0,me
syscall
li $v0,5
syscall 
add $a1,$v0,0 # save size in $a1
li $v0,4
la $a0,me2
syscall
li $t0,0 
la $s0,binarynum
loop: # take number as array 
 beq $t0,$a1,end
 li $v0,5
 syscall
 sw $v0,($s0)
 add $s0,$s0,4
 add $t0,$t0,1
 j loop
end:
li $v0,4
la $a0,me3
syscall
jal convert
li $v0,4
la $a0,me4
syscall
add $a0,$v1,0
li $v0,1
syscall
li $v0,10
syscall 