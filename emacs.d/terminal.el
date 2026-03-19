(defun alecs/toggle-term ()
  (interactive)
  (if (string= (buffer-name) "*vterm*")
      (switch-to-buffer (other-buffer (current-buffer)))
    (if (get-buffer "*vterm*")
        (switch-to-buffer "*vterm*")
      (vterm))))

(use-package vterm
  :after (evil evil-collection)
  :init
  (add-to-list 'evil-collection-mode-list 'vterm)
  :general
  (alecs/leader
    "t" #'alecs/toggle-term))
