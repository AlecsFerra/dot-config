(use-package flyspell
  :custom
  (flyspell-issue-message-flag nil)
  ; (ispell-program-name "enchant-2")
  (ispell-dictionary "en_US")
  :hook
  (tex-mode   . flyspell-mode)
  (LaTeX-mode . flyspell-mode))

(use-package flyspell-correct
  :after flyspell
  :bind (:map evil-normal-state-map
              ("<leader>cg" . flyspell-correct-wrapper)))

(use-package auctex
  :init
  (setq TeX-command-default "Latex"
        TeX-PDF-mode t
        TeX-parse-self t ; parse on load
        TeX-auto-save t
        TeX-save-query nil)
  ;; Hidden files
  (setq TeX-auto-local ".auctex-auto"
        TeX-style-local ".auctex-style")
  ;; Show preview in pdf tools
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
  ;; Correlation between text
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex
        TeX-source-correlate-start-server nil)
  ;; Reload buffer on compilation
  :hook
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  (LaTeX-mode . auto-fill-mode)
  :bind (:map evil-normal-state-map
              ("<leader>cc" . TeX-command-run-all)))

(use-package lsp-latex
  :disabled
  :hook
  (LaTeX-mode . lsp-deferred)
  (bibtex-mode . lsp-deferred))

(use-package pdf-tools
  :after evil-collection
  :magic ("%PDF" . pdf-view-mode)
  :init
  (add-to-list 'evil-collection-mode-list '(pdf pdf-view))
  (setq pdf-view-use-scaling t
        pdf-view-display-size 'fit-page)
  :config
  (pdf-tools-install t))
