(use-package z3-mode
  :init
  :config
  (defvar alecs/z3-solver-cmd
    (concat (executable-find "z3") " -in"))
  (defvar alecs/cvc5-solver-cmd
    (executable-find "cvc5"))
  ;; By default this package loads z3
  (defvar alecs/smt-solver-region-command
    alecs/z3-solver-cmd)
  (defun alecs/z3-mode-use-cvc5 ()
    "Switch Z3 mode to use CVC5 as the solver."
    (interactive)
    (setq alecs/smt-solver-region-command alecs/cvc5-solver-cmd)
    (setq z3-solver-cmd (executable-find "cvc5")))
  (defun alecs/z3-mode-use-z3 ()
    "Switch Z3 mode to use Z3 as the solver."
    (interactive)
    (setq alecs/smt-solver-region-command
          (concat (executable-find "z3") " -in"))
    (setq z3-solver-cmd (executable-find "z3")))
  (defun alecs/z3-execute-region-advice ()
    (shell-command-on-region
     (if (region-active-p) (region-beginning) (point-min))
     (if (region-active-p) (region-end) (point-max))
     alecs/smt-solver-region-command))
  (advice-add 'z3-execute-region :override
              #'alecs/z3-execute-region-advice)
  :mode ("\\.smt2\\'" . z3-mode))
