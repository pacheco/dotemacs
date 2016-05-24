;;
;; to jump to definition with C-c C-j install godef: go get code.google.com/p/rog-go/exp/cmd/godef
;;

(require-package 'go-mode)
(require-package 'company-go)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save nil t)))

(provide 'init-go)
