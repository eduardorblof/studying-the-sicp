#lang sicp

;Exercise 1.9: Each of the following two procedures defines
;a method for adding two positive integers in terms of the
;procedures inc, which increments its argument by 1, anddec, 
;which decrements its argument by 1.

(define (+ a b)
   (if (= a 0) b (inc (+ (dec a) b))))
(define (+ a b)
   (if (= a 0) b (+ (dec a) (inc b))))

;Using the substitution model, illustrate the process generated 
;by each procedure in evaluating (+ 4 5). Are these
;processes iterative or recursive?

; RESPOSTA: utilizando o modelo de substituição:
; primeiro procedimento:

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

; observa-se que o processo é recursivo, pois "empilha" operações
; deferidas (no caso, inc).   

; segundo procedimento:

(+ 4 5)
(+ (dec 4) (inc 5))
(+ (dec 3) (inc 6))
(+ (dec 2) (inc 7))
(+ (dec 1) (inc 8))
(+ 0 9)
9

; este procedimento aplica um processo iterativo, pois existem
; variáveis de estado que sumarizam o estado atual sem empilhar
; operações. A sintaxe do retorno, onde a chamada recursiva
; ocorre com a herança de parâmetros formais bem definidos 
; caracteriza o processos como recursão em cauda: nenhuma 
; operação é necessária após a chamada recursiva.