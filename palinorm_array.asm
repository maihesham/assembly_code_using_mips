.data
arr: .space 80
me:.asciiz  "false"
mess:.asciiz  "true"
.text
.globl main
main:
li $v0,5
syscall
add $s0, $v0,0
la $t0,arr
li $t1,0
takearray:
   beq $t1,$s0,endprocess
     li $v0,5
     syscall
     sw $v0,($t0)
     addi $t1,$t1,1
     addi $t0,$t0,4
     j takearray
endprocess:
la $t1,arr #array
la $t5,arr  #array
sub $t2,$s0,1
mul $s4,$t2,4
add $t5,$t5,$s4
li $t3,0
pal:
   bge $t3,$t2,end
     lw $s7,($t1)
     lw $s6,($t5)
        beq $s7,$s6,true
        bne $s7,$s6,false
true:
     sub $t5,$t5,4
     addi $t1,$t1,4
     add $t3,$t3,1
     sub $t2,$t2,1
     j pal
false:
 li $v0,4
 la $a0,me
 syscall
j Exit
end:
li $v0,4
 la $a0,mess
 syscall
Exit:
li $v0,10
syscall 