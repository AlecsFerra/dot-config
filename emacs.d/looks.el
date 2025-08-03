(defun alecs/compute-font-size ()
  (let* ((attrs (car (display-monitor-attributes-list)))
         (width (nth 3 (assq 'geometry attrs))))
    (cond
     ((> width 3000) 180)
     ((> width 2000) 160)
     ((> width 1000) 120)
     (t 110))))

(defun alecs/set-frame-font (&optional font-family font-height)
  (setq font-family (or font-family "Berkeley Mono"))
  (let* ((size (or font-height (alecs/compute-font-size)))
         (font-size (/ (float size) 10))
         (font-string (format "%s-%d" font-family font-size)))
    (add-to-list 'default-frame-alist `(font . ,font-string))
    (set-frame-font font-string nil t)))

(alecs/set-frame-font)

(setq banner-path (expand-file-name "banners/MetalEmacs.png"
                                    user-emacs-directory))

(use-package catppuccin-theme
  :custom
  (catppuccin-flavor 'latte)
  (catppuccin-highlight-matches t)
  (catppuccin-italic-comments t)
  :init
  (defun alecs/catppuccin-diff-face-fix (theme &rest _args)
    "Override diff faces after Catppuccin colors are applied."
    (when (and (eq theme 'catppuccin)
               (eq catppuccin-flavor 'latte))
      (let* ((ctp-text (catppuccin-color 'text))
             (ctp-surface2 (catppuccin-color 'surface2))
             (ctp-green (catppuccin-color 'green))
             (ctp-red (catppuccin-color 'red))
             (ctp-yellow (catppuccin-color 'yellow))
             (ctp-base (catppuccin-color 'base))
             (lighten #'catppuccin-lighten)
             (darken #'catppuccin-darken))
        (custom-set-faces
         `(diff-hunk-header ((t (:foreground ,ctp-text :background ,ctp-surface2))))
         `(diff-added ((t (:background ,(funcall lighten ctp-green 80)))))
         `(diff-removed ((t (:background ,(funcall lighten ctp-red 80)))))
         `(diff-indicator-added ((t (:foreground ,ctp-green))))
         `(diff-indicator-removed ((t (:foreground ,ctp-red))))
         `(diff-refine-added ((t (:background ,(funcall lighten ctp-green 60)))))
         `(diff-refine-removed ((t (:background ,(funcall lighten ctp-red 60)))))
         `(diff-refine-changed ((t (:background ,ctp-yellow :foreground ,ctp-base))))))))
  (advice-add 'enable-theme :after #'alecs/catppuccin-diff-face-fix)
  (load-theme 'catppuccin))

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
