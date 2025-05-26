(when (member "Berkeley Mono" (font-family-list))
  (set-frame-font "Berkeley Mono" nil t))

(setq banner-path "~/.emacs.d/banners/MetalEmacs.png")

(defun alecs/compute-font-size ()
  (let* ((attrs (car (display-monitor-attributes-list)))
         (width (nth 3 (assq 'geometry attrs))))
    (cond
     ((> width 2000) 160)
     (t 110))))

(set-face-attribute 'default nil
                    :height (alecs/compute-font-size))

(use-package catppuccin-theme
  :custom
  (catppuccin-flavor 'latte)
  :init
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

(use-package dashboard
  :custom
  (dashboard-banner-logo-title "I can't believe it's not VIM!")
  (dashboard-startup-banner banner-path)
  (dashboard-image-banner-max-height 500)
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
  :init
  (dashboard-setup-startup-hook))
