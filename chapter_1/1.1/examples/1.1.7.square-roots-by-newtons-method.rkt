#lang sicp

(define (square x)
    (* x x))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess)  x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt 1e-11)
(sqrt 1e11)

; nota-se ineficácia de good-enough? ao aplicá-lo sobre valores
; muito grandes e muito pequenos. Tal problema de implementação
; é devidamente tratado com new-good-enough, implementado no
; exercício 1.7.
