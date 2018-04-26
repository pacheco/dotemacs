(require-package 'rust-mode)

;;; lsp mode
;;; ----------------------------
;;; to install required rust components:
;;; $ rustup component add --toolchain nightly rls-preview rust-analysis rust-src

(require 'lsp-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust))

(add-hook 'rust-mode-hook #'lsp-rust-enable)


;;; general stuff
;;; ----------------------------------------
(font-lock-add-keywords 'rust-mode
                        '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
(add-hook 'rust-mode-hook #'electric-pair-mode)


;;; racer-mode stuff
;;; ---------------------------
;; (require-package 'racer)


;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'rust-mode-hook #'electric-pair-mode)
;; (add-hook 'racer-mode-hook #'company-mode)

;; (add-hook 'racer-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c C-t") 'racer-describe)))

;; (require-package 'flycheck-rust)
;; (add-hook 'rust-mode-hook #'flycheck-mode)
;; (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; (add-hook 'racer-mode-hook #'eldoc-mode)

(provide 'init-rust)
