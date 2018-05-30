(use-package paredit
  :ensure t
  :commands (enable-paredit-mode)
  :hook (emacs-lisp-mode . enable-paredit-mode)
  :bind (:map paredit-mode-map
         ("C-w" . paredit-backward-kill-word)
         ("C-h" . paredit-backward-delete)
         ;; ("C-<right>" . forward-word)
         ;; ("C-<left>" . backward-word)
         ("M-<right>" . paredit-forward-slurp-sexp)
         ("M-<left>" . paredit-forward-barf-sexp)
         ("[" . paredit-open-round)
         ("]" . paredit-close-round)
         ("(" . paredit-open-square)
         (")" . paredit-close-square)
         ("M-[" . 'paredit-wrap-round)))

(provide 'init-paredit)
