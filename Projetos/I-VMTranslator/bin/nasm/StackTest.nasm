; 0 - PUSH constant 17
; 1 - PUSH constant 17
; 2 - EQ
; 3 - PUSH constant 17
; 4 - PUSH constant 16
; 5 - EQ
; 6 - PUSH constant 16
; 7 - PUSH constant 17
; 8 - EQ
; 9 - PUSH constant 892
; 10 - PUSH constant 891
; 11 - LT
; 12 - PUSH constant 891
; 13 - PUSH constant 892
; 14 - LT
; 15 - PUSH constant 891
; 16 - PUSH constant 891
; 17 - LT
; 18 - PUSH constant 32767
; 19 - PUSH constant 32766
; 20 - GT
; 21 - PUSH constant 32766
; 22 - PUSH constant 32767
; 23 - GT
; 24 - PUSH constant 32766
; 25 - PUSH constant 32766
; 26 - GT
; 27 - PUSH constant 57
; 28 - PUSH constant 31
; 29 - PUSH constant 53
; 30 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 31 - PUSH constant 112
; 32 - SUB
; 33 - NEG
; 34 - AND
; 35 - PUSH constant 82
; 36 - OR
; End
