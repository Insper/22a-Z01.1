; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0
; Mesma questão da prova
;0b111110000 = 496



leaw $496, %A
movw %A, %D
leaw $21184, %A
movw %D, (%A)
leaw $21185, %A
movw (%A), %D
notw %D
leaw $21184, %A
movw (%A),%A
addw %A, %D, %D
leaw $15, %A
addw %D, %A, %D
leaw $21184, %A
movw %D, (%A)