(use-package flycheck)

(use-package flyspell
  :commands flyspell-mode
  :bind (:map evil-normal-state-map
              ("<leader>cg" . flyspell-auto-correct-word)))

(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-enable-symbol-highlighting nil)
  :bind (:map evil-normal-state-map
              ("<leader>ca" . lsp-execute-code-action)))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-eldoc-enable-hover nil
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-delay 0
        lsp-ui-doc-show-with-mouse nil)
  :config
  (lsp-ui-doc-frame-mode)

  :bind (:map evil-normal-state-map
              ("K" . lsp-ui-doc-glance)))

(use-package company
  :demand t
  :config
  (global-company-mode)
  :bind (:map company-active-map
              ("C-j" . company-select-next)
              ("C-k" . company-select-previous)))

;; Haskell
(use-package haskell-mode
  :hook (haskell-mode . interactive-haskell-mode))

(use-package lsp-haskell
  :after haskell-mode
  :hook ((haskell-mode . lsp-deferred)
         (haskell-literate-mode . lsp-deferred)))

;; LaTeX
(use-package auctex)

(use-package lsp-latex
  :hook ((tex-mode . lsp-deferred)
         (latex-mode . lsp-deferred)
         (bibtex-mode . lsp-deferred)))
