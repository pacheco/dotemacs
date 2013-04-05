;;; lps-modes --- mode specific configs

;;; Commentary:
;;; setup mode specific configurations.  Last thing it does is load all
;;; the files inside the modes folder.

;;; Code:

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

(eval-after-load 'paredit
  '(progn (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
          (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
          ;; (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
          ;; (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
          (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "M-<left>") 'paredit-forward-barf-sexp)))


;;; yasnippet
(require 'yasnippet)
(yas-load-directory (concat dotemacs-dir "snippets"))

;;; ggtags
(require 'ggtags)
(setq ggtags-global-window-height 15)

;;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
     ;; (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
     ;; (setq flycheck-checkers (delq 'emacs-lisp flycheck-checkers))
     (set-face-foreground 'flycheck-error-face "red")
     (set-face-background 'flycheck-error-face "black")
     (set-face-foreground 'flycheck-warning-face "gold")
     (set-face-background 'flycheck-warning-face "black")))

;;; auto-complete
(require 'auto-complete-config)
(setq ac-auto-start t
      ac-auto-show-menu 0.1
      ac-delay 0.1)
(eval-after-load 'auto-complete
  '(progn
     (define-key ac-mode-map (kbd "C-<tab>") 'auto-complete)
     ;; use c-n c-p for next/prev completion while menu is showing
     (setq ac-use-menu-map t)
     (define-key ac-menu-map (kbd "C-n") 'ac-next)
     (define-key ac-menu-map (kbd "C-p") 'ac-previous)))


;;; load mode specific configuration files
(mapcar 'load-file (directory-files (concat dotemacs-dir "modes") t ".*.el"))

(provide 'lps-modes)
;;; lps-modes ends here
