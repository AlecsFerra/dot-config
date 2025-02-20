(use-package doom-themes
  :demand t
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (doom-themes-visual-bell-config)
  (load-theme 'doom-winter-is-coming-light))

;; Run this command to get the required icons.
;; M-x nerd-icons-install-fonts
(use-package doom-modeline
  :demand t
  :init (doom-modeline-mode t))

;; Fira code ligatures
;; M-x fira-code-mode-install-fonts
(use-package fira-code-mode
  :demand t
  :custom
  (fira-code-mode-disabled-ligatures '("x"))
  :config
  (global-fira-code-mode))
