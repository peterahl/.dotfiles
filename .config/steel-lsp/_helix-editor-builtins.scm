(define #%helix-editor-module (#%module "helix/core/editor"))

(define (register-values module values)
  (map (lambda (ident) (#%module-add module (symbol->string ident) void)) values))
(register-values #%helix-editor-module '(editor-switch!
set-buffer-uri!
set-register!
Action/Replace
editor-document->language
editor-focus
editor-document-reload
string->editor-mode
themes->list
selected-register!
Action/VerticalSplit
editor-all-documents
editor-doc-in-view?
editor-document-dirty?
set-editor-clip-right!
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
set-editor-clip-top!
editor->text
set-scratch-buffer-name!
editor-focused-buffer-area
editor-set-mode!
register->value
editor-document-last-saved
editor-document->path
editor->doc-id
))