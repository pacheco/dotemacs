;;; lisp.el --- common lisp configs

;;; Commentary:
;;; setup slime, paredit, etc

;;; Code:

;;; use slime from quicklisp -> (ql:quickload "quicklisp-slime-helper")
(when (file-exists-p "~/quicklisp")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl --dynamic-space-size 2048")
  (setq common-lisp-hyperspec-root "/usr/share/doc/hyperspec/")
  (add-hook 'slime-mode-hook
            (lambda ()
              (define-key slime-mode-map (kbd "C-<tab>") 'slime-complete-symbol)))
  (add-hook 'slime-repl-mode-hook
            (lambda ()
              (define-key slime-repl-mode-map (kbd "C-c C-d") 'slime-describe-symbol)
              (define-key slime-repl-mode-map (kbd "(") (lambda () (interactive) (insert "[")))
              (define-key slime-repl-mode-map (kbd ")") (lambda () (interactive) (insert "]")))
              (define-key slime-repl-mode-map (kbd "[") (lambda () (interactive) (insert "(")))
              (define-key slime-repl-mode-map (kbd "]") (lambda () (interactive) (insert ")"))))))

(add-hook 'lisp-mode-hook             (lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode 1)))


(defun lps/slime-abcl ()
  "Start slime using abcl."
  (interactive)
  (let ((inferior-lisp-program "abcl"))
    (slime)))

(defun lps/slime-clisp ()
  "Start slime using abcl."
  (interactive)
  (let ((inferior-lisp-program "clisp"))
    (slime)))


;;; lisp.el ends here
