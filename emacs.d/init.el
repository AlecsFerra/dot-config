;; Do not override currect directory when operning files
(defun alecs/default-directory (orig-fun &rest args)
  (let ((orig-dir default-directory))
    (apply orig-fun args)
    (setq default-directory orig-dir)))
(advice-add 'find-file :around #'alecs/default-directory)

(set-language-environment "UTF-8") ; Force UTF-8

;; Line numbers
(setq-default display-line-numbers 'relative)
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

;; I press this to often
(global-unset-key (kbd "C-x C-c"))

(setq package-check-signature nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq use-package-always-defer t)

(package-initialize)

(use-package exec-path-from-shell
  :demand t
  :config
  (exec-path-from-shell-initialize))

(defun alecs/load-config-file (file)
  (load (expand-file-name file "~/.emacs.d/")))

(alecs/load-config-file "evil")
(alecs/load-config-file "looks")
(alecs/load-config-file "completion")
(alecs/load-config-file "lsp")
(alecs/load-config-file "git")
(alecs/load-config-file "misc")
