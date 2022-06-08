; 0 - PUSH constant 10
leaw $10, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 1 - PUSH local 0
leaw $1,%A
movw (%A),%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 2 - POP local 0
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
movw %A,%D
leaw $1,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 3 - PUSH constant 21
leaw $21, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 4 - PUSH constant 22
leaw $22, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 5 - POP argument 2
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $2,%A
movw %A,%D
leaw $2,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 6 - POP argument 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $1,%A
movw %A,%D
leaw $2,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 7 - PUSH constant 36
leaw $36, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 8 - POP this 6
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $6,%A
movw %A,%D
leaw $3,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 9 - PUSH constant 42
leaw $42, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 10 - PUSH constant 45
leaw $45, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 11 - POP that 5
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $5,%A
movw %A,%D
leaw $4,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 12 - POP that 2
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $2,%A
movw %A,%D
leaw $4,%A
movw (%A),%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 13 - PUSH constant 510
leaw $510, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 14 - POP temp 6
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $6,%A
movw %A,%D
leaw $5,%A
addw %A,%D,%D
leaw $13,%A
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $13,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw %A,%D
movw (%A),%A
movw %D,(%A)
; 15 - PUSH local 0
leaw $1,%A
movw (%A),%D
leaw $0,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 16 - PUSH that 5
leaw $4,%A
movw (%A),%D
leaw $5,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 17 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; 18 - PUSH argument 1
leaw $2,%A
movw (%A),%D
leaw $1,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 19 - SUB
; 20 - PUSH this 6
leaw $3,%A
movw (%A),%D
leaw $6,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 21 - PUSH this 6
leaw $3,%A
movw (%A),%D
leaw $6,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
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
leaw $5,%A
movw %A,%D
leaw $6,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 25 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; End
