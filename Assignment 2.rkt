#lang racket
#| CSC-135
   Assignment 2
   Marina Nikiforova
   Evamarie Najera
|#

#|-----Function3------|#
 (define(buildList N E1)
    (if (= N 0) '()
      (cons E1(buildList (- N 1) E1))))
  
     
;testing (works but needs to be extended)
(buildList 3 'A)



;4.) DFA Acceptor

(define ( DFA-Acceptor lstAlpha start lstFinal sink)
( cond
   [(eq? start Q0) (Q0 lstAlpha)]
   [else 'invalid]) )


(define (Q0 t)
 (cond
  [(eq? 0 (car t)) (Q1 (cdr t))]
  [(eq? 1 (car t)) (Q0 (cdr t))]
  [else P]))

(define (Q1 t)
  (cond
    [(eq? 0 (car t)) (P)]
    [(eq? 1 (car t)) (Q2)]
    [else P]))

(define (Q2)
  #t)

(define ( P )
  #f)

;test case
(DFA-Acceptor '(1 1 0 1 0) Q0 ( Q2 ) P)
(DFA-Acceptor '(1 1 1 1 0 1 0 1 0) Q0 ( Q2 ) P)
(DFA-Acceptor '(1 0 0) Q0 ( Q2 ) P)



#|-----Function 6-----|#
(define (selectN n)
  (lambda (list)
    (define (iter l i)
      (if (= i 0) l (iter (cdr l) (- i 1))))
    (iter list n)))

;testing
; change the number inselectN, or reconfigure the list
(define last (selectN 2))
(define result (last '(4 8 2 9 -1 13 15 17)))
(display result)
