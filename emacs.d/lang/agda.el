(when (executable-find "agda-mode")

  (defun alecs/agda2-mode-start ()
    "Load the agda-mode package and start the agda2-mode and loads the file."
    (interactive)
    (load-file (string-trim (shell-command-to-string "agda-mode locate")))
    (agda2-mode))

  (use-package agda2-mode
    :ensure nil ; Provided with loadfile
    :commands agda2-mode
    :mode ("\\.agda\\'" . alecs/agda2-mode-start)))
