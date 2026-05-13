(define-configuration (input-buffer)
  ((default-modes (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))

(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-nyxt-user-system-and-load "nyxt-user/search-engines"
  :depends-on (:nx-search-engines) :components ("search-engines.lisp"))
