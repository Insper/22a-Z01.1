; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]


leaw $0, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)       ; ram[2] eh ram[0], e ram[2] vai diminuindo ate 0

WHILE: ; Vai somando ram[1] ao ram[3], diminui ram[2] ate chegar em 0
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
    jg %D

    