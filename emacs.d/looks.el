;; -*- lexical-binding: t -*-
(defun alecs/compute-font-size ()
  (let* ((attrs (car (display-monitor-attributes-list)))
         (width (nth 3 (assq 'geometry attrs))))
    (cond
     ((> width 3000) 180)
     ((> width 2000) 160)
     ((> width 1000) 120)
     (t 110))))

(use-package nerd-icons)

;; Testing the render of unicode math with the font
;; ⟦ Γ ⊢ t ∶ τ ⟧ₜₘ : (γ ∈ ⟦ ⊢ Γ ⟧ₜₓ) → ⟦ Γ ⊢ τ ⟧ₜₚ γ
;; map (f ∘ g) ≡ map f ∘ map g
;; ◂ ⌈f ̧⌉ ⇒ ▵ f

(defun alecs/set-frame-font (&optional font-family font-height)
  (interactive)
  (setq font-family (or font-family "Aporetic Sans Mono"))
  (let* ((size (or font-height (alecs/compute-font-size)))
         (font-size (/ (float size) 10))
         (font-string (format "%s-%d" font-family font-size)))
    (add-to-list 'default-frame-alist `(font . ,font-string))
    (set-frame-font font-string nil t)))
(alecs/set-frame-font)

(use-package batppuccin
  :custom
  (batppuccin-italic-comments nil)
  :init
  (load-theme 'batppuccin-latte t))

;; If we are on a laptop enable battery status in the modeline
(setq laptop-hostnames '("dhcp-18-248.imdea" "MacBook-Pro.local"))
(when (member (system-name) laptop-hostnames)
  (display-battery-mode t))

(use-package doom-modeline
  :custom
  (doom-modeline-hud t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-highlight-modified-buffer-name nil)
  (doom-modeline-percent-position nil)
  (doom-modeline-position-line-format nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-project-name t)
  :hook
  (after-init . doom-modeline-mode))

(setq banner-path
      (expand-file-name "banners/MetalEmacs.png"
                        user-emacs-directory))

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
  (dashboard-mode . (lambda () (display-line-numbers-mode -1)))
  :init
  (dashboard-setup-startup-hook))
