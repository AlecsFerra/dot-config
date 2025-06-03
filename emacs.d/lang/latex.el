(use-package lsp-latex
  :hook
  (LaTeX-mode . lsp-deferred)
  (bibtex-mode . lsp-deferred))


(use-package flyspell
  :custom
  (flyspell-issue-message-flag nil)
  (ispell-dictionary "en_US")
  :hook
  (tex-mode   . flyspell-mode)
  (LaTeX-mode . flyspell-mode))

(use-package flyspell-correct
  :after flyspell
  :general
  (alecs/leader
    :keymaps 'flyspell-mode-map
    "cg" #'flyspell-correct-wrapper))

(use-package auctex
  :custom
  (TeX-command-default "Latex")
  (TeX-PDF-mode t)
  (TeX-parse-self t) ; parse on load
  (TeX-auto-save t)
  (TeX-save-query nil)
  (TeX-master nil) ; Automatically ask for master file
  ;; Hidden files
  (TeX-auto-local
   (expand-file-name ".acutex-auto/" emacs-cache-dir))
  (TeX-style-local
   (expand-file-name ".auctex-style/" emacs-cache-dir))
  ;; Show preview in pdf tools
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
  ;; Correlation between text
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-start-server nil)
  (TeX-show-compilation nil)
  ;; Reload buffer on compilation
  :hook
  (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  (LaTeX-mode . auto-fill-mode)
  :general
  (alecs/leader
    :keymaps 'LaTeX-mode-map
    "cc" #'TeX-command-run-all))

(use-package pdf-tools
  :after evil-collection
  :magic ("%PDF" . pdf-view-mode)
  :custom
  (pdf-view-use-scaling t)
  (pdf-view-display-size 'fit-page)
  :init
  (add-to-list 'evil-collection-mode-list '(pdf pdf-view))
  :config
  (pdf-tools-install t)
  ;; Ensure PDFs open on the right
  (add-to-list 'display-buffer-alist
               '("\\.pdf\\'"
                 (display-buffer-in-side-window)
                 (side . right)
                 (window-width . 0.5)
                 (slot . 1)
                 (window-parameters . ((no-delete-other-windows . t))))))
