;; -*- lexical-binding: t -*-
(use-package haskell-mode
  :hook
  (haskell-mode . interactive-haskell-mode)
  (haskell-mode . haskell-indentation-mode))

(use-package haskell-ts-mode
  :mode "\\.hs\\'"
  :hook
  (haskell-ts-mode . interactive-haskell-mode)
  (haskell-mode . haskell-indentation-mode))

(use-package consult-hoogle
  :general
  (alecs/leader
    :keymaps 'haskell-ts-mode-map
    "hh" #'consult-hoogle))
