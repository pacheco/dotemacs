;;; go mode
(require 'go-mode-load)
(add-hook 'go-mode-hook (lambda ()
                          (yas-minor-mode 1)))
