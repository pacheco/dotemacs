;; Mode specific configs

;;; c mode
(setq-default c-basic-offset 4)
(require 'c-eldoc)
(setq c-eldoc-includes " -I./ -I../ -I.../  -I./include/ -I../include/ -I../../include/ -I${HOME}/usr/include/ ")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;; shell mode
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda ()
                                        (paredit-mode +1)
                                        (eldoc-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

(eval-after-load 'paredit
  '(progn (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
          (define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)
          ;; (define-key paredit-mode-map (kbd "C-<right>") 'forward-word)
          ;; (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
          (define-key paredit-mode-map (kbd "M-<right>") 'paredit-forward-slurp-sexp)
          (define-key paredit-mode-map (kbd "M-<left>") 'paredit-forward-barf-sexp)))

;;; winner mode
(winner-mode 1)

;;; go mode
(require 'go-mode-load)


(provide 'lps-modes)
