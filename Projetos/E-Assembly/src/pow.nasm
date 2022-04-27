; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos


; Guarda o valor da RAM[1] em RAM[0] temporariamente para usar como base para o quadrado do valor da RAM[1] e usa RAM[1] como contador
leaw $1,%A
movw (%A),%D ; %D = RAM[1]
leaw $0,%A
movw %D,(%A) ; RAM[0] = %D
incw %D ; %D++ => O ciclo precisa ser feito n+1 vezes pois o primeiro valor somado é o valor da RAM[2] que é inicializado como 0
leaw $1,%A
movw %D,(%A) ; RAM[1] = %D
SUM:
leaw $1,%A
movw (%A),%D ; %D = RAM[1]
decw %D ; %D = RAM[1] - 1
movw %D,(%A) ; RAM[1] = %D
leaw $END,%A ; Prepara o jump
je %D ; Se %D == 0, então o loop de soma chegou ao fim, pois o contador indica quantas vezes o valor da RAM[1] deve ser somados
nop
leaw $0,%A
movw (%A),%D ; %D = RAM[0]
leaw $2,%A  
addw %D,(%A),%D ; %D = %D + %A => %D = RAM[0] + RAM[2] => RAM[0] + RAM[0]
leaw $2,%A 
movw %D,(%A) ; RAM[2] = %D (SOMA)
leaw $SUM,%A ; Prepara o jump
jmp ; Reinicia a soma
nop
END: 
leaw $2,%A
movw (%A),%D ; %D = RAM[2]
leaw $0,%A
movw %D,(%A) ; RAM[0] = %D (RESULTADO)