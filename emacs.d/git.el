(use-package magit
  :after (evil transient)
  :bind (:map evil-normal-state-map
              ("<leader>gg" . magit-status)))
