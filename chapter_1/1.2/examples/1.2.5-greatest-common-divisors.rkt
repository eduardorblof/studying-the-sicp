#lang sicp

; Algoritmo de Euclides para computar GCD

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

; este algoritmo gera um processo iterativo que expande
; logaritmicamente.

