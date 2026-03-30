;; -*- lexical-binding: t -*-
(use-package evil
  :custom
  (evil-shift-width tab-width)
  (evil-want-keybinding nil)
  :init
  (evil-mode t))

(defun alecs/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (cl-remove-if-not 'buffer-file-name (buffer-list)))))

(use-package anzu
  :after evil
  :init
  (global-anzu-mode t))

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
    "bc" (λ () (interactive) (kill-buffer (current-buffer)))
    "bC" #'alecs/kill-other-buffers)
  (general-define-key
   :states 'visual
   "C-/" #'comment-dwim)
  (general-define-key
   :states 'normal
   "C-/" #'comment-line)
  (general-define-key
   :states 'insert
   "C-/" #'ignore))

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-key-blacklist '("SPC"))
  (evil-collection-setup-minibuffer t)
  :general
  (general-evil-define-key 'insert evil-ex-completion-map
    "C-j" #'next-history-element
    "C-k" #'previous-history-element)
  :init
  (evil-collection-init)
  (add-to-list 'evil-collection-mode-list 'dired))

(use-package evil-numbers
  :after evil
  :general
  (:states '(normal visual)
           "C-a" #'evil-numbers/inc-at-pt
           "C-x" #'evil-numbers/dec-at-pt))

(use-package evil-surround
  :after evil
  :init
  (global-evil-surround-mode t))

(use-package evil-matchit
  :after evil
  :init
  (global-evil-matchit-mode t))
