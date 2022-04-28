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

leaw $4, %A         ; aponta para a RAM[4]
movw (%A), %D       ; copia ram[4] EM %D
leaw $3, %A         ; APONTA PARA A RAM[3]
movw %D, (%A)       ; em RAM[3] temos copia de ram[4]

leaw $5, %A         ; aponta para RAM[5]
movw (%A), %D       ; COPIA RAM[5] em %D
leaw $1, %A         ; aponta para RAM[1]
movw %D, (%A)       ; started a soma, JA SOMAMOS O PRIMEIRO
leaw $5, %A
movw %A, %D         ; %D vale 5 agr
leaw $2, %A         ; aponta para RAM[2] (INDEX AUX)
movw %D, (%A)       
leaw $4, %A             ; aponta para RAM[4]
movw (%A), %D           ; copia RAM[4] em %D
decw %D
movw %D, (%A)           ; atualiza RAM[4]
leaw $inicio, %A
je %D
nop


LOOP:

    leaw $2, %A
    movw (%A), %D       ; valor de RAM[2] é o indice
    incw %D             ; incrementa %D, muda o index
    leaw $2, %A
    movw %D, (%A)       ; ATUALIZA O VALOR DO INDEX

    leaw $2, %A         ; aponta para a ram de indice
    movw (%A), %D       ; copia o indice da ram[i] em %D

    movw %D, %A         ; TRANSFORMA O INDICE EM VALOR
    movw (%A), %D
    
    leaw $1, %A         ; APONTA PARA A RAM DA SOMA
    addw (%A), %D, %D   ; FAZ A SOMA

    movw %D, (%A)       ; ATUALIZA A SOMA

    ; ROTINA PARA SAIR DO LOOP ;
    leaw $4, %A             ; aponta para RAM[4]
    movw (%A), %D           ; copia RAM[4] em %D
    decw %D
    movw %D, (%A)           ; atualiza RAM[4]
    leaw $LOOP, %A           ; aponta para a label END
    jg %D
    nop

; =================== divisão ========================== ;

; Divide R2 por R3 e armazena o resultado em R0.
; (R0, R2, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

inicio:
    leaw $1, %A
    movw (%A), %D

    leaw $2, %A
    movw %D, (%A)

    leaw $3 , %A
    movw (%A), %D
    leaw $2 , %A
    ; A = D - RAM[A] 
    subw (%A) , %D, %A
    movw %A , %D

    ; Definindo o loop
    DIV:
        leaw $3 , %A
        movw (%A), %D
        leaw $2 , %A
        ; A = D - RAM[A] 
        subw (%A) , %D, %A
        movw %A , %D
        leaw $2 , %A
        movw %D , (%A)

        ; incremento Ram[0]
        leaw $0 , %A
        movw (%A) , %D
        incw %D
        movw %D , (%A)
        leaw $2, %A
        movw (%A), %D
        leaw $DIV, %A
        jg %D
        nop