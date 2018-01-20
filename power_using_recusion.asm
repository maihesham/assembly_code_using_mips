.data
prompt: .asciiz "Enter N value: "
results: .asciiz "\nFactorial of N = "
n: .word 0
answer: .word 0
.text
.globl main
#pass $a0 , n 
pow:
sub $sp, $sp, 8
sw $ra, ($sp)
sw $s0, 4($sp)
li $v1,1
beq $a2, 0, powDone
move $s0, $a2 # fact(n1)
sub $a2, $a2, 1
jal pow
mul $v1,$v1,$a1
powDone:
lw $ra, ($sp)
lw $s0, 4($sp)
add $sp, $sp, 8
jr $ra
main:
li $v0, 5 # read number
syscall
add $a1,$v0,0
li $v0, 5 # read power
syscall
add $a2,$v0,0
jal pow
add $a0,$v1,0
li $v0, 1 # print integer
syscall
li $v0, 10 # call code for terminate
syscall # system call
.end main