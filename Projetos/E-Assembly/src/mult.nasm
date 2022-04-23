; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

; RAM[0] será a base e RAM[1] será usado como o contador;
; o processo de multiplicação se dará com somas sucessivas;


LOOP:
    leaw $3, %A         ; aponta para RAM[3]
    movw (%A), %D       ; move RAM[3] para %D
    leaw $0, %A         ; aponta para RAM[0]
    addw %D, (%A), %D   ; soma RAM[3] + RAM[0] e salva em %D
    leaw $3, %A         ; aponta para RAM[3]
    movw %D, (%A)       ; move RAM[3] anterior + RAM[0] para RAM[3] atual
    leaw $1, %A         ; aponta para RAM[1]
    movw (%A), %D       ; move RAM[1] para %D
    decw %D             ; decrementa o valor de RAM[1]
    movw %D, (%A)       ; move %D para RAM[1], RAM[1] - 1
    leaw $LOOP, %A      ; aponta para o LOOP
    jg
    nop