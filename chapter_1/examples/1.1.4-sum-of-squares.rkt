
#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a )
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

; the "fully expand and then reduce" evaluation method is known as normal-order evaluation
; the "evaluate the arguments and then apply" method is called applicative-order evaluation

; Lisp uses applicative-order evaluation (avoid evaluating arguments more than once by using temporary variables)
