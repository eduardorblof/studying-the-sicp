#lang sicp

(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))
(fib 7)

; esse procedimento é um exemplo típico de recursão em árvore,
; contudo, um modo terrível de computar números de fibonacci
; pelo excesso de computações redundantes; o espaço requerido
; cresce linearmente com o input, pois são necessários ministrar
; apenas dos nós acima na árvore a qualquer ponto de qualquer
; computação. Em geral, o número de passos requeridos por um
; processo recursivo-em-árvore é proporcional á quantidade de 
; nós da árvore, enquanto o espaço requerido é proporcional à
; profundidade máxima da árvore. 

; também podemos formular um processo iterativo para computar os
; números de fibonacci.

(define (fib-it n)
    (fib-iter 1 0 n))
(define (fib-iter a b count)
    (if (= 0 count)
    b
    (fib-iter (+ a b) a (- count 1))))

(fib-it 7)

; esse segundo método é uma iteração linear: linear com n. Da
; diferença em número de passos para findar a computação entre
; um procedimento e outro, não se deve estimar que os processos
; de recursão em árvore sejam inúteis. Por exemplo: processos 
; que operam sobre estruturas de dados de organização hierárquica.

