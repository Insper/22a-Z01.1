; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

LOOP:
leaw $R3, %A
movw (%A), %D
leaw $R1, %A
movw (%A), %A

addw %A, %D, %D
leaw $R3, %A
movw %D, (%A)

leaw $R0, %A
movw (%A), %D

subw %D, $1, %D
movw %D, (%A)

leaw $LOOP, %A 
jg %D
nop