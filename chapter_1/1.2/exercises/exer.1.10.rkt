#lang sicp

;Exercise 1.10: The following procedure computes a mathematical 
;function called Ackermann’s function.

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;What are the values of the following expressions?

(A 1 10)
(A 2 4)
(A 3 3)

;RESPOSTA:
;(A 1 10)
;(A 0 (A 1 9))
;(* 2 (A 0 (A 1 8)))
;(* 2(* 2(A 0 (A 1 7)))) ...

; do desenvolvimento acima, nota-se que o algoritmo retornará
; 2 na y-ésima potência. No caso, 2^10.

;(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 2 1))))
;(A 1 (A 1 (A 1 2)))
;(A 1 (A 1 4))
;(A 1 16)
;2^16

;do desenvolvimento acima, nota-se que é realizado o processo de
;tetração: o algoritmo retorna 2 tetrado a y.

;(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;(A 2 4)
;2^16

;do desenvolvimento acima, nota-se que é realizada a operação
; de pentação.

;Consider the following procedures, where A is the procedure 
;defined above:

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

;Give concise mathematical definitions for the functions computed
;by the procedures f, g, and h for positive integer values of n. 
;For example, (k n) computes 5n^2.

; RESPOSTA: para f, como desenvolvidos acima, (A 0 n)  
; corresponde a 2n. Em g, (A 1 n) computa 2^n. Em h, 
; (A 2 n) corresponde a n-ésima tetração de 2.

;**** de acordo com o que foi desenvolvido, o procedimento
; implementado para a função Ackerman é de processo recursivo
; em árvore, ainda por ser estudado.