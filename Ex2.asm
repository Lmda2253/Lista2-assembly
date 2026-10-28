
.data
    msg: .asciiz "Digite o raio: "
    resultado: .asciiz "Comprimento: "

.text

main:
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 6
    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, resultado
    syscall

    li $v0, 1
    move $a0, $t2
    syscall


