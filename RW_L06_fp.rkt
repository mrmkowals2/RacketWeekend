#lang racket
(require (file "RW_L04_oop.rkt"))

;(list "a" 4 #t)

(define a (list "a" 4 #t))
(list-ref a 0) ; "a"
(list-ref a 1) ; 4
(list-ref a 2) ; #t

(first a) ; "a"
(second a) ; 4
(third a) ; #t

(length a) ; 3

(rest a) ; '(4 #t)

(define/contract (cube x)
  (number? . -> . number?)
  (* x x x))

(define/contract l
  (listof number?)
  (list 4 -9 45.132 45-2i))

(map cube l)

(define/contract hamlet
  string?
  "To be or not to be, that is the question.")

(define/contract (uppercase str)
  (string? . -> . string?)
  (cond ((string=? str "")
         "")
        (else
          (define c (string-ref str 0))
          (format "~a~a"
                  (char-upcase c)
                  (substring str 1)))))

(map uppercase (string-split hamlet))

(define/contract (square-sum x y)
  (number? number? . -> . number?)
  (expt (+ x y) 2))

(define nums-1 (list -5 2 4.6))
(define nums-2 (list 4 01.3 1980))

(map square-sum nums-1 nums-2)

(foldl +
       0
       (list 1 2 3 4 5))

(andmap even?
        (list 313 55 94 4551 5+5i))

;(even? 5+5i)

(define (imaginary? x)
  (and (number? x)
       (not (real? x))))

(ormap imaginary?
       (list 313 5.6 94 4.551 5+5i))

(define/contract (talk-about-cubes nums)
  ((listof number?) . -> . void?)
  (for ([n nums])
    (displayln (format "The cube of ~a is ~a."
                       n
                       (cube n)))))

(talk-about-cubes (list 4 1.9 -5 3+2i))

(define/contract (talk-about-stuff list-1 list-2)
  ((listof string?) (listof number?) . -> . void?)
  (for ([a list-1]
        [b list-2])
    (displayln (format "a = ~a and b = ~a"
                      a
                      b))))

(talk-about-stuff (list "a" "b" "c") (list 1 2 3))

;(define (set-qtys-for-bins! bins qtys)
;  (for ([b bins]
;        [q qtys])
;    (set-qtys-for-bins! b q)))
; the above didn't work because set-qtys-for-bins! was never defined in previous
; lessons - pretty sure the author just made a mistake on this one

(match "143"
  [(? integer?)
   (error "Will never happen.")]
  ["134"
   (error "Close but no cigar.")]
  [(pregexp "1[0-9]3")
   "yes"]
  [else
   "you shouldn't see me"])

(define louis
  (list "l" "ou" "i" "s"))

(match louis
  [(? string?)
   "no way Jose"]
  [(list "l")
   "list contains more than that"]
  [(list-rest "l" "o" more)
   "close, but not quite"]
  [(list-rest "l" (pregexp "o[a-z]") more)
   (displayln
     (format "the second element of the list is: ~a"
             (second louis)))
   more]
  [else
   "ouch!"])

(match louis
  [(? string?)
   "no way Jose"]
  [(list "l")
   "list contains more than that"]
  [(list-rest "l" "o" more)
   "close, but not quite"])

