.data
me:.asciiz  "negative number not alow"
.text
.globl main
main:
li $v0,5
syscall
add $t0, $v0,0
li $v0,5
syscall
add $t1, $v0,0
blt $t1,0,end
li $t2,0
li $t7,1
pow:
  beq $t2,$t1,endof 
    mul $t7,$t7,$t0
    add $t2,$t2,1
    j pow    
end:
li $v0,4
la $a0,me
syscall  
li $v0,10
syscall
endof:
add $a0,$t7,0
li $v0,1
syscall
li $v0,10
syscall 