;;; Straight package mgmt
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
;; straight has use-package integration. By setting this parameter use
;; package will use straight to install packages. Make sure to set
;; ensure: nil if the package is bulitin
;; (setq straight-use-package-by-default t)

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
;; (setq display-time-format "%H:%M")
;; (display-time-mode 1)
;; (display-battery-mode 1)
;; ;;(tool-bar-mode -1)
;; ;;(menu-bar-mode -1)
;; ;;(scroll-bar-mode -1)
;; (electric-pair-mode 1)
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :weight 'normal
		    :height 110
                    :width 'normal)

;; ;;(fringe-mode 0)

;; (use-package flyspell
;;   :straight t
;;   :config
;;   (setq flyspell-issue-message-flag nil)
;;   (setq ispell-program-name "aspell")
;;   (setq ispell-list-command "--list")
;;   :hook
;;   org-mode)

(use-package org
  :hook
  org-indent-mode)

;; horizon-theme

(use-package dracula-theme
  :straight t
  :config
  (load-theme 'dracula t))

;; (use-package posframe
;;   :straight t)

;; ;; Seems there are some issues with posframe and exwm. The workaround
;; ;; is to decouple the posframe from the parrent. see:
;; ;; https://github.com/ch11ng/exwm/issues/550
;; (use-package ivy-posframe
;;   :straight t
;;   :config
;;   (setq ivy-posframe-parameters '((parent-frame nil)))
;;   (ivy-posframe-mode))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

(use-package projectile
  :straight t
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package perspective
  :straight t
  :after ivy
  :bind
  ("C-x b" . persp-ivy-switch-buffer)
  ("C-x C-b" . persp-list-buffers)   ; or use a nicer switcher, see below
  :config
  (persp-mode))

(use-package ivy
  :straight t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
	 ;; ("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package swiper
  :straight t
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package counsel
  :after ivy
  :straight t
  :config (counsel-mode)
  :bind (("C-x C-f" . counsel-find-file)))

(use-package company
  :straight t
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company)

(use-package ivy-rich
  :straight t
  :config
  (ivy-rich-mode)
  :diminish ivy-rich-mode)

(use-package cider
  :straight t)

(use-package clojure-mode
  :after cider)

(use-package smartparens
  :straight t
  :bind
  ;; (("C-M-f" . sp-forward-sexp smartparens-mode-map)
  ;;  ("C-M-b" . sp-backward-sexp smartparens-mode-map)
  ;;  ("C-)" . sp-forward-slurp-sexp smartparens-mode-map)
  ;;  ("C-(" . sp-backward-slurp-sexp smartparens-mode-map)
  ;;  ("M-)" . sp-forward-barf-sexp smartparens-mode-map)
  ;;  ("M-(" . sp-backward-barf-sexp smartparens-mode-map)
  ;;  ("C-S-s" . sp-splice-sexp)
  ;;  ("C-M-<backspace>" . backward-kill-sexp)
  ;;  ("C-M-S-<SPC>" . (lambda () (interactive) (mark-sexp -1))))
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (sp-pair "'" nil :actions :rem)
  (sp-pair "`" nil :actions :rem)
  (setq sp-highlight-pair-overlay nil))

(use-package yasnippet                  ; Snippets
  :straight t
  :config
  (yas-reload-all)
  (yas-global-mode))

(use-package yasnippet-snippets         ; Collection of snippets
  :straight t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(help-window-select t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
