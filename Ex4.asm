
.data
    msg: .asciiz "Digite uma nota: "
    mediaMsg: .asciiz "\nMedia: "
    aprovado: .asciiz "\nAPROVADO"
    exame: .asciiz "\nEXAME"
    retido: .asciiz "\nRETIDO"

.text

main:
    li $t0, 0
    li $t1, 4

ler_notas:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall

    add $t0, $t0, $v0
    addi $t1, $t1, -1
    bne $t1, $zero, ler_notas

    li $t2, 4
    div $t0, $t2
    mflo $t3

    li $v0, 4
    la $a0, mediaMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    bge $t0, 24, mostrar_aprovado
    bge $t0, 12, mostrar_exame
    j mostrar_retido

mostrar_aprovado:
    li $v0, 4
    la $a0, aprovado
    syscall
    j fim

mostrar_exame:
    li $v0, 4
    la $a0, exame
    syscall
    j fim

mostrar_retido:
    li $v0, 4
    la $a0, retido
    syscall

fim:
    li $v0, 10
    syscall
