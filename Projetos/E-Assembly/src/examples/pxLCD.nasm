; ####################################################################
; Rafael Corsi @ 2018
;
; pinta os primeiros 16 pxs do LCD !
; ####################################################################

movw $0, %D        ; Carrega 0 no reg. S
decw %D            ; faz 0 - 1 = 0x1111111111111
                   ; faz com que todos os bits sejam 1
leaw $18794, %A    ; Carrega o endereço dos primeiros bits
movw %D, (%A)      ; Move o valor de %S para o LCD
