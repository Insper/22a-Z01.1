	  ;; Elementos De Sistemas
	  ;; Eng. Insper - Rafael Corsi
	  ;; Exemplo de salto incodicional
	  ;;
	  ;; s = 0
	  ;; while(1)
	  ;;  s = s+1
INICIO:
	  leaw $0, %A
	  movw %A, %D                   ; Carrega 0 em S

ADD:                              ; Label para saltar
	  incw %D                       ; Incrementa S
	  leaw $ADD, %A                 ; Carrega endereço do label ADD
	                                ; (3 no caso)
	  jmp                           ; Salto incondicional
	  nop                           ; No-Operation
	                                ; (necessário após jump)
