(use-package flycheck)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-enable-symbol-highlighting nil
        lsp-modeline-diagnostics-enable nil)
  :config
  ;; (lsp-log-io nil)
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
  (setq ess-r--no-company-meta t)
  (global-company-mode)
  :bind (:map company-active-map
              ("C-j" . company-select-next)
              ("C-k" . company-select-previous)))

;; Spell checking
(use-package flyspell
  :custom
  (flyspell-issue-message-flag nil)
  (ispell-program-name "enchant-2")
  (ispell-dictionary "en_US")
  :hook
  (tex-mode   . flyspell-mode)
  (LaTeX-mode . flyspell-mode))
(use-package flyspell-correct
  :after flyspell
  :bind (:map evil-normal-state-map
              ("<leader>cg" . flyspell-correct-wrapper)))

;; Haskell
(use-package haskell-mode
  :hook
  (haskell-mode . interactive-haskell-mode))
(use-package lsp-haskell
  :after haskell-mode
  :hook
  (haskell-mode . lsp-deferred)
  (haskell-literate-mode . lsp-deferred))

;; LaTeX
(use-package auctex)
(use-package lsp-latex
  :disabled
  :hook
  (tex-mode . lsp-deferred)
  (LaTeX-mode . lsp-deferred)
  (bibtex-mode . lsp-deferred))

(use-package pdf-tools
  :after evil-collection
  :magic ("%PDF" . pdf-view-mode)
  :init
  (add-to-list 'evil-collection-mode-list '(pdf pdf-view))
  (setq-default pdf-view-display-size 'fit-page)
  :config
  (pdf-tools-install))
