;;; elisp.el --- emacs lisp config

;;; Commentary:
;;; 

;;; Code:

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (paredit-mode 1)
            (eldoc-mode 1)
            (flycheck-mode-on-safe)
            ;;(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
            ))

;;; elisp.el ends here
