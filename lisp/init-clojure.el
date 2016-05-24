(require-package 'clojure-mode)
(require-package 'clojure-mode-extra-font-locking)
(require-package 'cider)

(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'eldoc-mode)
;;(add-hook 'clojure-mode-hook 'subword-mode)

(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (setq eldoc-documentation-function 'cider-eldoc)))


(add-hook 'cider-mode-hook 'enable-paredit-mode)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(provide 'init-clojure)
