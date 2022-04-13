; Arquivo: sw1.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 4/2020
;
; Faça os LEDs copiarem os valores das chaves
; LED = SW

leaw $21185, %A
movw (%A), %D
leaw $21184, %A
movw %D, (%A)

