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

;;; completion using sematic
(require 'semantic)

(semantic-add-system-include "~/usr/include/")

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(defun lps/semantic-jump ()
  "Try to jump to the tag pointed by the cursor. If there is an
error (e.g. cursor not pointing a tag), ask for a symbol name"
  (interactive)
  (condition-case nil
      (semantic-ia-fast-jump nil)
    (error (semantic-complete-jump))))

;;; C/C++ hooks
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq company-backends (delete 'company-clang company-backends))
            ;(ggtags-mode 1)
            (semantic-mode 1)
            (define-key semantic-mode-map (kbd "C-.") 'lps/semantic-jump)
            (define-key semantic-mode-map (kbd "C-c C-f") 'semantic-symref-symbol)
            (define-key semantic-mode-map (kbd "C-c C-d") 'semantic-ia-show-summary)
            (local-set-key (kbd "C-h") 'c-electric-backspace)
            (setq c-auto-newline nil)
            ;(c-toggle-hungry-state 1)
            (c-set-offset 'statement-case-open 0)))

(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "my-c++-style")))


(provide 'init-c)
