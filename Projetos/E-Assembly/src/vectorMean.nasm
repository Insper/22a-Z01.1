; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------

leaw $4, %A
movw (%A), %D
leaw $2, %A
movw %D, (%A); RAM[2] = RAM[4], utilizaremos o RAM[2] para armazenar o tamanho do vetor inicialmente e utilizar como contador para percorrer o vetor
leaw $3, %A
movw %D, (%A); RAM[3] = RAM[4]. Utilizaremos o RAM[3] para armazenar o tamanho do vetor inicialmente e utilizar como endereçamento das RAMs do vetor]
leaw $1, %A
movw $0, (%A); RAM[1] = 0
leaw $0, %A
movw $0, (%A); RAM[0] = 0

SUM:
leaw $3, %A
movw (%A), %D
decw %D
movw %D, (%A); RAM[3] = RAM[3] - 1

leaw $ENDSUM,%A ; Prepara o jump
jl %D ; Se %D == 0, então o loop de soma chegou ao fim, pois o contador indica o tamanho do vetor restante a ser percorrido
nop
leaw $5, %A
addw %D,%A,%A ; %A = %D + %A
movw (%A), %D

leaw $1, %A
addw %D,(%A),%D ; %A = %D + %A
movw %D, (%A); RAM[1] = RAM[1] + RAM[5+n]

leaw $SUM,%A
jmp 
nop

ENDSUM:

leaw $0, %A ;definindo resultado 0
movw %A, (%A); RAM[0] = 0

leaw $1, %A
movw (%A), %D ; armazenando resultado 0 em RAM[1]
leaw $3, %A
movw %D, (%A);

LOOP:
  leaw $3, %A
  movw (%A), %D

  leaw $4, %A

  subw %D, (%A), %D 
  
  leaw $3, %A
  movw %D, (%A)


  leaw $0, %A
  movw (%A), %D
  incw %D
  movw %D, (%A)

  leaw $3, %A
  movw (%A), %D

  leaw $END, %A 
  jle %D 
  nop

leaw $LOOP, %A
jmp
nop

END:

