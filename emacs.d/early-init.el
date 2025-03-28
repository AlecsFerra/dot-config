;; Remove the gui madness
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

(setq frame-title-format "%b - emacs")

(setq gc-cons-threshold (* 100 1024 1024))

(defun alecs/make-dir (dir)
  "Creates directory if non already present"
  (unless (file-exists-p dir)
    (make-directory dir t)))

(defvar emacs-cache-dir
  (expand-file-name "~/.cache/emacs/"))
(alecs/make-dir emacs-cache-dir)

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

(setq eln-cache-dir
      (expand-file-name "eln-cache/" emacs-cache-dir))
(alecs/make-dir eln-cache-dir)
(setq native-comp-eln-load-path (list eln-cache-dir))

(setq backup-dir
      (expand-file-name "backups/" emacs-cache-dir))
(alecs/make-dir backup-dir)
(setq backup-directory-alist
      `(("." . ,backup-dir)))

(setq auto-save-dir
      (expand-file-name "auto-saves/" emacs-cache-dir))
(alecs/make-dir auto-save-dir)
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-dir t)))

(savehist-mode t)
(recentf-mode t)

;; Disable startup messages
(setq inhibit-startup-message t)
(setq message-log-max nil)

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
