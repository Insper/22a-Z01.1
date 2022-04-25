; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0
; Mesma questão da prova

; definindo 111110000
leaw $496, %A
movw %A, %D
leaw $21184, %A
movw %D, (%A)
; %D = 1110 e guardando R[1]
leaw $14 , %A
movw %A, %D 
leaw %1 , %A
movw %D , (%A)
; lendo os SW e dando not
leaw $21185, %A
movw (%A), %D
notw %D
; Lendo Ram[1] e fazendo and
leaw $1 , %A
andw (%A), %D , %D
; lendo os leds
leaw $21184 , %A
addw (%A), %D, %D
movw %D , (%A)



