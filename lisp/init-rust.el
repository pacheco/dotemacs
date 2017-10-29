(require-package 'rust-mode)

;;; racer-mode config
;;; ---------------------------
(require-package 'racer)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook #'electric-pair-mode)
(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'racer-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-t") 'racer-describe)))


;; (require-package 'flycheck-rust)
;; (add-hook 'rust-mode-hook #'flycheck-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; TODO: try using lsp
;; ------------------------

(provide 'init-rust)
