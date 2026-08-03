;; -*- lexical-binding: t -*-
(use-package flymake
  :hook
  (prog-mode . flymake-mode)
  :custom
  (flymake-fringe-indicator-position 'left-fringe)
  :config
  (defun alecs/eldoc-at-front (orig &rest args)
    (apply orig args)
    (when flymake-mode
      (remove-hook 'eldoc-documentation-functions 'flymake-eldoc-function t)
      (add-hook 'eldoc-documentation-functions 'flymake-eldoc-function nil t)))
  (advice-add 'flymake-mode :around #'alecs/eldoc-at-front))

(setq xref-prompt-for-identifier nil)

(alecs/leader
  "cf" #'indent-region)

(general-define-key
 :states 'normal
 "gr" #'xref-find-references
 "gd" #'evil-goto-definition)

(use-package lsp-mode
  :custom
  (lsp-session-file (expand-file-name ".lsp-session-v1" emacs-cache-dir))
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-eldoc-render-all t)
  (lsp-diagnostics-provider :flymake)
  (lsp-server-install-dir (expand-file-name "lsp-servers/" emacs-cache-dir))
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

(use-package eldoc-mouse
  :general
  (:states '(normal visual)
           :keymaps 'override
           "K" #'eldoc-mouse-pop-doc-at-cursor))

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest :branch "main")
  :custom
  (copilot-install-dir (expand-file-name "copilot" emacs-cache-dir))
  (copilot-indent-offset-warning-disable t)
  (copilot-max-char-warning-disable t)
  (copilot-version nil)
  :general
  (alecs/leader
    "ac" #'copilot-mode)
  :config
  (unless (file-exists-p (copilot-server-executable))
    (copilot-install-server))
  :general
  (:keymaps 'copilot-completion-map
            "<tab>" #'copilot-accept-completion-by-line))

(dolist (file '("haskell" "latex" "agda" "proofgeneral" "lean"
                "emacslisp" "smt"))
  (alecs/load-config-file (concat "lang/" file)))
