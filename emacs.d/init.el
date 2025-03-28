;; Do not override currect directory when operning files
(defun alecs/default-directory (orig-fun &rest args)
  (let ((orig-dir default-directory))
    (apply orig-fun args)
    (setq default-directory orig-dir)))
(advice-add 'find-file :around #'alecs/default-directory)

;; Run gc when out of focus
(if (boundp 'after-focus-change-function)
    (add-function :after after-focus-change-function
                  (lambda () (unless (frame-focus-state)
                          (garbage-collect))))
  (add-hook 'after-focus-change-function
            'garbage-collect))

(set-language-environment "UTF-8") ; Force UTF-8

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(package-initialize)

(use-package exec-path-from-shell
  :demand t
  :config
  (exec-path-from-shell-initialize))

(defun alecs/load-config-file (file)
  (load (expand-file-name file "~/.emacs.d/")))

(alecs/load-config-file "basic")
(alecs/load-config-file "evil")
(alecs/load-config-file "looks")
(alecs/load-config-file "completion")
(alecs/load-config-file "lsp")
(alecs/load-config-file "git")
