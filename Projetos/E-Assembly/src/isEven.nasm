; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

leaw $0, %A
movw %A, %D
movw %D, (%A)
leaw $5, %A
movw (%A), %D
leaw $1, %A
andw %A, %D, %D
jne %D
nop

leaw $1, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)
