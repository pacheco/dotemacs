;; custom keybindings

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-x"))
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-<") 'previous-window)
(global-set-key (kbd "C->") 'other-window)
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "<f12>") 'toggle-maximize)
(global-set-key (kbd "<f10>") (lambda () (interactive) (ansi-term "/bin/bash")))
(global-set-key (kbd "<f5>") 'first-error)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "C-x C-S-f") 'recentf-ido-find-file)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x TAB") 'yas-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-x C-b") (lambda () (interactive) (list-buffers t)))

(add-hook 'gtags-mode-hook
          (lambda ()
            (define-key gtags-mode-map (kbd "C-S-g") 'gtags-find-tag-from-here)))

(eval-after-load 'slime
  '(progn (define-key slime-mode-map (kbd ""))))

(eval-after-load 'paredit
  '(progn (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
          (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
          ;; (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
          ;; (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
          (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "M-<left>") 'paredit-forward-barf-sexp)))

(add-hook 'c-mode-hook (lambda ()
                         (define-key (lookup-key semantic-mode-map (kbd "C-c ,")) (kbd "d")
                           'semantic-ia-show-summary)
                         (define-key (lookup-key semantic-mode-map (kbd "C-c ,")) (kbd "D")
                           'semantic-ia-show-doc)))

(provide 'lps-bindings)
