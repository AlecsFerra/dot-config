(use-package evil
  :custom
  (evil-shift-width tab-width)
  (evil-want-keybinding nil)
  :init
  (evil-mode t))

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
  :custom
  (evil-collection-key-blacklist '("SPC"))
  :init
  (evil-collection-init)
  (add-to-list 'evil-collection-mode-list 'dired))

(use-package general
  :after evil
  :preface
  (general-create-definer alecs/leader
    :states '(normal visual)
    :prefix "SPC"
    :global-prefix "C-SPC")
  :config
  (general-evil-setup t)
  (alecs/leader
    "eb" #'eval-buffer
    "ee" #'eval-last-sexp
    "bc" (lambda ()
           (interactive)
           (kill-buffer (current-buffer)))
    "t"  #'alecs/toggle-term))

(use-package evil-numbers
  :after evil
  :general
  (:states '(normal visual)
           "C-a" #'evil-numbers/inc-at-pt
           "C-x" #'evil-numbers/dec-at-pt))

(use-package undo-tree
  :after evil
  :custom
  (undo-tree-history-directory-alist
   `(("." . ,(expand-file-name "undo/" emacs-cache-dir))))
  (undo-tree-visualizer-relative-timestamps t)
  :init
  ;; Patch undo-tree override logic
  (advice-add 'undo-tree-overridden-undo-bindings-p
              :override (lambda () nil))
  (global-undo-tree-mode t)
  (evil-set-undo-system 'undo-tree)
  :general
  (alecs/leader
    "u" #'undo-tree-visualize)
  (:keymaps 'undo-tree-visualizer-mode-map
            "<escape>" #'quit-window))
