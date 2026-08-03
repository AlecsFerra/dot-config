;; -*- lexical-binding: t -*-
(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))

(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-resize 0)
  :init
  (vertico-mode t)
  :general
  (alecs/leader
    "sr" #'vertico-repeat)
  (general-evil-define-key 'insert vertico-map
    "C-j" #'vertico-next
    "C-k" #'vertico-previous)
  :hook
  (minibuffer-setup . vertico-repeat-save))

(use-package consult
  :after vertico
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  (consult-buffer-filter '("^ " "\*.*\*" "magit.*"))
  :general
  (alecs/leader
    "SPC" #'consult-buffer
    "se" #'consult-flymake))

(use-package embark-consult
  :after consult
  :general
  (:keymaps 'vertico-map
            "C-." #'embark-act
            "C-q" #'alecs/embark-kill)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package affe
  :after vertico
  :general
  (alecs/leader
    "sf" #'affe-find
    "sg" #'affe-grep))

(use-package corfu
    :ensure t
    :custom
    (corfu-auto t)
    (corfu-auto-prefix 3)
    (corfu-min-width 60)
    (corfu-max-width corfu-min-width)
    (corfu-count 14)
    (corfu-scroll-margin 4)
    (corfu-popupinfo-delay '(0.5 . 0.5))
    :init
    (global-corfu-mode t)
    (corfu-history-mode t)
    (corfu-popupinfo-mode t))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-abbrev t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t))

(use-package nerd-icons-corfu
  :after corfu
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
