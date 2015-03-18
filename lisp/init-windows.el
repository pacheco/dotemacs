;;; winner mode on (allows window configuration undo/redo with 'c-c left/right')
(winner-mode 1)

;;; for switching between >2 windows
(require-package 'switch-window)
(require 'switch-window)
(setq switch-window-shortcut-style 'keyboard)
(global-set-key (kbd "C-x o") 'switch-window)

;;; When splitting window, show (other-buffer) in the new window
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

(global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))



(provide 'init-windows)

