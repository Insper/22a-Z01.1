; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)

leaw $ZERO, %A
je %D
nop

decw %D
leaw $2, %A
movw %D, (%A)
leaw $3, %A
movw %D, (%A)

LOOP:

    leaw $0, %A
    movw (%A), %D
    leaw $1, %A
    addw %D, (%A), %D
    movw %D, (%A)

    leaw $2, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)
    decw %D

    leaw $FIM, %A
    je %D
    nop

    leaw $LOOP, %A
    jmp
    nop
        
FIM:

    leaw $1, %A
    movw (%A), %D
    leaw $0, %A
    movw %D, (%A)

    leaw $3, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)
    leaw $2, %A
    movw %D, (%A)
    decw %D

    leaw $END, %A
    je %D
    nop

    leaw $LOOP, %A
    jmp
    nop

ZERO:

leaw $1, %A
movw %A, (%A)

END: