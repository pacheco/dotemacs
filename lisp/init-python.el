;;; remember to install python modules: pylint pyflakes flake8 jedi epc
(require-package 'epc)
(require-package 'python-environment)
(require-package 'jedi)

(require 'jedi)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook
          (lambda ()
            (jedi:setup)
            (setq ac-sources '(ac-source-jedi-direct ac-source-words-in-same-mode-buffers))))


(provide 'init-python)
