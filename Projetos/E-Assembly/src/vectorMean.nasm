; ------------------------------------
; Calcule a média dos valores de um   pseudocodigo          
; que possui inicio em RAM[5] e tama  let ram[3] = 4;
;                                     let ram[1] = 0;
; defindo em RAM[4],                  while (ram[3] < ram[4]){
;                                       ram[1] += ram[ram[3] + 4];
;                                       ram[3] += 1
;                                     }
;                                     ram [0] = ram[1]/ram[4]           
; 1. Salve a soma em RAM[1]         
; 2. Salve a média em RAM[0]            
;           
; ----------------------------------            
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
; ----------------------------------            

leaw $4, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)

WHILE: ; soma ram[1] à ram[ram[3]]
    leaw $1, %A
    movw (%A), %D
    leaw $3, %A
    movw (%A), %A; salva o endereco salvo em ram[3] no %A
    addw (%A), %D, %D; adiciona o valor do endereco de ram[3] ao valor salvo em ram[1]
    leaw $1, %A
    movw %D, (%A)
    ; agora aumenta ram[3] em 1
    leaw $3, %A
    movw (%A), %D
    leaw $1, %A
    addw %A, %D, %D
    leaw $3, %A
    movw %D, (%A)
    ; checa se ram[4] + 4 - ram[3] > 0
    leaw $4, %A
    movw (%A), %D
    addw %A, %D, %D ;transforma D em ram[4] + 4
    leaw $3, %A
    subw %D, (%A), %D
    leaw $WHILE, %A
    jg %D
    nop


leaw $1, %A
movw (%A), %D


LOOP:

    leaw $4, %A
    movw (%A), %A

    subw %D, %A, %D
    leaw $2 , %A
    movw %D, (%A)
    leaw $1, %A
    movw %A, %D
    leaw $0, %A
    addw (%A), %D, %D
    movw %D, (%A)


    leaw $2, %A
    movw (%A), %D
    leaw $LOOP, %A
    jge %D
    nop