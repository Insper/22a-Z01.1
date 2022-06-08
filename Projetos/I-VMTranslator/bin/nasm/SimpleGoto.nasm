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
; 2 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $0,%A
movw (%A),%A
movw %D,(%A)
leaw $0,%A
movw (%A),%D
incw %D
movw %D, (%A)
; 3 - POP temp 0
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
; End
