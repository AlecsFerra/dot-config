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
  (setf (car    magit-status-margin) t)
  (setf (cadddr magit-status-margin) t)
  :custom
  (magit-save-repository-buffers 'dontask)
  (magit-display-buffer-function #'alecs/magit-display-diff-other-window)
  (magit-commit-show-diff nil)
  :general
  (alecs/leader
    "gg" #'magit-status)
  (:keymaps 'magit-status-mode-map
            "<escape>" #'magit-mode-bury-buffer))

(use-package forge
  :custom
  (forge-database-file (expand-file-name "forge-database.sqlite"
                                         emacs-cache-dir))
  (forge-add-default-bindings nil)
  :init
  (add-to-list 'evil-collection-mode-list 'forge)
  :general
  (alecs/leader
    "gb" #'forge-browse
    "gn" #'forge-list-notifications))

(use-package magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode)
  :custom
  (magit-delta-default-light-theme "Monokai Extended Light")
  :config
  (add-to-list 'magit-delta-delta-args "--light"))

(use-package transient
  :custom
  (transient-history-file
   (expand-file-name "transient/history.el" emacs-cache-dir))
  (transient-values-file
   (expand-file-name "transient/values.el" emacs-cache-dir))
  (transient-levels-file
   (expand-file-name "transient/levels.el" emacs-cache-dir))
  :general
  (:keymaps 'transient-base-map
            "<escape>" #'transient-quit-one))

(use-package git-gutter
  :custom
  (git-gutter:modified-sign "▋")
  (git-gutter:added-sign    "▋")
  (git-gutter:deleted-sign  "▋")
  :config
  (defun alecs/git-gutter-toggle-popup ()
    "Toggle git-gutter popup hunk window."
    (let ((buf git-gutter:popup-buffer))
      (if (get-buffer-window buf)
          (delete-window (get-buffer-window buf))
        (git-gutter:popup-hunk))))
  (set-face-foreground 'git-gutter:modified "dodger blue")
  (add-to-list 'display-buffer-alist
               `(,git-gutter:popup-buffer ,@alecs/bottom-side-window))
  :general
  (alecs/leader
    "gd" (λ () (interactive) (alecs/git-gutter-toggle-popup))
    "gr" #'git-gutter:revert-hunk)
  :init
  (global-git-gutter-mode t))
