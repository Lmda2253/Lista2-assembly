
.data
    msg: .asciiz "Digite um numero positivo: "
    maiorMsg: .asciiz "\nMaior valor: "
    menorMsg: .asciiz "\nMenor valor: "

.text

main:
    li $t0, 0
    li $t1, 0

ler:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    blez $t2, ler

    beq $t0, $zero, primeiro

    slt $t3, $t2, $t1
    bne $t3, $zero, atualizar_menor

    j verificar_maior

atualizar_menor:
    move $t1, $t2

verificar_maior:
    slt $t3, $t2, $t4
    beq $t3, $zero, atualizar_maior
    j contar

atualizar_maior:
    move $t4, $t2
    j contar

primeiro:
    move $t1, $t2
    move $t4, $t2

contar:
    addi $t0, $t0, 1
    li $t3, 10
    bne $t0, $t3, ler

mostrar:
    li $v0, 4
    la $a0, maiorMsg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, menorMsg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

 
