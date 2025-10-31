;; -*- lexical-binding: t -*-
;; Guess indentation for the current buffer
(use-package dtrt-indent
  :hook
  (prog-mode . dtrt-indent-mode))

(use-package flyspell
  :custom
  (flyspell-issue-message-flag nil)
  (ispell-dictionary "en_US")
  :hook
  (tex-mode   . flyspell-mode)
  (org-mode   . flyspell-mode)
  (LaTeX-mode . flyspell-mode))

(use-package flyspell-correct
  :after flyspell
  :general
  (alecs/leader
    :keymaps 'flyspell-mode-map
    "cg" #'flyspell-correct-wrapper))

(use-package rainbow-mode
  :hook
  (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package undo-tree
  :after evil
  :custom
  (undo-tree-history-directory-alist
   `(("." . ,(expand-file-name "undo/" emacs-cache-dir))))
  (undo-tree-visualizer-relative-timestamps t)
  (undo-tree-visualizer-diff t)
  :init
  ;; Patch undo-tree override logic
  (advice-add 'undo-tree-overridden-undo-bindings-p
              :override (lambda () nil))
  (advice-add 'undo-tree-load-history :around
              (lambda (orig-fun &rest args)
                (let ((inhibit-message t))
                  (apply orig-fun args))))
  (global-undo-tree-mode t)
  (evil-set-undo-system 'undo-tree)
  :general
  (alecs/leader
    "u" #'undo-tree-visualize)
  (:keymaps 'undo-tree-visualizer-mode-map
            "<escape>" #'quit-window))

(use-package embark
  :general
  (alecs/leader
    "aa" #'embark-dwim
    "ae" #'embark-act))

(defun alecs/embark-kill (&optional arg)
  "Kill buffer or remove file from recentf."
  (interactive "P")
  (require 'embark)
  (let ((embark-default-action-overrides '((buffer . kill-buffer)
                                           (file . embark-recentf-remove)))
        (embark-pre-action-hook (assq-delete-all 'kill-buffer
                                                 embark-pre-action-hooks))
        embark-quit-after-action)
    (embark-dwim arg)))
