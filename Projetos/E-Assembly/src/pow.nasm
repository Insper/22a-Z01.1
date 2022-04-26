; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

;código em python
;i = 1
; while r[1] * i <= r[1] * r[1]:
;   i+=1
;r[2] = r[1] * (i-1)

;ex RAM[1] = 2
;inicialmente RAM[0] = 0


LOOP:
    leaw $1, %A ; A = 1
    movw (%A), %D ; D = RAM[1]  no ex : D = 2
    leaw $0, %A  ;A=0
    addw %D, (%A), %D ; D = D + RAM[1] = RAM[0] + RAM[1] ; D = 2+ 0 -> D = 2
    leaw $0, %A ; A = 0
    movw %D, (%A) ; RAM[0] = D ;  RAM[0] = 2 
    ;"contador"
    leaw $3, %A ; A = 3
    movw (%A), %D ;D = RAM[3]
    incw %D ; D = D + 1
    movw %D, (%A) ; RAM[3] = D
    ; análise do valor da RAM[1] - RAM[3]
    leaw $1, %A ; A = 1
    subw (%A), %D, %D ; D = RAM[1] - D = RAM[1] - RAM[3] ; 
 
    leaw $LOOP, %A ;prepara o salto
    jne ; verifica se D é diferente de 0
    nop

