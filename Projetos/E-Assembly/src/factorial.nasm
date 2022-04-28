; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)
leaw $2, %A
subw %D, %A, %D
leaw $3, %A
movw %D, (%A)
leaw $4, %A
movw %D, (%A)
leaw $2, %A
movw (%A), %D
decw %D
leaw $0, %A    
movw (%A), %D  
leaw $1, %A
subw %D, %A, %D
leaw $ELSE, %A 
jle %D        
nop 


LOOP1:

    LOOP:
        leaw $0, %A
        movw (%A), %D
        leaw $2, %A
        movw (%A), %A
        addw %D, %A, %D
        leaw $2, %A
        movw %D, (%A)
        leaw $3, %A
        movw (%A), %D
        decw %D
        movw %D, (%A)
        leaw $LOOP, %A
        jne %D
        nop

    leaw $2, %A
    movw (%A), %D
    leaw $0, %A
    movw %D, (%A)
    leaw $4, %A
    movw (%A), %D
    leaw $3, %A
    movw %D, (%A)
    leaw $4, %A
    decw %D
    movw %D, (%A)
    leaw $3, %A
    movw %D, (%A)
    leaw $LOOP1, %A
    jne %D
    nop


leaw $2, %A
movw (%A), %D
leaw $1, %A
movw %D, (%A)  
leaw $0, %A
movw %A, %D
leaw $END, %A
je %D
nop
ELSE:
    leaw $1, %A
    movw %A, (%A)  

END: