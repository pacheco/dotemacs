(require-package 'ggtags)
(require-package 'cedet)

;;; basic identation options
(setq-default c-basic-offset 4)

;;; c++ indentation options
(c-add-style "my-c++-style" '("cc-mode"
                             (c-offsets-alist . ((innamespace . [0]))) ; do not indent namespaces
                             ))

;;; GDB config
(setq-default gdb-many-windows 1)

;;; C/C++ hooks
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq company-backends (delete 'company-semantic company-backends))
            ;(ggtags-mode 1)
            (local-set-key (kbd "C-h") 'c-electric-backspace)
            (setq c-auto-newline nil)
            ;(c-toggle-hungry-state 1)
            (c-set-offset 'statement-case-open 0)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "my-c++-style")))


(provide 'init-c)
