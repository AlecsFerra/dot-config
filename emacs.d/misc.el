;; Guess indentation for the current buffer
(use-package dtrt-indent
  :hook
  (prog-mode . dtrt-indent-mode))

(use-package rainbow-mode
  :hook
  (prog-mode . rainbow-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))
