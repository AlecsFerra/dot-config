;; -*- lexical-binding: t -*-
(set-language-environment "UTF-8") ; Force UTF-8

(setq pop-up-frames nil)
(setq ns-pop-up-frames nil)
(setq display-buffer-base-action
      '((display-buffer-reuse-window
         display-buffer-same-window)
        (reusable-frames . t)))
(setq display-buffer-fallback-action
      '((display-buffer--maybe-same-window
         display-buffer-reuse-window
         display-buffer--maybe-pop-up-frame-or-window
         display-buffer-in-previous-window
         display-buffer-use-some-window
         display-buffer-at-bottom)))

;; Line numbers
(setq-default display-line-numbers t)
(setq-default display-line-numbers-width 3)
(set-fringe-mode '(0 . nil))

;; Tabs -> spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)

(electric-pair-mode t) ; Auto parens

;; Remove whitespaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Scrolling
(pixel-scroll-precision-mode)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; I press this too often
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-h C-w"))

(defalias 'λ 'lambda)

(defconst alecs/right-side-window
  '((display-buffer-in-side-window)
    (side . right)
    (window-width . 0.44)
    (slot . 1)
    (window-parameters . ((window-preserve-selected-window . t)))))

(defconst alecs/bottom-side-window
  '((display-buffer-in-side-window)
    (side . bottom)
    (window-width . 0.05)
    (slot . 1)
    (window-parameters . ((window-preserve-selected-window . t)))))

(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

(package-initialize)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(defun alecs/load-config-file (file)
  (load (expand-file-name file user-emacs-directory)))

(dolist (file '("evil" "looks" "completion" "git" "lsp" "org" "misc"))
  (alecs/load-config-file file))
