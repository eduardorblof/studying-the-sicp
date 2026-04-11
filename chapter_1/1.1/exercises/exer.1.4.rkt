;Exercise 1.4: Observe that our model of evaluation allows
;for combinations whose operators are compound expressions. 
;Use this observation to describe the behavior of the
;following procedure:

;(define (a-plus-abs-b a b)
;((if (> b 0) + -) a b))

; RESPOSTA: define a-plus-abs-b como procedimento que toma a
; e b e retorna a soma de a e módulo de b. Para isso, verifica
; o sinal de b: se b for maior que zero, retorna o operador
; soma como resultado e aplia sobre a e b; se não, retorna o 
; operador de subtração, de forma a trocar o sinal de b
; e aplicar a soma.
