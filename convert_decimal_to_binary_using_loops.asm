.data
res: .space 40
sp:.asciiz " - \n " 
.text
.globl main
convert:
addi $t0,$a1,0
addi $t2,$a1,0
li $t1,0
loop:
  ble $t0,0,endcount
  srl $t0,$t0,1
  addi $t1,$t1,1
  j loop
endcount:
la $s0,res
loop1:
  ble $t2,0,endconver
  rem $t3,$t2,2
  sw $t3,($s0)
  addi $s0,$s0,4
  div $t2,$t2,2
  j loop1
endconver:
add $v1,$t1,0
jr $ra
main:
li $v0,5
syscall
addi $a1,$v0,0
jal convert  #pass number in $a0 , return in $v0
la $a0,sp
li $v0,4
syscall
la $s0,res
add $t0,$v1,0
mul $t1,$t0,4
sub $t1,$t1,4
add $s0,$s0,$t1
loop2:
beq $t0,0,exit
lw $t1,($s0)
add $a0,$t1,0
li $v0,1
syscall
sub $t0,$t0,1
sub $s0,$s0,4
j loop2
exit:
li $v0,10
syscall 