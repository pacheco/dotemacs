(require-package 'yasnippet)

(yas-global-mode 1)

(yas-load-directory (expand-file-name "snippets" user-emacs-directory))

(eval-after-load 'yasnippet
  '(progn
     (yas-reload-all)
     (define-key yas-minor-mode-map (kbd "C-c <tab>") 'yas-expand)
     (define-key yas-minor-mode-map (kbd "<tab>") nil)
     (define-key yas-minor-mode-map (kbd "TAB") nil)))

(provide 'init-yas)
