;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybindings                                                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set prefix key
;; root-map is bound by prefix
;; top map is straight pipes
(set-prefix-key (kbd "F8"))

(defcommand firefox () ()
  "Start Forefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "firefox")))

(defcommand alacritty () ()
  "Start Alacritty or switch to it, if it is already running"
  (run-or-raise "alacritty" '(:class "Alacritty")))

(defvar *quit/session*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "r") "restart-hard")
    (define-key m (kbd "q") "quit")
    m
    ))

(define-key *root-map* (kbd "q") '*quit/session*)

(defvar *swank-repl*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "s") "start-swank")
    (define-key m (kbd "q") "stop-swank")
    m
    ))

(define-key *root-map* (kbd "r") '*swank-repl*)

(defvar *dev*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "e") "emacs")
    (define-key m (kbd "a") "alacritty")
    m
    ))

(define-key *root-map* (kbd "d") '*dev*)

(defvar *browsing*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "firefox")
    m
    ))

(define-key *root-map* (kbd "b") '*browsing*)

(defvar *windows*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "curframe")
    (define-key m (kbd "M-b") "move-focus left")
    m
    ))

(define-key *root-map* (kbd "C-f") '*my-frame-bindings*)


;; navigation
;; cycle forward and back through groups
(define-key *root-map* (kbd ".") "gnext")
(define-key *root-map* (kbd ",") "gprev")
(define-key *top-map* (kbd "s-Up") "gnext")
(define-key *top-map* (kbd "s-Down") "gprev")

;; cycle through windows using Super key + arrows
(define-key *top-map* (kbd "s-Right") "pull-hidden-next")
(define-key *top-map* (kbd "s-Left") "pull-hidden-previous")

;; send window to next/previous groups
(define-key *root-map* (kbd "s-Right") "gnext-with-window")
(define-key *root-map* (kbd "s-Left") "gprev-with-window")

(define-key *top-map* (kbd "s-SPC") "fnext")

;; open terminal
(define-key *root-map* (kbd "Return") "exec alacrity")

;; toggle useless gaps keybinding (Super + u)
(define-key *top-map* (kbd "s-u") "toggle-gaps")

;; allows me to continously have control of Prefix key
;; by unmapping it from 'pull-hidden-other
(undefine-key *tile-group-root-map* (kbd "C-z"))
(define-key *root-map* (kbd "C-z") "abort")

;; take screenshot
(defcommand stump-screenshot () ()
  (run-shell-command "exec scrot")
  (sleep 0.5)
  (message "Screenshot taken!"))

(define-key *top-map* (kbd "Print") "stump-screenshot")

(define-key *top-map* (kbd "s-s") "toggle-swank")
