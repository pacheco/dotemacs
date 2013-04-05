;;; python.el --- python specific configs

;;; Commentary:
;;; python specific configs

;;; Code:

;;; jedi autocompletion
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook (lambda ()
                              (jedi:setup)
                              (auto-complete-mode 1)
                              (flycheck-mode 1)))
(eval-after-load 'jedi
  '(progn
     (define-key jedi-mode-map (kbd "C-c C-d") 'jedi:show-doc)))


