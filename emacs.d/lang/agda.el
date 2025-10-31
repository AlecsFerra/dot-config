;; -*- lexical-binding: t -*-
(defun alecs/agda2-mode-start ()
  "Load the agda-mode package, enable agda2-mode, and open the file."
  (interactive)
  (load-file (string-trim (shell-command-to-string "agda-mode locate")))
  (agda2-mode))

(use-package agda2-mode
  :if (executable-find "agda-mode")
  :ensure nil ; Installed with Agda
  :commands agda2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.agda\\'" . alecs/agda2-mode-start)))
