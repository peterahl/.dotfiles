(require "cogs/keymaps.scm")
; (require "cogs/conjure.scm")
; (require "cogs/harpoon.scm")

; (require "helix/editor.scm")
; (require "nrepl.scm")

(require "mattwparas-helix-package/splash.scm")

(when (equal? (command-line) '("hx"))
  (show-splash))

(require "steel-pty/term.scm")

(provide open-term
         new-term
         kill-active-terminal
         switch-term
         term-resize
         (contract/out set-default-terminal-cols! (->/c int? void?))
         (contract/out set-default-terminal-rows! (->/c int? void?))
         (contract/out set-default-shell! (->/c string? void?))
         xplr
         open-debug-window
         close-debug-window
         hide-terminal)

; (keymap (global)
;         (normal ("SPC" (c (l ":conjure-open-log")
;                          (s ":conjure-send-code"))))))

; (keymap (global)
;         (normal (space (m (a ":harpoon-add")
;                           (r ":harpoon-remove")
;                           (t ":harpoon-toggle")
;                           (c ":harpoon-clear")
;                           (l ":harpoon-list")
;                           (m ":harpoon-open-menu")
;                           (q ":harpoon-quick-jump")
;                           ("1" ":harpoon-jump-to-1")
;                           ("2" ":harpoon-jump-to-2")
;                           ("3" ":harpoon-jump-to-3")
;                           ("4" ":harpoon-jump-to-4")
;                           ("5" ":harpoon-jump-to-5")))))

(require (prefix-in helix. "helix/commands.scm"))
(require "nrepl.scm")

(keymap (global)
        (normal (space (n (C ":nrepl-connect")
                          (D ":nrepl-disconnect")
                          (J ":nrepl-jack-in")
                          (L ":nrepl-load-file")
                          (b ":nrepl-eval-buffer")
                          (l ":nrepl-lookup-picker")
                          (m ":nrepl-eval-multiple-selections")
                          (p ":nrepl-eval-prompt")
                          (s ":nrepl-eval-selection")))
                (A-ret ":nrepl-eval-selection"))
        (select (space (n (C ":nrepl-connect")
                          (D ":nrepl-disconnect")
                          (J ":nrepl-jack-in")
                          (L ":nrepl-load-file")
                          (b ":nrepl-eval-buffer")
                          (l ":nrepl-lookup-picker")
                          (m ":nrepl-eval-multiple-selections")
                          (p ":nrepl-eval-prompt")
                          (s ":nrepl-eval-selection")))
                (A-ret ":nrepl-eval-selection")))
