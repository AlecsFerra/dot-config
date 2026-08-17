;; -*- lexical-binding: t -*-

(use-package lsp-latex
  :hook
  (LaTeX-mode . lsp-deferred)
  (bibtex-mode . lsp-deferred))

(use-package auctex
  :after general
  :mode
  ("\\.tex\\'" . LaTeX-mode)
  :custom
  (TeX-command-default "Latex")
  (TeX-engine 'luatex)
  (TeX-output-dir "build/")
  (TeX-PDF-mode t)
  (TeX-parse-self t) ; parse on load
  (TeX-auto-save t)
  (TeX-save-query nil)
  (TeX-debug-warnings t)
  (TeX-master nil) ; Automatically ask for master file
  ;; Hidden files
  (TeX-auto-local (expand-file-name ".acutex-auto/"
                                    emacs-cache-dir))
  (TeX-style-local (expand-file-name ".auctex-style/"
                                     emacs-cache-dir))
  ;; Show preview in pdf tools
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
  ;; Correlation between text
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-start-server nil)
  (TeX-show-compilation nil)
  :hook
  (LaTeX-mode . auto-fill-mode)
  :init
  ;; For some reason is not named *-hook
  ;; (add-hook 'TeX-after-compilation-finished-functions
            ;; #'TeX-revert-document-buffer)
  :config
  (add-to-list 'display-buffer-alist
               `(" output\\*$" ,@alecs/right-side-window))
  (add-to-list 'display-buffer-alist
               `("*TeX Help*" ,@alecs/right-side-window))
  (add-to-list 'display-buffer-alist
               `("*TeX Errors*" ,@alecs/right-side-window))
  :general
  (general-define-key
   :keymaps 'LaTeX-mode-map
   "C-c C-l" #'TeX-error-overview
   "C-c C-c" #'TeX-command-run-all))

(use-package reftex
  :hook (LaTeX-mode . turn-on-reftex)
  :custom
  (reftex-plug-into-AUCTeX t)
  :general
  (general-define-key
   :states '(normal motion)
   :keymaps 'reftex-mode-map
   "gt" #'reftex-toc))


(use-package pdf-tools
  :after evil-collection
  :magic ("%PDF" . pdf-view-mode)
  :custom
  (pdf-view-use-scaling t)
  (pdf-view-display-size 'fit-page)
  :hook
  (pdf-view-mode . pdf-links-minor-mode)
  (pdf-view-mode . pdf-isearch-minor-mode)
  (pdf-view-mode . pdf-outline-minor-mode)
  (pdf-view-mode . pdf-history-minor-mode)
  :init
  (add-to-list 'evil-collection-mode-list '(pdf pdf-view))
  :config
  (pdf-tools-install :no-query)
  (add-to-list 'display-buffer-alist
               `("\\.pdf\\'" ,@alecs/right-side-window)))
