#lang racket
#| CSC-135
   Assignment 2
   Marina Nikiforova
   Evamarie Najera
|#

;1.) make6 

(define ( toString str )
   (number->string str))

( define (checkNegative num)
(string-prefix? (toString num) "-"))

(define ( checkLength a )
  (if (> 3 ( length a )) #f #t ))

(define ( length num )
  (if (checkNegative num) (- (string-length (toString num)) 1) (string-length(toString num))))

(define (first a )
  (substring (toString a) 0 3))

(define (last b)
   (substring (toString b) (- (string-length(toString b)) 3) (string-length(toString b))))
                         
( define ( make6  x y )
   ( if (checkLength x) (if (checkLength y) (string-append (first x) (last y) ) "-2") "-2" ) )

(make6 123 479)
(make6 -12 456)
(make6 1 9)
(make6 123 12)
(make6 123457 -453)



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
