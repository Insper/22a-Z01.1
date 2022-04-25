; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000

;RAM[0] -> contador
;RAM[1] -> variavel para posicao

SETUP:
    leaw $8,%A ;guarda 8 em R1
    movw %A,%D
    leaw $1,%A
    movw %D,(%A)
loop:
    leaw $1,%A ;guarda valor de R1 ( posicao do contador) em A
    movw (%A),%A

    movw (%A),%D ; guarda valor RAM[R1] em D

    leaw $END,%A ;pula para end se D == 0
    je %D
    nop

    leaw $1,%A ; incrementa valor de R1
    movw (%A),%D
    incw %D
    movw %D,(%A)

    leaw $loop,%A ;reinicia o loop
    jmp
    nop
END:
    leaw $1,%A ;guarda R1 em D, subtrai 7 de D e escreve D em R0
    movw (%A),%D
    leaw $8,%A
    subw %D,%A,%D
    leaw $0,%A
    movw %D,(%A)


