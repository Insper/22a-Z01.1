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
leaw $3, %A
movw %D, (%A)
leaw $5, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)
SOMA:
leaw $2, %A
movw (%A), %A
movw (%A), %D
leaw $1, %A

addw %D, (%A), %D
movw %D, (%A)
leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $3, %A
movw (%A), %D
subw %D, $1, %D
movw %D, (%A)
leaw $SOMA, %A
jg %D
nop

leaw $1, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A)

LOOP:
    
    leaw $2, %A
    movw (%A), %D
    leaw $4, %A
    subw %D, (%A), %D
    
    leaw $INC, %A
    jge
    nop

    leaw $ELSE, %A
    jmp
    nop

    INC:
    leaw $2, %A
    movw %D, (%A)
    leaw $0, %A
    
    movw (%A), %D
    incw %D
    leaw $0, %A

    movw %D, (%A)
    leaw $LOOP, %A
    jmp
    nop
ELSE:
nop






























































































































































































































































