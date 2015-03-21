(when (executable-find "ag") ; install silversearcher-ag
  (require-package 'ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "C-?") 'ag-project))

(provide 'init-ag)
