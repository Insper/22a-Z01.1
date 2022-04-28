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
leaw $4 %D
addw %D, (%A), %D
leaw $2, %A
movw %D, (%A)

LOOP1:
    leaw $1, %A
    movw (%A), %D
    leaw $2, %A
    movw (%A), %A
    movw (%A), %A
    addw %D, %A, %D
    leaw $1, %A
    movw %D, (%A)
    leaw $2, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)
    leaw $4, %A
    subw %D, (%A), %D
    leaw $LOOP1, %A
    jne %D
    nop

leaw $1, %A
movw (%A), %D 
leaw $3, %A
movw %D, (%A)

LOOP2:
    leaw $3, %A
    movw (%A), %D
    leaw $4, %A
    movw (%A), %A
    subw %D, %A, %D
    leaw $3, %A
    movw %D, (%A)
    leaw $0, %A
    movw (%A), %D
    incw %D
    movw %D, (%A)
    leaw $3, %A
    movw (%A), %D
    leaw $LOOP2, %A
    jne %D
    nop