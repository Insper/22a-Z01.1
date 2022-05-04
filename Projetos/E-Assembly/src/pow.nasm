; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


INICIO: ; salvar R1 na RAM[0]
    leaw $1,%A
    movw (%A),%D
    leaw $0,%A
    movw %D,(%A)
    

MULT:

    leaw $0,%A
    movw (%A),%D ; guarda R0 em D
    decw %D ; Decrementa D
    movw %D,(%A) ;guarda D em R0

    leaw $END,%A 
    jl %D ; se D for < 0 pula para END, isso pois na primeira execucao estamos somando R3 com R1 e R3 = 0 na primeira entao precisamos iterar R0 + 1 vezes.
    nop

    leaw $3,%A  ;guarda R3 em D
    movw (%A),%D
    leaw $1,%A
    addw %D,(%A),%D ; Soma D com R1 e guarda em D
    leaw $3,%A ;guarda D em R3
    movw %D,(%A)

    leaw $MULT,%A ;pula para MUlT (reinicia o loop)
    jmp 
    nop
END: ; salvar RAM[3] em RAM[0]
    leaw $3,%A
    movw (%A),%D
    leaw $0,%A
    movw %D,(%A)
    nop