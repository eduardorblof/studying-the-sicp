#lang sicp


; this construct is special form called a case analysis
(define (abs1 x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs1 -5)

; another way to write the abolute-value procedure is

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))
(abs2 -5)

; another way:

(define (abs3 x)
  (if (< x 0)
  (- x)
  x))
(abs3 -5)
