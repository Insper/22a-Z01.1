; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw $1, %A    ; faz %A apontar para RAM[1]
movw (%A), %D  ; carrega o valor de RAM[1] em %D
leaw $ELSE, %A ; precisamos carregar em %A o valor do salto
jge %D          ; salta se valor em %D for menor que zero
nop            ; 
               ; if
negw %D        ;
leaw $0, %A    ;
movw %D, (%A)  ; 
               ;
leaw $END, %A  ; agora não podemos executar o trecho 
jmp            ; do else, vamos pular para o fim 
nop            ; do código
               ;
ELSE:          ; else
               ;
leaw $0, %A    ; 
movw %D, (%A)  ; 
               ;
END:           ;
