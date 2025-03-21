(use-package evil
  :custom
  (evil-shift-width tab-width)
  (evil-want-keybinding nil)
  :init
  (eval-after-load "dired" ; Dired hijacks the space key
    '(unbind-key "<SPC>" dired-mode-map))
  :config
  (evil-set-leader 'normal " ")
  :hook
  (after-init . evil-mode)

  :bind
  (:map evil-insert-state-map
        ("C-/"        . ignore))

  (:map evil-visual-state-map
        ("C-/"        . comment-dwim))

  (:map evil-normal-state-map
        ("C-/"        . comment-line)
        ("<leader>eb" . eval-buffer)
        ("<leader>ee" . eval-last-sexp)
        ("<leader>bc" . (lambda () (interactive) (kill-buffer (current-buffer))))
        ("<leader>t"  . alecs/toggle-term)))

(defun alecs/toggle-term ()
  "Inspired by https://gist.github.com/msoeken/4b2e3ee07b7252f8cb99"
  (interactive)
  (if (string= (buffer-name) "*ansi-term*")
      (switch-to-buffer (other-buffer (current-buffer)))
    (if (get-buffer "*ansi-term*")
        (switch-to-buffer "*ansi-term*")
      (ansi-term (getenv "SHELL")))))

(use-package evil-collection
  :after evil
  :demand t
  :custom
  (evil-collection-key-blacklist '("SPC"))
  :config
  (add-to-list 'evil-collection-mode-list 'dired)
  (evil-collection-init))

(use-package undo-tree
  :demand t
  :after evil
  :custom
  (undo-tree-history-directory-alist `(("." . ,(expand-file-name "undo/" emacs-cache-dir))))
  (undo-tree-visualizer-relative-timestamps t)
  :init
  ;; For some reason undo tree refuses to start if the original emacs
  ;; keybinding for comments is overriden
  (advice-add 'undo-tree-overridden-undo-bindings-p
              :override (lambda () nil))
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode t)
  :bind
  (:map evil-normal-state-map
        ("<leader>u" . undo-tree-visualize)))

;; Piece of shit used by magit
(use-package transient
  :custom
  (transient-history-file (expand-file-name "transient/history.el" emacs-cache-dir))
  (transient-values-file (expand-file-name "transient/values.el" emacs-cache-dir))
  (transient-levels-file (expand-file-name "transient/levels.el" emacs-cache-dir))
  :bind
  (:map transient-base-map
        ("<escape>" . transient-quit-one)))
