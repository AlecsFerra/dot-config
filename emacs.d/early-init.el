;; -*- lexical-binding: t -*-
;; (setenv "LIBRARY_PATH"
;;         "/usr/local/Cellar/gcc/16.1.0/lib/gcc/current/gcc/x86_64-apple-darwin25/16:/usr/local/lib/gcc/current:/usr/local/opt/libgccjit/lib/gcc/current:/usr/local/lib")

;; (setenv "COMPILER_PATH"
;;         "/usr/local/Cellar/gcc/16.1.0/libexec/gcc/x86_64-apple-darwin25/16")

;; (setenv "GCC_EXEC_PREFIX"
;;         "/usr/local/Cellar/gcc/16.1.0/lib/gcc/current/")

;; Remove the gui madness
(menu-bar-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(setq custom-safe-themes t)

(add-to-list 'default-frame-alist
             '(ns-appearance . light))
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(setq ns-use-proxy-icon nil)
(setq frame-title-format "%b - emacs")

(defvar emacs-cache-dir
  (expand-file-name "~/.cache/emacs/"))
(make-directory emacs-cache-dir t)

(setq custom-file
      (expand-file-name "custom.el" emacs-cache-dir))
(setq recentf-save-file
      (expand-file-name "recentf" emacs-cache-dir))
(setq savehist-file
      (expand-file-name "history" emacs-cache-dir))
(setq auto-save-list-file-prefix
      (expand-file-name "auto-save-list" emacs-cache-dir))
(setq package-user-dir
      (expand-file-name "elpa/gnupg" emacs-cache-dir))
(make-directory package-user-dir t)
(setq project-list-file
      (expand-file-name "projects" emacs-cache-dir))
(setq eln-cache-dir
      (expand-file-name "eln-cache/" emacs-cache-dir))
(make-directory eln-cache-dir t)
(setq native-comp-eln-load-path (list eln-cache-dir))
(setq backup-dir
      (expand-file-name "backups/" emacs-cache-dir))
(make-directory backup-dir t)
(setq backup-directory-alist
      `(("." . ,backup-dir)))
(setq auto-save-dir
      (expand-file-name "auto-saves/" emacs-cache-dir))
(make-directory auto-save-dir t)
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-dir t)))
(setq multisession-directory
      (expand-file-name "multisession/" emacs-cache-dir))
(make-directory multisession-directory t)
(setq bookmark-default-file
      (expand-file-name "bookmarks" emacs-cache-dir))
(setq pcache-directory
      (expand-file-name "var/pcache" emacs-cache-dir))
(setq tramp-persistency-file-name
      (expand-file-name "tramp" emacs-cache-dir))

(savehist-mode t)
(recentf-mode t)

;; Disable startup messages
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

;; Vertico suggestions
(setq-default enable-recursive-minibuffers t)
(setq-default minibuffer-prompt-properties
              '(read-only t cursor-intangible t face minibuffer-prompt))

;; ;; Run gc when out of focus
;; (if (boundp 'after-focus-change-function)
;;     (add-function :after after-focus-change-function
;;                   (lambda () (unless (frame-focus-state)
;;                           (garbage-collect))))
;;   (add-hook 'after-focus-change-function
;;             'garbage-collect))
(setq gc-cons-threshold (* 512 1024 1024))
(setq garbage-collection-messages t)

(setq ring-bell-function 'ignore)

;; ESC is ESC
(define-key minibuffer-local-map [escape]
            'abort-minibuffers)
(define-key minibuffer-local-ns-map [escape]
            'abort-minibuffers)
(define-key minibuffer-local-completion-map [escape]
            'abort-minibuffers)
(define-key minibuffer-local-must-match-map [escape]
            'abort-minibuffers)
(define-key minibuffer-local-isearch-map [escape]
            'abort-minibuffers)
