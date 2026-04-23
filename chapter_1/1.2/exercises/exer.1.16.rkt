#lang sicp

;Exercise 1.16: Design a procedure that evolves an iterative 
;exponentiation process that uses successive squaring and uses a logarithmic 
;number of steps, as does fast-expt.(Hint: Using the observation that 
;(bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, 
;an additional state variable a, and define the state transformation 
;in such a way that the product abn is unchanged from state to state.
;At the beginning of the process a is taken to be 1, and the
;answer is given by the value of a at the end of the process.
;In general, the technique of defining an invariant quantitythat 
;remains unchanged from state to state is a powerful
;way to think about the design of iterative algorithms.)

(define (even? n)
    ( = (remainder n 2) 0))

(define (square x)
    (* x x))

(define (expt b n)
    (iter-fast-expt b n 1))

(define (iter-fast-expt b n a)
   (cond
        ((= n 0) a)
        ((even? n) (iter-fast-expt (square b) (/ n 2) a ))
        (else (iter-fast-expt b (- n 1) (* b a)))
   )
)

(expt 2 4)

; (iter-fast-expt 5 3 1)
; (iter-fast-expt 5 2 5)
; (iter-fast-expt 5 1 25)
; (iter-fast-expt 5 0 125)
; 125