(require "mattwparas-helix-package/splash.scm")
(when (equal? (command-line) '("hx"))
  (show-splash))

(require (prefix-in helix. "helix/commands.scm"))

(require "nrepl/nrepl.scm")

(require "helix/keymaps.scm")

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


