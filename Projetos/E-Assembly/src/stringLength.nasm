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
;  RAM[16] = NULL = 0x0000

leaw $R7, %A ; passa o valor da RAM[7] = 0 para o registrador A
movw %A, %D ; registrador D recebe o valor 0
movw %D, (%A) ; RAM[0] recebe o valor 0
LOOP:
leaw $R7, %A ; passa o valor da RAM[7] = 0 para o registrador A
movw (%A), %D ; registrador D recebe o valor da RAM[0]
incw %D ; registrador D = 1
movw %D, (%A) ; RAM[0] recebe o valor 1
movw %D, %A ; registrador A recebe o valor 1
movw (%A), %D ; registrador D recebe o valor da RAM[1]
leaw $ZERO, %A ; passa o endereço ZERO para o registrador A
je %D ; se o valor do registrador D for igual a 0, então desvia o fluxo para ZERO
nop ; não faz nada
leaw $R0 , %A ; passa o valor da RAM[0] para o registrador A
movw (%A), %D ; registrador D recebe o valor da RAM[0]
incw %D ; incrementa +1 ao valor do registrador D
movw %D, (%A) ; RAM[0] recebe o valor do registrador D
leaw $LOOP, %A ; passa o endereço LOOP para o registrador A
jmp ; retorna para o endereço armazenado em LOOP
nop ; não faz nada
ZERO:
leaw $R0, %A ; passa o valor da RAM[0] para o registrador A
movw (%A), %D ; registrador D recebe o valor da RAM[0]
incw %D ; incrementa +1 ao valor do registrador D
movw %D, (%A) ; RAM[0] recebe o valor do registrador D = 1