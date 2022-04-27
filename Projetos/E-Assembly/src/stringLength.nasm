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

; Zerando os registradores
leaw $0, %A ; passa o valor 0 para o registrador A
movw %A, %D ; registrador D recebe o valor 0
movw %D, (%A) ; RAM[0] recebe o valor 0

leaw $8, %A ; passa o valor 8 para o registrador A
movw %A, %D ; registrador D recebe o valor 8

leaw $5, %A ; passa o valor 5 para o registrador A
movw %D, (%A) ; RAM[5] recebe o valor 8

LOOP:
    leaw $5, %A ; passa o valor 5 para o registrador A
    movw (%A), %D ; registrador D recebe o valor da RAM[5]
    movw (%A), %A ; registrador A recebe o valor da RAM[5]
    leaw $END, %A ; passa o valor END para o registrador A
    je %D ; se o registrador D for igual a 0, então faz um desvio para o endereço END
    nop
    leaw $0, %A ; passa o valor 0 para o registrador A
    movw (%A), %D ; registrador D recebe o valor da RAM[0]
    incw %D ; incrementa +1 ao valor do registrador D
    leaw $0, %A ; passa o valor 0 para o registrador A
    movw %D, (%A) ; RAM[0] recebe o valor do registrador D
    leaw $5, %A ; passa o valor 5 para o registrador A
    movw (%A), %A ; registrador A recebe o valor da RAM[5]
    incw %A ; incrementa +1 ao valor do registrador A
    movw %A, %D ; registrador D recebe o valor do registrador A
    leaw $5, %A ; passa o valor 5 para o registrador A
    movw %D, (%A) ; RAM[5] recebe o valor do registrador D
    leaw $LOOP, %A ; passa o endereço LOOP para o registrador A
    jmp ; faz um desvio para o endereço LOOP, continuando o laço
END: ; endereço final