#lang sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

; Circle centered at the origin with unit radius.

; Predicate.
(define (in-circle x y rad)
  (<= (+ (* x x) (* y y)) (* rad rad)))

; Experiment.
(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (bounding-box)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (P x y 1.0)))
  (* (monte-carlo trials bounding-box) (- x2 x1) (- y2 y1)))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment) ; If the experiment is successful.
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))