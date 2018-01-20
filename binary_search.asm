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
li $s1,0 #l
li $s2,9 #h
loop4:
 add $s3,$s2,$s1
 div $t0,$s3,2 # mid $t0
 bgt $s1,$s2,endnotfound
 ###############
 mul $t1,$t0,4
 sub $t1,$t1,4
 add $t7,$s0,$t1 # now $t7 in address of mid 
 lw $t4,($t7) # $t4 has value of mid in array
 beq $t4,$a1,findend
 blt $t4,$a1,less
 bgt $t4,$a1,gret
less:
 #low
 add $s1,$t0,1
 j loop4
gret:
 sub $s2,$t0,1
 j loop4
endnotfound:
la $a0,notfindit
li $v0,4
syscall
jr $ra
findend:
la $a0,find
li $v0,4
syscall
jr $ra
##########################################################################################
main:
la $a0,values
li $v0,4
syscall
li $v0,5
syscall
addi $a1,$v0,0 # save search value in $a1
la $a0,mes1
li $v0,4
syscall
jal takefromuser
jal binarsearch
li $v0,10
syscall     
