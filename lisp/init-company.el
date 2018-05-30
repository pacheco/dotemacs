(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :bind (:map company-mode-map
         ("C-<tab>" . company-complete)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)))

(provide 'init-company)
