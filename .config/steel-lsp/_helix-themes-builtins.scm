(define #%helix-themes-module (#%module "helix/core/themes"))

(define (register-values module values)
  (map (lambda (ident) (#%module-add module (symbol->string ident) void)) values))
(register-values #%helix-themes-module '(theme-set-style!
add-theme!
theme-style
current-theme
current-theme-name
hashmap->theme
get-theme
string->color
))