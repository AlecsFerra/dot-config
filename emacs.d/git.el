;; -*- lexical-binding: t -*-
(defun alecs/magit-display-diff-other-window (buffer)
  (display-buffer
   buffer (if (with-current-buffer buffer (derived-mode-p 'magit-diff-mode))
              '(display-buffer-pop-up-window)
            '(display-buffer-same-window))))

(use-package magit
  :after (evil evil-collection)
  :init
  (add-to-list 'evil-collection-mode-list 'magit)
  :config
  ;; Display margin indicators for commit lists
  (setf (car magit-status-margin) t)
  (setf (cadddr magit-status-margin) t)
  :custom
  (magit-save-repository-buffers 'dontask)
  (magit-display-buffer-function #'alecs/magit-display-diff-other-window)
  :general
  (alecs/leader
    "gg" #'magit-status)
  (:keymaps 'magit-status-mode-map
            "<escape>" #'magit-mode-bury-buffer))

(use-package forge
  :custom
  (forge-database-file (expand-file-name "forge-database.sqlite"
                                         emacs-cache-dir))
  :init
  (setq forge-add-default-bindings nil)
  (add-to-list 'evil-collection-mode-list 'forge)
  (with-eval-after-load 'magit
    (require 'forge))
  :config
  :general
  (alecs/leader
    "gb" #'forge-browse
    "gn" (lambda ()
           (interactive)
           (forge-list-notifications)
           (forge-pull-notifications))))

(use-package magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode)
  :custom
  (magit-delta-default-light-theme "Monokai Extended Light")
  :config
  (add-to-list 'magit-delta-delta-args "--light"))

(use-package transient
  :custom
  (transient-history-file (expand-file-name "transient/history.el"
                                            emacs-cache-dir))
  (transient-values-file  (expand-file-name "transient/values.el"
                                            emacs-cache-dir))
  (transient-levels-file  (expand-file-name "transient/levels.el"
                                            emacs-cache-dir))
  :general
  (:keymaps 'transient-base-map
            "<escape>" #'transient-quit-one))

(use-package git-gutter
  :custom
  (git-gutter:modified-sign "▋")
  (git-gutter:added-sign    "▋")
  (git-gutter:deleted-sign  "▋")
  :config
  (set-face-foreground 'git-gutter:modified "dodger blue")
  (add-to-list 'display-buffer-alist
               '("\\*git-gutter:diff\\*"
                 (display-buffer-in-side-window)
                 (window-height . 0.4)
                 (side . bottom)
                 (slot . 1)
                 (window-parameters
                  . ((no-delete-other-windows . t)))))
  :general
  (alecs/leader
    "gd" #'git-gutter:popup-hunk
    "gr" #'git-gutter:revert-hunk)
  :init
  (global-git-gutter-mode t))
