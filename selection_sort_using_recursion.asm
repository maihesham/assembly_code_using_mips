#//////////////////////////////////////////////////////////
#frist take search value from user                        /
#seaond take nmbers from and put in array                 / 
# reurn index from 0 to 9                                 /
#//////////////////////////////////////////////////////////
.data 
 arr:.word 40
 t : .asciiz " - " 
 mes1: .asciiz "enter numbers in  array (size 10)\n"
 endli: .asciiz "\n"
 find: .asciiz "find in array \n"
 .text
show:
la $s0,arr
li $t0,0
loop1:
 beq $t0,10,end1
 lw $a0,($s0)
 li $v0,1
 syscall
add $s0,$s0,4
add $t0,$t0,1
j loop1
end1:
jr $ra 
###########################################################################################
takefromuser:
la $s0,arr
li $t0,0
loop:
 beq $t0,10,end
 li $v0,5
 syscall
sw $v0,($s0)
add $s0,$s0,4
add $t0,$t0,1
j loop
end:
jr $ra
############################################################################################
selectionsort:
beq $a1,10,Exit
add $sp,$sp,-4
sw $ra,($sp)
addi $t1,$a1,0 #minindex 
addi $t2,$a1,1 #i
forj:
 beq $t2,11,endsmall # i > size exit
 mul $s1,$t2,4
 sub $s1,$s1,4
 mul $s2,$t1,4
 sub $s2,$s2,4
##################
  lw $t3,arr($s1) # arr(i)
  lw $t4,arr($s2) # arr(minindex)
  blt $t3,$t4,update
  add $t2,$t2,1
  j  forj
update:
add $t1,$t2,0
add $t2,$t2,1
j  forj
endsmall:
#swap start (a1) with min ($t1)
mul $s2,$t1,4
sub $s2,$s2,4
mul $s4,$a1,4
sub $s4,$s4,4
lw $s0,arr($s4) # min
lw $s1,arr($s2)
sw $s0,arr($s2)
sw $s1,arr($s4)
add $a1,$a1,1
jal selectionsort
j Exit
Exit:
lw $ra,($sp)
add $sp,$sp,4
jr $ra
##########################################################################################
main:
la $a0,mes1
li $v0,4
syscall
li $a1,1
jal takefromuser
jal selectionsort
jal show
li $v0,10
syscall     
