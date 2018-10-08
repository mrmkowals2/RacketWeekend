#lang racket

(require (for-syntax racket/match))

(list 'define 'welcome-msg "Welcome to Racket Weekend")

(define (define-greeting greet)
  (list 'define 'welcome-msg greet))

(module+ test
  (require rackunit)
  (define-syntax (let-test stx)
    (syntax-case stx ()
      [(_ formals tests ...)
       #'(let formals
             (test-begin
               tests ...))])))

(module+ test
  (let-test ([a 5]
             [b 3])
    (check-true (exact-integer? a))
    (check-false (even? b))))

