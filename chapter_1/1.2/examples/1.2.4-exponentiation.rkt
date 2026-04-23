#lang sicp

; por definição recursiva,

(define (expt b n)
    (if (= n 0)
        1
        (* b (expt b (- n 1)))))

; este é um processo linear recursivo, que requer O(n) passos
; e O(n) de espaço.

; nós podemos reformulá-lo de maneira equivalente com iteração
; linear:

(define (expt b n) 
    (expt-iter b n 1))
(define (expt-iter b counter product)
    (if (= counter 0)
    product
    (expt-iter b
        (- counter 1)
        (* b product))))
; que requer O(n) passos e O(1) em espaço.

; tambem podemos computar o fatorial em menos passos usando
; quadrados sucessivos.

; para isso usaremos a regra: 

; b^n = (b^(n/2))^2 se n é par,
; b^n = b * b^(n-1) se n é ímpar]

(define (fast-expt b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; onde
(define (even? n)
    (= (remainder n 2) 0))

; este processo cresce logaritmicamente com n tanto para número
; de passos quanto espaço.Este processo tem complexidade O(log n).
