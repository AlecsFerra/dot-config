;; -*- lexical-binding: t -*-
(set-language-environment "UTF-8") ; Force UTF-8

(setq pop-up-frames nil)
(setq ns-pop-up-frames nil)

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

;; Auto-revert
(global-auto-revert-mode t)

;; Scrolling
(pixel-scroll-precision-mode)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; I press this too often
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-h C-w"))
(global-unset-key (kbd "C-h C-a"))

(defalias 'λ 'lambda)

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
  :custom
  (exec-path-from-shell-arguments '("-l"))
  :init
  (exec-path-from-shell-initialize))

(defun alecs/load-config-file (file)
  "Load a configuration `FILE` from the user's Emacs directory."
  (load (expand-file-name file user-emacs-directory)))

(dolist (file '("evil" "windows" "looks" "completion" "git" "lsp"
                "org" "misc" "terminal"))
  (alecs/load-config-file file))
