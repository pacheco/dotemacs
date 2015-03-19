(require-package 'ggtags)
(require-package 'cedet)

(require 'semantic)

(setq-default c-basic-offset 4)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)


(defun lps/semantic-jump ()
  "Try to jump to the tag pointed by the cursor. If there is an
error (e.g. cursor not pointing a tag), ask for a symbol name"
  (interactive)
  (condition-case nil
      (semantic-ia-fast-jump nil)
    (error (semantic-complete-jump))))

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
            (c-toggle-hungry-state 1)
            (c-set-offset 'statement-case-open 0)))

(provide 'init-c)
