(use-package magit
  :after evil
  :bind (:map evil-normal-state-map
              ("<leader>gg" . magit-status)))

(use-package magit-delta
  :after magit
  :config
  (add-to-list 'magit-delta-delta-args "--light")
  :hook (magit-mode . magit-delta-mode))
