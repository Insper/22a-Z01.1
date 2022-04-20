; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD


leaw $65280, %A
movw %A, %D
leaw $16384, %A
movw $%D, (%A)

leaw $33024, %A
movw %A, %D

leaw $16404, %A
movw $%D, (%A)

leaw $16424, %A
movw $%D, (%A)

leaw $16444, %A
movw $%D, (%A)

leaw $16464, %A
movw $%D, (%A)

leaw $16484, %A
movw $%D, (%A)

leaw $16504, %A
movw $%D, (%A)

leaw $65280, %A
movw %A, %D
leaw $16524, %A
movw $%D, (%A)