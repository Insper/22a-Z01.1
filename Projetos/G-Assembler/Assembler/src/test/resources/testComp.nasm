; Arquivo: testComp.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 16/04/2017

movw %A,%D
addw %A,%D,%D
movw %D,%A
movw %D,(%A)
incw %D
nop
; Teste comentario
movw (%A),%D
addw (%A),%D,%D  ; comentario
subw %D,(%A),%A
rsubw %D,(%A),%A
decw %A
decw %D
notw %A
notw %D
negw %A
negw %D

; Teste comentario 2
; comentario

andw (%A),%D,%D
andw %D,%A,%A
orw (%A),%D,%D
orw %D,%A,%A