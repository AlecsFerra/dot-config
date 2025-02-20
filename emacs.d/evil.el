(use-package evil
  :demand t
  :init
  (setq evil-shift-width tab-width)
  ;; Dired hijacks the space key
  (eval-after-load "dired"
    '(unbind-key "<SPC>" dired-mode-map))
  :config
  (evil-mode t)
  (evil-set-leader 'normal " ")
  (evil-set-initial-state 'term-mode 'normal)

  :bind (:map evil-insert-state-map
              ("C-/"        . ignore))

  :bind (:map evil-visual-state-map
              ("C-/"        . comment-dwim))

  :bind (:map evil-normal-state-map
              ("C-/"        . comment-line)
              ("<leader>eb" . eval-buffer)
              ("<leader>ee" . eval-last-sexp)
              ("<leader>bc" . kill-buffer)
              ("<leader>t"  . alecs/toggle-term)))

(defun alecs/toggle-term ()
  "Inspired by https://gist.github.com/msoeken/4b2e3ee07b7252f8cb99"
  (interactive)
  (if (string= (buffer-name) "*ansi-term*")
      (switch-to-buffer (other-buffer (current-buffer)))
    (if (get-buffer "*ansi-term*")
        (switch-to-buffer "*ansi-term*")
        (ansi-term (getenv "SHELL")))))

(use-package undo-tree
  :demand t
  :after evil
  :init
  (setq undo-tree-history-directory-alist
        '(("." . "~/.cache/emacs/undo")))
  (setq undo-tree-visualizer-relative-timestamps t)
  ;; For some reason undo tree refuses to start if the original emacs
  ;; keybinding for comments is overriden
  (advice-add 'undo-tree-overridden-undo-bindings-p
              :override (lambda () nil))
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode t)

  :bind (:map evil-normal-state-map
              ("<leader>u" . undo-tree-visualize)))
