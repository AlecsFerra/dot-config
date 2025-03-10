(use-package haskell-mode
  :hook
  (haskell-mode . interactive-haskell-mode))

(use-package lsp-haskell
  :after haskell-mode
  :hook
  (haskell-mode . lsp-deferred)
  (haskell-literate-mode . lsp-deferred))
