(use-package rg
  :if (executable-find "rg")
  :ensure t
  :config
  :bind (("C-?" . rg)
         ("C-M-?" . rg-project)))

(provide 'init-rg)
