; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

leaw $0, %A
movw %A, %D
notw %D

; linha 1
leaw $16384, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16404, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16424, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16444, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

;Bolinha

leaw $16464, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16484, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16504, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)

leaw $16524, %A
movw %D, (%A)

leaw $16544, %A
movw %D, (%A)

leaw $16564, %A
movw %D, (%A)

leaw $16584, %A
movw %D, (%A)

leaw $16604, %A
movw %D, (%A)

leaw $16624, %A
movw %D, (%A)
leaw $16644, %A
movw %D, (%A)
leaw $16664, %A
movw %D, (%A)
leaw $16684, %A
movw %D, (%A)
leaw $16704, %A
movw %D, (%A)
leaw $16724, %A
movw %D, (%A)
leaw $16744, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)   
leaw $16764, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
leaw $16784, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
leaw $16804, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
leaw $16824, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
leaw $16844, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
leaw $16864, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
;adiciona 20
leaw $16884, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
;adiciona 20
leaw $16904, %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
incw %A
movw %D, (%A)
;adiciona 20
leaw $16924, %A
movw %D, (%A)
;adiciona 20
leaw $16944, %A
movw %D, (%A)
;adiciona 20
leaw $16964, %A
movw %D, (%A)
;adiciona 20
leaw $16984, %A
movw %D, (%A)
;adiciona 20
leaw $17004, %A
movw %D, (%A)
;adiciona 20
leaw $17024, %A
movw %D, (%A)
;adiciona 20
leaw $17044, %A
movw %D, (%A)
;adiciona 20
leaw $17064, %A
movw %D, (%A)
;adiciona 20
leaw $17084, %A
movw %D, (%A)
;adiciona 20
leaw $17104, %A
movw %D, (%A)
;adiciona 20
leaw $17124, %A
movw %D, (%A)
;adiciona 20
leaw $17144, %A
movw %D, (%A)
;adiciona 20
leaw $17164, %A
movw %D, (%A)
;adiciona 20
leaw $17184, %A
movw %D, (%A)
;adiciona 20
leaw $17204, %A
movw %D, (%A)
;adiciona 20
leaw $17224, %A
movw %D, (%A)
;adiciona 20
leaw $17244, %A
movw %D, (%A)
