; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.


leaw $1,%A   ;copia valor de RAM[1] para D
movw (%A),%D


leaw $ABS,%A ; faz o jump se D for >= 0
jge %D
nop

negw %D ;  D = -D (so vai rodar se D < 0)

ABS:
    leaw $0,%A ;escreve D em RAM[0]
    movw %D,(%A)



