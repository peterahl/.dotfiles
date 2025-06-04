(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-configuration (web-buffer)
  ((default-modes (pushnew 'nyxt/mode/style:dark-mode %slot-value%))))

(defmethod customize-instance ((document-buffer document-buffer) &key)
  (setf (slot-value document-buffer 'zoom-ratio-default) 0.8))

(define-configuration browser
  ((theme theme:+light-theme+)))

(define-configuration (web-buffer)
  ((default-modes
    (remove-if (lambda (nyxt::m) (string= (symbol-name nyxt::m) "DARK-MODE"))
               %slot-value%))))

(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-configuration browser
  ((theme theme:+light-theme+)))

(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-configuration (input-buffer)
  ((default-modes (pushnew 'nyxt/mode/emacs:emacs-mode %slot-value%))))
