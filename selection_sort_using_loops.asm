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
#################################################################################################
selectionsort:
li $t0,1  # i 
li $t1,1 # j
li $t2,1 #min
la $s0,arr
fori:
 beq $t0,10,endall
 addi $t1,$t0,1 #update j 
 addi $t2,$t0,0 # update min
 forj:
  beq $t1,11,exitsmall
 ###############
mul $s1,$t1,4
sub $s1,$s1,4
mul $s2,$t2,4
sub $s2,$s2,4
##################
  lw $t3,arr($s1)
  lw $t4,arr($s2)
  blt $t3,$t4,update
  add $t1,$t1,1
  j  forj
update:
add $t2,$t1,0
add $t1,$t1,1
j  forj
exitsmall:
mul $s4,$t2,4
sub $s4,$s4,4
##################
mul $s2,$t0,4
sub $s2,$s2,4
lw $s0,arr($s4)
lw $s1,arr($s2)
sw $s0,arr($s2)
sw $s1,arr($s4)
add $t0,$t0,1
j fori
endall:
jr $ra
main:
la $a0,mes1
li $v0,4
syscall
jal takefromuser
jal selectionsort
jal show
li $v0,10
syscall     