#lang sicp


; Exercise 3.1

(define (make-accumulator initial-value)
  (define (accrete amount)
    (begin (set! initial-value (+ initial-value amount))
           initial-value))
  accrete)


(define A (make-accumulator 5))
(A 10)
(A 10)