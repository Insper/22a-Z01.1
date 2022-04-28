; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

;PARTE DA ESQUERDA VERTICAL DO C --> meio no $18789


setup:
leaw $18533,%A ; guarda valor inicial em r1
movw %A,%D
leaw $1,%A
movw %D,(%A)

LOOP: ;adiciona 20 ao valor de r1 a cada iteracao, 30 iteracoes,

    leaw %1,%A ;salva valor de r1 em D, subtrai valor final da iteracao do valor atual de D e pula para END se a subtracao da 0
    movw (%A),%D
    leaw $19194,%A
    subw %D,%A,%D
    leaw $END,%A
    jge %D
    nop


    leaw %1,%A ;somando 20 no valor de R1
    movw (%A),%D
    leaw $20,%A
    addw %D,%A,%D
    leaw $1,%A
    movw %D,(%A)

    leaw $1,%A
    movw (%A),%D 
    leaw $18693,%A ;caso esteja no centro, nao adiciona 1
    subw %D,%A,%D
    leaw $MEIO,%A
    jg %D
    nop


    leaw $1,%A ;desenhando
    movw (%A),%A
    movw $-1,(%A)

    addw %A,$1,%A
    movw $-1,(%A)

    leaw $LOOP,%A
    jmp
    nop
MEIO:
    leaw $1,%A
    movw (%A),%D
    leaw $18994,%A
    subw %D,%A,%D
    leaw $FIM,%A
    jge %D
    nop

    leaw $1,%A ;desenhando
    movw (%A),%A
    movw $-1,(%A)

    leaw $LOOP,%A 
    jmp
    nop
FIM:
    leaw $1,%A ;desenhando
    movw (%A),%A
    movw $-1,(%A)

    addw %A,$1,%A
    movw $-1,(%A)

    leaw $LOOP,%A 
    jmp
    nop


END:
    nop