(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (yas-load-directory (expand-file-name "snippets" user-emacs-directory))
  :bind (:map yas-minor-mode-map
         ("C-c <tab>" . yas-expand)
         ("<tab>" . nil)
         ("TAB" . nil)))

(provide 'init-yas)
