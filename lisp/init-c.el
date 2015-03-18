(require-package 'ggtags)

(setq-default c-basic-offset 4)

(add-hook 'c-mode-common-hook
          (lambda ()
            (ggtags-mode 1)
            (local-set-key (kbd "C-h") 'c-electric-backspace)
            (setq c-auto-newline nil)
            (c-toggle-hungry-state 1)
            (c-set-offset 'statement-case-open 0)))

(provide 'init-c)
