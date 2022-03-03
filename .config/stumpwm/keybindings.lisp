;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybindings                                                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set prefix key
(set-prefix-key (kbd "F8"))

;;others
;; run or raise firefox
(defcommand firefox () ()
  "Start Forefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "firefox")))

(defcommand alacritty () ()
  "Start Alacritty or switch to it, if it is already running"
  (run-or-raise "alacritty" '(:class "alacritty")))

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


(define-key *top-map* (kbd "s-b") "firefox")
(define-key *root-map* (kbd "s-b") "firefox")

;; open terminal
(define-key *root-map* (kbd "Return") "exec urxvt")
(define-key *root-map* (kbd "c") "exec urxvt")
(define-key *root-map* (kbd "C-c") "exec urxvt")

;; toggle useless gaps keybinding (Super + u)
(define-key *top-map* (kbd "s-u") "toggle-gaps")

;; hard restart keybinding (Super + r)
(define-key *top-map* (kbd "s-r") "restart-hard")

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
