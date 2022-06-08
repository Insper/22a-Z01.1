; 0 - PUSH constant 10
; 1 - PUSH local 0
; 2 - POP local 0
; 3 - PUSH constant 21
; 4 - PUSH constant 22
; 5 - POP argument 2
; 6 - POP argument 1
; 7 - PUSH constant 36
; 8 - POP this 6
; 9 - PUSH constant 42
; 10 - PUSH constant 45
; 11 - POP that 5
; 12 - POP that 2
; 13 - PUSH constant 510
; 14 - POP temp 6
; 15 - PUSH local 0
; 16 - PUSH that 5
; 17 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 18 - PUSH argument 1
; 19 - SUB
; 20 - PUSH this 6
; 21 - PUSH this 6
; 22 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 23 - SUB
; 24 - PUSH temp 6
; 25 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; End
