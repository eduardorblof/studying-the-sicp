#lang sicp

; um processo linear recursivo
(define (factorial n)
    (if (= n 1)
    1
    (* n (factorial (- n 1)))))

; um processo linear iterativo

(define (factorial n)
    (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
    (if (> counter max-count)
    product
    (fact-iter (* counter product)
    (+ counter 1)
    max-count)))

; no primeiro algoritmo, o procedimento é executado através
; do processo de expansão seguida de contração. A expansão
; ocorre na acumulação de operações deferidas (adiadas). A
; esse tipo de processo, nomeia-se processo recursivo.
; A progressão desse processo requer que o interpretador tome
; conta de uma sequência de operações deferidas, no caso, 
; multiplicações, que cresce linearmente com n, tal qual
; o número de passos de execução. Tal processo é chamado 
; processo linear recursivo.

; Em contraste, o segundo processo "encolhe": a cada passo,
; para qualquer n, é necessário monitorar apenas os valores
; atuais das variáveis product, counter e max-count. Este se
; chama processo iterativo. Um processo iterativo é tal que
; o seu estado atual pode ser sumarizado por um número fixo
; de variáveis de estado, bem como a regra fixa que descreve
; como essas variáveis devem se comportar de estado para
; estado, e uma teste de encerramento que especifica as 
; condições para que o processo seja interrompido. Para
; computar n!, o número de passo requeridos cresce linearmente
; com n. Tal processo é chamado linear iterativo.

; No caso iterativo, as variáveis de estado do programa proveem
; uma descrição completa do estado do processo em qualquer ponto.
; Em contraste, o processo recursivo conta com informações "escondidas"
; que precisam ser monitoradas pelo interpretador.

; não confundir as definições de procedimento recursivo com a
; de processo recursivo!

; em C, loops são análogos a processos recursivos com TCO. Em
; C, mesmo que um procedimento recursivo seja sintaticamente um
; TCO (logicamente, um processo iterativo), não há garantia de 
; otimização pelo compilador, então na prática continua sendo
; recursivo. De maneira geral, loops, por serem processos 
; iterativos são mais eficientes em C.

