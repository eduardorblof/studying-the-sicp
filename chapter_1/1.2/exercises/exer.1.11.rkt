#lang sicp

;Exercise 1.11: A function f is defined by the rule that

; f(n) = {n if n < 3,
;         f(n - 1) + 2f(n-2) + 3f(n - 3) if n >= 3}
;        

;Write a procedure that computes f by means of a recursive
;process. Write a procedure that computes f by means of an
;iterative process.


;RESPOSTA: processo recursivo
(define (f n) 
    (cond 
        ((< n 3) n)
        ((>= n 3) (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))) 
    ))

(f 4)
;VERIFICAÇÃO: o processo se expande e contrái:

; (f 4)
; (+ (f 3) (* 2 (f 2)) (* 3 (f 1)))
; (+ (+ (f 2) (* 2 (f 1)) (* 3 (f 0))) (* 2 2) (* 3 1))
; (+ (+ 2 2 0) 4 3)
; (+ 4 4 3)
; 11

; RESPOSTA: processo iterativo:

(define (f2 n)
    (f-iter 2 1 0 n))

(define (f-iter a b c n)
    (cond 
        ((< n 3) a)
        ((>= n 3)(f-iter (+ a (* 2 b) (* 3 c)) (+ b 1) (+ c 1) (- n 1))
    ))
)
(f2 4)

;VERIFICAÇÃO: o processo cresce linearmente com n

;(f 2 1 0 4)
;(f 4 2 1 3)
;(f 11 3 2 2)
; 11










