;; Guess indentation for the current buffer
(use-package dtrt-indent
  :hook
  (prog-mode . dtrt-indent-mode))

(use-package rainbow-mode
  :hook
  (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package treesit
  :ensure nil ;; Built-in package
  :demand t
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
