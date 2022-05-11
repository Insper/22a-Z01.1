; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

; i = 0
; while r[0] > r[1]:
;   r[0] = r[0] - r[1]
;   i +=1
;r[2] = i

LOOP:
    
    leaw $0, %A ; A recebe 0
    movw (%A), %D ;D = RAM[0]
    leaw $1, %A ;A recebe 1
    subw %D, (%A), %D ; subtrai  RAM[0] - RAM[1] e guarda em D, D = RAM[0] - RAM[1].
    


    leaw $INC, %A ; prepara o salto
    jge ;analisa se %D >=0
    nop

    leaw $ELSE, %A
    jmp
    nop

    INC:
    leaw $0, %A ;A recebe 0
    movw %D, (%A) ;RAM[0] = D que é igual a  RAM[0] - RAM[1]
    leaw $2, %A ;A recebe 2
    
    movw (%A), %D ; D = RAM[2]; "incializa com RAM[2] = 0 já, não precisa fazer com que RAM[2] = 0."
    incw %D ; D = D+1
    leaw $2, %A ;A recebe 2

    movw %D, (%A) ;RAM[2] = D
    leaw $LOOP, %A ; prepara o salto
    jmp ; salto sem condição
    nop

    ELSE:
    nop



















































































