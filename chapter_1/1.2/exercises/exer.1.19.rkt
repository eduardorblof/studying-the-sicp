#lang sicp

;Exercise 1.19: There is a clever algorithm for computing
;the Fibonacci numbers in a logarithmic number of steps.
;Recall the transformation of the state variables a and b in
;the fib-iter process of Section 1.2.2: a a +b and b a.
;Call this transformation T , and observe that applying Tover 
;and over again n times, starting with 1 and 0, produces
;the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci
;numbers are produced by applying T n , the nth power of the
;transformationT , starting with the pair (1, 0). Now consider T 
;to be the special case of p = 0 and q = 1 in a family of
;transformations Tpq , where Tpq transforms the pair (a, b) 
;according to a bq + aq + ap and b bp + aq. Show
;that if we apply such a transformation Tpq twice, the effect
;is the same as using a single transformation Tp ′q ′ of the
;same form, and compute p′ and q′ in terms of p and q. This
;gives us an explicit way to square these transformations,
;and thus we can compute T n using successive squaring, as
;in the fast-expt procedure. Put this all together to complete the
;following procedure, which runs in a logarithmic number of steps:

; T_{pq}:
; a <- bq + aq + ap === a <- a * (p + q) + b * q 
; b <- bp + aq      === b <- a * q       + b * p
 
; Mostrar que (T_{pq})^2 = T_{p'q'}

; T(a,b)^2 = T(T(a,b)) =
; = T(bq + aq + ap, bp + aq) =
; = (((bp + aq)q) + ((bq + aq + ap)q) + ((bq + aq + ap)p), ((bp + aq)p) + ((bq + aq + ap)q)) =
; = (bpq + aq^2 + bq^2 + aq^2 + apq + bqp + aqp + ap^2   ,    bp^2 + aqp + bq^2 + aq^2 + apq) =
; = (2aq^2 + bq^2 + ap^2 + 2bpq + 2apq    ,    bp^2 + bq^2 + aq^2 + 2apq) = 
; = (a * (2q^2 + p^2 + 2pq) + b * (q^2 + 2pq)    ,  a * (q^2 + 2pq) + b * (p^2 + q^2) )
; = (a * (q^2 + 2pq + q^2 + p^2) + b * (q^2 + 2pq)  ,  a * (q^2 + 2pq) + b * (p^2 + q^2)), onde vê se que:
;   (q^2 + 2pq) = q', logo
;   (a * (q^2 + 2pq + q^2 + p^2) + b * q'  ,  a * q' + b * (p^2 + q^2)) =
; = (a * (q' + q^2 + p^2) + b * q'  ,  a * q' + b * (p^2 + q^2)) =  
; = (a * (q' + p') + b * q'  ,  a * q' + b * p')

; portanto, existem
; p' = p^2 + q^2    e
; q' = q^2 + 2pq    tais que

; (T_{pq})^2 = T_{p'q'}

(define (fib n)
    (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
    (cond 
        ((= count 0) b)
        ((even? count)
            (fib-iter a
                    b
                    (+ (* p p) (* q q)) ; <- respostas do exercicio
                    (+ (* q q) (* 2 p q)) ; <- 
                    (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))