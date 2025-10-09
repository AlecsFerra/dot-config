(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic)))

(use-package vertico
  :custom
  (vertico-cycle t)
  (vertico-resize 0)
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
    "SPC" #'consult-buffer
    "se" #'consult-flymake))

(use-package embark-consult
  :after consult
  :general
  (:keymaps 'vertico-map
            "C-." #'embark-act
            "C-c" #'alecs/embark-kill)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package affe
  :after (vertico orderless)
  :general
  (alecs/leader
    "sf" #'affe-find
    "sg" #'affe-grep))

(use-package company
  :custom
  (ess-r--no-company-meta t)
  (company-tooltip-scrollbar-width 0)
  :config
  (setq company-frontends
        (remove #'company-echo-metadata-frontend
                company-frontends))
  :general
  (:keymaps 'company-active-map
            "C-j" #'company-select-next
            "C-k" #'company-select-previous)
  (:states 'insert
           "<enter>" #'company-complete)
  :hook
  (prog-mode . company-mode)
  (org-mode  . company-mode))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode)
  :custom
  (company-box-doc-enable t)
  (company-box-scrollbar nil)
  :hook
  (company-mode . company-box-mode))
