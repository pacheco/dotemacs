(use-package ag
  :if (executable-find "ag")
  :ensure t
  :config
  (setq-default ag-highlight-search t)
  :bind (("C-?" . ag-regexp)
         ("C-M-?" . ag-project)))

(provide 'init-ag)
