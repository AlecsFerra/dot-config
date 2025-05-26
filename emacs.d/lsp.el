(use-package flycheck)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :custom
  (lsp-enable-symbol-highlighting nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-session-file (expand-file-name ".lsp-session-v1" emacs-cache-dir))
  :general
  (alecs/leader
    :keymaps 'lsp-mode-map
    "c a" #'lsp-execute-code-action))

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
  :general
  (:keymaps 'lsp-ui-doc-frame-mode-map
            "q" nil)
  (:states 'normal
           :keymaps 'lsp-mode-map
           "K" #'lsp-ui-doc-glance)
  :hook
  (lsp-mode . lsp-ui-mode))

(use-package company
  :after evil
  :custom
  (ess-r--no-company-meta t)
  (company-tooltip-scrollbar-width 0)
  :general
  (:keymaps 'company-active-map
            "C-j" #'company-select-next
            "C-k" #'company-select-previous)
  (:states 'insert
           "<backtab>" #'company-complete)
  :hook
  (prog-mode . company-mode))

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
  (copilot-version nil)
  :config
  (unless (file-exists-p (copilot-server-executable))
    (copilot-install-server))
  :general
  (:keymaps 'copilot-completion-map
            "<tab>" #'copilot-accept-completion-by-line)
  :hook
  (prog-mode . copilot-mode))

(use-package treesit
  :ensure nil ;; Built-in package
  :config
  (setq treesit-grammar-dir
        (expand-file-name "tree-sitter/" emacs-cache-dir))
  (make-directory treesit-grammar-dir t)
  (setq treesit-extra-load-path (list treesit-grammar-dir))

  (setq treesit-language-source-alist
        '((haskell "https://github.com/tree-sitter/tree-sitter-haskell")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (json "https://github.com/tree-sitter/tree-sitter-json")))

  (dolist (lang (mapcar #'car treesit-language-source-alist))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang treesit-grammar-dir)))

  (add-to-list 'major-mode-remap-alist '(haskell-mode . haskell-ts-mode))
  (add-to-list 'major-mode-remap-alist '(html-mode    . html-ts-mode))
  (add-to-list 'major-mode-remap-alist '(json-mode    . json-ts-mode)))

(setq langs '("haskell" "latex" "agda"))
(dolist (file langs)
  (alecs/load-config-file (concat "lang/" file)))
