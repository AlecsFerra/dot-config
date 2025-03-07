;; Fonts
(set-frame-font "FiraCode Nerd Font Mono 14" nil t)

;; Line numbers
(setq-default display-line-numbers 'relative)

;; Tabs -> spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)

(electric-pair-mode t) ; Auto parens

(setq custom-safe-themes t)

;; Remove whitespaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Vertico suggestions
(setq-default enable-recursive-minibuffers t)
(setq-default minibuffer-prompt-properties
              '(read-only t cursor-intangible t face minibuffer-prompt))


;; Scrolling
(pixel-scroll-precision-mode)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; ESC is ESC
(define-key minibuffer-local-map [escape]
            'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape]
            'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape]
            'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape]
            'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape]
            'minibuffer-keyboard-quit)
