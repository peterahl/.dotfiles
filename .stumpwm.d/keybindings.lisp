;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Keybindings                                                             ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :stumpwm)
;; set prefix key
;; root-map is bound by prefix
;; top map is straight pipes
(set-prefix-key (kbd "Print"))
;; change the prefix key to something else: Apperently F20 is XF86AudioMicMute on asus

(undefine-key *root-map* (kbd "s"))
(undefine-key *root-map* (kbd "S"))
(undefine-key *root-map* (kbd "Q"))
(undefine-key *root-map* (kbd "f"))
(undefine-key *root-map* (kbd "w"))

;; Apps
(defcommand alacritty () ()
  "Start Alacritty or switch to it, if it is already running"
  (run-or-raise "alacritty" '(:class "Alacritty")))

(define-key *top-map* (kbd "s-a") "alacritty")

(defcommand firefox () ()
  "Start Firefox or switch to it, if it is already running"
  (run-or-raise "firefox" '(:class "firefox")))

(defcommand chrome () ()
  "Start google-chrome or switch to it, if it is already running"
  (run-or-raise "google-chrome-stable" '(:class "Google-chrome")))

(defcommand figma () ()
  "Start figma or switch to it, if it is already running"
  (run-or-raise "figma-linux" '(:class "figma-linux")))

(defcommand slack () ()
  "Start slack or switch to it, if it is already running"
  (run-or-raise "slack" '(:class "Slack")))

(defcommand neovide () ()
  "Start neovide or switch to it, if it is already running"
  (run-or-raise "neovide" '(:class "neovide")))

(defcommand dbeaver () ()
  "Start dbeaver or switch to it, if it is already running"
  (run-or-raise "dbeaver" '(:class "DBeaver")))

(defcommand spotify () ()
  "Start spotify or switch to it, if it is already running"
  (run-or-raise "spotify" '(:class "Spotify")))

(defcommand pavucontrol () ()
  "Start pavucontrol or switch to it, if it is already running"
  (run-or-raise "pavucontrol" '(:class "Pavucontrol")))

(defcommand nyxt () ()
  "Start nyxt or switch to it, if it is already running"
  (run-or-raise "nyxt" '(:class "Nyxt")))


(define-key *top-map* (kbd "s-e") "emacs")
(define-key *top-map* (kbd "s-f") "figma")
(define-key *top-map* (kbd "s-a") "alacritty")
(define-key *top-map* (kbd "s-c") "chrome")
(define-key *top-map* (kbd "s-n") "neovide")
(define-key *top-map* (kbd "s-d") "dbeaver")
(define-key *top-map* (kbd "s-Return") "exec alacritty")

;; groups
(defvar *quit/session*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "r") "restart-hard")
    (define-key m (kbd "l") "exec blurlock")
    (define-key m (kbd "c") "loadrc")
    (define-key m (kbd "q") "quit")
    m
    ))

(defvar *frames*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "v") "hsplit")
    (define-key m (kbd "s") "vsplit")
    (define-key m (kbd "l") "move-focus right")
    (define-key m (kbd "h") "move-focus left")
    (define-key m (kbd "j") "move-focus down")
    (define-key m (kbd "k") "move-focus up")
    (define-key m (kbd "m") "only")
    (define-key m (kbd "d") "remove-split")
    (define-key m (kbd "f") "fselect")
    m
    ))

(defvar *windows*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "w") "windowlist")
    (define-key m (kbd "d") "delete")
    (define-key m (kbd "h") "move-window left")
    (define-key m (kbd "j") "move-window down")
    (define-key m (kbd "k") "move-window up")
    (define-key m (kbd "l") "move-window right")
    m
    ))

(defvar *applications*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "f") "firefox")
    (define-key m (kbd "s") "slack")
    (define-key m (kbd "m") "spotify")
    (define-key m (kbd "p") "pavucontrol")
    (define-key m (kbd "n") "exec neovide")
    m
    ))

(defvar *utils*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "h") "refresh-heads")
    (define-key m (kbd "e") "exec xrandr --output HDMI-A-0 --left-of eDP")
    (define-key m (kbd "a") "exec xrandr --auto")
    m
    ))


(define-key *root-map* (kbd "f") '*frames*)
(define-key *root-map* (kbd "u") '*utils*)
(define-key *root-map* (kbd "w") '*windows*)
(define-key *root-map* (kbd "a") '*applications*)
(define-key *root-map* (kbd "q") '*quit/session*)
(define-key *root-map* (kbd "c") "exec alacritty")


;; toggle useless gaps keybinding (Super + u)
(define-key *top-map* (kbd "s-u") "toggle-gaps")

;; allows me to continously have control of Prefix key
;; by unmapping it from 'pull-hidden-other
(undefine-key *tile-group-root-map* (kbd "C-z"))
(define-key *root-map* (kbd "C-z") "abort")
