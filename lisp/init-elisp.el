(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (turn-on-eldoc-mode)
            (enable-paredit-mode)))

(provide 'init-elisp)
