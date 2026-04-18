#lang sicp

;Exercise 1.12: the following pattern of numbers is called
;Pascal’s 

;1
;1 1
;1 2 1
;1 3 3 1
;1 4 6 4 1

;The numbers at the edge of the triangle are all 1, and each
;number inside the triangle is the sum of the two numbers
;above it.35 Write a procedure that computes elements of
;Pascal’s triangle by  means of a recursive process.

; RESPOSTA: 

(define (pascal row col)
    (cond
        ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal (- row 1) col ) (pascal (- row 1) 
        (- col 1))))
    ))

(pascal 5 3)
