;; -*- lexical-binding: t -*-

;; if the executable "agda-mode" is found in the system, set up set
;; the agda input method
(defvar alecs/agda-exec (executable-find "agda-mode"))
(when alecs/agda-exec
  (load-file (string-trim (shell-command-to-string
                           (concat alecs/agda-exec " locate"))))
  (defun alecs/enable-agda-input-method ()
    "Enable Agda input method in the current buffer."
    (interactive)
    (require 'agda-input)
    (add-hook 'evil-insert-state-entry-hook
              (λ () (set-input-method "Agda")) nil t)
    (add-hook 'evil-insert-state-exit-hook
              (λ () (set-input-method nil)) nil t)))
(use-package agda-input
  :if alecs/agda-exec
  :ensure nil ; Installed with Agda)
  :commands alecs/enable-agda-input-method)

(use-package agda2-mode
  :if alecs/agda-exec
  :ensure nil ; Installed with Agda
  :commands agda2-mode
  :mode
  ("\\.agda\\'" . agda2-mode))
