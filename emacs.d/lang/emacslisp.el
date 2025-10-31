;; -*- lexical-binding: t -*-
(general-define-key
 :keymaps 'emacs-lisp-mode-map
 "C-c C-c" #'eval-buffer)

(defun alecs/eval-elisp-dwim ()
  (interactive)
  (let* ((beg (if (use-region-p)
                  (region-beginning)
                (save-excursion (mark-defun) (region-beginning))))
         (end (if (use-region-p)
                  (region-end)
                (save-excursion (mark-defun) (region-end))))
         (sexp (read (buffer-substring beg end)))
         (result (eval sexp)))
    (deactivate-mark)
    (message "%s" (string-trim-right (pp-to-string result)))))

(general-define-key
 :keymaps 'override
 "C-c C-e" #'alecs/eval-elisp-dwim)
