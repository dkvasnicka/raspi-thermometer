#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/templates
         racket/runtime-path
         "../../racket-riak/main.rkt")

(define-values [app-routes appurl]
    (dispatch-rules
        [("data") (λ [req] 
                 (response/full
                    200 #"OK"
                    (current-seconds) TEXT/HTML-MIME-TYPE
                    empty
                    (list (string->bytes/utf-8 
                            (string-append "[" (string-join (get-all-strings "temp") ", ") "]")))))]))

(define-runtime-path static-files "static")

(serve/servlet app-routes 
               #:command-line? #t
               #:launch-browser? #f
               #:servlet-regexp #rx""
               #:extra-files-paths (list static-files))
