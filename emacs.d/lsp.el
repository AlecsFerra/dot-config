(use-package flymake
  :hook
  (prog-mode . flymake-mode)
  :custom
  (flymake-fringe-indicator-position nil)
  :config
  (defun alecs/eldoc-at-front (orig &rest args)
    (apply orig args)
    (when flymake-mode
      (remove-hook 'eldoc-documentation-functions 'flymake-eldoc-function t)
      (add-hook 'eldoc-documentation-functions 'flymake-eldoc-function nil t)))
  (advice-add 'flymake-mode :around #'alecs/eldoc-at-front))


(setq xref-prompt-for-identifier nil)

(general-define-key
 :keymaps 'emacs-lisp-mode-map
 "C-c C-c" #'eval-buffer)

(general-define-key
 :keymaps 'override
 "C-c C-e" (lambda ()
             (interactive)
             (let* ((beg (if (use-region-p)
                             (region-beginning)
                           (save-excursion (mark-defun) (region-beginning))))
                    (end (if (use-region-p)
                             (region-end)
                           (save-excursion (mark-defun) (region-end))))
                    (sexp (read (buffer-substring beg end)))
                    (result (eval sexp)))
               (deactivate-mark)
               (message "%s" (string-trim-right (pp-to-string result))))))

(alecs/leader
  "cf" #'indent-region)

(general-define-key
 :states 'normal
 "gr" #'xref-find-references)

(use-package lsp-mode
  :custom
  (lsp-session-file (expand-file-name ".lsp-session-v1" emacs-cache-dir))
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-eldoc-render-all t)
  (lsp-diagnostics-provider :flymake)
  :general
  (alecs/leader
    :keymaps 'lsp-mode-map
    "ca" #'lsp-execute-code-action
    "cr" #'lsp-rename))

(use-package eldoc
  :custom
  (eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  (eldoc-echo-area-use-multiline-p t)
  :config
  (setq eldoc-display-functions
        (delq #'eldoc-display-in-echo-area eldoc-display-functions)))

(use-package eldoc-box
  :custom
  (eldoc-box-max-pixel-width 500)
  (eldoc-box-max-pixel-height 200)
  (eldoc-box-clear-with-C-g t)
  (eldoc-box-position-function #'eldoc-box--position-at-point)
  :hook
  (eldoc-box-buffer-setup . (lambda (&rest ignore)
                              (display-line-numbers-mode -1)))
  :general
  (:states '(normal visual)
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
            "<tab>"     #'copilot-accept-completion-by-line))
  ;; :hook
  ;; (prog-mode . copilot-mode)
  ;; (magit-log-edit-mode . copilot-mode))

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
                "agda"
                "proofgeneral"
                "lean"))
  (alecs/load-config-file (concat "lang/" file)))
