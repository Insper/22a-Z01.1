; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

leaw $16384, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

leaw $1, %A
movw %A, (%A)

LOOP:
leaw $0, %A
movw (%A), %D
addw $1, %D, (%A)
movw %D, %A
movw $-1, (%A)
leaw $1, %A
movw (%A), %D
addw $1, %D, (%A)
movw (%A), %D
leaw $21, %A
subw %D, %A, %D

leaw $END, %A
je %D
nop

leaw $LOOP, %A
jmp
nop
END: