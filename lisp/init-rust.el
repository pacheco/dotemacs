;;; to install required rust components:
;;; $ rustup component add --toolchain nightly rls-preview rust-analysis rust-src

(use-package rust-mode
  :ensure t
  :config
  (font-lock-add-keywords 'rust-mode
                          '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (add-hook 'rust-mode-hook #'electric-pair-mode))

(use-package lsp-rust
  :after (rust-mode lsp-mode)
  :init
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  :hook ((rust-mode . lsp-rust-enable)))

(provide 'init-rust)
