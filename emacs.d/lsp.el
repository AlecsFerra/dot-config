(use-package flycheck)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-enable-symbol-highlighting nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-session-file (expand-file-name ".lsp-session-v1" emacs-cache-dir))
  :bind
  (:map evil-normal-state-map
        ("<leader>ca" . lsp-execute-code-action)))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-eldoc-enable-hover nil)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-delay 0)
  (lsp-ui-doc-show-with-mouse nil)
  :config
  (lsp-ui-doc-frame-mode)
  :bind
  (:map lsp-ui-doc-frame-mode-map
        ("q" . nil))
  (:map evil-normal-state-map
        ("K" . lsp-ui-doc-glance)))

(use-package company
  :after evil
  :demand t
  :custom
  (ess-r--no-company-meta t)
  (company-tooltip-scrollbar-width 0)
  :config
  (global-company-mode)
  :bind
  (:map company-active-map
        ("C-j"   . company-select-next)
        ("C-k"   . company-select-previous))
  (:map evil-insert-state-map
        ("<backtab>" . company-complete)))

(use-package company-box
  :after company
  :custom
  (company-box-doc-enable t)
  (company-box-scrollbar nil)
  :hook
  (company-mode . company-box-mode))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main")
  :custom
  (copilot-install-dir (expand-file-name "copilot" emacs-cache-dir))
  (copilot-indent-offset-warning-disable t)
  :config
  (unless (file-exists-p (copilot-server-executable))
    (copilot-install-server))
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  :bind
  (:map copilot-completion-map
        ("<tab>" . copilot-accept-completion))
  :hook
  (prog-mode . copilot-mode))

(setq langs '("haskell" "latex" "agda"))
(dolist (file langs)
  (alecs/load-config-file (concat "lang/" file)))
