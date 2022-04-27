; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $1, %A
movw %A, (%A)

WHILE:
    leaw $0, %A
    movw (%A), %D

    leaw $0, %A
    movw (%A), %D
    leaw $2, %A
    movw %D, (%A)   ; ram[2] = ram[0], e ram[2] vai diminuindo ate 0

    leaw $0, %A
    movw %A, %D
    leaw $3, %A
    movw %D, (%A)

    MULTI: ; Vai somando ram[1] ao ram[3], diminui ram[2] ate chegar em 0
        leaw $1, %A
        movw (%A), %D       ; D eh ram[1]
        leaw $3, %A
        addw (%A), %D, %D   ; D eh a soma de ram[1] e ram[3]
        movw %D, (%A)       ; guarda D em ram[3]

        ; agora diminui ram[2] em 1
        leaw $2, %A
        movw (%A), %D
        decw %D
        movw %D, (%A)
        
        ; checa se ram[2] > 0
        leaw $MULTI, %A
        jg %D
        nop
    ;MULTIPLICA D(R0) POR R1

    leaw $3, %A
    movw (%A), %D
    leaw $1, %A
    movw %D, (%A)    ;ram[1] = ram[3]

    leaw $0, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)

    leaw $WHILE, %A
    jg %D   ;continua o loop enquanto D > 0
    nop

