(defun alecs/org-open-at-point-or-ret ()
  (interactive)
  (if (org-in-regexp org-link-bracket-re 1)
      (org-open-at-point)
    (evil-ret)))

(defun alecs/join-lines (&rest strings)
  (string-join strings "\n"))

(use-package org
  :after evil
  :custom
  (org-id-locations-file (expand-file-name
                         ".org-id-locations"
                         emacs-cache-dir))
  (org-confirm-babel-evaluate nil)
  (org-src-preserve-indentation t)
  (org-babel-python-command "python3")
  :general
  (:keymaps 'org-mode-map
   :states 'normal
   "RET" #'alecs/org-open-at-point-or-ret)
  :config
  (require 'ob-python)
  (require 'ob-haskell)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (haskell . t))))

(defvar org-general-template
  `("g" "General" plain
    ,(alecs/join-lines "* Overview"
                       "%?"
                       "* Key Points"
                       ""
                       "* References"
                       ""
                       "* Related")
    :target (file+head "general/%<%Y%m%d%H%M%S>-${slug}.org"
                       "#+title: ${title}\n")
    :immediate-finish t
    :jump-to-captured t
    :unnarrowed t))

(defvar org-misc-template
  (let ((header (alecs/join-lines
                 "#+title: ${title}"
                 "#+filetags: misc")))
    `("t" "Temporary notes" plain
      "%?"
      :target (file+head "temp/%<%Y%m%d%H%M%S>-${slug}.org"
                         ,header)
      :immediate-finish t
      :jump-to-captured t
      :unnarrowed t)))

(defvar org-reference-template
  `("r" "Bibliography Reference" plain
    ,(alecs/join-lines "* Overview"
                       "%?"
                       "* Key Points"
                       ""
                       "* Related")
    :target (file+head "references/${citar-citekey}.org"
                       (alecs/join-lines
                        "#+title: ${note-title}."
                        "#+filetags: reference"))
    :immediate-finish t
    :jump-to-captured t
    :unnarrowed t))

(use-package org-roam
  :custom
  (org-roam-directory "~/Documents/org")
  (org-roam-db-location (expand-file-name
                         "org-roam.db"
                         emacs-cache-dir))
  (org-roam-capture-templates
   `(,org-general-template
     ,org-misc-template
     ,org-reference-template))
  :init
  (add-to-list 'evil-collection-mode-list 'org)
  (add-to-list 'evil-collection-mode-list 'org-roam)
  :general
  (alecs/leader
    "os" #'org-roam-node-find)
  (alecs/leader
    :keymaps 'org-mode-map
    "oi" #'org-roam-node-insert)
  :config
  (org-roam-db-autosync-enable))

(use-package citar
  :custom
  (citar-bibliography '("~/Documents/references.bib"))
  :config
  (defvar citar-indicator-notes-icons
    (citar-indicator-create
    :symbol (nerd-icons-mdicon
              "nf-md-notebook"
              :v-adjust -0.3)
    :function #'citar-has-notes
    :padding "  "
    :tag "has:notes"))

  (defvar citar-indicator-links-icons
    (citar-indicator-create
    :symbol (nerd-icons-octicon
              "nf-oct-link"
              :v-adjust -0.1)
    :function #'citar-has-links
    :padding "  "
    :tag "has:links"))

  (defvar citar-indicator-files-icons
    (citar-indicator-create
    :symbol (nerd-icons-faicon
              "nf-fa-file"
              :v-adjust -0.1)
    :function #'citar-has-files
    :padding "  "
    :tag "has:files"))

  (setq citar-indicators
        (list citar-indicator-files-icons
              citar-indicator-notes-icons
              citar-indicator-links-icons))
  (citar-org-roam-mode)
  :general
  (alecs/leader
    "oc" #'citar-open)
  :hook
  (LaTeX-mode . citar-capf-setup)
  (org-mode . citar-capf-setup))

(use-package citar-org-roam
  :after (citar org-roam)
  :custom
  (citar-org-roam-note-title-template "${title} (Bibliography Reference)")
  (citar-org-roam-capture-template-key "r"))
