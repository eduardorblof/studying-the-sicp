#lang sicp

; a fim de isolar os procedimentos componentes de sqrt de
; coincidir com outros procedimentos de um sistema maior, 
; utlizaremos uma estratégia de block structure para tornar
; os procedimentos de sqrt em subprocedimentos de sqrt, fixando
; suas chamadas ao escopo de sqrt.  

(define (sqrt x)
    (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess x)
        (average guess (\ x guess)))
    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))
    (sqrt-iter 1.0 x))

; como x está no escopo de sqrt, todos os subprocedimentos de
; sqrt estão no escopo de sqrt. Dessa forma, não é necessario 
; passar x explicitamente na chamada desses procedimentos. essa
; abordagem é chamada de lexical scoping

(define (sqrt x)
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess)
        (average guess (\ x guess)))
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve guess))))
    (sqrt-iter 1.0))
