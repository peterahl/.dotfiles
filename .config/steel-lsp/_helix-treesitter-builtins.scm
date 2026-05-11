(define #%helix-treesitter-module (#%module "helix/core/treesitter"))

(define (register-values module values)
  (map (lambda (ident) (#%module-add module (symbol->string ident) void)) values))
(register-values #%helix-treesitter-module '(tsnode-children
tsnode->tstree
TSNode?
tstree->root
TSQuery?
tsnode-descendant-byte-range
tssyntax->tree
tsnode-extra?
tsnode-within-byte-range?
tsnode-named-children
document->tree-byte-range
tsnode-named?
rope->tssyntax
tssyntax->layers-byte-range
string->tsquery
tsquery-loader
tsnode-missing?
tsnode-start-byte
query-tssyntax
query-tssyntax-byte-range
TSQueryLoader?
tsnode-kind
document->layers-byte-range
tsnode-end-byte
TSSyntax?
document->tree
query-document-byte-range
tsnode-parent
tsnode-named-descendant-byte-range
tsmatch-capture
TSTree?
query-document
tstree->language
tsnode-print-tree
tsmatch-captures
tsnode-visible?
TSMatch?
tssyntax->tree-byte-range
))