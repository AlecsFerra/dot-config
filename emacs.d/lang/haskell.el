(use-package haskell-ts-mode
  :ensure t
  :custom
  (haskell-ts-font-lock-level 4))

(use-package consult-hoogle
  :bind
  (:map evil-normal-state-map
        ("<leader>hh" . consult-hoogle)))

(use-package lsp-haskell
  :after haskell-ts-mode)
  ;; :hook
  ;; (haskell-ts-mode . lsp-deferred))
