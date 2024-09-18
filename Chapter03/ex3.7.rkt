#lang sicp

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

(define peter-acc (make-account 100 'open-sesame))


(define (make-joint acc acc-pass new-acc-pass)
  (lambda (passcode message)
    (acc (and (eq? passcode new-acc-pass) acc-pass) message)))

(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud)) ; Paul now has access to Peter's account.
((peter-acc 'rosebud 'withdraw) 10)
((paul-acc 'open-sesame 'withdraw) 10)
((peter-acc 'open-sesame 'withdraw) 10)
((paul-acc 'rosebud 'withdraw) 10)
((peter-acc 'open-sesame 'withdraw) 10)

