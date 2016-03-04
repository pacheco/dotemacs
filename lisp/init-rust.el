(require-package 'rust-mode)
(require-package 'racer)

(setq racer-cmd (expand-file-name "~/.cargo/bin/racer"))
(setq racer-rust-src-path (expand-file-name "~/usr/rustc/src"))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(provide 'init-rust)
