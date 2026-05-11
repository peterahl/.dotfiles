(define #%helix-editor-module (#%module "helix/core/editor"))

(define (register-values module values)
  (map (lambda (ident) (#%module-add module (symbol->string ident) void)) values))
(register-values #%helix-editor-module '(editor-switch!
set-buffer-uri!
doc-closed-path
set-register!
Action/Replace
editor-document->language
editor-focus
editor-document-reload
set-editor-count!
doc-closed-id
themes->list
selected-register!
editor-doc-in-view?
Action/VerticalSplit
editor-all-documents
editor-document-dirty?
set-editor-clip-right!
string->editor-mode
editor-set-focus!
set-editor-clip-bottom!
current-cursor
editor-mode
cx->themes
cx->cursor
set-editor-clip-left!
editor-switch-action!
Action/Load
Action/HorizontalSplit
editor-doc-exists?
register-hook
editor->text
set-editor-clip-top!
set-scratch-buffer-name!
editor-focused-buffer-area
editor-set-mode!
register->value
doc-closed-language
editor-document-last-saved
editor-document->path
editor-count
doc-closed-text
editor->doc-id
))