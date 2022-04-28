; Arquivo: palindromo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se uma palavra salva na memória
; é um palíndromo ou não. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.
; 
; A palavra possui tamanho fixo de 5 caracteres,
; começando no endereço 10 da RAM e terminando no
; endereço 14 da RAM. A palavra é codificado em
; ASCII.

; exemplo:
;  RAM[10] = a
;  RAM[11] = r
;  RAM[12] = a
;  RAM[13] = r
;  RAM[14] = a
; 

leaw $10, %A    ; A = 10
movw (%A), %D   ; RAM[10]
leaw $14, %A    ; A = 14
subw %D, (%A), %D ; D = RAM[10] - RAM[14]
leaw $1, %A     ; A = 1
movw %D, (%A)   ; RAM[1] = D
leaw $11, %A    ; A = 11
movw (%A), %D   ; RAM[11]
leaw $13, %A    ; A = 13
subw %D, (%A), %D ; D = RAM[11] - RAM[13]
leaw $2, %A     ; A = 2
movw %D, (%A)   ; RAM[2] = D
leaw $2, %A
movw %D, (%A)     
leaw $1, %A
addw (%A), %D, %D ; D = RAM[1] + RAM[2]
leaw $3, %A        
movw %D, (%A)     ; RAM[3] = D = RAM[1] + RAM[2]
leaw $0, %A
movw %A, %D
leaw $0, %A
movw %D, (%A) ; RAM[0] = 0
leaw $3, %A
movw (%A), %D ; busca valor verificar (RAM[3])
leaw $END, %A ; prepara salto
jne           ; RAM[3] == 0?
nop
leaw $0, %A
movw $1, (%A) ; RAM[0] = 1
END: 
