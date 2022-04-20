; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

leaw $65024, %A
movw %A, %D
leaw $16384, %A
movw $%D, (%A)

leaw $33024, %A
movw %A, %D

leaw $16404, %A
movw $%D, (%A)

leaw $16424, %A
movw $%D, (%A)

leaw $65024, %A
movw %A, %D

leaw $16444, %A
movw $%D, (%A)

leaw $33024, %A
movw %A, %D

leaw $16464, %A
movw $%D, (%A)

leaw $16484, %A
movw $%D, (%A)

leaw $65024, %A
movw %A, %D
leaw $16504, %A
movw $%D, (%A)