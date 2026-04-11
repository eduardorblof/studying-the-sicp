;Exercise 1.5: Ben Bitdiddle has invented a test to determine
;whether the interpreter he is faced with is using 
;applicative order evaluation or normal-order evaluation. 
;He defines thefollowing two procedures:

(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))

;Then he evaluates the expression 

(test 0 (p))

;What behavior will Ben observe with an interpreter that
;uses applicative-order evaluation? What behavior will he
;observe with an interpreter that uses normal-order evaluation?
;Explain your answer. (Assume that the evaluation rule for the 
;special form if is the same whether the interpreter is using 
;normal or applicative order: The predicate expression is 
;evaluated first, and the result determines whether to evaluate
;the consequent or the alternative expression.)

;RESPOSTA: o comportamento examinado neste procedimento é
; verificar a se o parâmetro y será avaliado, dado que x
; satisfaz a condição. Para o caso de teste com parâmetros
; x = 0 e y = (p), tal que (p) é uma chamada recursiva sem
; critério de término, caso o interpreador use normal order (lazy),
; é esperado que o procedimento retorne 0. No caso contrário,
; o programa entra em loop infinito, preso em (p), já que apesar
; de x satisfazer a condicional, o método de applicative order
; evaluation obriga a verificação de todos as entidades operadas.