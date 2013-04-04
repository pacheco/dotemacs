;; Mode specific configs

;;; shell mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda ()
                                        (paredit-mode 1)
                                        (eldoc-mode 1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode 1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode 1)))

;;; yasnippet
(require 'yasnippet)
(yas-load-directory (concat dotemacs-dir "snippets"))

;;; load mode specific configuration 
(mapcar 'load-file (directory-files (concat dotemacs-dir "modes") t ".*.el"))

(provide 'lps-modes)
