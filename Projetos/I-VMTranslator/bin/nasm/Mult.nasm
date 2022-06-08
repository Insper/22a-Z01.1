; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 0
; 2 - POP local 0
; 3 - PUSH argument 1
; 4 - POP local 1
; 5 - PUSH constant 0
; 6 - PUSH local 1
; 7 - EQ
; 9 - PUSH local 0
; 10 - PUSH argument 0
; 11 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 12 - POP local 0
; 13 - PUSH local 1
; 14 - PUSH constant 1
; 15 - SUB
; 16 - POP local 1
; 18 - PUSH local 0
; 21 - PUSH constant 7
; 22 - PUSH constant 2
; 23 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 24 - PUSH constant 3
; End
