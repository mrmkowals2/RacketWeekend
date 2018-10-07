#lang racket

(serve/servlet
  let-er-rip
  #:port 6995
  #:servlet-regexp #rx"")

(define greetings/hash
  (hash "en" "Hello!"
        "de" "Hallo!"
        "es" "¡Hola!"
        "pt" "Ola!"
        "jp" ""))

(define languages (hash-keys greetings/hash))

;; the number of available language
(define num-languages (length languages))

(define-values (dispatcher url-generator)
  (dispatch-rules
    [("hello") hello]
    [("hello" (string-arg)) hello+lang]
    [("hello") #:method (regexp ".*") not-allowed]))

;; request? string? -> response?
(define (hello+lang req lang)
  (define greeting (hash-ref greetings/hash
                             lang
                             #f))
  (cond ((string? greeting)
         (respond/text #:body greeting))
        (else
          (not-found req))))

;; request? -> response?
(define (hello req)
  (define lang (random-language))
  (define greeting (hash-ref greetings/hash lang))
  (set-location (respond/text #:body greeting)
                (url-generator hello+lang lang)))

;; -> string?
(define (random-language)
  (list-ref greetings (random num-greetings)))

