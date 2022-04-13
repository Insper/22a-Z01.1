; Arquivo: led1.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 4/2020
;
; Faça os LEDs: 9,7,5,3,1 acenderem

leaw $682, %A
movw %A, %D
leaw $21184, %A
movw %D, (%A)

