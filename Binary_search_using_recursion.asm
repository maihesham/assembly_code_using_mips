
 
  
#//////////////////////////////////////////////////////////
#frist take search value from user                        /
#seaond take nmbers from and put in array                 / 
# reurn index from 0 to 9                                 /
#//////////////////////////////////////////////////////////
.data 
 arr:.word 40
 t : .asciiz " - " 
 mes1: .asciiz "enter numbers in  array (size 10)\n"
 values: .asciiz "enter search value \n"
 endli: .asciiz "\n"
 find: .asciiz "find in array \n"
 notfindit :.asciiz "number not found in array \n"
 index: .asciiz "index of value from (0 to 9) =>  index of value in array =  "
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
binarsearch:
la $s0,arr
bgt $a1,$a2,endnotfound
add $sp,$sp,-4
sw $ra,($sp)
add $t1,$a1,$a2
div $t2,$t1,2 # calcute mid 
mul $t7,$t2,4
sub $t7,$t7,4
add $t6,$t7,$s0
lw $t3,($t6)
beq $t3,$a3,endallfoundit
blt $t3,$a3,less
bgt $t3,$a3,gret
endnotfound:
la $a0,notfindit
li $v0,4
syscall
j Exit
endallfoundit:
la $a0,find
li $v0,4
syscall
j Exit
less:
 #low
 add $a1,$t2,1
 jal binarsearch
 j Exit
gret:
 sub $a2,$t2,1
 jal binarsearch
 j Exit
Exit:
lw $ra,($sp)
add $sp,$sp,4
jr $ra
##########################################################################################
main:
la $a0,values
li $v0,4
syscall
li $v0,5
syscall
addi $a3,$v0,0 # save search value in $a1
la $a0,mes1
li $v0,4
syscall
jal takefromuser
#jal show
li $a1,0 #low  
li $a2,9 # high
jal binarsearch
li $v0,10
syscall     
