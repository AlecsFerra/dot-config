(use-package haskell-mode
  :custom
  (haskell-ts-use-indent nil)
  :hook
  (haskell-mode . interactive-haskell-mode))

(use-package haskell-ts-mode
  :mode "\\.hs\\'"
  :hook
  (haskell-ts-mode . interactive-haskell-mode))

(use-package lsp-haskell
  :disabled t
  :after haskell-ts-mode
  :hook
  (haskell-ts-mode . lsp-deferred))

(use-package consult-hoogle
  :general
  (alecs/leader
    :keymaps 'haskell-ts-mode-map
    "hh" #'consult-hoogle))
