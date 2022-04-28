; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

leaw $1,%A         ; carrega a constant 1 em %A
movw (%A),%D       ; move o valor da RAM[%A] para %D 
leaw $0,%A         ; carrega a constant 0 em %A
subw %D, (%A), %D  ; faz %D - RAM[%A] e salva em %D
leaw $2, %A        ; carrega a constant 2 em %A
movw %D, (%A)      ; copia o valor de %D para RAM[%A]