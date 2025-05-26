(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic)))

(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  :init
  (vertico-mode t)
  :general
  (:keymaps 'vertico-map
            [escape] #'abort-recursive-edit
            "C-j"    #'vertico-next
            "C-k"    #'vertico-previous))

(use-package consult
  :after vertico
  :custom
  (completion-in-region-function #'consult-completion-in-region)
  (consult-buffer-filter '("^ " "\*.*\*" "magit.*"))
  :general
  (alecs/leader
    "SPC" #'consult-buffer))

(use-package embark
  :after consult
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
  :general
  (:keymaps 'vertico-map
            "C-." #'embark-act
            "C-c" #'alecs/embark-kill))

(use-package embark-consult
  :after embark
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package affe
  :after consult
  :general
  (alecs/leader
    "sf" #'affe-find
    "sg" #'affe-grep))

(use-package consult-flycheck
  :after (consult flycheck)
  :general
  (alecs/leader
    "se" #'consult-flycheck))
