;; -*- lexical-binding: t -*-
(use-package lean4-mode
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
            :rev :last-release)
  :config
  (add-to-list 'display-buffer-alist
               `(,lean4-info-buffer-name ,@alecs/right-side-window))
  (general-define-key
   :keymaps 'lean4-mode-map
   :states 'normal
   "C-c C-i" #'lean4-toggle-info)
  :mode "\\.lean4?\\'")

(defun alecs/suppress-lsp-inlayhint-warnings (orig-fun type message &rest args)
  "Suppress LSP inlayHint/refresh warnings."
  (unless (and (eq type 'lsp-mode)
               (string-match-p "workspace/inlayHint/refresh" message))
    (apply orig-fun type message args)))

(advice-add 'display-warning
            :around #'alecs/suppress-lsp-inlayhint-warnings)
