; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

leaw $18634, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)

leaw $15, %A
movw %A, (%A)

LOOP1:
leaw $0, %A
movw (%A), %A
movw $-1, (%A)

leaw $0, %A
movw (%A), %A
movw %A, %D
leaw $320, %A
addw %A, %D, %A
movw $-1, (%A)

leaw $16, %A
movw (%A), %D
addw $1, %D, (%A)
movw (%A), %D
leaw $17, %A
subw %D, %A, %D

leaw $LOOP2, %A
je %D
nop

leaw $LOOP1, %A
jmp
nop

LOOP2:
leaw $0, %A
movw (%A), %D
leaw $20, %A
addw %A, %D, %D
leaw $0, %A
movw %D, (%A)
leaw $8, %A
movw %D, (%A)
leaw $32769, %A
movw %A, %D
leaw $8, %A
movw (%A), %A
movw %D, (%A)

leaw $15, %A
movw (%A), %D
subw %D, $1, %D
leaw $15, %A
movw %D, (%A)

leaw $END, %A
je %D
nop

leaw $LOOP2, %A
jmp
nop

END: