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
