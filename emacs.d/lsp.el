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

(alecs/load-config-file "lang/haskell")
(alecs/load-config-file "lang/latex")
