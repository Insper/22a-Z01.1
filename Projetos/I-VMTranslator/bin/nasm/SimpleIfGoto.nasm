; 0 - PUSH constant 5
leaw $5, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 1 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 2 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 3 - EQ
; 4 - Goto Condicional
leaw $0,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $-1,%A
subw %A,%D,%D
leaw $IF1,%A
je %D
nop
ELSE1:
; 5 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
IF1:
; 6 - POP temp 0
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
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
; 7 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 8 - PUSH constant 9
leaw $9, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 9 - EQ
; 10 - Goto Condicional
leaw $0,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $-1,%A
subw %A,%D,%D
leaw $IF2,%A
je %D
nop
ELSE2:
; 11 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 12 - POP temp 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $1,%A
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
IF2:
; End
