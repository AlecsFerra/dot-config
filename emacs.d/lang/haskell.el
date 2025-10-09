(defun open-line-above ()
  "Insert a newline above, like vim’s ‘O’ function."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1))

(defvar haskell-liquid-signature-regexp
  (rx line-start
      (group (or (seq alpha (one-or-more (or alnum "_" "'")))
                 (seq "(" (one-or-more (not alnum)) ")")))
      (zero-or-more blank)
      "::")
  "Regexp that matches (using a group) the identifier of the
current function in the signature line.")

(defun haskell-liquid-goto-signature ()
  "Go to the signature line of the current function and return its
identifier."
  (interactive)
  (end-of-line)
  (search-backward-regexp haskell-liquid-signature-regexp)
  (match-string 1))

(defun haskell-liquid-remove-type-class ()
  "Remove the type-class annotation in the current line."
  (interactive)
  (beginning-of-line)
  (when (re-search-forward (rx "::" (one-or-more not-newline) "=>")
                           (line-end-position) t)
    (delete-region (match-beginning 0) (match-end 0))
    (insert "::")))

(defun haskell-liquid-insert-string (str)
  "Place the string STR inside a Liquid Haskell annotation."
  (insert "{-@ " (replace-regexp-in-string "\n" "\n    " str) " @-}"))

(defun haskell-liquid-add-refinement (str)
  "Add Liquid Haskell refinement around string STR."
  (open-line-above)
  (delete-horizontal-space)
  (haskell-liquid-insert-string str))

(defun haskell-liquidify-region (start end)
  (interactive "r")
  (let* ((str (delete-and-extract-region start end))
         (no-newline (not (s-suffix-p "\n" str))))
    (if no-newline
        (haskell-liquid-insert-string str)
      (haskell-liquid-insert-string (string-trim-right str))
      (insert "\n"))))

(defun haskell-liquid-add-annotation (str)
  (let ((identifier-name (haskell-liquid-goto-signature)))
    (haskell-liquid-add-refinement (concat str " " identifier-name))))

(defun haskell-liquid-reflect-function ()
  (interactive)
  (haskell-liquid-add-annotation "reflect"))

(defun haskell-liquid-measure-function ()
  (interactive)
  (haskell-liquid-add-annotation "measure"))

(defun haskell-liquid-ignore-function ()
  "Add a Liquid Haskell ignore annotation for the current function."
  (interactive)
  (haskell-liquid-add-annotation "ignore"))

(defun haskell-liquid-lazy-function ()
  "Add a Liquid Haskell lazy annotation for the current function."
  (interactive)
  (haskell-liquid-add-annotation "lazy"))

(defun haskell-liquid-refine-function (start end)
  "Add a Liquid Haskell refinement of the text between START and
END (interactively, the active region) above the signature for
the current function."
  (interactive "r")
  (let ((specification (string-trim-right (buffer-substring start end))))
    (haskell-liquid-goto-signature)
    (haskell-liquid-add-refinement specification)))

(defcustom haskell-liquid-padded-refinements t
  "Whether refinements introduced with ‘haskell-liquid-refine-type’
should put a space between the type and the curly braces."
  :type 'boolean)

(defun haskell-liquid-refine-type (start end)
  "Place the text between START and END (interactively, the active
region) inside a Liquid Haskell type refinement."
  (interactive "r")
  (let ((padding (if haskell-liquid-padded-refinements " " ""))
        (base-type (delete-and-extract-region start end)))
    (save-excursion
      (insert "{" padding ":" base-type " | True" padding "}"))
    (search-forward ":")
    (goto-char (match-beginning 0))))

;; always enter evil insert mode after calling ‘haskell-liquid-refine-type’
(advice-add 'haskell-liquid-refine-type :after
            (lambda (&rest _) (evil-insert 1)))

(use-package haskell-mode
  :hook
  (haskell-mode . interactive-haskell-mode)
  :general
  (alecs/leader
    :keymaps 'haskell-mode-map
    "hlr" #'haskell-liquid-reflect-function
    "hlm" #'haskell-liquid-measure-function
    "hli" #'haskell-liquid-ignore-function
    "hll" #'haskell-liquid-lazy-function
    "hlt" #'haskell-liquid-refine-type
    "hlf" #'haskell-liquid-refine-function))

(use-package haskell-ts-mode
  :mode "\\.hs\\'"
  :hook
  (haskell-ts-mode . interactive-haskell-mode)
  :general
  (alecs/leader
    :keymaps 'haskell-ts-mode-map
    "hlr" #'haskell-liquid-reflect-function
    "hlm" #'haskell-liquid-measure-function
    "hli" #'haskell-liquid-ignore-function
    "hll" #'haskell-liquid-lazy-function
    "hlt" #'haskell-liquid-refine-type
    "hlf" #'haskell-liquid-refine-function))

(use-package consult-hoogle
  :general
  (alecs/leader
    :keymaps 'haskell-ts-mode-map
    "hh" #'consult-hoogle))
