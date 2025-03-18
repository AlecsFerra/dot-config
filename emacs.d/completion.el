(use-package vertico
  :demand t
  :after (marginalia)
  :init
  (setq vertico-cycle t
        vertico-resize nil)
  :config
  (vertico-mode t)
  :bind
  (:map vertico-map
        ([escape] . abort-recursive-edit)
        ("C-j"    . vertico-next)
        ("C-k"    . vertico-previous)))

(use-package marginalia
  :demand t
  :config
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic)))

(use-package consult
  :after (vertico evil)
  :custom
  (completion-in-region-function 'consult-completion-in-region)
  (consult-buffer-filter '("^ " "\*.*\*" "magit.*"))
  :bind
  (:map evil-normal-state-map
        ("<leader><SPC>" . consult-buffer)))

(use-package embark
  :commands (alecs/embark-kill)
  :config
  (defun alecs/embark-kill (&optional arg)
    "Kill buffer or remove file from recentf."
    (interactive "P")
    (let ((embark-default-action-overrides '((buffer . kill-buffer)
                                             (file . embark-recentf-remove)))
          (embark-pre-action-hook (assq-delete-all 'kill-buffer
                                                    embark-pre-action-hooks))
          embark-quit-after-action)
      (embark-dwim arg)))
  :bind
  (("C-." . embark-act)
   ("C-c" . alecs/embark-kill)))

(use-package embark-consult
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package affe
  :after (vertico evil)
  :bind
  (:map evil-normal-state-map
        ("<leader>sf" . affe-find)
        ("<leader>sg" . affe-grep)))

(use-package consult-flycheck
  :after (consult evil flycheck)
  :bind
  (:map evil-normal-state-map
        ("<leader>se" . consult-flycheck)))
