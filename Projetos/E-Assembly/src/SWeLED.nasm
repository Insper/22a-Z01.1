; Arquivo: SWeLED.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Faça os LEDs exibirem 
; LED = ON ON ON ON ON !SW3 !SW2 !SW1 0
; Mesma questão da prova

leaw $21185, %A
movw (%A), %D
notw %D
leaw $511, %A
andw %A, %D, %D

leaw $1022, %A
andw %A, %D, %D

leaw $21184, %A
movw %D, (%A)