; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

leaw $1, %A
movw (%A), %D
leaw $0, %A
subw %D, (%A), %D
leaw $2, %A
movw %D, (%A)