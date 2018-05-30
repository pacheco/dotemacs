(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :init
  (load "auctex-autoloads" nil t)
  :config
  (add-hook 'latex-mode-hook
            (lambda ()
              (semantic-mode nil))))

(use-package company-auctex
  :ensure t
  :after (auctex)
  :config
  (company-auctex-init))

(provide 'init-latex)
