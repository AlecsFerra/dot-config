(use-package magit
  :after evil
  :bind (:map evil-normal-state-map
              ("<leader>gg" . magit-status)))
