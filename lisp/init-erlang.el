(require-package 'erlang)
(require 'erlang-start)

;;; TODO: check distel
(mapcar (lambda (x) (add-to-list 'auto-mode-alist (cons x 'erlang-mode)))
        '("relx.config" "app.config"))

(add-hook 'erlang-mode-hook
          (lambda ()
            (define-key erlang-mode-map (kbd "C-c h") 'erlang-man-function)))


(provide 'init-erlang)
