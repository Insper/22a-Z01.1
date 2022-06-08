; 0 - PUSH constant 111
leaw $111, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 1 - PUSH constant 333
leaw $333, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 2 - PUSH constant 888
leaw $888, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 3 - POP static 8
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $8,%A
movw %A,%D
leaw $16,%A
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
; 4 - POP static 3
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $3,%A
movw %A,%D
leaw $16,%A
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
; 5 - POP static 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $1,%A
movw %A,%D
leaw $16,%A
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
; 6 - PUSH static 3
leaw $16,%A
leaw $3,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 7 - PUSH static 1
leaw $16,%A
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
; 8 - SUB
; 9 - PUSH static 8
leaw $16,%A
leaw $8,%A
addw %A,%D,%A
movw (%A),%D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 10 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
; End
