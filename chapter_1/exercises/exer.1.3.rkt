#lang sicp

;Exercise 1.3: Define a procedure that takes three numbers
;as arguments and returns the sum of the squares of the two
;larger numbers.

(define (square x) (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (larger a b)
    (if (> a b)
    a
    b))

(define (larger3 x y z selector) 
    (if (= selector 1)
    (larger (larger x y) (larger x z))
    (if (< x y)
    (larger x y)
    (larger y z))))

(define (soq-larger-three x y z)
    (sum-of-squares (larger3 x y z 1) (larger3 x y z 0)))

(soq-larger-three 1 2 2)

; solução alternativa

#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (smallest a b c)
  (cond ((and (<= a b) (<= a c)) a)
        ((and (<= b a) (<= b c)) b)
        (else c)))

(define (soq-larger-three x y z)
  (sum-of-squares (+ x y z)
                  (- (smallest x y z))))