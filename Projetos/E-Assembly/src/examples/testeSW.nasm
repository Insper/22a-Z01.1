; ####################################################################
; Rafael Corsi @ 2018
;
; Aciona os LEDs com um contador:
;
; %D     = RAM[1] = CNT
; LED    = CNT
; RAM[1] = CNT + 1
; ####################################################################

LED:
  leaw $21185, %A
  movw (%A), %D
  ;notw %D                       
  leaw $21184, %A
  movw %D, (%A)
  leaw $LED, %A
  jmp
  nop
