#lang sicp

; Exercise 3.2

(define (make-monitored proc)
  (define total-calls 0)
  (define (mf arg)
    (cond ((eq? arg 'how-many-calls?) total-calls)
          ((eq? arg 'reset-count) (begin (set! total-calls 0)
                                         total-calls))
          (else (begin (set! total-calls (+ total-calls 1))
                       (proc arg)))))
  mf)

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)
(s 81)
(s 'how-many-calls?)
(s 'reset-count)