(set-frame-font "Berkeley Mono 14" nil t)

(use-package catppuccin-theme
  :custom
  (catppuccin-flavor 'latte)
  :config
  (load-theme 'catppuccin))

;; Run this command to get the required icons.
;; (nerd-icons-install-fonts)
(use-package doom-modeline
  :custom
  (doom-modeline-hud t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-highlight-modified-buffer-name nil)
  (doom-modeline-percent-position nil)
  (doom-modeline-position-line-format nil)
  (doom-modeline-buffer-encoding nil)
  :hook
  (after-init . doom-modeline-mode))

(setq banner-directory "~/.emacs.d/banners/")
(use-package dashboard
  :custom
  (dashboard-banner-logo-title "I can't believe it's not VIM!")
  (dashboard-startup-banner (concat banner-directory "bcc.txt"))
  (dashboard-page-separator "\n")
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-startupify-list `(dashboard-insert-banner
                               dashboard-insert-banner-title
                               dashboard-insert-newline
                               ,(dashboard-insert-newline 2)
                               dashboard-insert-init-info))
  :hook
  (dashboard-mode . (lambda ()
                      (display-line-numbers-mode -1)))
  :config
  (dashboard-setup-startup-hook))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))
