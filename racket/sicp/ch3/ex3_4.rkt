#lang racket

(define call-the-cops (lambda args (display "Cops called!\n")))
(define [make-account available-credit password]
  (define password-incorrect-count 0)
  (lambda [op input-password]
    (if [eq? input-password password]
      (lambda [amount]
        (begin
          (set! password-incorrect-count 0)
          (cond ([eq? op 'withdraw]
                 (begin
                   (if [< available-credit amount]
                     "Insufficient funds"
                     (begin
                       (set! available-credit (- available-credit amount))
                       available-credit))))
                ([eq? op 'deposit]
                 (begin
                   (begin
                     (set! available-credit (+ available-credit amount))
                     available-credit)))
                (else (error "Unknown operation" op)))))
      (lambda args
        (begin
          (cond ([< 5 password-incorrect-count]
                 (call-the-cops))
                ([< 0 password-incorrect-count]
                 (set! password-incorrect-count (+ password-incorrect-count 1)))
                (else
                  (begin
                    (set! password-incorrect-count 1))))
          "Incorrect password")))))

(define acc (make-account 100 'secret-password))

((acc 'withdraw 'secret-password) 40)

((acc 'deposit 'some-other-password) 50)

((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)
((acc 'deposit 'incorrect) 1)