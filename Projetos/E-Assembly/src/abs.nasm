; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw $1, %A
movw (%A), %D ; %D = (RAM[1])
leaw $END, %A ; prepara salto
jg           ; RAM[1] > 0?
nop
negw %D ; RAM[1] *= -1
END:
    leaw $0, %A
    movw %D, (%A); RAM[0] = RAM[1]
