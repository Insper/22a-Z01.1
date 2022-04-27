leaw $R10, %A
movw (%A), %D
leaw $R14, %A
subw (%A), %D, %D

leaw $NAOP, %A

jne %D
nop

leaw $R11, %A
movw (%A), %D
leaw $R13, %A
subw (%A), %D, %D

leaw $PALINDROMO, %A

je %D
nop

NAOP:
leaw $R0, %A
movw $0, (%A)

leaw $END, %A

jmp
nop

PALINDROMO:
leaw $R0, %A
movw $1, (%A)

END: