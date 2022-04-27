; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos



;divide R2 por R4 e armazena o resultado em R0


DIV:
    leaw $2,%A
    movw (%A),%D ; guarda R2 em D

    leaw $4,%A
    subw %D,(%A),%D ;D = R2-R4
    leaw $END,%A ;se resto for menor que 0 pula para END
    jl %D
    nop

    leaw $2,%A ; escreve resto em R2 (so vai rodar quando o resto for >= 0)
    movw %D,(%A)

    leaw $0,%A ; incrementa o valor da divisao em R2
    movw (%A),%D
    incw %D
    movw %D,(%A)

    leaw $DIV,%A ; pula para DIV
    jmp 
    nop

END:
    nop
















































































