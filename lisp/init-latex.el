(require-package 'auctex)
(require-package 'company-auctex)

(company-auctex-init)

(add-hook 'latex-mode-hook
          (lambda ()
            (semantic-mode nil)))

(provide 'init-latex)
