; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.


;R1 = R0-1

;MULT
;R0 = mult R0*R1
;ENDMULT
;R1 -= 1
;se R1 > 0 pula para Mult
;R1 = R0 


INICIO:
    leaw $0,%A ;R1 = R0-1
    movw (%A),%D
    decw %D
    leaw $1,%A
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
END:
    leaw $3,%A ;R0 = R0*R1 --> (esse resultado esta salvo em R3): R0 = R3
    movw (%A),%D
    leaw $0,%A
    movw %D,(%A)

    leaw $1,%A ; R1 -= 1
    movw (%A),%D
    decw %D
    movw %D,(%A)

    leaw %MULT,%A ;se R1 > 0 pula para Mult
    jg %D
    nop

    leaw $0,%A ;R1 = R0
    movw (%A),%D
    leaw $1,%A
    movw %D,(%A)