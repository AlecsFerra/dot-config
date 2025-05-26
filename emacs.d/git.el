(use-package magit
  :after (evil evil-collection)
  :init
  (add-to-list 'evil-collection-mode-list 'magit)
  :general
  (alecs/leader
    "gg" #'magit-status)
  (:keymaps 'magit-status-mode-map
            "<escape>" #'magit-mode-bury-buffer))

(use-package magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode)
  :config
  (add-to-list 'magit-delta-delta-args "--light"))

(use-package transient
  :custom
  (transient-history-file (expand-file-name "transient/history.el" emacs-cache-dir))
  (transient-values-file  (expand-file-name "transient/values.el" emacs-cache-dir))
  (transient-levels-file  (expand-file-name "transient/levels.el" emacs-cache-dir))
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
  :init
  (global-git-gutter-mode t))
