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
; while r[0] > 0: 
;   r[0] = r[0] -r [1]
;ram[2] = modulo
;

LOOP:
    leaw $0, %A
    movw (%A), %D
    leaw $1, %A
    subw %D, (%A), %D
    leaw %0, %A
    movw %D, (%A)

    leaw $ELSE, %A ; prepara salto
    jl  ;analisa se é menor que zero
    nop
    leaw $LOOP, %A ; prepara o salto
    jge ;analisa se é maior que zero
    nop
    

    ELSE:
    leaw $1, %A
    addw (%A), %D, %D
    leaw $2, %A
    movw %D, (%A)

