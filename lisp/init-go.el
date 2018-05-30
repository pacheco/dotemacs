;;
;; to jump to definition with C-c C-j install godef: go get code.google.com/p/rog-go/exp/cmd/godef
;;

(use-package go-mode
  :ensure t)
(use-package company-go
  :ensure t
  :config
  (add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (add-hook 'before-save-hook 'gofmt-before-save nil t))))

(provide 'init-go)
