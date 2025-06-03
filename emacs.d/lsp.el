(use-package flymake
  :hook
  (prog-mode . flymake-mode))

(use-package lsp-mode
  :custom
  (lsp-session-file (expand-file-name ".lsp-session-v1" emacs-cache-dir))
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-eldoc-render-all t)
  :general
  (alecs/leader
    :keymaps 'lsp-mode-map
    "ca" #'lsp-execute-code-action
    "cr" #'lsp-rename
    "cf" #'lsp-format-buffer
    "cd" #'lsp-find-definition
    "cR" #'lsp-find-references))

(setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

(use-package eldoc-box
  :custom
  (eldoc-box-max-pixel-width 500)
  (eldoc-box-max-lines 20)
  (eldoc-box-clear-with-C-g t)
  (eldoc-box-position-function #'eldoc-box--position-at-point)
  ;; Eldoc specific settings
  :general
  (:states 'normal
           :keymaps 'override
           "K" #'eldoc-box-help-at-point))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main")
  :custom
  (copilot-install-dir (expand-file-name "copilot" emacs-cache-dir))
  (copilot-indent-offset-warning-disable t)
  (copilot-max-char-warning-disable t)
  (copilot-version nil)
  :config
  (unless (file-exists-p (copilot-server-executable))
    (copilot-install-server))
  :general
  (:keymaps 'copilot-completion-map
            "<tab>"     #'copilot-accept-completion
            "<backtab>" #'copilot-accept-completion-by-line)
  :hook
  (prog-mode . copilot-mode)
  (magit-log-edit-mode . copilot-mode))

(use-package treesit
  :ensure nil ;; Built-in package
  :config
  (setq treesit-grammar-dir
        (expand-file-name "tree-sitter/" emacs-cache-dir))
  (make-directory treesit-grammar-dir t)
  (setq treesit-extra-load-path (list treesit-grammar-dir))
  (setq treesit-language-source-alist
        '((haskell  "https://github.com/tree-sitter/tree-sitter-haskell")
          (html     "https://github.com/tree-sitter/tree-sitter-html")
          (elisp    "https://github.com/Wilfred/tree-sitter-elisp")
          (markdown "https://github.com/ikatyang/tree-sitter-markdown")
          (json     "https://github.com/tree-sitter/tree-sitter-json")))
  (dolist (lang (mapcar #'car treesit-language-source-alist))
    (unless (treesit-language-available-p lang)
      (treesit-install-language-grammar lang treesit-grammar-dir))
    (let ((plain-mode (intern (format "%s-mode" lang)))
          (ts-mode    (intern (format "%s-ts-mode" lang))))
      (add-to-list 'major-mode-remap-alist (cons plain-mode ts-mode)))))

(dolist (file '("haskell"
                "latex"
                "agda"))
  (alecs/load-config-file (concat "lang/" file)))
