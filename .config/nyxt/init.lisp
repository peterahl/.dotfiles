;; (defvar *my-search-engines*
;;   (list
;;    '("python3" "https://docs.python.org/3/search.html?q=~a" "https://docs.python.org/3")
;;    '("doi" "https://dx.doi.org/~a" "https://dx.doi.org/")
;;    '("go" "https://www.google.com/search?q=~a" "https://www.google.com/")))
;;
;; (define-configuration buffer
;;   ((search-engines (append (mapcar (lambda (engine) (apply 'make-search-engine engine))
;;                                    *my-search-engines*)
;;                            %slot-default%))))
;;
