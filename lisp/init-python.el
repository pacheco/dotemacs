(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (if (executable-find "ipython")
      (setq python-shell-interpreter "ipython"
            python-shell-interpreter-args "-i --simple-prompt")))

(provide 'init-python)
