;;; python.el --- python specific configs

;;; Commentary:
;;; python specific configs

;;; Code:

;;; jedi autocompletion
(require 'jedi)
(require 'flycheck)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook (lambda ()
                              (jedi:setup)
                              (auto-complete-mode 1)
                              (flycheck-mode-on-safe)
                              (setq ac-sources '(ac-source-jedi-direct ac-source-words-in-same-mode-buffers))))

;;; remember to install python modules: pylint pyflakes flake8 jedi epc

(eval-after-load 'jedi
  '(progn
     (define-key jedi-mode-map (kbd "C-c C-d") 'jedi:show-doc)))

;;; python.el ends here
