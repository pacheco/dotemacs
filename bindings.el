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
(global-set-key (kbd "<f10>") (lambda () (interactive) (ansi-term "/bin/bash")))
(global-set-key (kbd "<f5>") 'first-error)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "<f8>") 'recentf-ido-find-file)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x TAB") 'yas/expand)

(provide 'lps-bindings)
