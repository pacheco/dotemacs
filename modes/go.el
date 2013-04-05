;;; go mode
(require 'go-mode-load)
(require 'go-autocomplete)
(add-hook 'go-mode-hook (lambda ()
                          (yas-minor-mode 1)))
