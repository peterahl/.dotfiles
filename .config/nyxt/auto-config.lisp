;; (DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
;;   ((DEFAULT-MODES (APPEND '(NYXT::EMACS-MODE) %SLOT-DEFAULT%))))
(define-configuration buffer
  ((default-modes (append '(nyxt::vi-normal-mode) %slot-default%))))
