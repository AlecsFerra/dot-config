(use-package magit
  :after (evil evil-collection)
  :init
  (add-to-list 'evil-collection-mode-list 'magit)
  :bind
  (:map evil-normal-state-map
        ("<leader>gg" . magit-status)))

(use-package magit-delta
  :after magit
  :config
  (add-to-list 'magit-delta-delta-args "--light")
  :hook
  (magit-mode . magit-delta-mode))

;; Piece of shit used by magit
(use-package transient
  :custom
  (transient-history-file (expand-file-name "transient/history.el" emacs-cache-dir))
  (transient-values-file (expand-file-name "transient/values.el" emacs-cache-dir))
  (transient-levels-file (expand-file-name "transient/levels.el" emacs-cache-dir))
  :bind
  (:map transient-base-map
        ("<escape>" . transient-quit-one)))

(use-package git-gutter
  :demand t
  :custom
  (git-gutter:modified-sign "▋")
  (git-gutter:added-sign    "▋")
  (git-gutter:deleted-sign  "▋")
  :config
  (set-face-foreground 'git-gutter:modified "dodger blue")
  (global-git-gutter-mode t))
