#lang sicp

;Exercise 1.8: Newton’s method for cube roots is based on
;the fact that if y is an approximation to the cube root of x,
;then a better approximation is given by the value

;(/ (+ (/ x (square y)) (* 2 y)) 3)

;Use this formula to implement a cube-root procedure analogous 
;to the square-root procedure. (In Section 1.3.4 we will
;see how to implement Newton’s method in general as an
;abstraction of these square-root and cube-root procedures.)

(define (square x)
    (* x x))

(define (cube x)
    (* x x x))

(define (better-guess x y)
    (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (new-good-enough? guess x)
    (< (abs (- (improve guess x) guess)) (* guess 0.001)))

(define (improve guess x)
    (better-guess x guess))

(define (cube-iter guess x)
    (if (new-good-enough? guess x)
    guess
    (cube-iter (improve guess x) x)))

(define (cube-root x)
    (cube-iter 1.0 x))

(cube-root 27)
