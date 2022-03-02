;;; packages.el --- lispyville layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: Peter Lejon <peter@t14s>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `lispyville-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `lispyville/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `lispyville/pre-init-PACKAGE' and/or
;;   `lispyville/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst lispyville-packages
  '(lispy
    lispyville))

(defun lispyville/init-lispy ()
  (use-package lispy
    :defer t
    :hook ((lisp-mode . lispy-mode)
           (emacs-lisp-mode . lispy-mode)
           (ielm-mode . lispy-mode)
           (scheme-mode . lispy-mode)
           (racket-mode . lispy-mode)
           (hy-mode . lispy-mode)
           (lfe-mode . lispy-mode)
           (dune-mode . lispy-mode)
           (clojure-mode . lispy-mode)
           (fennel-mode . lispy-mode))
    :init
    (add-hook 'eval-expression-minibuffer-setup-hook
               (defun spacemacs-init-lispy-in-eval-expression-h ()
                 "Enable `lispy-mode' in the minibuffer for `eval-expression'."
                 (lispy-mode)
                 ;; When `lispy-key-theme' has `parinfer', the TAB key doesn't do
                 ;; completion, neither (kbd "<tab>"/"TAB"/"C-i")/[tab]/"\C-i" works in
                 ;; terminal as tested so remapping is used as a workaround
                 (local-set-key (vector 'remap (lookup-key lispy-mode-map (kbd "TAB"))) #'completion-at-point)))
    :config
    (setq lispy-close-quotes-at-end-p t)
    (add-hook 'lispy-mode-hook #'turn-off-smartparens-mode)))

(defun lispyville/init-lispyville ()
  (use-package lispyville
    :defer t
    :hook (lispy-mode . lispyville-mode)
    :init
    (setq lispyville-key-theme
          '((operators normal)
            c-w
            (prettify insert)
            (atom-movement t)
            (additional-movement normal visual motion)
            slurp/barf-lispy
            (wrap visual)
            additional
            additional-insert))
    :config
    (lispyville-set-key-theme)
    (add-hook 'evil-escape-inhibit-functions
              (defun +lispy-inhibit-evil-escape-fn ()
                (and lispy-mode (evil-insert-state-p))))))
