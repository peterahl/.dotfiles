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

;; input focus is transferred to the window you click on
(setf *mouse-focus-policy* :click)

(ql:quickload :slynk)
(slynk:create-server :port 4005)

(load "~/.stumpwm.d/keybindings.lisp")
