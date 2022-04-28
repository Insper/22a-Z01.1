; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadro no LCD

setup:
leaw $18533,%A ; guarda valor inicial em r1
movw %A,%D
leaw $1,%A
movw %D,(%A)

LOOP: ;adiciona 20 ao valor de r1 a cada iteracao, 30 iteracoes,

    leaw %1,%A ;salva valor de r1 em D, subtrai valor final da iteracao do valor atual de D e pula para END se a subtracao da 0
    movw (%A),%D
    leaw $19214,%A
    subw %D,%A,%D
    leaw $END,%A
    jge %D
    nop

    leaw $1,%A ;desenhando
    movw (%A),%A
    movw $-1,(%A)
    ; addw %A,$1,%A
    ; movw $-1,(%A)

    leaw %1,%A ;somando 20 no valor de R1
    movw (%A),%D
    leaw $20,%A
    addw %D,%A,%D
    leaw $1,%A
    movw %D,(%A)

    leaw $LOOP,%A
    jmp
    nop
END:
    nop