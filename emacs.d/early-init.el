;; Remove the gui madness
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(add-to-list 'default-frame-alist
       '(font . "FiraCode Nerd Font Mono-14")) ; Font family and size

(setq gc-cons-threshold (* 100 1024 1024))

(defvar emacs-cache-dir
  (expand-file-name "~/.cache/emacs/"))
(unless (file-exists-p emacs-cache-dir)
  (make-directory emacs-cache-dir t))

(setq custom-file
      (expand-file-name "custom.el" emacs-cache-dir))
(setq recentf-save-file
      (expand-file-name "recentf" emacs-cache-dir))
(setq savehist-file
      (expand-file-name "history" emacs-cache-dir))
(setq auto-save-list-file-prefix
      (expand-file-name "auto-save-list" emacs-cache-dir))
(setq package-user-dir
      (expand-file-name "elpa/" emacs-cache-dir))
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" emacs-cache-dir))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-saves/" emacs-cache-dir) t)))

(savehist-mode t)
(recentf-mode t)

;; Disable startup messages
(setq inhibit-startup-message t)
(setq message-log-max nil)

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
