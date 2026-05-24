;; -*- lexical-binding: t -*-

;; if the executable "agda-mode" is found in the system, set up set
;; the agda input method
(defvar alecs/agda-exec (executable-find "agda-mode"))
(when alecs/agda-exec
  (load-file (string-trim (shell-command-to-string
                           (concat alecs/agda-exec " locate"))))
  (defun alecs/agda-input-on ()
    (set-input-method "Agda"))

  (defun alecs/agda-input-off ()
    (set-input-method nil))

  (defun alecs/enable-agda-input-method ()
    (require 'agda-input)
    (add-hook 'evil-insert-state-entry-hook #'alecs/agda-input-on nil t)
    (add-hook 'evil-insert-state-exit-hook  #'alecs/agda-input-off nil t))

  (defun alecs/disable-agda-input-method ()
    (remove-hook 'evil-insert-state-entry-hook #'alecs/agda-input-on t)
    (remove-hook 'evil-insert-state-exit-hook  #'alecs/agda-input-off t))

  (defun alecs/agda-input ()
    (interactive)
    (if (member #'alecs/agda-input-on evil-insert-state-entry-hook)
        (progn (alecs/disable-agda-input-method)
               (message "Agda input method disabled"))
      (progn (alecs/enable-agda-input-method)
             (message "Agda input method enabled")))))

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
