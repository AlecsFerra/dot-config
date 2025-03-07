(use-package vertico
  :demand t
  :after (marginalia)
  :init
  (setq vertico-cycle t
        vertico-resize nil)

  :config
  (vertico-mode t)

  :bind (:map vertico-map
              ([escape] . abort-recursive-edit)
              ("C-j"    . vertico-next)
              ("C-k"    . vertico-previous)))

(use-package marginalia
  :demand t
  :config
  (marginalia-mode))

(use-package orderless
  :init
  (setq completion-styles
        '(orderless basic)))

(use-package consult
  :after (vertico evil)
  :init
  (setq completion-in-region-function
        'consult-completion-in-region)
  (setq consult-buffer-filter
        '("^ " "*Messages*" "*scratch*"))
  :bind (:map evil-normal-state-map
              ("<leader><SPC>" . consult-buffer)))

(use-package affe
  :after (vertico evil)
  :bind (:map evil-normal-state-map
              ("<leader>sf" . affe-find)
              ("<leader>sg" . affe-grep)))

(use-package consult-flycheck
  :after (consult evil flycheck)
  :bind (:map evil-normal-state-map
              ("<leader>se" . consult-flycheck)))
