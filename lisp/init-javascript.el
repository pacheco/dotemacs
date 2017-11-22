
;; js2-mode config ----------------------------------------------

(require-package 'js2-mode)
(require-package 'js2-refactor)
(require-package 'xref-js2)
(require-package 'company-tern)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js2-mode binds "M-." which conflicts with xref, unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode)
            (add-to-list 'company-backends 'company-tern)
            ;; disable tern's jumping, we're using xref
            (define-key tern-mode-keymap (kbd "M-.") nil)
            (define-key tern-mode-keymap (kbd "M-,") nil)
            (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(add-hook 'js2-mode-hook
          (lambda ()
            (flycheck-mode)
            (flycheck-add-mode 'javascript-eslint 'js2-mode)))

(add-hook 'js2-mode-hook
          (lambda ()
            (setq js2-basic-offset 2)
            (setq js2-strict-trailing-comma-warning nil)))


;; web-mode config -------------------------------------------------

(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;; (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(add-hook 'web-mode-hook (lambda ()
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-css-indent-offset 2)
                           (setq web-mode-code-indent-offset 2)
                           (setq web-mode-sql-indent-offset 2)))

(provide 'init-javascript)
