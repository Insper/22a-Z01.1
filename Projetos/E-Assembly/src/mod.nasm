; ------------------------------------------------------------
; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
; ------------------------------------------------------------

INICIO: ;guarda R0 em R2
leaw $0,%A
movw (%A),%D
leaw $2,%A
movw %D,(%A)

SUB:
    leaw $2,%A
    movw (%A),%D ; guarda R0 em D
    leaw $1,%A

    subw %D,(%A),%D ;D = R0-R1
    leaw $END,%A ;se resto for menor que 0 pula para END
    jl %D
    nop

    leaw $2,%A ; escreve resto em R2 (so vai rodar quando o resto for >= 0)
    movw %D,(%A)

    leaw $SUB,%A ; pula para SUB
    jmp 
    nop

END:
    nop