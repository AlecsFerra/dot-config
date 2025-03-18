(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'tsdh-light))

;; Run this command to get the required icons.
;; (nerd-icons-install-fonts)
(use-package doom-modeline
  :config
  (doom-modeline-mode t))

;; Fira code ligatures
;; (fira-code-mode-install-fonts)
(use-package fira-code-mode
  :custom
  (fira-code-mode-disabled-ligatures '("x"))
  :config
  (global-fira-code-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))
