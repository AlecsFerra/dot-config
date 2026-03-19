;; -*- lexical-binding: t -*-

(setq display-buffer-base-action
      '((display-buffer-reuse-window
         display-buffer-same-window)
        (reusable-frames . t)))
(setq display-buffer-fallback-action
      '((display-buffer--maybe-same-window
         display-buffer-reuse-window
         display-buffer--maybe-pop-up-frame-or-window
         display-buffer-in-previous-window
         display-buffer-use-some-window
         display-buffer-at-bottom)))

(defconst alecs/right-side-window
  '((display-buffer-in-side-window)
    (side . right)
    (window-width . 0.44)
    (slot . 1)
    (window-parameters . ((window-preserve-selected-window . t)))))

(defconst alecs/bottom-side-window
  '((display-buffer-in-side-window)
    (side . bottom)
    (window-width . 0.05)
    (slot . 1)
    (window-parameters . ((window-preserve-selected-window . t)))))

(defvar alecs/toggle-win-conf nil)
(defun alecs/toggle-window-maximize ()
  (interactive)
  (if alecs/toggle-win-conf
      (progn
        (set-window-configuration alecs/toggle-win-conf)
        (setq alecs/toggle-win-conf nil))
    (progn
      (setq alecs/toggle-win-conf (current-window-configuration))
      (delete-other-windows))))

(general-define-key
 :states '(normal visual)
 "C-w m" 'alecs/toggle-window-maximize)
