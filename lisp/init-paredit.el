(require-package 'paredit)

(autoload 'enable-paredit-mode "paredit")

(eval-after-load 'paredit
  '(progn (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
          (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
          ;; (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
          ;; (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
          (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "M-<left>") 'paredit-forward-barf-sexp)
          (define-key paredit-mode-map (kbd "[") 'paredit-open-round)
          (define-key paredit-mode-map (kbd "]") 'paredit-close-round)
          (define-key paredit-mode-map (kbd "(") 'paredit-open-square)
          (define-key paredit-mode-map (kbd ")") 'paredit-close-square)
          (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-round)))


(provide 'init-paredit)
