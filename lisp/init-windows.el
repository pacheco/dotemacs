;;; winner mode on (allows window configuration undo/redo with 'c-c left/right')
(winner-mode 1)

;;; for switching between >2 windows
(require-package 'switch-window)
(require 'switch-window)
(setq switch-window-shortcut-style 'keyboard)
(global-set-key (kbd "C-x o") 'switch-window)

(provide 'init-windows)

