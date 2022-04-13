leaw $2, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
leaw $1, %A
movw (%A), %D
leaw $END, %A
jne
nop
leaw $1, %A
movw $1, (%A)
END:
