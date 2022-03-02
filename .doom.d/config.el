;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Peter Lejon"
      user-mail-address "jp.lejon@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 16))
(setq doom-big-font (font-spec :family "FiraCode Nerd Font" :size 24))



;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-laserwave)
;; (setq doom-theme 'doom-horizon)
(setq doom-theme 'doom-gruvbox)
;; (setq doom-theme 'doom-one-light)



(setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?t))

(defun peter/center-line (&rest _)
  (evil-scroll-line-to-center nil))

(advice-add 'evil-next-line :after #'peter/center-line)
(advice-add 'evil-previous-line :after #'peter/center-line)
(advice-add 'evil-goto-line :after #'peter/center-line)
(advice-add 'evil-scroll-up :after #'peter/center-line)
(advice-add 'evil-scroll-down :after #'peter/center-line)
(advice-add 'better-jumper-jump-backward :after #'peter/center-line)
(advice-add 'better-jumper-jump-forward :after #'peter/center-line)

;; Fix jump issue for vertico
(dolist (func '(+default/search-project))
  (advice-add func :around #'doom-set-jump-a))

(dolist (func '(+default/search-buffer))
  (advice-add func :around #'doom-set-jump-a))
;; (advice-add 'next-line :after #'recenter)
;; (advice-add 'previous-line :after #'recenter)
;; (advice-add 'scroll-up :after #'move-to-window-line)
;; (advice-add 'scroll-down :after #'move-to-window-line)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq doom-localleader-key ",")

(setq aw-scope 'frame)

(setq cider-enhanced-cljs-completion-p nil
      lsp-ui-doc-enable nil
      lsp-ui-sideline-show-code-actions nil)

;; Preformance stuff
(setq which-key-idle-delay 0.2
      gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

;; (map! :leader
;;       :desc "Description" :n "C-r" #'ranger
;;       ;; :desc "vterm" :n "'" #'vterm
;;       (:when (featurep! :ui workspaces)
;;        (:prefix-map ("l" . "workspace")
;;         :desc "Display tab bar"           "TAB" #'+workspace/display
;;         :desc "Switch workspace"          "."   #'+workspace/switch-to
;;         :desc "Switch to last workspace"  "`"   #'+workspace/other
;;         :desc "New workspace"             "n"   #'+workspace/new
;;         :desc "New named workspace"       "N"   #'+workspace/new-named
;;         :desc "Load workspace from file"  "l"   #'+workspace/load
;;         :desc "Save workspace to file"    "s"   #'+workspace/save
;;         :desc "Delete session"            "x"   #'+workspace/kill-session
;;         :desc "Delete this workspace"     "d"   #'+workspace/delete
;;         :desc "Rename workspace"          "r"   #'+workspace/rename
;;         :desc "Restore last session"      "R"   #'+workspace/restore-last-session
;;         :desc "Next workspace"            "]"   #'+workspace/switch-right
;;         :desc "Previous workspace"        "["   #'+workspace/switch-left)))

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

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(define-derived-mode vue-mode web-mode "vue"
  "A major mode derived from web-mode, for editing .vue files with LSP support.")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook! 'vue-mode-hook #'lsp
  (setq web-mode-markup-indent-offset 2
        web-mode-script-padding 0
        web-mode-style-padding 0
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(use-package turbo-log
  :bind (("C-S-l" . turbo-log-print)
         ("C-S-i" . turbo-log-print-immediately)
         ("C-S-h" . turbo-log-comment-all-logs)
         ("C-S-s" . turbo-log-uncomment-all-logs)
         ("C-S-[" . turbo-log-paste-as-logger)
         ("C-S-]" . turbo-log-paste-as-logger-immediately)
         ("C-S-x" . turbo-log-delete-all-logs))
  :config
  (setq turbo-log-msg-format-template "\"🚀: %s\"")
  (setq turbo-log-allow-insert-without-tree-sitter-p t))

(setq typescript-indent-level 2)

(use-package! prisma-mode)
(after! prisma-mode
  (add-hook 'prisma-mode-hook #'lsp!))

(use-package! ranger)

;; (autoload 'View-scroll-half-page-forward "view")
;; (autoload 'View-scroll-half-page-backward "view")
;; (map! "C-v" #'View-scroll-half-page-forward
;;       "M-v" #'View-scroll-half-page-backward)

;; (use-package! vertico-posframe
;;   :config
;;   (vertico-posframe-mode 1)
;;   (setq vertico-posframe-parameters
;;         '((left-fringe . 8)
;;           (right-fringe . 8))))

;; (use-package! nvm)
(nvm-use  "v16.13.1")

(map! "M-g M-g" #'avy-goto-char
      "M-g M-t" #'treemacs-select-window
      "M-g M-r" #'ranger
      "M-o" #'ace-window
      "M-i" #'iedit-mode
      "M-g M-m" #'consult-global-mark
      "M-g M-l" #'consult-mark
      "M-g M-b" #'pop-global-mark)

(map! :localleader
      :map typescript-mode-map
      (:prefix ("e" . "eval")
       "b" #'eval-ts-buffer
       "r" #'eval-ts-region))

(map! :localleader
      :map rjsx-mode-map
      (:prefix ("e" . "eval")
       "b" #'eval-js-buffer
       "r" #'eval-js-region))

;; (use-package! ts-comint
;;   :config
;;   ;; (setq ts-comint-program-command "ts-node")
;;   (setq ts-comint-program-command "tsun")
;;   (map! :localleader
;;         :map typescript-mode-map
;;         (:prefix ("e" . "eval")
;;          "b" #'eval-ts-buffer
;;          "B" #'ts-send-buffer-and-go
;;          "f" #'ts-load-file-and-go
;;          "e" #'ts-send-last-sexp
;;          "r" #'eval-ts-region
;;          "R" #'ts-send-region-and-go
;;          "E" #'ts-send-last-sexp-and-go)))
