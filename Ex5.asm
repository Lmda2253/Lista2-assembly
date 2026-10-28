
.data
    msg1: .asciiz "Digite o primeiro numero: "
    msg2: .asciiz "Digite o segundo numero: "
    resultado: .asciiz "Soma dos impares: "

.text

main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    slt $t2, $t0, $t1
    bne $t2, $zero, ordenar

    move $t3, $t0
    move $t0, $t1
    move $t1, $t3

ordenar:
    li $t2, 0

somar:
    bgt $t0, $t1, mostrar

    andi $t3, $t0, 1
    beq $t3, $zero, proximo

    add $t2, $t2, $t0

proximo:
    addi $t0, $t0, 1
    j somar

mostrar:
    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

   
