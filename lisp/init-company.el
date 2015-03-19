(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; use c-n c-p for next/prev completion while menu is showing
(eval-after-load 'company
   '(progn
      (define-key company-mode-map (kbd "C-<tab>") 'company-complete)
      (define-key company-active-map (kbd "C-n") 'company-select-next)
      (define-key company-active-map (kbd "C-p") 'company-select-previous)))



(provide 'init-company)
