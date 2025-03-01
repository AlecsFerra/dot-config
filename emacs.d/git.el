(use-package magit
  :after evil
  :bind (:map evil-normal-state-map
              ("<leader>gg" . magit-status)))

(use-package magit-delta
  :after magit
  :hook (magit-mode . magit-delta-mode))
