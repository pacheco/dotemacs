;;; to install required rust components:
;;; $ rustup component add --toolchain nightly rls-preview rust-analysis rust-src

(use-package rust-mode
  :ensure t
  :after (eglot)
  :config
  (font-lock-add-keywords 'rust-mode
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  :hook ((rust-mode . electric-pair-mode)
         (rust-mode . eglot-ensure))
  )

(use-package cargo
  :ensure t
  :hook ((rust-mode . cargo-minor-mode)))

;; (use-package flycheck-rust
;;   :ensure t
;;   :after (rust-mode)
;;   :hook ((flycheck-mode . flycheck-rust-setup)
;;          (rust-mode . flycheck-mode)))

;; (use-package lsp-rust
;;   :after (rust-mode lsp-mode)
;;   :init
;;   (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
;;   :hook ((rust-mode . lsp-rust-enable)))

(provide 'init-rust)
