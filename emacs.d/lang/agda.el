;; -*- lexical-binding: t -*-

;; if the executable "agda-mode" is found in the system, set up set
;; the agda input method
(defvar has-agda (executable-find "agda-mode"))
(if has-agda
    (load-file (string-trim (shell-command-to-string "agda-mode locate"))))

(defun alecs/enable-agda-input-method ()
  "Enable Agda input method in the current buffer."
  (interactive)
  (add-hook 'evil-insert-state-entry-hook
            (lambda () (set-input-method "Agda")) nil t)
  (add-hook 'evil-insert-state-exit-hook
            (lambda () (set-input-method nil)) nil t))

(use-package agda-input
  :if has-agda
  :ensure nil ; Installed with Agda)
  :commands alecs/enable-agda-input-method)

(use-package agda2-mode
  :if has-agda
  :ensure nil ; Installed with Agda
  :commands agda2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.agda\\'" . agda2-mode)))
