;;; winner mode on (allows window configuration undo/redo with 'c-c left/right')
(winner-mode 1)

;;; for switching between >2 windows
(use-package switch-window
  :ensure t
  :config
  (setq switch-window-shortcut-style 'keyboard)
  :bind (("C-x o" . switch-window)
         ("M-o" . switch-window)))

(provide 'init-windows)

