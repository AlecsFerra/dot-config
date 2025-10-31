;; -*- lexical-binding: t -*-
(use-package evil
  :custom
  (evil-shift-width tab-width)
  (evil-want-keybinding nil)
  :init
  (evil-mode t))

(defun alecs/toggle-term ()
  "Inspired by https://gist.github.com/msoeken/4b2e3ee07b7252f8cb99"
  (interactive)
  (if (string= (buffer-name) "*terminal*")
      (switch-to-buffer (other-buffer (current-buffer)))
    (if (get-buffer "*terminal*")
        (switch-to-buffer "*terminal*")
      (term (getenv "SHELL")))))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-key-blacklist '("SPC"))
  :config
  :init
  (evil-collection-init)
  (add-to-list 'evil-collection-mode-list 'dired))

(use-package general
  :after evil
  :custom
  (evil-maybe-remove-spaces t)
  :preface
  (general-create-definer alecs/leader
    :states '(normal visual)
    :prefix "SPC"
    :global-prefix "C-SPC")
  :config
  (general-evil-setup t)
  (alecs/leader
    "bc" (lambda ()
           (interactive)
           (kill-buffer (current-buffer)))
    "t"  #'alecs/toggle-term)
  (general-define-key
   :states 'visual
   "C-/" #'comment-dwim)
  (general-define-key
   :states 'normal
   "C-/" #'comment-line)
  (general-define-key
   :states 'insert
   "C-/" #'ignore))

(use-package evil-numbers
  :after evil
  :general
  (:states '(normal visual)
           "C-a" #'evil-numbers/inc-at-pt
           "C-x" #'evil-numbers/dec-at-pt))

(use-package evil-surround
  :config
  (global-evil-surround-mode t))
