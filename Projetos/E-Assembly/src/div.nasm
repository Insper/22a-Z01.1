; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos





; Teoria:
; R0 é um numero a ser dividido por R1
; EX: R0=64 R1=12    R2 = 64/12
; Como fazer?
; LOOP de subtração
; 64 - 12 = 52 contador = 1
; 48 -12 = 40 contador = 2
; ...
; 16 - 12 = 4 contador = 5

; Logo R2 sera o valor que o contador atingiu até nn conseguir mais subtrair

; Da pra verificar isso com R0-R1 != 0 no final do código
; Mas como ver isso todas as vezes e ter espaço em RAMs ainda?

















































































