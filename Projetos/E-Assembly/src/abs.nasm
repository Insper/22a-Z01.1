; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

 leaw $1, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)
;COMEÇA JUMP SE <0
leaw %END%, %A
jge %D
nop
;PASSA O VALOR INVERTIDO
leaw %0, %A
negw %D
movw %D, (%A)
END: