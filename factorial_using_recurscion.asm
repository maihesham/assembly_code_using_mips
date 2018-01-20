.data
prompt: .asciiz "Enter N value: "
results: .asciiz "\nFactorial of N = "
n: .word 0
answer: .word 0
.text
.globl main
#pass $a0 , n 
fact:
sub $sp, $sp, 8
sw $ra, ($sp)
sw $s0, 4($sp)
li $v1, 1
beq $a1, 0, factDone
move $s0, $a1 # fact(n1)
sub $a1, $a1, 1
jal fact
mul $v1, $s0, $v1 # n * fact(n1)
factDone:
lw $ra, ($sp)
lw $s0, 4($sp)
add $sp, $sp, 8
jr $ra
main:
li $v0, 4 # print prompt string
la $a0, prompt
syscall
li $v0, 5 # read N (as integer)
syscall
sw $v0, n
lw $a1, n
jal fact
sw $v1, answer
li $v0, 4 # print prompt string
la $a0, results
syscall
li $v0, 1 # print integer
lw $a0, answer
syscall
li $v0, 10 # call code for terminate
syscall # system call
.end main