; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!
                               
;definindo 110100
leaw $52, %A
movw %A, %D
leaw $21184, %A
movw %D, (%A)

; Switchs sem not 100000010 = 258
leaw $258 , %A
movw %A, %D 
leaw %1 , %A
movw %D , (%A)
; lendo os SW
leaw $21185, %A
movw (%A), %D
incw %D
; Lendo Ram[1] e fazendo and
leaw $1 , %A
andw (%A), %D , %D
; lendo os leds
leaw $21184 , %A
addw (%A), %D, %D
movw %D , (%A)


; Switchs com not 010000000 = 128
leaw $128 , %A
movw %A, %D 
leaw %1 , %A
movw %D , (%A)
; lendo os SW
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


;Lendo Ram[5][3]
leaw $8 , %A
movw %A, %D 
leaw %1 , %A
movw %D , (%A)

;Lendo Ram[5][3]
leaw $5 , %A
movw (%A), %D
leaw $1 , %A
andw (%A), %D , %D
;Passsando pro led
; lendo os leds
leaw $21184 , %A
addw (%A), %D, %D
movw %D , (%A)

