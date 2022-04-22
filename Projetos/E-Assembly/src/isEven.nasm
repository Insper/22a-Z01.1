; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

; Só vai ser ímpar se o RAM[5] for ---------1

leaw $1, %A
movw %A, %D ; Carregando 1 no D
leaw $5, %A

; Faz um and bit a bit e carrega no D. Aqui que a mágica acontece :) Se %D for 1 então é ímpar
andw %D, (%A), %D

leaw $0, %A
movw %D, (%A)

; Preciso subtrair 1 se for ímpar -- RAM[0] = 1 se for PAR
leaw $1, %A
movw %A, %D
leaw $0, %A
subw (%A), %D, %D
leaw $END, %A
jge %D
nop

; Se não fizer o salto é porque %D é < 0, preciso inverter
negw %D

END:
  leaw $0, %A
  movw %D, (%A)

