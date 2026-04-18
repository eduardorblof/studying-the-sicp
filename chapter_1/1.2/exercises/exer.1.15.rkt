#lang sicp

Exercise 1.15: 

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

; a. How many times is the procedure p applied when (sine 12.15) 
;is evaluated?

; b. What is the order of growth in space and number of
;steps (as a function of a) used by the process generated
;by the sine procedure when (sine a) is evaluated?

; RESPOSTA.A: 5 vezes

; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.05))))))

; RESPOSTA.B: 

;10a/3^x <= 1
;10a <= 3^x
;ln(10 a) <= x ln 3
;ln(10a)/ln 3 <= x
;x >= log_3 (10a) = log_3 (10) + log_3 (a)
; como log_3 (10) é constante,
; O(log a)

