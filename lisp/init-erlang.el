(push "~/.emacs.d/site-lisp/distel/elisp/" load-path)
(require-package 'erlang)
(require 'company-distel)
(require 'erlang-start)

;;; distel
(require 'distel)
(distel-setup)
(setq inferior-erlang-prompt-timeout t)
(setq inferior-erlang-machine-options '("-sname" "emacs"))
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        (car (split-string (shell-command-to-string "hostname"))))))

(mapcar (lambda (x) (add-to-list 'auto-mode-alist (cons x 'erlang-mode)))
        '("relx.config" "app.config"))

(add-hook 'erlang-mode-hook
          (lambda ()
            (define-key erlang-mode-map (kbd "C-c h") 'erlang-man-function)
            (setq company-backends '(company-distel))))

(provide 'init-erlang)
