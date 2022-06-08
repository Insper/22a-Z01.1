; 0 - POP pointer 0
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $3,%A
movw %D,(%A)
; 1 - POP pointer 1
leaw $0,%A
movw (%A),%D
decw %D
movw %D,(%A)
leaw $0,%A
movw (%A),%A
movw (%A),%D
leaw $4,%A
movw %D,(%A)
; End
