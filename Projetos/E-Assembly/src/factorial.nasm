; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

; precisamos saber se o número é menor ou igual a 1, se for verdade o fatorial é 1 ;
; se não o calculo segue da maneira usual ;

leaw $0, %A         ; aponta para R0
movw (%A), %D       ; move RAM[0] para %D
decw %D             ; decrementa %D , RAM[0] <= RAM[0] - 1
leaw $ELSE, %A      ; carregando em %A o valor do salto
jle %D              ; salta se %D <=0, caso especial do fatorial
nop

; if %D > 0 ;
; aqui terá a rotina do fatorial em si ;
; primeiro, armazenamos uma copia de si em outra memoria, RAM[2] por exemplo ;

leaw $0, %A             ; aponta para RAM[0]
movw (%A), %D           ; move RAM[0] para %D
decw %D                 ; faz %D <= RAM[0] - 1
leaw $2, %A             ; aponta para RAM[2]
movw %D, (%A)           ; copia RAM[0] - 1 em RAM[2]
leaw $3, %A             ; aponta para RAM[3]
movw %D, (%A)           ; copia o valor de N em RAM[3] (SERÁ A CONDIÇÃO DE PARADA DO FATORIAL)
; aqui temos os dois números, em RAM[0] e RAM[2] para fazer o produto ;

LOOP:
    leaw $1, %A         ; aponta para RAM[1]
    movw (%A), %D       ; move RAM[1] para %D
    leaw $0, %A         ; aponta para RAM[0]
    addw %D, (%A), %D   ; soma RAM[1] + RAM[0] e salva em %D
    leaw $1, %A         ; aponta para RAM[1]
    movw %D, (%A)       ; move RAM[1] anterior + RAM[0] para RAM[1] atual
    leaw $2, %A         ; aponta para RAM[2]
    movw (%A), %D       ; move RAM[2] para %D
    decw %D             ; decrementa o valor de RAM[2]
    movw %D, (%A)       ; move %D para RAM[2], RAM[2] - 1
    ; VOLTA PARA O LOOP ;
    leaw $LOOP, %A      ; aponta para o LOOP
    jg %D
    nop
    ; ------------------------------------------------;
    ; AQUI É PARA ATUALIZAR OS VALORES DE N E N-1 ;
    ; ------------------------------------------------;

    ; ATUALIZANDO OS VALORES DA RAM[0];

    ; ja temos n*(n-1) ... no produto, devemos mover isso para RAM[0] ;
    leaw $1, %A     ; aponta para RAM [1]
    movw (%A), %D   ; copia o valor de RAM[1] para %D
    leaw $0, %A     ; aponta para RAM[0]
    movw %D, (%A)   ; copia %D em RAM[0]

    ; vamos usar RAM[3] para condição de parada, quando ela for 1, paramos o fatorial ;
    leaw $3, %A     ; aponta para RAM[3]
    movw (%A), %D   ; Copia RAM[3] em %D
    decw %D         ; decrementa %D
    leaw $END, %A   ; aponta para o fim do código
    je %D
    nop

    ; AINDA NÃO É HORA DE TERMINAR, VAMOS ATUALIZAR O VALOR DE RAM[2], será RAM[3] - 1 ;

    ; %D já guarda N -1, VAMOS COPIA-LO em RAM[2]
    leaw $2, %A     ; aponta para RAM[2]
    ; decw %D         ; TESTE AQUIIIIII
    movw %D, (%A)   ; faz RAM[2] = N -1

    ; Agr vamos fazer a condição de volta para o loop ;
    ; ANTES devemos zerar RAM[1] e decrementar RAM[3]
    leaw $3, %A
    movw (%A), %D
    decw %D
    movw %D, (%A)
    leaw $1, %A     ; aponta para RAM[1]
    movw $0, (%A)   ; copia 0 em RAM[1]
    leaw $0, %A     ; APONTA para ram[0]
    movw %A, %D     
    leaw $LOOP, %A

    je %D
    nop

ELSE:
    leaw $1, %A     ; aponta para RAM[1]
    movw $1, (%A)   ; faz RAM[1] = 1
    ; fim do caso especial do fatorial ;

END:
    ; FIM DO fatorial ;