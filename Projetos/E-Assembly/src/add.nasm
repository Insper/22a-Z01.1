; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].


leaw $0,%A
movw (%A),%D
leaw $1,%A
addw (%A),%D,%D
leaw $2,%A
movw %D,(%A)
