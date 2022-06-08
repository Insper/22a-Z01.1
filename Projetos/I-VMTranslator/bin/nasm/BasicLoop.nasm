; 0 - PUSH constant 0
; 1 - POP temp 0
; 2 - PUSH constant 1
; 3 - POP temp 1
; 4 - PUSH temp 0
; 5 - PUSH constant 10
; 6 - EQ
; 8 - PUSH temp 0
; 9 - PUSH constant 1
; 10 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 11 - POP temp 0
; 12 - PUSH temp 1
; 13 - PUSH temp 1
; 14 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 15 - POP temp 1
; End
