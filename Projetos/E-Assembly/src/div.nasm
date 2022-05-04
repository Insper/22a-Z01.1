; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

leaw $0, %A
movw (%A), %D


LOOP:

leaw $1, %A
movw (%A), %A

subw %D, %A, %D
;leaw $0,%A
;incw %A

leaw $5 , %A
movw %D, (%A)
leaw $1, %A
movw %A, %D
leaw $2, %A
addw (%A), %D, %D
movw %D, (%A)


leaw $5, %A
movw (%A), %D
leaw $LOOP, %A
jg %D
nop

















































































