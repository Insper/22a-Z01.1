; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

leaw $17189, %A
movw $-1, (%A)
leaw $17509, %A
movw $-1, (%A)

leaw $32769, %A
movw %A, %D

leaw $17209, %A
movw %D, (%A)
leaw $17229, %A
movw %D, (%A)
leaw $17249, %A
movw %D, (%A)
leaw $17269, %A
movw %D, (%A)
leaw $17289, %A
movw %D, (%A)
leaw $17309, %A
movw %D, (%A)
leaw $17329, %A
movw %D, (%A)
leaw $17349, %A
movw %D, (%A)
leaw $17369, %A
movw %D, (%A)
leaw $17389, %A
movw %D, (%A)
leaw $17409, %A
movw %D, (%A)
leaw $17429, %A
movw %D, (%A)
leaw $17449, %A
movw %D, (%A)
leaw $17469, %A
movw %D, (%A)
leaw $17489, %A
movw %D, (%A)