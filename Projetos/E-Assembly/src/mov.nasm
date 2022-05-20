; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; -----------------------
; RAM[0] = RAM[1]
; -----------------------


; -----------------------
; RAM[3] = 1
; -----------------------

; ------------carregando constantes----------------
leaw $0, %A ; carrega a constante 0 em %A
movw (%A), %D ; %D= RAM[0]
 
leaw $R11, %A ; carrega a constante 11 em %A
movw %D, (%A) ; RAM[11]=RAM[0]
 
leaw $1, %A ; carrega a constante 1 em %A
movw (%A), %D ; %D=RAM[1]
 
leaw $R12, %A ; carrega a constante 12 em %A
movw %D, (%A) ; RAM[12]=RAM[1]
 
; ---------------RAM[1] = RAM[0]-------------------
leaw $R11, %A ; carrega a constante 11 em %A
movw (%A), %D ; %D=RAM[11]=RAM[0]
 
leaw $1, %A ; carrega a constante 1 em %A
movw %D, (%A) ; RAM[1]=RAM[11]=RAM[0]
 
; ---------------RAM[0] = RAM[1]-------------------
leaw $R12, %A ; carrega a constante 12 em %A
movw (%A), %D ; %D=RAM[12]=RAM[1]
 
leaw $0, %A ; carrega a constante 0 em %A
movw %D, (%A) ; RAM[0]=RAM[12]=RAM[1]
 
; ----------------RAM[3] = 1-----------------------
leaw $1, %A ; carrega a constante 1 em %A
movw %A, %D ; move o valor da RAM[%A] para %D
 
leaw $3, %A ; carrega a constante 3 em %A
movw %D, (%A) ; move o valor da %D para RAM[%A]