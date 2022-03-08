;; -*-lisp-*-
;;
;; A sample .stumpwmrc file found at /usr/share/doc/stumpwm

(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(in-package :stumpwm)

;; clx needs to be cloned to quicklisp folder in $HOME
(ql:quickload :clx-truetype)
(ql:quickload :slynk)
(set-module-dir "/usr/share/stupmwm/contrib/")

;; load Stump contrib modules
(mapc #'load-module '("ttf-fonts"
                      "swm-gaps"))

;; set desktop background color
(setf (xlib:window-background (screen-root (current-screen))) #x47456d)
;; set wallpaper
;; (run-shell-command "feh --bg-fill ~/Pictures/wallpaper.png")

;; font settings. Sometimes you need to cashe it.
;; (xft:cache-fonts)
(set-font (list (make-instance 'xft:font
                               :family "Fira Code"
                               :subfamily "Regular"
                               :size 16)))
(grename "Base")
(gnewbg "Extra")
(gnewbg-float "Float")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybindings                                                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set prefix key
;; root-map is bound by prefix
;; top map is straight pipes
(set-prefix-key (kbd "Print"))
;; change the prefix key to something else: Apperently F20 is XF86AudioMicMute on asus

(define-key *top-map* (kbd "s-r") "loadrc")



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

(defcommand alacritty () ()
  "Start Alacritty or switch to it, if it is already running"
  (run-or-raise "alacritty" '(:class "Alacritty")))

(defvar *dev*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "e") "emacs")
    (define-key m (kbd "a") "alacritty")
    m
    ))

(define-key *root-map* (kbd "d") '*dev*)

(defcommand firefox () ()
  "Start Firefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "firefox")))

(defcommand chrome () ()
  "Start google-chrome or switch to it, if it is already running"
  (run-or-raise "google-chrome-stable" '(:class "Google-chrome")))

(defvar *browsing*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "firefox")
    (define-key m (kbd "c") "chrome")
    m
    ))

(define-key *root-map* (kbd "b") '*browsing*)
