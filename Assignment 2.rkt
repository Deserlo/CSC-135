#lang racket
(current-namespace (make-base-namespace)) ;needed for eval function to work

#| CSC-135
   Assignment 2
   Marina Nikiforova
   Evamarie Najera
|#

#|-----Function 1------|#
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

;test
(make6 123 479)
(make6 -12 456)
(make6 1 9)
(make6 123 12)
(make6 123457 -453)


#|-----Function 2------|#

(define (convert-to-string List) (eval(cons string-append (map symbol->string List))))
(convert-to-string '(a b c d))
 
(define ( concatL L M )
  (cond ((null? L ) M)
        ((null? M) L)
        (else (for/list ([i L] [j M])
                (list (string-append(convert-to-string i)(convert-to-string j)))))))

;test
(concatL '((a b) (c d) (d e)) '((f f f) (d e s) (v v v)))

#|-----Function 3------|#
 (define(buildOne N E1)
    (if (= N 0) '()
      (cons E1(buildOne (- N 1) E1))))
(define(buildTwo M E2)
    (if (= M 0) '()
      (cons E2(buildTwo (- M 1) E2))))
(define(appendlist E1 E2)(if (null? E1) E2
                             (cons(car E1)
                                  (appendlist(cdr E1) E2))))
(define (buildList N E1 M E2)
  (appendlist (buildOne N E1) (buildTwo M E2)))
  
  ;test
(buildList 3 'A 3 'b)
(buildList 3 '() 2 'a)
(buildList 2 '(a b c) 1 'Q)

#|-----Function 4------|#

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

;test 
(DFA-Acceptor '(1 1 0 1 0) Q0 ( Q2 ) P)
(DFA-Acceptor '(1 1 1 1 0 1 0 1 0) Q0 ( Q2 ) P)
(DFA-Acceptor '(1 0 0) Q0 ( Q2 ) P)

#|-----Function 5------|#

(define (selectN n)
  (lambda (list)
    (define (iter l i)
      (if (= i 0) l (iter (cdr l) (- i 1))))
    (iter list n)))

;test
; change the number inselectN, or reconfigure the list
(define last (selectN 2))
(define result (last '(4 8 2 9 -1 13 15 17)))
(display result)
