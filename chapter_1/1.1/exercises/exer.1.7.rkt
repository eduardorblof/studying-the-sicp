;Exercise 1.7: The good-enough? test used in computing
;square roots will not be very effective for finding the square
;roots of very small numbers. Also, in real computers,
;arithmetic operations are almost always performed with 
;limited precision. This makes our test inadequate for very large
;numbers. Explain these statements, with examples showing
;how the test fails for small and large numbers. An alternative 
;strategy for implementing good-enough? is to watch
;how guess changes from one iteration to the next and to
;stop when the change is a very small fraction of the guess.
;Design a square-root procedure that uses this kind of end
;test. Does this work better for small and large numbers?

; RESPOSTA: em respeito da eficácia de good-enough? em números
; muito pequenos, a ineficiência se dá pois é esperado que
; a diferença entre um guess e o valor buscado não seja
; "capturado" pela ordem de grandeza do teste como está; para
; valores extremamente grandes, a ordem de grandeza pode não
; ser precisa o suficiente para contornar o retorno de guesses
; com diferenças aberrantes do valor real da raiz quadrada, além
; do "ruído" natural da implementação de valores em ponto
; flutuante por computadores, que podem levar a um loop
; infinito: improve alternar entre dois valores que nunca
; convergem abaixo do limiar.

; ex1: (1e-11)
; ex2: (1e11)

; solução sugerida: 

;(define (new-good-enough? guess x)
;    (< (abs (- (improve guess x) guess)) (* guess 0.001)))

; testando-o, conclui-se que new-good-enough? consegue capturar
; as diferenças entre iterações corretamente pois ao invés de
; comparar o progresso do método através de um valor fixo,
; identifica se as aplicações herdadas apresentam diferença
; substancial de uma para outra, ou seja, se o método está 
; "avançando".




