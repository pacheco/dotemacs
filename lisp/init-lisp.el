(require-package 'slime-company)

(setq inferior-lisp-program "sbcl --dynamic-space-size 2048")
(setq common-lisp-hyperspec-root "/usr/share/doc/hyperspec/")

(add-hook 'lisp-mode-hook
          (lambda () (enable-paredit-mode)))
(add-hook 'lisp-interaction-mode-hook
          (lambda () (enable-paredit-mode)))

;; with quicklisp run (ql:quickload "quicklisp-slime-helper")
(load (expand-file-name "~/usr/quicklisp/slime-helper.el"))

(slime-setup '(slime-fancy slime-company))

(add-hook 'slime-repl-mode-hook
          (lambda ()
            (define-key slime-repl-mode-map (kbd "C-c C-d") 'slime-describe-symbol)
            (define-key slime-repl-mode-map (kbd "(") (lambda () (interactive) (insert "[")))
            (define-key slime-repl-mode-map (kbd ")") (lambda () (interactive) (insert "]")))
            (define-key slime-repl-mode-map (kbd "[") (lambda () (interactive) (insert "(")))
            (define-key slime-repl-mode-map (kbd "]") (lambda () (interactive) (insert ")")))))

(provide 'init-lisp)
