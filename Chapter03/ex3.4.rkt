#lang sicp

; Exercise 3.4

(define (make-account balance password)

  (define tries 0)
  
  (define (withdraw amount)
    (if (<= amount balance)
        (begin (set! balance (- balance amount))
               balance)
        ("Insufficient funds.")))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (call-the-cops) "Calling the cops")

  (define (reset-tries) (set! tries 0))
  
  (define (dispatch code m)
    (if (eq? code password) 
        (cond ((eq? m 'withdraw) (begin (reset-tries) withdraw))
              ((eq? m 'deposit) (begin (reset-tries) deposit))
              (else (error "Unknown request -- MAKE-ACCOUNT" m)))
        (lambda (m) (if (< tries 7)
                        (begin (set! tries (+ tries 1))
                                 "Incorrect password")
                        (call-the-cops)))))
  
  dispatch)


(define acc (make-account 100 'simsim))

((acc 'simsim 'withdraw) 40)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)


((acc 'simsim 'deposit) 50)
((acc 'abcdef 'deposit) 50)
((acc 'abcdef 'deposit) 50)