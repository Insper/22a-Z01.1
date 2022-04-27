; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.


;primeiro teste, fazer r0^r0


; Multiplica o valor de RAM[1] com RAM[2] salvando em RAM[3]

PREMULT:
    leaw $0,%A ;checa se R0 e 0
    movw (%A),%D
    leaw $ZERO,%A
    je %D
    nop

    leaw $0,%A ;salva R0 em R1
    movw (%A),%D
    leaw $1,%A
    movw %D,(%A)

    decw %D ;salva R0-1 em R2
    leaw $2,%A
    movw %D,(%A)
    
    leaw $0,%A ; salva D (decrementado) em R0
    movw %D,(%A)

MULT:

    leaw $2,%A
    movw (%A),%D ; guarda R2 em D
    decw %D ; Decrementa D
    movw %D,(%A) ;guarda D em R2

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
    leaw $0,%A ;decrementa R0
    movw (%A),%D
    decw %D
    movw %D,(%A)

    leaw $2,%A ;salva R0 (novo R0 decrementado) em R2
    movw %D,(%A)

    leaw $3,%A ;salva R3 em R1
    movw (%A),%D 
    leaw $1,%A
    movw %D,(%A)

    leaw $0,%A ;zera R3
    movw %A,%D
    leaw $3,%A
    movw %D,(%A)

    leaw $0,%A
    movw (%A),%D
    leaw $ENDFAC,%A;pula para ENDFAC se R0 == 0
    je %D
    nop

    leaw $MULT,%A ;pula para mult
    jmp
    nop

ZERO:
    leaw $1,%A
    movw %A,%D
    movw %D,(%A)

ENDFAC:
    nop