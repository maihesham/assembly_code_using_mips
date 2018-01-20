.data
fib:.space 80
me1:.asciiz "enter n = \n  "
t : .asciiz " - " 
endli:.asciiz " \n "
.text
.globl main
makwfib:
 la $s0,fib
 la $s1,fib
 la $s2,fib
 li $t0,0 # i-2
 li $t1,1 # i-1
 sw $t0,($s0)
 sw $t1,4($s0)
 li $t2,0
 li $t3,2
loop: 
beq $t2,11,end
   add $s7,$t0,$t1
   mul $t4,$t3,4 # index
   sw  $s7,fib($t4) #save 
   add $t2,$t2,1
   add $t3,$t3,1
   add $t0,$t1,0
   add $t1,$s7,0
   j loop
end:
jr $ra
main:
jal makwfib
li $v0,5
syscall
mul $s6,$v0,4
lw $a0,fib($s6)
li $v0,1
syscall
li $v0,10
syscall