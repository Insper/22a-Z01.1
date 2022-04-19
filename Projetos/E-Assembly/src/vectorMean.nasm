; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------



leaw $4, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

SOMA:

    leaw $4, %A
    movw (%A), %D
    leaw $4, %A
    addw %D, %A, %A

    movw (%A), %D
    leaw $1, %A
    addw %D, (%A), %D
    movw %D, (%A)
    leaw $3, %A
    movw %D, (%A)
    
    leaw $4, %A
    movw (%A), %D

    leaw $MEDIA, %A
    je %D
    nop

    decw %D
    leaw $4, %A
    movw %D, (%A)

    leaw $SOMA, %A
    jmp
    nop

MEDIA:

    leaw $2, %A
    movw (%A), %D
    leaw $3, %A
    subw (%A), %D, %D
    
    movw %D, (%A)

    leaw $FIM, %A
    jl %D
    nop

    leaw $0, %A
    addw $1, (%A), %D
    movw %D, (%A)

    leaw $MEDIA, %A
    jmp
    nop

FIM: