#lang sicp

;Exercise 1.18: Using the results of Exercise 1.16 and 
;Exercise 1.17, devise a procedure that generates an iterative 
;process for multiplying two integers in terms of adding, doubling,
;and halving and uses a logarithmic number of steps.


(define (double x)
    (+ x x))
(define (halve x)
    (/ x 2))

(define (even? n)
    (= (remainder n 2) 0))


(define (fast-mul a b)
    (fast-mul-iter a b 0))

(define (fast-mul-iter a b acc) 
    (cond
        ((= b 0) acc)
        ((even? b) (fast-mul-iter (double a) (halve b) acc))
        (else (fast-mul-iter a (- b 1) (+ acc a)))    
    )
)

(fast-mul 3 4)

