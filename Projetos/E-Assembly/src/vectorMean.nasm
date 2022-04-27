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
SETUP:
    leaw $5,%A;guarda 5 em RAM 3
    movw %A,%D
    leaw $3,%A
    movw %D,(%A)

SOMA:;itera em todos os numeros do vetor guarda a soma em R1
    leaw $3,%A;acessa RAM 3
    movw (%A),%A

    movw (%A),%D ;acessa RAM de numero guardado em R3 e guarda o valor dessa RAm em D

    leaw $1,%A ;acessa R1
    movw (%A),%A

    addw %D,%A,%D ;soma numero da Ram de numero escrita em RAM 3 com numero em RAM 1
    
    leaw $1,%A
    movw %D,(%A) ; guarda a soma em R1

    leaw $3,%A ;incrementa o valor de R3
    movw (%A),%D
    incw %D
    movw %D,(%A)

    leaw $4,%A ;soma o valor de R4 com 4 e guarda em D
    movw (%A),%D
    leaw $4,%A
    addw %D,%A,%D 

    leaw $3,%A
    movw (%A),%A

    subw %D,%A,%D ; subtrai R3 de D e guarda em D

    leaw $MEDIA,%A ;pula para media se chegou no final do vetor
    jl %D
    nop

    leaw %SOMA,%A ; caso contrario itera novamente
    jmp
    nop




MEDIA:;divide a soma por R4 e guarda em R0
    leaw $1,%A ; guarda R1 (soma) em R2
    movw (%A),%D
    leaw $2,%A
    movw %D,(%A)


DIV: ;divide R2 por R4 e armazena o resultado em R0
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

