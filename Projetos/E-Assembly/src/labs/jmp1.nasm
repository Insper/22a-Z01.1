leaw $2, %A
movw %A, %D
leaw $0, %A
movw %D, (%A) ; RAM[0] = 2
leaw $1, %A
movw (%A), %D ; busca valor verificar (RAM[1])
leaw $END, %A ; prepara salto
jne           ; RAM[1] == 0?
nop
leaw $1, %A
movw $1, (%A) ; RAM[=] = 1
END:          
