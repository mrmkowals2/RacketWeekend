#lang racket

(require (file "RW_L03_main.rkt"))
(require (file "RW_L04_oop.rkt"))

(module+ test
  (require rackunit))

(module+ test
  (check-true (location? super-shoes-loc))
  (check-= 5
           (location-aisle super-shoes-loc)
           0)
  (define b (bin (location "A" 5 1)
                 "Fancy Pants"
                 1
                 #t))
  (define picked-b (pick b))
  (check-= 1
           (bin-qty b)
           0)
  (check-= 0
           (bin-qty picked-b)
           0)
)

(module+ test
  (check-exn exn:fail?
             (lambda ()
               (pick picked-b))))

