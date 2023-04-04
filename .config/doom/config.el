;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Peter Lejon"
      user-mail-address "jp.lejon@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "Fira Code" :size 11 :weight 'SemiBold)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 11 :style 'italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-localleader-key ",")

;; (require 'treesit)

(defun peter/center-line (&rest _)
  (evil-scroll-line-to-center nil))

(advice-add 'evil-next-line :after #'peter/center-line)
(advice-add 'evil-previous-line :after #'peter/center-line)
(advice-add 'evil-goto-line :after #'peter/center-line)
(advice-add 'evil-scroll-up :after #'peter/center-line)
(advice-add 'evil-scroll-down :after #'peter/center-line)
(advice-add 'better-jumper-jump-backward :after #'peter/center-line)
(advice-add 'better-jumper-jump-forward :after #'peter/center-line)

(setq gc-cons-threshold 167772160)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))

;; (setq +tree-sitter-hl-enabled-modes t)
;; (global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(map! :n "M-g M-r" #'ranger)

(add-hook 'lisp-mode-hook #'evil-cleverparens-mode)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)

(use-package! protobuf-mode
  :defer-incrementally t)

(setq-hook! 'protobuf-mode-hook +format-with "buf format")

(after! lsp-java
  (setq lsp-java-format-settings-profile "GoogleStyle"
        lsp-java-formatting-provider "google-java-format"
        lsp-java-format-settings-url "file:///home/peter/.config/emacs/.local/etc/eclipse-java-google-style.xml"))

(setq initial-major-mode 'emacs-lisp-mode)

(after! org
  (add-hook 'org-mode-hook (lambda ()
                             (copilot-mode 1)
                             (auto-fill-mode 1))))

(add-hook 'markdown-mode-hook (lambda ()
                                (copilot-mode 1)
                                (auto-fill-mode 1)))


(use-package! lsp-volar)

(setq highlight-indent-guides-method 'bitmap)

(use-package turbo-log
  :bind (("C-s-l" . turbo-log-print)
         ("C-s-i" . turbo-log-print-immediately)
         ("C-s-h" . turbo-log-comment-all-logs)
         ("C-s-s" . turbo-log-uncomment-all-logs)
         ("C-s-[" . turbo-log-paste-as-logger)
         ("C-s-]" . turbo-log-paste-as-logger-immediately)
         ("C-s-x" . turbo-log-delete-all-logs))
  :config
  (setq turbo-log-msg-format-template "\"🚀: %s\"")
  (setq turbo-log-allow-insert-without-tree-sitter-p t))
