#lang sicp


; Exercise 3.3

(define (make-account balance password)
  (define (withdraw amount)
    (if (<= amount balance)
        (begin (set! balance (- balance amount))
               balance)
        ("Insufficient funds.")))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch code m)
    (if (eq? code password) 
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request -- MAKE-ACCOUNT" m)))
        (lambda (m) "Incorrect password")))
  
  dispatch)


(define acc (make-account 100 'simsim))

((acc 'simsim 'withdraw) 40)
((acc 'abcdef 'deposit) 50)
((acc 'simsim 'deposit) 50)
