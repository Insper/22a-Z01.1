; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

; Para realizar este trabalho, é necessario somar o número, o número de vezes.
; Ex: o Número 4, para chegar em seu quadrado precisa ser somado 4 vezes, ou o número 5 precisa ser somado 5 vezes.
; Para isso podemos pegar o valor inicial do número, armazenar no resultado, e utilizar o RAM[1] como contador

LOOP:
    leaw $0, %A             ; Aponta para RAM[0]
    movw (%A), %D           ; Move o valor da RAM[0] para %D
    leaw $1, %A             ; Aponta para RAM[1]
    addw %D, (%A), %D       ; Soma o valor de RAM[1] com RAM[0] e adiciona a %D
    leaw $0, %A             ; Aponta para RAM[0]
    movw %D, (%A)           ; Move o resultado da soma para a RAM[0]
    ; Até esse momento do codigo foi feita a soma do valor da RAM[1] com zero, e o
    ; Armazenamento deste valor na RAM[0]

    ; Agora é preciso retirar um número do RAM[0] até o mesmo ser igual a zero

    leaw $1, %A             ; Aponta para RAM[0]
    movw (%A), %D           ; Move o valor de RAM[0] para %D
    decw %D                 ; Decrementa o valor armezando em %D em 1
    movw %D, (%A)           ; Armezana %D de volta para RAM[0]
    leaw $LOOP, %A          ; Aponta para o LOOP

    ; Neste ponto, o valor armezando na variavel %A vai ser subtraida até atingir o seu valor de zero
    ; Quando isso ocorrer o LOOP será quebrado e o valor armezando na RAM[0] deverá corresonder ao Quadrado do valor inicialmente dado
    je
    nop